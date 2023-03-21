package kr.or.ddit.board.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.board.service.InterviewService;
import kr.or.ddit.board.vo.InterviewVO;
import kr.or.ddit.lab.vo.CounAttachVO;
import kr.or.ddit.vo.IncruiterVO;
import kr.or.ddit.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("interview/interviewUpdate")
public class InterviewUpdateController {

	@Inject
	private InterviewService service;

	@GetMapping
	public String InterviewForm(
			Model model,
			@RequestParam("what") String incumNo,
			@ModelAttribute("incruiter") IncruiterVO incruiter,
			@ModelAttribute("simpleCondition") SearchVO searchVO
	) {
		log.info("incumNo : {}",incumNo);
		InterviewVO interview = service.retrieveInterview(incumNo);
		interview.setIncumNo(incumNo);
		log.info("interview : {}",interview);
		model.addAttribute("interview", interview);
		return "interview/interviewUpdate";
	}

	@PostMapping
	public String InterviewUpdate(
			Model model,
			@ModelAttribute("interview") InterviewVO interview
	) {
		log.info("포스트");
		String viewName = null;
		int rowcnt = service.modifyInterview(interview);

		if (rowcnt > 0) {
			viewName = "redirect:/interview/interviewList";
		} else {
			viewName = "interview/interviewUpdate";
		}
		return viewName;
	}

}
