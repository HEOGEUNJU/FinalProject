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

import kr.or.ddit.resume.service.CourseService;
import kr.or.ddit.resume.vo.ActivityVO;
import kr.or.ddit.resume.vo.AwardVO;
import kr.or.ddit.resume.vo.CourseVO;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemberVOWrapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/course")
public class CourseController {

	@Inject
	private CourseService service;
	
	@ModelAttribute("course")
	public CourseVO course() {
		return new CourseVO();
	}
	
	@GetMapping
	public String courseList() {
		return "resume/items/course";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String listData(
		Model model
		, @AuthMember MemberVO authMember
	) {
		List<CourseVO> courseList = service.retrieveCourseList(authMember.getMemId());
		model.addAttribute("courseList", courseList);
		return "jsonView";
	}
	
	@GetMapping("/{courseSn}")
	public String courseView(@PathVariable String courseSn, Model model) {
		CourseVO course = service.retrieveCourse(courseSn);
		model.addAttribute("course", course);
		return "resume/items/courseView";
	}
	
	@GetMapping("/insert")
	public String courseForm() {
		return "resume/items/courseForm";
	}
	
	@PostMapping("/insert")
	public String courseInsert(
		@ModelAttribute("course") CourseVO course
		, Model model
		, @AuthenticationPrincipal MemberVOWrapper principal
	) {
		MemberVO authMember = principal.getRealMember();
		course.setMemId(authMember.getMemId());
		service.createCourse(course);
		return "redirect:" + course.getCourseSn();
	}
	
	@GetMapping("/update")
	public String courseUdateForm(@RequestParam("courseSn") String courseSn, Model model) {
		CourseVO course = service.retrieveCourse(courseSn);
		model.addAttribute("course", course);
		return "resume/items/courseForm";
	}
	
	@PostMapping("/update")
	public String courseUpdate(@ModelAttribute("course") CourseVO course, Model model) {
		service.modifyCourse(course);
		return "redirect:" + course.getCourseSn();
	}
	
	@PostMapping("/delete")
	public String courseDelete(@RequestParam("courseSn") String courseSn, Model model) {
		service.removeCourse(courseSn);
		return "redirect:/course";
	}		
}
