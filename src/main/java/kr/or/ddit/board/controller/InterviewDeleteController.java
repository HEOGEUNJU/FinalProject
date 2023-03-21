package kr.or.ddit.board.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.board.service.InterviewService;
import kr.or.ddit.board.vo.InterviewVO;

@Controller
@RequestMapping("/interview/interviewDelete")
public class InterviewDeleteController {

	@Inject
	private InterviewService service;

	@PostMapping
	public String interviewDelete(
			Model model,
			@ModelAttribute("interview") InterviewVO interview
	) {
		String viewName = null;
		int rowcnt = service.removeInterview(interview);
		if (rowcnt > 0) {
			viewName = "redirect:interviewList";
		} else {
			viewName = "interview/interviewDetail";
		}
		return viewName;
	}

}
