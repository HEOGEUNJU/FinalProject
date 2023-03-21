package kr.or.ddit.expert.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.company.vo.CompanyVO;
import kr.or.ddit.expert.dao.OtherDAO;
import kr.or.ddit.expert.service.ExpertService;
import kr.or.ddit.expert.vo.ExjobVO;
import kr.or.ddit.expert.vo.ExpertVO;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.MemberVO;
import oracle.net.aso.e;

@RequestMapping("/expert")
@Controller
public class ExpertApplicationController {
	@Inject
	private OtherDAO otherDAO;
	
	@Inject
	private ExpertService service;
	
	@GetMapping("/application1")
	public String expertApplication1(
		) {
			return "expert/application/expertApplication1";
	}
	@GetMapping("/application2")
	public String expertApplication2(
		@ModelAttribute("expert") ExpertVO expert	
		) {
		return "expert/application/expertApplication2";
	}
	@GetMapping("/application3")
	public String expertApplication3(
			) {
		return "expert/application/expertApplication3";
	}
	@PostMapping("/application2")
	public String applicationExpert(
		@Validated(InsertGroup.class) @ModelAttribute("expert") ExpertVO expert
		,@AuthMember MemberVO authMember
		,Errors errors
		, Model model	
		) {
		expert.setMemId(authMember.getMemId());
		boolean valid = !errors.hasErrors();
		String message ="";
		if(valid) {
			int result = service.aplicationExpert(expert);
			if(result > 0) {
				message = "성공적으로 입력되었습니다.";
				return "redirect:/mypage/seeke";
			}
			else {
				message = "서버 오류";
				return "expert/application/application2";
			}
		}
		else {
			message = "오류났음.";
			model.addAttribute("message", message);
			return "expert/application/application2";
		}
		
	}
	@PostMapping("/exfield")
	@ResponseBody
	public List exjobDetailList(
		@RequestBody ExjobVO exjob
		)throws Exception{
		String exfieldId = exjob.getExfieldId();
		return otherDAO.selectExjobList(exfieldId);
	}

}
