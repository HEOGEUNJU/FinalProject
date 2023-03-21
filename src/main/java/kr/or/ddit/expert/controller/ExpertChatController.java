package kr.or.ddit.expert.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.security.AuthMember;
import kr.or.ddit.vo.MemberVO;

@Controller
@RequestMapping("/expert/chat")
public class ExpertChatController {
	
	@GetMapping("/{exprodId}")
	public String getExpertChat(
		@PathVariable String exprodId,
		@AuthMember MemberVO authMember,
		Model model,
		HttpServletRequest req
		) {
		String memId = authMember.getMemId();
		HttpSession session = req.getSession();
		session.setAttribute("memId", memId);
		model.addAttribute("exprodId", exprodId);
		return "exprodChat";
	}
}
