package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.company.dao.CompanyDAO;
import kr.or.ddit.company.service.CompanyService;
import kr.or.ddit.company.vo.CompanyVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.IncruiterVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MenuVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import kr.or.ddit.vo.SeekerVO;
import lombok.extern.slf4j.Slf4j;

/**
 *  Backend controller(command handler) --> Plain Old Java Object
 */
@Slf4j
@Controller
@RequestMapping("/join")
public class MemberInsertController{
	@Inject
	private MemberService service;
	
	@Inject
	private CompanyService companyService;
	
	@ModelAttribute("company")
	public CompanyVO company() {
		return new CompanyVO();
	}
	@ModelAttribute("incruiter")
	public IncruiterVO IncruiterVO() {
		return new IncruiterVO();
	}
	@ModelAttribute("seeker")
	public SeekerVO SeekerVO() {
		return new SeekerVO();
	}
	
	@GetMapping("/seeker")
	public String seekerForm(
		@ModelAttribute("member") SeekerVO seeker	
		){
		return "join/seekerJoin";
	}
	
	
	@GetMapping("/incruiter")
	public String incruiterForm(
//			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage
			@ModelAttribute("simpleCondition") SearchVO searchVO
//			,@ModelAttribute("company") CompanyVO company
			,@ModelAttribute("incruiter") IncruiterVO incruiter
			,Model model
			){
//		PagingVO<CompanyVO> pagingVO = new PagingVO<CompanyVO>();
//		pagingVO.setCurrentPage(currentPage);
//		pagingVO.setSimpleCondition(searchVO);
		
//		companyService.retrieveCompanyList(pagingVO);
		
//		model.addAttribute("pagingVO", pagingVO);
		
		return "join/incruiterJoin";
	}
	
	@PostMapping("/seeker")
	public String seekerInsert(
		HttpServletRequest req 
		, @Validated(InsertGroup.class) @ModelAttribute("member") SeekerVO member	
		, Errors errors
	)throws ServletException, IOException {
		
		boolean valid = !errors.hasErrors();
		
		String viewName = null;
		 
		if(valid) {
			ServiceResult result = service.createSeeker(member);
			switch (result) {
			case PKDUPLICATED:
				req.setAttribute("message", "아이디 중복");
				viewName = "join/seekerJoin";
				break;
			case FAIL:
				req.setAttribute("message", "서버에 문제 있음. 쫌따 다시 하셈.");
				viewName = "join/seekerJoin";
				break;

			default:
				viewName = "redirect:/";
				break;
			}
		}else {
			viewName = "join/seekerJoin";
		}
		return viewName;
	}
	@PostMapping("/incruiter")
	public String incruiterInsert(
			HttpServletRequest req 
			, @Validated(InsertGroup.class) @ModelAttribute("member") IncruiterVO member	
			, Errors errors
			)throws ServletException, IOException {
		
		boolean valid = !errors.hasErrors();
		
		String viewName = null;
		
		if(valid) {
			ServiceResult result = service.createIcruiter(member);
			switch (result) {
			case PKDUPLICATED:
				req.setAttribute("message", "아이디 중복");
				viewName = "join/incruiterJoin";
				break;
			case FAIL:
				req.setAttribute("message", "서버에 문제 있음. 쫌따 다시 하셈.");
				viewName = "join/incruiterJoin";
				break;
				
			default:
				viewName = "redirect:/";
				break;
			}
		}else {
			viewName = "join/incruiterJoin";
		}
		return viewName;
	}
	
	@ResponseBody
	@GetMapping("/memIdcheck")
	public List<String> selectMemIdList(){
		List<String> memIdList = new ArrayList<>();
		memIdList = service.retrieveMemIdList();
		return memIdList;
	}
}




















