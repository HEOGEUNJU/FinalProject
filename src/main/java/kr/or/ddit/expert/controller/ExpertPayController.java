package kr.or.ddit.expert.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.websocket.server.PathParam;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.expert.service.ExcartService;
import kr.or.ddit.expert.vo.ExcartVO;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.vo.MemberVO;

@Controller
@RequestMapping("/expert")
public class ExpertPayController {

	@Inject
	private ExcartService excartService;
	
	@PostMapping(value ="/updateState")
	public String updateExcartState(
		@RequestBody ExcartVO excart
		) {
		String exprodId = excart.getExprodId();
		String memId = excart.getMemId();
		ExcartVO dataExcart = new ExcartVO();
		dataExcart.setExprodId(exprodId);
		dataExcart.setMemId(memId);
		excartService.retrieveExcartState(dataExcart);
		return "끝났따";
	}
	
	@GetMapping("/pay/{exprodId}")
	public String expertPay(
		@PathParam("exprodId") String exprodId
		) {
		return "expert/expertPay";
	}
	
	@PostMapping("/pay/{exprodId}")
	public String excartPay(
		@PathVariable("exprodId")String exprodId
		, @ModelAttribute("excart") ExcartVO excart
		,@AuthMember MemberVO authMember
		,Errors errors
		,Model model
		) {
		excart.setMemId(authMember.getMemId());
		excart.setExprodId(exprodId);
		
		boolean valid = !errors.hasErrors();
	    String viewName = "";
	    if(valid) {
	    	int result = excartService.insertExcart(excart);
		       if(result > 0) {
		            viewName = "redirect:/mypage/seeker";
	       }
	       else {
	          model.addAttribute("message","서버 오류, 쫌다 다시");
	          viewName = "expert/prod/"+excart.getExprodId();
	       }
	    }
	    else {
	    	viewName = "expert/prod/"+excart.getExprodId();
	    }
	      return viewName;
	}
	
}
