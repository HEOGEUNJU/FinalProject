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

import kr.or.ddit.resume.service.CareerService;
import kr.or.ddit.resume.vo.ActivityVO;
import kr.or.ddit.resume.vo.AwardVO;
import kr.or.ddit.resume.vo.CareerVO;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemberVOWrapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/career")
public class CareerController {

	@Inject
	private CareerService service;
	
	@ModelAttribute("career")
	public CareerVO career() {
		return new CareerVO();
	}
	
	@GetMapping
	public String careerList() {
		return "resume/items/career";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String listData(
		Model model
		, @AuthMember MemberVO authMember
	) {
		List<CareerVO> careerList = service.retrieveCareerList(authMember.getMemId());
		model.addAttribute("careerList", careerList);
		return "jsonView";
	}
	
	@GetMapping("/{careerSn}")
	public String careerView(@PathVariable String careerSn, Model model) {
		CareerVO career = service.retrieveCareer(careerSn);
		model.addAttribute("career", career);
		return "resume/items/careerView";
	}
	
	@GetMapping("/insert")
	public String careerForm() {
		return "resume/items/careerForm";
	}
	
	@PostMapping("/insert")
	public String careerInsert(
		@ModelAttribute("career") CareerVO career
		, Model model
		, @AuthenticationPrincipal MemberVOWrapper principal
	) {
		MemberVO authMember = principal.getRealMember();
		career.setMemId(authMember.getMemId());
		service.createCareer(career);
		return "redirect:" + career.getCareerSn();
	}
	
	@GetMapping("/update")
	public String careerUdateForm(@RequestParam("careerSn") String careerSn, Model model) {
		CareerVO career = service.retrieveCareer(careerSn);
		model.addAttribute("career", career);
		return "resume/items/careerForm";
	}
	
	@PostMapping("/update")
	public String careerUpdate(@ModelAttribute("career") CareerVO career, Model model) {
		service.modifyCareer(career);
		return "redirect:" + career.getCareerSn();
	}
	
	@PostMapping("/delete")
	public String careerDelete(@RequestParam("careerSn") String careerSn, Model model) {
		service.removeCareer(careerSn);
		return "redirect:/career";
	}	
}
