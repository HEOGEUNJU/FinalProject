package kr.or.ddit.lab.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.lab.service.ContestService;
import kr.or.ddit.lab.vo.ContestVO;
import kr.or.ddit.ui.PaginationRenderer;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import lombok.RequiredArgsConstructor;

/**
 * 
 * @author 작성자명
 * @since 2023. 3. 3.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 3. 3.   윤호연               최초작성
 * 2023. 3. 6. 	  윤호연		1차수정
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */

@RequiredArgsConstructor
@Controller
@RequestMapping("/lab/contest")
public class labContController {

	private final ContestService service;
	
	@Resource(name="bootstrapPaginationRender")
	private PaginationRenderer renderer;
	
	@GetMapping
	public String labContestMain(
//		@RequestBody PagingVO<ContestVO> pagingVO,
		Model model
	) {
		return "lab/labContestView";
	}
	
	@ResponseBody
	@PostMapping
	public PagingVO<ContestVO> labContestList(
		@RequestParam(value ="page", required=false, defaultValue="1") int currentPage
		, @ModelAttribute("simpleCondition") SearchVO searchVO
		, Model model
	){
		PagingVO<ContestVO> pagingVO = new PagingVO<>();
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		
		service.retrieveContestList(pagingVO);
		
		model.addAttribute("pagingVO", pagingVO);
		if(!pagingVO.getDataList().isEmpty())
			model.addAttribute("pagingHTML", renderer.renderPagination(pagingVO));
		
		return pagingVO; 
	}
	
	@GetMapping("/detail")
	public String labContestDetail(
		@RequestParam(value="no") String contNo
		, Model model
	) {
		ContestVO contest = new ContestVO();
		contest = service.retrieveContest(contNo);
		
		model.addAttribute("contest", contest);
		
		return "lab/labContestDetail";
	}
	
	@GetMapping("/insertForm")
	public String InsertForm(
		Model model
	) {
		return "lab/labContestForm";
	}
	
	
	@PostMapping("/insert")
	public String InsertContest(
		@ModelAttribute("contest") ContestVO contest
		, Model model
	) {
		return "";
	}
	
}
