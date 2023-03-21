package kr.or.ddit.expert.controller;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.expert.service.ExprodService;
import kr.or.ddit.expert.vo.ExprodVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;

@Controller
@RequestMapping("/mission")
public class missionController {
	@Inject
	private ExprodService exprodservice;

	@GetMapping
	public String mission(
		@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage
		,@ModelAttribute("simpleCondition") SearchVO searchVO
		,Model model	
		) {
		PagingVO<ExprodVO> pagingVO = new PagingVO<>(13,10
				);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		exprodservice.selectExprodMissionList(pagingVO);
		model.addAttribute("pagingVO", pagingVO);
		return "expert/mission";
	}
	
	@ResponseBody	
	@PostMapping(value="/search", produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	public PagingVO exprodSearch(
		@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage
		,@ModelAttribute("simpleCondition") SearchVO searchVO
		,Model model
		) {
		PagingVO<ExprodVO> pagingVO = new PagingVO<>();
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		exprodservice.selectExprodMissionList(pagingVO);
		model.addAttribute("pagingVO", pagingVO);
		return pagingVO;
	}
	
	@ResponseBody
	@PostMapping(value="/delete", produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	public void deleteProd(
		@RequestParam("exprodId") String exprodId
		) {
		exprodservice.removeExprod(exprodId);
	}
	
	@ResponseBody
	@PostMapping(value ="/update", produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	public void updateExprod(
		ExprodVO exprod
		) {
		exprodservice.updateExprodName(exprod);
	}
	@ResponseBody
	@PostMapping(value ="/updateModal", produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	public void updateModalExprod(
			ExprodVO exprod
			) {
		exprodservice.updateExprod(exprod);
	}
	@ResponseBody
	@PostMapping(value ="/newprod", produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	public void newExprod(
		ExprodVO exprod
		) {
//		String exprodName = exprod.getExprodName();
		
		
		exprodservice.InsertExprod(exprod);
	}
}
