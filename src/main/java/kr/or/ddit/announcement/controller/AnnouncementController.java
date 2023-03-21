package kr.or.ddit.announcement.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.announcement.dao.AnnoDAO;
import kr.or.ddit.announcement.dao.AnnoSearchDAO;
import kr.or.ddit.announcement.service.AnnoService;
import kr.or.ddit.announcement.vo.AnnoVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.NotExistAnnoException;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.ui.PaginationRenderer;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.vo.PagingVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 작성자명
 * @since 2023. 2. 1.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                 수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 1.   양서연               최초작성
 * 2023. 2. 17.  최경수               회원별 공고 목록 추가
 * 2023. 2. 19.  양서연               컨트롤러 이름 변경
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */

@Slf4j
@Controller
@RequestMapping("/announcement")
@RequiredArgsConstructor
public class AnnouncementController {
	private final AnnoService service;
	private final AnnoSearchDAO annoSearchDAO;
	private final AnnoDAO annoDAO;
	private final MemberService memberService;

	@Resource(name="bootstrapPaginationRender")
	private PaginationRenderer renderer;

	@ModelAttribute("anno")
	public AnnoVO annoVO() {
		return new AnnoVO();
	}

	/**
	 * 공고 목록으로 이동
	 * @return
	 */
	@GetMapping
	public String listUI() {
		return "announcement/annoList";
	}

	/**
	 * 페이징 처리
	 * @param currentPage
	 * @param detailCondition
	 * @param map
	 * @param model
	 * @return
	 */
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String annoList(
		@RequestParam(value="page",required=false, defaultValue="1") int currentPage
		, @ModelAttribute("detailCondition") AnnoVO detailCondition
		, @RequestParam Map<String, Object> map
		, Model model
		, Authentication authentication
	) {
		log.info("map : " + map);
		
		PagingVO<AnnoVO> pagingVO = new PagingVO<>();
		pagingVO.setCurrentPage(currentPage);
        
		pagingVO.setDetailCondition(detailCondition);
		
		//검색조건저장
		AnnoVO vo = pagingVO.getDetailCondition();
		vo.setKeyword(map);
		pagingVO.setDetailCondition(vo);
		if(authentication==null) {
			log.info("어쓰 널임");
		} else {
			MemberVOWrapper wrapper = (MemberVOWrapper) authentication.getPrincipal();
			MemberVO realMember = wrapper.getRealMember();
			pagingVO.setMemId(realMember.getMemId());
		}
		
		service.retrieveAnnoList(pagingVO);
		List<String> per15Chk = annoDAO.per15Chk();
		
		model.addAttribute("per15Chk",per15Chk);
		model.addAttribute("pagingVO", pagingVO);
		if(!pagingVO.getDataList().isEmpty())
			model.addAttribute("pagingHTML", renderer.renderPagination(pagingVO));
		
		log.info("pagingVO값: {}",pagingVO);
		return "jsonView";
	}

	/**
	 * 공고 view
	 * @param annoNo
	 * @param model
	 * @param principal
	 * @return
	 */
	@GetMapping("view/{annoNo}")
	public String annoView(
		@PathVariable String annoNo
		, Model model
		, Authentication authentication
//		, @AuthMember MemberVO authMember
//		, @AuthenticationPrincipal MemberVOWrapper principal
	) {
		AnnoVO anno = service.retrieveAnno(annoNo);
		MemberVO annoInc = memberService.retrieveIncruiter(anno.getMemId());
		annoInc.getMemName();
		annoInc.getIncruiterVO().getMemEmail();
		//삭제된 글
		if(anno.getAnnoStateCd().equals("B2")||anno.getAnnoStateCd().equals("B3")) {
			throw new NotExistAnnoException(annoNo);
		}
		annoDAO.incrementHit(annoNo);
		
		if(authentication==null) {
			log.info("어쓰 널임");
		} else {
			MemberVOWrapper wrapper = (MemberVOWrapper) authentication.getPrincipal();
			MemberVO realMember = wrapper.getRealMember();
			String memId = realMember.getMemId();
			String cmpId = anno.getCmpId();
			
			service.insertMemLog(annoNo, memId);
			
			int selectLikeAnno = service.retrieveLikeAnno(annoNo, memId);
			int selectLikeCmp = service.retrieveLikeCmp(cmpId, memId);
			model.addAttribute("selectLikeAnno", selectLikeAnno);
			model.addAttribute("selectLikeCmp", selectLikeCmp);
		}
		
		model.addAttribute("anno",anno);
		model.addAttribute("annoInc",annoInc);
		return "announcement/annoView";
	}
	
