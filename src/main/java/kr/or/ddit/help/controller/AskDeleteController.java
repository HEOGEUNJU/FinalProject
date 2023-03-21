package kr.or.ddit.help.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.help.service.AskService;
import kr.or.ddit.help.vo.AskVO;
import kr.or.ddit.security.AuthMember;

@Controller
@RequestMapping("/ask/askDelete")
public class AskDeleteController {

	@Inject
	private AskService service;

	@PostMapping
	public String askDelete(
			Model model,
			@ModelAttribute("ask") AskVO ask
	) {
		String viewName = null;
		int rowcnt = service.removeAsk(ask);
		if(rowcnt > 0) {
			viewName = "redirect:askList";
			// 성공 시 삭제완료 alert
		}else {
			viewName = "ask/askList";
			// 실패 시 삭제실패 alert
		}
		return viewName;
	}

}
