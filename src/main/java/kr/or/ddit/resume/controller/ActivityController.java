package kr.or.ddit.resume.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.resume.service.ActivityService;
import kr.or.ddit.resume.vo.ActivityVO;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
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
@RequestMapping("/activity")
public class ActivityController {

	@Inject
	private ActivityService service;
	
	@ModelAttribute("activity")
	public ActivityVO activity() {
		return new ActivityVO();
	}
	
	@GetMapping
	public String activityList() {
		return "resume/items/activity";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String listData(
		Model model
		, @AuthMember MemberVO authMember
	) {
		List<ActivityVO> activityList = service.retrieveActivityList(authMember.getMemId());
		model.addAttribute("activityList", activityList);
		return "jsonView";
	}
	
	@GetMapping("/{actSn}")
	public String activityView(@PathVariable String actSn, Model model) {
		ActivityVO activity = service.retrieveActivity(actSn);
		model.addAttribute("activity", activity);
		return "resume/items/activityView";
	}
	
	@GetMapping("/insert")
	public String activityForm() {
		return "resume/items/activityForm";
	}
	
	@PostMapping("/insert")
	public String activityInsert(
		@Validated(InsertGroup.class) @ModelAttribute("activity") ActivityVO activity
		, Errors errors
		, Model model
		, @AuthenticationPrincipal MemberVOWrapper principal
	) {
		MemberVO authMember = principal.getRealMember();
		activity.setMemId(authMember.getMemId());
		
		String viewName = null;
		if (!errors.hasErrors()) {
			ServiceResult result = service.createActivity(activity);
			if (ServiceResult.OK == result) {
				viewName = "redirect:" + activity.getActSn();
			} else {
				model.addAttribute("message", "서버 오류, 좀 이따 다시 시도해주세요.");
				viewName = "resume/items/activityForm";
			}
		} else {
			viewName = "resume/items/activityForm";
		}
		return viewName;
	}
	
	@GetMapping("/update")
	public String activityUdateForm(@RequestParam("actSn") String actSn, Model model) {
		ActivityVO activity = service.retrieveActivity(actSn);
		model.addAttribute("activity", activity);
		return "resume/items/activityForm";
	}
	
	@PostMapping("/update")
	public String activityUpdate(
		@Validated(UpdateGroup.class) @ModelAttribute("activity") ActivityVO activity
		, Errors errors
		, Model model
	) {
		String viewName = null;
		
		if (!errors.hasErrors()) {
			ServiceResult result = service.modifyActivity(activity);
			if (ServiceResult.OK == result) {
				viewName = "redirect:" + activity.getActSn();
			} else {
				model.addAttribute("message", "서버 오류, 좀 이따 다시 시도해주세요.");
				viewName = "resume/items/activityForm";
			}
		} else {
			viewName = "resume/items/activityForm";
		}
		return viewName;
	}
	
	@PostMapping("/delete")
	public String activityDelete(
//		@Validated(DeleteGroup.class) @RequestParam("actSn") String actSn
		@Validated(DeleteGroup.class) @ModelAttribute("activity") ActivityVO activity
		, Errors errors
		, Model model
	) {
		String actSn = activity.getActSn();
		
		String viewName = null;
		if (!errors.hasErrors()) {
			ServiceResult result = service.removeActivity(actSn);
			if (ServiceResult.OK == result) {
				viewName = "redirect:/activity";
			} else {
				model.addAttribute("message", "서버 오류, 좀 이따 다시 시도.");
				viewName = "resume/items/activityView?actSn" + actSn;
			}
		} else {
			viewName = "resume/items/activityView?actSn" + actSn;
		}
		
		return viewName;
	}
}