	@PostMapping(value="/recommend")
	public String recommendList(
		@RequestParam Map<String, String> map
		, Model model
	) {
		log.info("recommendMap : " + map);
		String annoNo = map.get("annoNo");
		List<AnnoVO> recommendList = service.retrieveRecommendList(annoNo);
		
		model.addAttribute("recommendList", recommendList);
		
		return "jsonView";
	}
	
	@PostMapping("view/welAjax")
	public String annoViewWel(
		@RequestBody Map<String, String> map
		, Model model
	) {
		String annoNo = map.get("annoNo");
		AnnoVO anno = service.retrieveAnno(annoNo);
		model.addAttribute("anno", anno);
		model.addAttribute("welfareList", anno.getWelfareList());
		
		return "jsonView";
	}
	
	@GetMapping("insert")
	public String insertAnno(
		Model model
	) {
		return "announcement/annoForm";
	}

	/**
	 * 공고 등록 프로세스
	 * @param anno
	 * @param errors
	 * @param salaryDetail
	 * @param model
	 * @return
	 */
	@PostMapping("insert")
	public String createAnnoProcess(
		@Validated(InsertGroup.class) @ModelAttribute("anno") AnnoVO anno
		, Errors errors
		, @RequestParam Integer salaryDetail
		, Model model
	) {
		//급여
		String salary = anno.getAnnoSalary();
		if(!salary.equals("면접후결정")) {
			anno.setAnnoSalary2(salaryDetail);
		}
		
		//공고상태코드 생성
		String startDate = anno.getAnnoStartdate();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		String today = dateFormat.format(new Date(System.currentTimeMillis()));
		try {
			Date today2 = new Date(dateFormat.parse(today).getTime());
			Date startDate2 = new Date(dateFormat.parse(startDate).getTime());
			
			int compare = today2.compareTo(startDate2);
			
			//compare가 0보다 크면 today2가 더 크다
			if(compare<0) {
				//등록대기중
				anno.setAnnoStateCd("B3");
			} else {
				//등록됨
				anno.setAnnoStateCd("B1");
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		String annoNo = "";
		String viewName = "";
		if(!errors.hasErrors()) {
			ServiceResult result = service.createAnno(anno);
			annoNo = anno.getAnnoNo();
			if(ServiceResult.OK == result) {
				viewName = "redirect:/announcement/view/"+annoNo;
			} else {
				model.addAttribute("message", "서버 오류, 쫌따 다시");
				viewName = "announcement/annoForm";
			}
		}
		return viewName;
	}
	
	@GetMapping("update")
	public String updateAnno(
		@RequestParam("what") String annoNo
		, Model model
		, Authentication authentication
	) {
		String viewName = "";
		AnnoVO anno = service.retrieveAnno(annoNo);
		MemberVOWrapper wrapper = (MemberVOWrapper) authentication.getPrincipal();
		MemberVO realMember = wrapper.getRealMember();
		String cmpId = realMember.getIncruiterVO().getCmpId();
		if(anno.getCmpId().equals(cmpId)) {
			model.addAttribute("anno",anno);
			viewName="announcement/annoEditForm";
		}
		return viewName;
	}
	
	
	@PostMapping("update")
	public String updateAnnoProces(
		@Validated(UpdateGroup.class) @ModelAttribute("anno") AnnoVO anno
		, BindingResult errors
		, Model model
		, @RequestParam Integer salaryDetail
	) {
		String viewName = null;
		
		String salary = anno.getAnnoSalary();
		if(salary.equals("면접후결정")) {
			anno.setAnnoSalary2(null);
		} else {
			anno.setAnnoSalary2(salaryDetail);
		}
		
		log.info("공고수정 : {}",anno);
		
		if(!errors.hasErrors()) {
			ServiceResult result = service.modifyAnno(anno);
			if(ServiceResult.OK == result) {
				viewName="redirect:/announcement/view/"+anno.getAnnoNo();
			} else {
				model.addAttribute("message", "서버 오류");
				viewName = "announcement/annoEditForm";
			}
		} else {
			viewName = "announcement/annoEditForm";
		}
		return viewName;
	}
	
	@ResponseBody
	@PostMapping("delete")
	public String deleteAnno(
		Model model
		, @AuthMember MemberVO authMember
		, @RequestBody Map<String, String> map
	) {
		String result = "fail";
		String annoNo = map.get("annoNo");
		
		result = service.removeAnno(annoNo) > 0 ? "success" : "fail";
		return result;
	}
	
	@PostMapping("terminate")
	@ResponseBody
	public String terminateAnno(
		Model model
		, @AuthMember MemberVO authMember
		, @RequestBody Map<String, String> map
	) {
		String result = "fail";
		String annoNo = map.get("annoNo");
		
		result = service.terminateAnno(annoNo) > 0 ? "success" : "fail";
		return result;
	}
	
	/**
	* 관심공고
	* @param annoNo
	* @param memId
	* @return
	*/
	@PostMapping("likeAnno")
	@ResponseBody
	public String insertLikeAnno(
		@RequestBody Map<String,String> map
		, Model model
	) {
		int cnt = 0;
		String result = "";
		String annoNo = map.get("annoNo");
		String memId = map.get("memId");
		int selectLikeAnno = service.retrieveLikeAnno(annoNo, memId);
		if(selectLikeAnno>0) {
			cnt = service.removeLikeAnno(annoNo, memId);
			if(cnt>0) result = "delete";
		} else {
			cnt = service.createLikeAnno(annoNo, memId);
			if(cnt>0) result = "insert";
		}
		return result;
	}
	
	/**
	 * 관심기업
	 * @param map
	 * @param model
	 * @return
	 */
	@PostMapping("likeCmp")
	@ResponseBody
	public String insertLikeCmp(
		@RequestBody Map<String,String> map
		, Model model	
	) {
		int cnt = 0;
		String result= "";
		
		String cmpId = map.get("cmpId");
		String memId = map.get("memId");
		int selectLikeCmp = service.retrieveLikeCmp(cmpId, memId);
		if(selectLikeCmp>0) {
			cnt = service.removeLikeCmp(cmpId, memId);
			if(cnt>0) result = "delete";
		} else {
			cnt = service.createLikeCmp(cmpId, memId);
			if(cnt>0) result = "insert";
		}
		return result;
	}

	/**
	 * DB 코드 가져오기
	 * @param model
	 * @param param
	 * @return
	 */
	@PostMapping("annoAjax")
	public String selectList(
		Model model
		, @RequestBody(required = false) List<Map<String, Object>> param
	){
		List<Map<String, Object>> regionList = null;
		List<Map<String, Object>> industryList = null;
		List<Map<String, Object>> jobList = null;
		List<Map<String, Object>> eduList = null;
		List<Map<String, Object>> welfareList = null;
		List<Map<String, Object>> positionList = null;
		List<Map<String, Object>> empltypeList = null;
		AnnoVO anno = new AnnoVO();
		
		for(Map<String, Object> list : param) {
			String type = (String)list.get("type");
			String code = (String)list.get("code");

			if(type.equals("region")) {
				regionList = annoSearchDAO.selectRegionList(code);
			}
			if(type.equals("industry")) {
				industryList = annoSearchDAO.selectIndustry(code);
			}
			if(type.equals("job")) {
				jobList = annoSearchDAO.selectJob(code);
			}
			if(type.equals("edu")) {
				eduList = annoSearchDAO.selectEduCd();
			}
			if(type.equals("welfare")) {
				welfareList = annoSearchDAO.selectWelfareList(code);
			}
			if(type.equals("position")) {
				positionList = annoSearchDAO.selectPositionList(code);
			}
			if(type.equals("empltype")) {
				empltypeList = annoSearchDAO.selectEmpltypeList();
			}
			if(type.equals("anno")) {
				anno = service.retrieveAnno(code);
			}
		}
		model.addAttribute("regionList", regionList);
		model.addAttribute("industryList", industryList);
		model.addAttribute("jobList", jobList);
		model.addAttribute("eduList", eduList);
		model.addAttribute("welfareList", welfareList);
		model.addAttribute("positionList", positionList);
		model.addAttribute("empltypeList", empltypeList);
		
		model.addAttribute("anno", anno);
		model.addAttribute("savedWelfareList", anno.getWelfareList());

		return "jsonView";
	}

	//경수
	@GetMapping("/myList")
	public String myList(
		Model model
		, @AuthMember MemberVO authMember
	) {
		String memId = authMember.getMemId();
		List<AnnoVO> list = service.retrieveMyAnnoList(memId);
		model.addAttribute("list", list);
		return "announcement/annoMyList";
	}
}