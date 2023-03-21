package kr.or.ddit.expert.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.expert.service.ExcartService;
import kr.or.ddit.expert.service.ExprodService;
import kr.or.ddit.expert.service.ExreviewService;
import kr.or.ddit.expert.vo.ExcartVO;
import kr.or.ddit.expert.vo.ExeventVO;
import kr.or.ddit.expert.vo.ExprodVO;
import kr.or.ddit.expert.vo.ExreviewVO;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;

@Controller
@RequestMapping("/expert/review")
public class ExpertReviewController {
	
	@Inject
	public ExcartService excartService;
	@Inject
	public ExreviewService exreviewService;
	@Inject
	public ExprodService exprodService;
	
	@GetMapping
	public String expertReview(
		@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage
		,@ModelAttribute("simpleCondition") SearchVO searchVO
		,Model model
		) {
		PagingVO<ExreviewVO> pagingVO = new PagingVO<ExreviewVO>(9,5);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		
		exreviewService.selectReveiwList(pagingVO);
		model.addAttribute("pagingVO", pagingVO);
		return "expert/expertReviewList";
	} 
	
	@GetMapping("/detail/{exprodId}")
	public String expertReviewDetail(
		@PathVariable("exprodId") String exprodId	
		,Model model
		) {
		ExprodVO exprod = new ExprodVO();
		exprod = exprodService.selectExprod(exprodId);
		model.addAttribute("exprod", exprod);
		return "expert/expertReviewDetail";
	} 
	@GetMapping("/write")
	public String exreviewWrite(
		@AuthMember MemberVO authMember
		, Model model
		) {
		List<ExprodVO> exprodList = new ArrayList<>();
		String memId = authMember.getMemId();
		List<ExcartVO> excartList = excartService.selectExcartList(memId);
		for(int i=0; i<excartList.size(); i++) {
			String exprodId =excartList.get(i).getExprodId();
			exprodList.add(exprodService.selectExprod(exprodId));
		}
		model.addAttribute("exprodList", exprodList);
		model.addAttribute("excartList", excartList);
		return "expert/expertReviewWrite";
	}
	@PostMapping("/write")
	public String exreviewWirtePost(
		@ModelAttribute("exreview") ExreviewVO exreview
		,Errors errors
		,Model model
		) {
	    boolean valid = !errors.hasErrors();
	    String viewName = "";
	    ExcartVO excart = new ExcartVO();
	    int result = 0;
	    excart = excartService.slectExcart(exreview.getExcartId());
	    if(valid) {
	    	if(excart.getReviewState().equals("Y")) {
	    		result = exreviewService.updateReview(exreview);
	    	}else {
	    		result = exreviewService.insertReview(exreview);
	    	}
	       if(result > 0) {
	            viewName = "redirect:/expert/review";
	       }
	       else {
	          model.addAttribute("message","서버 오류, 쫌다 다시");
	          viewName = "expert/expertReviewWrite";
	       }
	    }
	    else {
	    	viewName = "expert/expertReviewWrite";
	    }
	      return viewName;

	}
	@GetMapping("/update/{exreviewId}")
	public String exreviewUpdate(
		@PathVariable("exreviewId") String exreviewId,
		Model model
		) {
		ExreviewVO exreview = exreviewService.selectReview(exreviewId);
		model.addAttribute("exreview", exreview);
		return "expert/expertReviewUpdate";
	}
	@PostMapping("/update/{exreviewId}")
	public String exreviewUpdatePost(
		@ModelAttribute("exreview") ExreviewVO exreview
		,Errors errors
		,Model model
		) {
	    boolean valid = !errors.hasErrors();
	    String viewName = "";
	    int result = 0;
	    if(valid) {
	    		result = exreviewService.updateReview(exreview);
	       if(result > 0) {
	            viewName = "redirect:/expert/review";
	       }
	       else {
	          model.addAttribute("message","서버 오류, 쫌다 다시");
	          viewName = "expert/expertReviewUpdate";
	       }
	    }
	    else {
	    	viewName = "expert/expertReviewUpdate";
	    }
	      return viewName;

	}
}

