package kr.or.ddit.resume.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.resume.service.ResumeService;
import kr.or.ddit.resume.vo.ActivityVO;
import kr.or.ddit.resume.vo.AwardVO;
import kr.or.ddit.resume.vo.CareerVO;
import kr.or.ddit.resume.vo.CertificationVO;
import kr.or.ddit.resume.vo.CourseVO;
import kr.or.ddit.resume.vo.EducationVO;
import kr.or.ddit.resume.vo.FacilityVO;
import kr.or.ddit.resume.vo.ResumeItemVO;
import kr.or.ddit.resume.vo.ResumeVO;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.vo.MemberVO;

/**
 * @author 최경수
 * @since 2023. 2. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자       수정내용
 * -----------  --------    ----------------------
 * 2023. 2. 5.     최경수        최초작성
 * 2023. 2. 8.     최경수        각 이력서
 * 2023. 2. 10.    최경수        항목 목록 넣기 추가
 * 2023. 2. 12.    최경수        이력서 작성, 수정, 삭제
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/resume")
public class ResumeController {
	
	@Inject
	private ResumeService service;
	
	@ModelAttribute("resume")
	public ResumeVO resume() {
		return new ResumeVO();
	}
	
	@GetMapping
	public String resumeMain(
		Model model
		, @ModelAttribute ResumeVO resume
		, @AuthMember MemberVO authMember
	) {
		List<ResumeVO> resumeList = service.retrieveResumeList(authMember.getMemId());
		model.addAttribute("resumeList", resumeList);		
		return "resume/resumeMain";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String listData(
		Model model
		, @AuthMember MemberVO authMember
	){
		List<ResumeVO> resumeList = service.retrieveResumeList(authMember.getMemId());
		model.addAttribute("resumeList", resumeList);
		return "jsonView";
	}
	
	@GetMapping("/form")
	public String resumeForm(
		Model model
		, @ModelAttribute("resume") ResumeVO resume
		, @AuthMember MemberVO authMember
	) {
		return "resume/resumeForm";
	}
	
	@PostMapping("/form")
	public String resumeInsert(
		Model model
		, @ModelAttribute("resume") ResumeVO resume
		, @AuthMember MemberVO authMember
	) {
		resume.setMemId(authMember.getMemId());
		service.createResume(resume);
		return "redirect:/resume/" + resume.getResumeSn();
	}
	
	@GetMapping("/edit")
	public String resumeEdit(
		Model model
		, @RequestParam("resumeSn") String resumeSn
		, @ModelAttribute("resume") ResumeVO resume
		, @AuthMember MemberVO authMember
	) {
		resume = service.retrieveResume(resumeSn);
		model.addAttribute("resume", resume);
		return "resume/resumeEdit";
	}
	
//	@PatchMapping("/{resumeSn}")
	@PostMapping("/{resumeSn}/update")
	public String resumeUpdate(
		@PathVariable String resumeSn
		, Model model
		, @ModelAttribute("resume") ResumeVO resume
		, @AuthMember MemberVO authMember
	) {
		service.modifyResume(resume);
		return "redirect:/resume/" + resumeSn;
	}
	
//	@DeleteMapping("/{resumeSn")
	@PostMapping("/delete")
	public String resumeDelete(
		Model model
//		, @PathVariable String resumeSn
//		, @ModelAttribute("resume") ResumeVO resume
		, @RequestParam("resumeSn") String resumeSn
		, @AuthMember MemberVO authMember
	) {
		service.removeResume(resumeSn);
		return "redirect:/resume";
	}
	
	
	@GetMapping("/{resumeSn}")
	public String resumeView(@PathVariable String resumeSn, Model model) {
		ResumeVO resume = service.retrieveResume(resumeSn);
		model.addAttribute("resume", resume);
		return "resume/resumeView";
	}
	
	@ResponseBody
	@GetMapping(value="/ajax/{resumeSn}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResumeVO resumeAjaxView(@PathVariable String resumeSn) {
		ResumeVO resume = service.retrieveResume(resumeSn);
		return resume;
	}
	
	@GetMapping("/itemList")
	public String resumeItemList(
		@RequestParam String resumeSn
		, Model model
		, @AuthMember MemberVO authMember
	) {
		String memId = authMember.getMemId();
		ResumeVO resume = service.retrieveResume(resumeSn);
		ResumeVO exclude = service.retrieveItemForResume(memId, resumeSn);
		model.addAttribute("exclude", exclude);
		model.addAttribute("resume", resume);
		return "jsonView";
	}
	
	@PostMapping("/{resumeSn}")
	public String resumeItemInsert(
		@PathVariable String resumeSn
		, @ModelAttribute("education") EducationVO education
		, @ModelAttribute("career") CareerVO career
		, @ModelAttribute("certification") CertificationVO certification
		, @ModelAttribute("facility") FacilityVO facility
		, @ModelAttribute("activity") ActivityVO activity
		, @ModelAttribute("course") CourseVO course
		, @ModelAttribute("award") AwardVO award
		, Model model
		, @AuthMember MemberVO authMember
	) {
		if (education.getEduName() != null) {
			service.createItem(resumeSn, education);
		}
		if (career.getCareerCompany() != null) {
			service.createItem(resumeSn, career);
		}
		if (certification.getCertName() != null) {
			service.createItem(resumeSn, certification);
		}
		if (facility.getFacilityName() != null) {
			service.createItem(resumeSn, facility);
		}
		if (activity.getActName() != null) {
			service.createItem(resumeSn, activity);
		}
		if (course.getCourseName() != null) {
			service.createItem(resumeSn, course);
		}
		if (award.getAwardName() != null) {
			service.createItem(resumeSn, award);
		}
		
		return "jsonView";
	}
	
	@PostMapping("/{resumeSn}/item")
	public String resumeItemListInsert(
		@PathVariable String resumeSn
		, @ModelAttribute("resume") ResumeVO resume
		, Model model
	) {
		
		service.createResumeItemListForResume(resume);
		
		return "jsonView";
	}
	
	@PostMapping("/{resumeSn}/itemRemove")
	public String resumeItemRemove(
		@PathVariable String resumeSn
		, @RequestParam("resumeItemSn") String resumeItemSn
		, Model model
	) {
		ResumeItemVO item = new ResumeItemVO(resumeSn, resumeItemSn);
		
		service.removeItemInResume(item);
		
		return "jsonView";
	}
	
}

