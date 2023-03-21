package kr.or.ddit.myintro.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.myintro.service.MyintroService;
import kr.or.ddit.myintro.vo.MyintroVO;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.vo.MemberVO;

/**
 * @author 최경수
 * @since 2023. 2. 14.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 	    수정일               수정자                                     수정내용
 * --------     --------    ----------------------
 * 2023. 2. 14.       최경수        최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/myintro")
public class MyintroController {

	// 자기소개서 글자 제한을 둬야 하는데.. - 채용과정 테이블에 제약사항으로 놔뒀고 나중에 enum처리해서 몇자 적을지 적용할 수 있을 듯함
	
	
	@Inject
	private MyintroService service;
	
	@ModelAttribute("myintro")
	public MyintroVO myintro() {
		return new MyintroVO();
	}
	
	// 메인
	@GetMapping
	public String main(
		Model model
		, @AuthMember MemberVO authMember
	) {
		List<MyintroVO> myintroList = service.retrieveMyintroList(authMember.getMemId());
		model.addAttribute("myintroList", myintroList);
		return "myintro/myintroMain";
	}
	
	// 세부
	@GetMapping("{myintroSn}")
	public String view(
		@PathVariable String myintroSn
		, Model model
		, @ModelAttribute("myintro") MyintroVO myintro
	) {
		myintro = service.retrieveMyintro(myintroSn);
		model.addAttribute("myintro", myintro);
		
		return "myintro/myintroView";
	}
	
	// 세부ajax
	@ResponseBody
	@GetMapping("/ajax/{myintroSn}")
	public MyintroVO ajaxView(
			@PathVariable String myintroSn
			) {
		MyintroVO myintro = service.retrieveMyintro(myintroSn);
		
		return myintro;
	}
	
	// 입력폼
	@GetMapping("/form")
	public String form(
		Model model
		, @AuthMember MemberVO authMember
		, @ModelAttribute("myintro") MyintroVO myintro
	) {
		return "myintro/myintroForm";
	}
	
	// 입력
	@PostMapping
	public String insert(
		Model model
		, @AuthMember MemberVO authMember
		, @ModelAttribute("myintro") MyintroVO myintro			
	) {
		myintro.setMemId(authMember.getMemId());
		service.createMyintro(myintro);
		
		return "redirect:/myintro/" + myintro.getMyintroSn();
	}
	
	// 수정폼
	@GetMapping("/edit")
	public String edit(
		Model model
		, @ModelAttribute("myintro") MyintroVO myintro
		, @RequestParam("myintroSn") String myintroSn
	) {
		myintro = service.retrieveMyintro(myintroSn);
		model.addAttribute("myintro", myintro);
		return "myintro/myintroEdit";
	}
	
	// 수정
//	@PatchMapping("/{myintroSn}")
	@PutMapping("/{myintroSn}")
	public String update(
		Model model
		, @AuthMember MemberVO authMember
		, @ModelAttribute("myintro") MyintroVO myintro
	) {
		service.modifyMyintro(myintro);
		
		return "redirect:/myintro/" + myintro.getMyintroSn();
	}
	// 삭제
	@DeleteMapping("/{myintroSn}")
	public String delete(
		@PathVariable String myintroSn
	) {
		service.removeMyintro(myintroSn);
		return "redirect:/myintro";
	}
}
