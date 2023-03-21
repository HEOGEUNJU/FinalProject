package kr.or.ddit.board.controller;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.board.service.InterviewService;
import kr.or.ddit.board.vo.InterviewVO;
import kr.or.ddit.company.vo.CompanyVO;
import kr.or.ddit.ui.PaginationRenderer;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/interview")
public class InterviewController {

	@Inject
	private InterviewService service;

	@Resource(name="bootstrapPaginationRender")
	private PaginationRenderer renderer;

	@ModelAttribute("simpleCondition")
	public SearchVO searchVO() {
		return new SearchVO();
	}

	// ui
	@GetMapping("/interviewList")
	public String interviewUI(
		Authentication authentication
		, Model model
	) {
		String memId = "";
		// 운영자로 로그인 했나?
		if(authentication!= null) {
			String role = authentication.getAuthorities().toString();
			if(role.equals("[ROLE_ADMIN]")) {
				memId = authentication.getName();
			}
		}
		model.addAttribute("memId", memId);
		return "interview/interviewList";
	}

	// 인터뷰글 전체조회 + 페이징 + 검색
	@GetMapping(value="/interviewList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String interviewList(
			Model model,
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@ModelAttribute("simpleCondition") SearchVO searchVO,
			@RequestParam(value="gubun",required=false,defaultValue="") String gubun
	) {

		log.info("왔나?");
		PagingVO<InterviewVO> pagingVO = new PagingVO<>(9,5);

		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);

		InterviewVO interviewVO = new InterviewVO();
		interviewVO.setJobSub(gubun);

		pagingVO.setSimpleCondition(searchVO);
		pagingVO.setDetailCondition(interviewVO);

		service.retrieveInterviewList(pagingVO);
		log.info("interviewVO>>>>>>>: {}", interviewVO);
		model.addAttribute("pagingVO", pagingVO);
		log.info("pagingVO1111111111111>>>>>>>: {}", pagingVO);

		if(!pagingVO.getDataList().isEmpty())
			model.addAttribute("pagingHTML", renderer.renderPagination(pagingVO));
		log.info("pagingVO22222222222222222>>>>>>>: {}", pagingVO);

		// System.out.println(pagingVO);
		return "jsonView";
	}

	// 상세조회
	@GetMapping("/interviewDetail")
	public String detailInterview(
			Model model,
			@RequestParam("incumNo") String incumNo,
			Authentication authentication
	) {
		String memId = "";
		// 운영자로 로그인 했나?
		if(authentication!= null) {
			String role = authentication.getAuthorities().toString();
			if(role.equals("[ROLE_ADMIN]")) {
				memId = authentication.getName();
			}
		}
		model.addAttribute("memId", memId);

		InterviewVO interview = service.retrieveInterview(incumNo);
		service.updateHis(incumNo);
		model.addAttribute("interview", interview);
		return "interview/interviewDetail";
	}
}
