package kr.or.ddit.expert.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.expert.service.ExpertService;
import kr.or.ddit.expert.service.ExprodService;
import kr.or.ddit.expert.vo.ExcartVO;
import kr.or.ddit.expert.vo.ExpertVO;
import kr.or.ddit.expert.vo.ExprodVO;
import kr.or.ddit.expert.vo.ExreviewVO;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemberVOWrapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/expert")
public class ExpertProdController {
	
	@Inject
	private ExprodService exprodservice;
	@Inject
	private ExpertService expertService;
	@Inject 
	private MemberService memberService;
	
	@ModelAttribute("exprod")
	public ExprodVO exprodVO() {
		return new ExprodVO();
	}

	@GetMapping("/prod/{exprodId}")
	public String expertDetail(
		@PathVariable("exprodId")String exprodId
		, @ModelAttribute("exprod") ExprodVO exprod
		, @ModelAttribute("excart") ExcartVO excart
		,Errors errors
		,Model model
		, Authentication authentication
		) {
		exprod =  exprodservice.selectExprod(exprodId);
		String memId = exprod.getMemId();
		ExpertVO expert = expertService.retrieveMember(memId);
		MemberVO member = memberService.retrieveMember(memId);
		model.addAttribute("member", member);
		model.addAttribute("expert", expert);
		model.addAttribute("exprod", exprod);
		if(authentication==null) {
			log.info("어쓰 널임");
		}else {
			MemberVOWrapper wrapper = (MemberVOWrapper) authentication.getPrincipal();
			MemberVO realMember = wrapper.getRealMember();
			log.info("어쓰 널 아님 : {}",realMember.getMemId());
			String seekerMemId = realMember.getMemId();
			int selectLikeExprod = exprodservice.retrieveLikeExprod(exprodId, seekerMemId);
			model.addAttribute("selectLikeExprod", selectLikeExprod);
		}
		
		return "expert/exprodDetail";
	}
	
	@PostMapping("/likeExprod")
	@ResponseBody
	public String insertLikeProd(
		@RequestBody Map<String,String> map
		, Model model
		) {
		int cnt = 0;
		String result = "";
		String exprodId = map.get("exprodId");
		String memId = map.get("memId");
		int selectLikeProd = exprodservice.retrieveLikeExprod(exprodId, memId);
		if(selectLikeProd>0) {
			cnt = exprodservice.removeLikeExprod(exprodId, memId);
			if(cnt>0) result = "delete";
		} else {
			cnt = exprodservice.createLikeExprod(exprodId, memId);
			if(cnt>0) result = "insert";
		}
		return result;
	}		
	
	@GetMapping("/pushprod/{exprodId}")
	public String exprodPushForm(
		@PathVariable("exprodId")String exprodId
		, @ModelAttribute("exprod") ExprodVO exprod
		,Errors errors
		,Model model
		) {
		exprod =  exprodservice.selectExprod(exprodId);
		model.addAttribute("form", "상품수정");
		model.addAttribute("exprod", exprod);
		return "expert/exprodForm";
	}
	@PostMapping("/pushprod/{exprodId}")
	public String exprodPush(
		@PathVariable("exprodId") String exprodId
		,@ModelAttribute("exprod") ExprodVO exprod
		,Errors errors
		,Model model
		) {
	    boolean valid = !errors.hasErrors();
	    String viewName = "";
	    if(valid) {
	       int result = exprodservice.updateExprod(exprod);
	       if(result > 0) {
	            viewName = "redirect:/mypage/expert";
	       }
	       else {
	          model.addAttribute("message","서버 오류, 쫌다 다시");
	          viewName = "expert/exprodForm";	
	       }
	    }
	    else {
	    	viewName = "expert/exprodForm";
	    }
	      return viewName;
	
	}
	
	
	
	
	@GetMapping("/newprod")
	public String exprodInsertForm(
		@ModelAttribute("exprod") ExprodVO exprod	
		, Model model
		) {
		model.addAttribute("form", "상품등록");
		return "expert/exprodForm";
	}
	@PostMapping("/newprod")
	public String exprodInsert(
		@ModelAttribute("exprod") ExprodVO exprod
		,@AuthenticationPrincipal MemberVOWrapper principal
		,Errors errors
		,Model model
		) {
		MemberVO authMember = principal.getRealMember();
		exprod.setMemId(authMember.getMemId());
		
	    boolean valid = !errors.hasErrors();
	    String viewName = "";
	    if(valid) {
	       int result = exprodservice.InsertExprod(exprod);
	       if(result > 0) {
	            viewName = "redirect:/mypage/expert";
	       }
	       else {
	          model.addAttribute("message","서버 오류, 쫌다 다시");
	          viewName = "expert/exprodForm";
	       }
	    }
	    else {
	    	viewName = "expert/exprodForm";
	    }
	      return viewName;
	
	}

}
