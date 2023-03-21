package kr.or.ddit.selfpr.controller;

import javax.annotation.Resource;
/**
 * 
 * @author 작성자명
 * @since 2023. 2. 23.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2.23.      윤호연       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.security.AuthMember;
import kr.or.ddit.selfpr.service.LikeService;
import kr.or.ddit.selfpr.vo.LikeVO;
import kr.or.ddit.ui.PaginationRenderer;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/selfpr/like")
public class selfprLikeController {
	
	@Resource(name="bootstrapPaginationRender")
	private PaginationRenderer renderer;
	
	private final LikeService service;
	
	@GetMapping
	public String selfprLikeList(
		@AuthMember MemberVO authMember
		, @RequestParam(value = "page", required=false, defaultValue="1") int currentPage
		, @ModelAttribute("simpleCondition") SearchVO searchVO
		, Model model
	) {
		String memId = authMember.getMemId();
		PagingVO<LikeVO> pagingVO = new PagingVO<>(5,10);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		pagingVO.setMemId(memId);
		
		service.retrieveLikeList(pagingVO);
		
		model.addAttribute("pagingVO", pagingVO);
//		System.out.println(pagingVO);
		
		return "selfpr/selfPrLike";
	}
	
	@PostMapping("/likepr")
	public String insertLike(
		@AuthMember MemberVO authMember	
		, Model model
		, @ModelAttribute("like") LikeVO like
		, Errors errors
	) {
		String memId = authMember.getMemId();
		like.setMemId(memId);
		
		String viewName = null;
		if(!errors.hasErrors()) {
			int rowcnt = service.createLike(like);
			
			if(rowcnt > 0) {
				viewName = "redirect:/selfpr/like";
			}else {
				model.addAttribute("message", "서버 오류");
				viewName = "selfpr/like";
			}
		}else {
			viewName = "selfpr/like";
		}
		return viewName;
	}
		
		
	@PostMapping("/deleteLikepr")
	public String deleteLike(
		@AuthMember MemberVO authMember
		, @RequestParam("prNo") int prNo
		, Model model
	) {
		String memId = authMember.getMemId();
		LikeVO like = new LikeVO();
		like.setMemId(memId);
		like.setPrNo(prNo);
		
		System.out.println(memId);
		System.out.println(prNo);
		
		service.removeLike(like);
		return "redirect:/selfpr/like";
	}
	
	@PostMapping("/likeMatch")
	public void countprLike(
		@AuthMember MemberVO authMember
		, @ModelAttribute("like") LikeVO like
		, @RequestParam("prNo") int prNo
		, Model model
	) {
		service.matchLike(like);
	}
	
	
}
