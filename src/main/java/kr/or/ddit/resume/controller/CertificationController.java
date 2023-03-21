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

import kr.or.ddit.resume.service.CertificationService;
import kr.or.ddit.resume.vo.ActivityVO;
import kr.or.ddit.resume.vo.CertificationVO;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemberVOWrapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/certification")
public class CertificationController {

	@Inject
	private CertificationService service;
	
	@ModelAttribute("certification")
	public CertificationVO certification() {
		return new CertificationVO();
	}
	
	@GetMapping
	public String certificationList() {
		return "resume/items/certification";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String listData(
		Model model
		, @AuthMember MemberVO authMember
	) {
		List<CertificationVO> certificationList = service.retrieveCertificationList(authMember.getMemId());
		model.addAttribute("certificationList", certificationList);
		return "jsonView";
	}
	
	@GetMapping("/{certificationSn}")
	public String certificationView(@PathVariable String certificationSn, Model model) {
		CertificationVO certification = service.retrieveCertification(certificationSn);
		model.addAttribute("certification", certification);
		return "resume/items/certificationView";
	}
	
	@GetMapping("/insert")
	public String certificationForm() {
		return "resume/items/certificationForm";
	}
	
	@PostMapping("/insert")
	public String certificationInsert(
		@ModelAttribute("certification") CertificationVO certification
		, Model model
		, @AuthenticationPrincipal MemberVOWrapper principal
	) {
		MemberVO authMember = principal.getRealMember();
		certification.setMemId(authMember.getMemId());
		service.createCertification(certification);
		return "redirect:" + certification.getCertSn();
	}
	
	@GetMapping("/update")
	public String certificationUdateForm(@RequestParam("certSn") String certSn, Model model) {
		CertificationVO certification = service.retrieveCertification(certSn);
		model.addAttribute("certification", certification);
		return "resume/items/certificationForm";
	}
	
	@PostMapping("/update")
	public String certificationUpdate(@ModelAttribute("certification") CertificationVO certification, Model model) {
		service.modifyCertification(certification);
		return "redirect:" + certification.getCertSn();
	}
	
	@PostMapping("/delete")
	public String certificationDelete(@RequestParam("certSn") String certSn, Model model) {
		service.removeCertification(certSn);
		return "redirect:/certification";
	}	
}
