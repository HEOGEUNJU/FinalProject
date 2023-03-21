package kr.or.ddit.help.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.vo.IncruiterVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.SeekerVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 박형준
 * @since 2023. 2. 1.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일               수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 1.     박형준            최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Controller
@RequestMapping("/help/find")
public class IdPwFindController {
	
	@Inject
	private MemberService service;
	
	
	//아이디/비번 찾기페이지 이동
	@GetMapping
	public String find(HttpServletRequest req) {
		return "help/find/idpwFind";
	}
	
	//일반회원 아이디 찾기페이지 이동
	@GetMapping("/seekerFindId")
	public String seekerId(HttpServletRequest req) {
		return "help/find/seekerFindId";
	}
	
	//일반회원 아이디 찾기 결과
	@PostMapping("/seekerFindIdResult")
	public String seekerFindId(SeekerVO seeker, Model model) {
		List<SeekerVO> idList = service.searchSeekerId(seeker);
		model.addAttribute("idList", idList);
		return "help/find/seekerFindIdResult";
	}
	
	//일반회원 비밀번호 찾기페이지 이동
	@GetMapping("/seekerFindPw")
	public String seekerPw(HttpServletRequest req) {
		return "help/find/seekerFindPw";
	}
	
	//seekerFindId의 ajax로 일치여부 보내는 것
	@GetMapping("/ajax")
	public String isRight(@RequestParam("memName") String memName, @RequestParam("memEmail") String memEmail, Model model) {
		SeekerVO seeker = new SeekerVO();
		seeker.setMemName(memName);
		seeker.setMemEmail(memEmail);
		List<SeekerVO> list = service.searchSeekerId(seeker);
		//서비스에 다시 넣기
		SeekerVO realSeeker = list.get(0);
		if (realSeeker.getMemId() != null && realSeeker.getMemId() != "") {
			model.addAttribute("memId", realSeeker.getMemId());
		} 
		return "jsonView";
	}
	
	//기업회원 아이디 찾기페이지 이동
	@GetMapping("/incruiterFindId")
	public String incruiterId(HttpServletRequest req) {
		return "help/find/incruiterFindId";
	}
	
	//기업회원 비밀번호 찾기페이지 이동
	@GetMapping("/incruiterFindPw")
	public String incruiterPw(HttpServletRequest req) {
		return "help/find/incruiterFindPw";
	}
	
	//기업회원 아이디 찾기 결과
	@PostMapping("/incruiterFindIdResult")
	public String incruiter(IncruiterVO incruiter, Model model) {
		MemberVO incruiterId = service.retrieveIncruiterId(incruiter);
		model.addAttribute("incruiterId",incruiterId);
		return "help/find/incruiterFindIdResult";
	}
	
	//일반회원회원 존재확인 후 비밀번호 수정페이지로 이동
	@PostMapping("/seekerFindPwResult")
	public String findSeekerPw(SeekerVO seeker, Model model) {
		int count = service.retrieveGetSeekerResult(seeker);
		log.info("seekerFindPwResult : count={}", count);
		model.addAttribute("memId", seeker.getMemId());
		model.addAttribute("count",count);
		return "help/find/seekerFindPwResult";
	}
	
	@PostMapping("/incruiterFindPwResult")
	public String findIncruiterPw(IncruiterVO incruiter, Model model) {
		int count = service.retrieveGetIncruiterResult(incruiter);
		log.info("seekerFindPwResult : count={}", count);
		model.addAttribute("memId", incruiter.getMemId());
		model.addAttribute("count",count);
		return "help/find/incruiterFindPwResult";
	}
	
	//회원 비밀번호 수정
	@PostMapping("/updatePw")
	public String updateSeekerPw(MemberVO member, Model model) {
		int count = service.modifyPw(member);
		if(count > 0) {
			return "login/loginForm";
		}
		return "help/find/findPwResult";
	}
}
