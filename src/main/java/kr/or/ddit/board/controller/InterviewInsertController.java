package kr.or.ddit.board.controller;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.board.service.InterviewService;
import kr.or.ddit.board.vo.InterviewVO;
import kr.or.ddit.company.service.CompanyService;
import kr.or.ddit.company.vo.CompanyVO;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.vo.IncruiterVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/interview/interviewInsert")
public class InterviewInsertController {

	@Inject
	private InterviewService service;

	@ModelAttribute("company")
	public CompanyVO company() {
		return new CompanyVO();
	}

	@ModelAttribute("interview")
	public InterviewVO interview() {
		return new InterviewVO();
	}

	@GetMapping
	public String interviewForm(
		Model model
		, @ModelAttribute("interview") InterviewVO interview
		, @ModelAttribute("incruiter") IncruiterVO incruiter
		, @ModelAttribute("simpleCondition") SearchVO searchVO
		, Authentication auth
		) {
		if(auth != null) {
			String role = auth.getAuthorities().toString();
			if (role.equals("[ROLE_ADMIN]")) {
				return "interview/interviewInsert";
			}else {
				return "interview/interviewList";
			}
		}
		return "/interview/interviewList";
	}

//	@AuthMember MemberVO authMember
	@PostMapping
	public String writeInterview(Model model,
			@ModelAttribute("interview") InterviewVO interview) {
		log.info("interview : " + interview);

		String viewName = null;

		int rowcnt = service.createInterview(interview);
		if (rowcnt > 0) {
			viewName = "redirect:interviewList";
		} else {
			viewName = "interview/interviewInsert";
		}
		return viewName;

	}

}
