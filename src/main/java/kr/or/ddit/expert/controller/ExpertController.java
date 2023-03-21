package kr.or.ddit.expert.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.expert.dao.OtherDAO;
import kr.or.ddit.expert.service.ExeventService;
import kr.or.ddit.expert.service.ExpertService;
import kr.or.ddit.expert.service.ExprodService;
import kr.or.ddit.expert.service.ExreviewService;
import kr.or.ddit.expert.vo.ExeventVO;
import kr.or.ddit.expert.vo.ExlprodVO;
import kr.or.ddit.expert.vo.ExpertVO;
import kr.or.ddit.expert.vo.ExprodVO;
import kr.or.ddit.expert.vo.ExreviewVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;

@Controller
@RequestMapping("/expert")
public class ExpertController {
	@Inject
	private OtherDAO otherDAO;	
	@Inject
	private ExeventService exventservice;
	@Inject
	private ExprodService exprodservice;
	@Inject
	private ExreviewService exreviewService;
	@Inject
	private ExpertService expertService;
	
	@GetMapping("/search")
	public String expertMainSearch(
		@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage
		,@ModelAttribute("simpleCondition")SearchVO searchVO
		,Model model
		) {
		PagingVO<ExprodVO> pagingVO = new PagingVO<>(12,5);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		exprodservice.selectExprodList(pagingVO);
		model.addAttribute("pagingVO", pagingVO);
		
		return "expert/expertList";
	}
	
	@GetMapping("/detail/{memId}")
	public String expertDetail(
		@PathVariable("memId") String memId
		,Model model
		) {
		ExpertVO expert = expertService.retrieveMember(memId);
		model.addAttribute("expert", expert);
		return "expert/expertDetail";
	}
	
	@GetMapping
	public String expertMain(
		@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage
		,@ModelAttribute("simpleCondition") SearchVO searchVO
		,Model model
		) {
		PagingVO<ExprodVO> pagingVO = new PagingVO<>();
		PagingVO<ExeventVO> pagingVO2 = new PagingVO<>();
		PagingVO<ExreviewVO> pagingVO3 = new PagingVO<>();
		List<ExprodVO> topExprodList = new ArrayList<>(); 
		topExprodList = exprodservice.selectTopExprodList();
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		pagingVO2.setCurrentPage(currentPage);
		pagingVO2.setSimpleCondition(searchVO);
		pagingVO3.setCurrentPage(currentPage);
		pagingVO3.setSimpleCondition(searchVO);
		exventservice.retrieveExeventList(pagingVO2);
		exprodservice.selectExprodList(pagingVO);
		exreviewService.selectReveiwList(pagingVO3);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("pagingVO2", pagingVO2);
		model.addAttribute("pagingVO3", pagingVO3);
		model.addAttribute("topExprodList", topExprodList);
		return "expert/expertMain";
	} 
 
	@GetMapping("/CLASS")
	public String expertClassList(
		@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage
		,@ModelAttribute("simpleCondition") SearchVO searchVO
		,Model model
		) {
		PagingVO<ExprodVO> pagingVO = new PagingVO<ExprodVO>(9,5);
		searchVO.setSearchType("EL001");
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		exprodservice.selectExprodList(pagingVO);
		List<ExlprodVO> exlprod = new ArrayList<>();
		exlprod = otherDAO.selectExlprodList("EL001");
		model.addAttribute("pagingVO", pagingVO);	
		model.addAttribute("exlprod", exlprod);	
		return "expert/expertList";
	} 
	@GetMapping("/CONSULTING")
	public String expertProductList(
		@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage
		,@ModelAttribute("simpleCondition") SearchVO searchVO
		,Model model
		) {
		PagingVO<ExprodVO> pagingVO = new PagingVO<ExprodVO>(9,5);
		searchVO.setSearchType("EL002");
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		exprodservice.selectExprodList(pagingVO);
		List<ExlprodVO> exlprod = new ArrayList<>();
		exlprod = otherDAO.selectExlprodList("EL002");
		model.addAttribute("pagingVO", pagingVO);	
		model.addAttribute("exlprod", exlprod);		
		return "expert/expertList";
	} 

}
