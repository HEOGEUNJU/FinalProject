package kr.or.ddit.lab.controller;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.lab.service.NewsService;
import kr.or.ddit.lab.vo.NewsVO;
import kr.or.ddit.ui.PaginationRenderer;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 작성자명
 * @since 2023. 2. 1.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 2.      윤호연       최초작성
 * 2023. 2. 8.		윤호연       1차 수정
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("lab/News")
public class labNewsController {
	////
	@Resource(name="bootstrapPaginationRender")
	private PaginationRenderer renderer;
	////
	
	private final NewsService service;
	
	@GetMapping
	public String newsList(
		@RequestParam(value ="page", required=false, defaultValue="1") int currentPage
		, @ModelAttribute("simpleCondition") SearchVO searchVO
		, Model model
	) {
		PagingVO<NewsVO> pagingVO = new PagingVO<>(6,2);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		
		service.retrieveNewsList(pagingVO);
		
		model.addAttribute("pagingVO", pagingVO);
		System.out.println(pagingVO);
		
		return "lab/labNewsView";
	}
	
	@GetMapping("Detail")
	public String newsDetail(
		@RequestParam(value="no") String newsNo
		, @ModelAttribute("simpleCondition") SearchVO searchVO
		, Model model
	) {
		PagingVO<NewsVO> pagingVO = new PagingVO<>();
		pagingVO.setSimpleCondition(searchVO);
		
		service.retrieveNewsList(pagingVO);
		
		model.addAttribute("pagingVO", pagingVO);
		
		NewsVO news = service.retrieveNews(newsNo);
		model.addAttribute("news", news);
		
		return "lab/labNewsDetail";
	}
	
	@GetMapping("Form")
	public String NewsForm(
		Model model
	) {
		return "lab/labNewsForm";
	}	
	
	
	@PostMapping("Insert")
	public String InsertNews(
		Model model
		, @ModelAttribute("news") NewsVO news 
		, Errors errors
		, @RequestParam("categoryselect") String newsField
	) {
		news.setNewsField(newsField);
//		log.info(newsField);
		String viewname = null;
		if(!errors.hasErrors()) {
			int rowcnt = service.createNews(news);
			if(rowcnt > 0) {
				viewname = "redirect:/lab/News";
			}else {
				model.addAttribute("message","서버 오류");
				viewname = "lab/News/Form";
			}
		}else{
			viewname = "lab/News/Form";
		}
		return viewname;
	}
	
	@GetMapping("Update")
	public String updateForm(
		@RequestParam(value="no") String newsNo
		, Model model
	) {
		NewsVO news = service.retrieveNews(newsNo);
		model.addAttribute("news", news);
		return "lab/labNewsUpdateForm";
	}
	
	@PostMapping("Update")
	public String NewsUpdate(
		@ModelAttribute("news") NewsVO news
		, Errors errors
		, Model model
		, @RequestParam("categoryselect") String newsField
	) {
		news.setNewsField(newsField);
		String viewName = null;
		if(!errors.hasErrors()) {
			int rowcnt = service.modifyNews(news);
			if(rowcnt > 0) {
				viewName = "redirect:/lab/News/Detail?no="+news.getNewsNo();
			}else {
				model.addAttribute("message", "서버 오류");
				viewName = "lab/labNewsUpdateForm";
			}
		}else {
			viewName = "lab/labNewsUpdateForm";
		}
		return viewName;
	}
	
	@GetMapping("Delete")
	public String deleteNews(
		@RequestParam("no") String newsNo
		, Model model	
	) {
		service.removeNews(newsNo);
		return "redirect:/lab/News";
	}
}