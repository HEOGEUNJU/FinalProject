package kr.or.ddit.expert.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.expert.service.ExeventService;
import kr.or.ddit.expert.vo.ExeventVO;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/expert/event")
public class ExpertEventController {
	
	@Inject
	private ExeventService service;
	
	@GetMapping
	public String expertEventList(
		@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage
		,@ModelAttribute("simpleCondition") SearchVO searchVO
		,Model model	
		) {
		PagingVO<ExeventVO> pagingVO = new PagingVO<ExeventVO>(9,5);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		service.retrieveExeventList(pagingVO);
		
		PagingVO<ExeventVO> pagingVO2 = new PagingVO<ExeventVO>(9,5);
		pagingVO2.setCurrentPage(currentPage);
		pagingVO2.setSimpleCondition(searchVO);
		service.retrieveEndExeventList(pagingVO2);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("pagingVO2", pagingVO2);
		
		return "expert/expertEventList";
				
	}
	@GetMapping("/detail/{exeventId}")
	public String expertEventDetail(
		@PathVariable("exeventId") String exeventId
		,@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage
		,@ModelAttribute("simpleCondition") SearchVO searchVO
		,Model model
		) {
		PagingVO<ExeventVO> pagingVO = new PagingVO<ExeventVO>(9,5);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		service.retrieveExeventList(pagingVO);
		ExeventVO exevent = service.retrieveExevent(exeventId);
		service.updateHits(exeventId);
		model.addAttribute("exevent", exevent);
		model.addAttribute("pagingVO", pagingVO);
		return "expert/expertEventDetail";
	}
	@GetMapping("/update/{exeventId}")
	public String expertEventUpdate(
			@PathVariable("exeventId") String exeventId
			,Model model
			) {
		ExeventVO exevent = service.retrieveExevent(exeventId);
		log.info("exevent.getAttatchList 들어간 값들 : {}",exevent.getAttatchList());
		model.addAttribute("exevent", exevent);
		return "expert/expertEventWrite";
	}
	
	@GetMapping("/write")
	public String expertEventForm(
		@ModelAttribute("exevent") ExeventVO event
		) {
		return "expert/expertEventWrite";
	}
	@PostMapping("/write")
	public String expertEventWrite(
		@Validated(InsertGroup.class) @ModelAttribute("exevent") ExeventVO event
		, Errors errors
		, Model model
		) {
	      boolean valid = !errors.hasErrors();
	      String viewName = "";
	      if(valid) {
	         int result = service.createExevent(event);
	         if(result > 0) {
	            viewName = "redirect:/expert/event";
	         }
	         else {
	            model.addAttribute("message","서버 오류, 쫌다 다시");
	            viewName = "expert/write";
	         }
	      }
	      else {
	         viewName = "expert/write";
	      }
	      return viewName;
	}
	
	@PostMapping("/update/{exeventId}")
	public String updateExevent(
		@PathVariable("exeventId") String exeventId
		,@Validated(UpdateGroup.class) @ModelAttribute("exevent") ExeventVO event
		, Errors errors
		, Model model
		) {
		{
		      boolean valid = !errors.hasErrors();
		      String viewName = "";
		      if(valid) {
		         int result = service.updateExevent(event);
		         if(result > 0) {
		            viewName = "expert/event";
		         }
		         else {
		            model.addAttribute("message","서버 오류, 쫌다 다시");
		            viewName = "expert/event/update";
		         }
		      }
		      else {
		         viewName = "expert/event/update";
		      }
		      return viewName;
		}
	}
	@DeleteMapping("/delete/{exeventId}")
	public String deleteExevent(
		@PathVariable("exeventId") String exeventId
		) {
		service.deleteExevent(exeventId);
		return "redirect:/expert/event";
	}
}
