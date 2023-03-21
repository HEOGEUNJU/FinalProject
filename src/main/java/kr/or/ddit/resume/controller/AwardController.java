package kr.or.ddit.resume.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.resume.service.AwardService;
import kr.or.ddit.resume.vo.AwardVO;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemberVOWrapper;

/**
 * @author 최경수
 * @since 2023. 2. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 	    수정일               수정자                                     수정내용
 * --------     --------    ----------------------
 * 2023. 2. 6.       최경수        최초작성
 * 2023. 2. 7.       최경수        삭제 추가
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/award")
public class AwardController {

	@Inject
	private AwardService service;
	
	@ModelAttribute("award")
	public AwardVO award() {
		return new AwardVO();
	}
	
	@GetMapping
	public String awardList() {
		return "resume/items/award";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String listData(
		Model model
		, @AuthMember MemberVO authMember
	) {
		List<AwardVO> awardList = service.retrieveAwardList(authMember.getMemId());
		model.addAttribute("awardList", awardList);
		return "jsonView";
	}
	
	@GetMapping("/{awardSn}")
	public String awardView(@PathVariable String awardSn, Model model) {
		AwardVO award = service.retrieveAward(awardSn);
		model.addAttribute("award", award);
		return "resume/items/awardView";
	}
	
	@GetMapping("/insert")
	public String awardForm() {
		return "resume/items/awardForm";
	}
	
	@PostMapping("/insert")
	public String awardInsert(
		@ModelAttribute("award") AwardVO award
		, Model model
		, @AuthenticationPrincipal MemberVOWrapper principal
	) {
		MemberVO authMember = principal.getRealMember();
		award.setMemId(authMember.getMemId());
		service.createAward(award);
		return "redirect:" + award.getAwardSn();
	}
	
	@GetMapping("/update")
	public String awardUdateForm(@RequestParam("awardSn") String awardSn, Model model) {
		AwardVO award = service.retrieveAward(awardSn);
		model.addAttribute("award", award);
		return "resume/items/awardForm";
	}
	
	@PostMapping("/update")
	public String awardUpdate(@ModelAttribute("award") AwardVO award, Model model) {
		service.modifyAward(award);
		return "redirect:" + award.getAwardSn();
	}
	
	@PostMapping("/delete")
	public String awardDelete(@RequestParam("awardSn") String awardSn, Model model) {
		service.removeAward(awardSn);
		return "redirect:/award";
	}	
	
}
