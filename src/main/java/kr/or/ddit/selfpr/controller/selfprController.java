package kr.or.ddit.selfpr.controller;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.inject.Inject;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.selfpr.dao.SelfprDAO;
import kr.or.ddit.selfpr.service.SelfprService;
import kr.or.ddit.selfpr.vo.SelfprVO;
import kr.or.ddit.ui.PaginationRenderer;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SeekerVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 윤호연
 * @since 2023. 2. 4.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일               수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 4.  윤호연                최초작성
 * 2023. 2.13.  윤호연	   1차수정
 * 2023. 2.24.  윤호연	   2차수정  
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/selfpr")
public class selfprController {
	
	private final SelfprService service;
	private final SelfprDAO selfprDAO;
	@Inject
	private MemberService memService;
	@Resource(name="bootstrapPaginationRender")
	private PaginationRenderer renderer;
	
	@GetMapping
	public String selfprMain(
		@AuthMember MemberVO authMember	
		, Model model
	) {
		String memId2 = authMember.getMemId();
		model.addAttribute("memId2", memId2);
		
		return "selfpr/selfPrView";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String selfprData(
		@RequestParam(value = "page", required=false, defaultValue="1") int currentPage
		, @ModelAttribute("detailCondition") SelfprVO detailCondition
		, Model model
	) {
		PagingVO<SelfprVO> pagingVO = new PagingVO<>(6,10);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setDetailCondition(detailCondition);
		
		List<SelfprVO> selfprList = service.retrieveSelfprList(pagingVO);
		
		model.addAttribute("pagingVO", pagingVO);
		if(!pagingVO.getDataList().isEmpty())
			model.addAttribute("pagingHTML", renderer.renderPagination(pagingVO));
		
		return "jsonView";
	}
	
	@PostMapping("search")
	public String selfprSearch(
		Model model
		, @RequestBody(required = false) List<Map<String, Object>> param
	) {
		List<Map<String, Object>> regionList = null;
		List<Map<String, Object>> industryList = null;
		
		for(Map<String, Object> list : param) {
			String type = (String)list.get("type");
			String code = (String)list.get("code");
			
			if(type.equals("region")) {
				regionList = selfprDAO.selectRegionList(code);
			}
			if(type.equals("industry")) {
				industryList = selfprDAO.selectIndustry(code);
			}
		}
		model.addAttribute("regionList", regionList);
		model.addAttribute("industryList", industryList);
		
		return "jsonView";
	}
	
	@GetMapping("/Detail")
	public String selfprDetail(
		@AuthMember MemberVO authMember		
		, @RequestParam(value="no") int prNo
		, @ModelAttribute("detailCondition") SelfprVO detailCondition
		, Model model
	) {
		SeekerVO seeker = new SeekerVO();
		PagingVO<SelfprVO> pagingVO = new PagingVO<>();
		pagingVO.setDetailCondition(detailCondition);
		// 관심인재 관련
		String memId2 = authMember.getMemId();
//		System.out.println("로그인한 사람:"+ memId2);
		
		
		model.addAttribute("memId2", memId2);
		model.addAttribute("prNo", prNo);
//		System.out.println("pr번호 : " + prNo);
		
		SelfprVO matchselfpr = new SelfprVO();
		matchselfpr.setMemId2(memId2);
		matchselfpr.setPrNo(prNo);
		
		int match = service.matchLike(matchselfpr);
		
		matchselfpr.setLikeresult(match);
		model.addAttribute("matchselfpr", matchselfpr);
		
		// 이력서, 회원정보 뽑아오기
		SelfprVO selfprmem = service.retrieveSelfprMember(prNo);
		String writer = selfprmem.getMemId();
		seeker = memService.retrieveSeeker(writer);
		List<SelfprVO> selfpredu = service.retrieveSelfprEducation(prNo);
		List<SelfprVO> selfprcareer = service.retrieveSelfprCareer(prNo);
		List<SelfprVO> selfprcert = service.retrieveSelfprCert(prNo);
		List<SelfprVO> selfpract = service.retrieveSelfprAct(prNo);
		List<SelfprVO> selfpraward = service.retrieveSelfprAward(prNo);
		List<SelfprVO> selfprcourse = service.retrieveSelfprCourse(prNo);
		model.addAttribute("selfprmem", selfprmem);
		model.addAttribute("selfpredu", selfpredu);
		model.addAttribute("selfprcareer", selfprcareer);
		model.addAttribute("selfprcert", selfprcert);
		model.addAttribute("selfpract", selfpract);
		model.addAttribute("selfpraward", selfpraward);
		model.addAttribute("selfprcourse", selfprcourse);
		model.addAttribute("seeker", seeker);
		return "selfpr/selfPrDetail";
	}
	
	// Selfpr Insert
	
	@GetMapping("/InsertForm")
	public String selfprForm(
		@AuthMember MemberVO authMember
		, Model model
	) {
		String memId = authMember.getMemId();
		log.info("작성중인 Id" + memId);
		
		model.addAttribute("memId", memId);
		
		return "selfpr/selfPrForm";
	}
	
	@PostMapping("/Insert")
	public String selfprInsert(
		Model model
		, @ModelAttribute("selfpr") SelfprVO selfpr 
		, Errors errors
	) {
		String viewName = null;
		if(!errors.hasErrors()) {
//			String memId = authMember.getMemId();
			int rowcnt = service.createSelfpr(selfpr);
			System.out.println(rowcnt);
			if(rowcnt > 0) {
				viewName = "redirect:/selfpr";
			}else {
				model.addAttribute("message","서버 오류");
				viewName = "selfpr/Insert";
			}
		}else {
			viewName = "selfpr/Insert";
		}
		return viewName;
	}
	
	// Selfpr Update
	
	@GetMapping("/Update")
	public String UpdateForm(
		@AuthMember MemberVO authMember	
		, @RequestParam(value="no") int prNo
		, Model model
	) {
		String memId = authMember.getMemId();
		model.addAttribute("memId", memId);
		
		SelfprVO selfpr = service.retrieveSelfprMember(prNo);
		model.addAttribute("selfpr", selfpr);
		return "selfpr/selfPrUpdateForm";
	}
	
	@PostMapping("/Update")
	public String UpdateSelfpr(
		@ModelAttribute("selfpr") SelfprVO selfpr
		, Errors errors
		, Model model
	) {
		String viewName = null;
		if(!errors.hasErrors()) {
			int rowcnt = service.modifySelfpr(selfpr);
			if(rowcnt > 0) {
				viewName = "redirect:/selfpr/Detail/?no="+selfpr.getPrNo();
			}else {
				model.addAttribute("message", "서버 오류");
				viewName = "selfpr/selfPrUpdateForm";
			}
		}else {
			viewName = "selfpr/selfPrUpdateForm"; 
		}
		return viewName;
	}
	
	// Selfpr delete
	@GetMapping("/delete")
	public String deleteSelfpr(
		@RequestParam("no") int prNo
		, Model model
	) {
		service.removeSelfpr(prNo);
		return "redirect:/selfpr";
	}
	
}

