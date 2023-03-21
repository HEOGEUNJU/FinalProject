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

import kr.or.ddit.resume.service.FacilityService;
import kr.or.ddit.resume.vo.ActivityVO;
import kr.or.ddit.resume.vo.AwardVO;
import kr.or.ddit.resume.vo.FacilityVO;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemberVOWrapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/facility")
public class FacilityController {

	@Inject
	private FacilityService service;
	
	@ModelAttribute("facility")
	public FacilityVO facility() {
		return new FacilityVO();
	}
	
	@GetMapping
	public String facilityList() {
		return "resume/items/facility";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String listData(
		Model model
		, @AuthMember MemberVO authMember
	) {
		List<FacilityVO> facilityList = service.retrieveFacilityList(authMember.getMemId());
		model.addAttribute("facilityList", facilityList);
		return "jsonView";
	}
	
	@GetMapping("/{facilitySn}")
	public String facilityView(@PathVariable String facilitySn, Model model) {
		FacilityVO facility = service.retrieveFacility(facilitySn);
		model.addAttribute("facility", facility);
		return "resume/items/facilityView";
	}
	
	@GetMapping("/insert")
	public String facilityForm() {
		return "resume/items/facilityForm";
	}
	
	@PostMapping("/insert")
	public String facilityInsert(
		@ModelAttribute("facility") FacilityVO facility
		, Model model
		, @AuthenticationPrincipal MemberVOWrapper principal
	) {
		MemberVO authMember = principal.getRealMember();
		facility.setMemId(authMember.getMemId());
		service.createFacility(facility);
		return "redirect:" + facility.getFacilitySn();
	}
	
	@GetMapping("/update")
	public String facilityUdateForm(@RequestParam("facilitySn") String facilitySn, Model model) {
		FacilityVO facility = service.retrieveFacility(facilitySn);
		model.addAttribute("facility", facility);
		return "resume/items/facilityForm";
	}
	
	@PostMapping("/update")
	public String facilityUpdate(@ModelAttribute("facility") FacilityVO facility, Model model) {
		service.modifyFacility(facility);
		return "redirect:" + facility.getFacilitySn();
	}
	
	@PostMapping("/delete")
	public String facilityDelete(@RequestParam("facilitySn") String facilitySn, Model model) {
		service.removeFacility(facilitySn);
		return "redirect:/facility";
	}		
}
