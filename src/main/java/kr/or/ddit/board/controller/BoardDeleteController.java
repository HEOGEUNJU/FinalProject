package kr.or.ddit.board.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.board.service.BoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.vo.MemberVO;

@Controller
@RequestMapping("/board/boardDelete")
public class BoardDeleteController {

	@Inject
	private BoardService service;

	@PostMapping
	public String boardDelete(
			Model model,
			@ModelAttribute("board") BoardVO board,
			@AuthMember MemberVO authMember
	) {

		board.setBoardTitle("삭제된 글입니다.");
		board.setBoardContent("삭제되었습니다.");

		String viewName = null;
		board.setMemId(authMember.getMemId());
		int rowcnt = service.removeBoard(board);
		if(rowcnt>0) {
			viewName = "redirect:boardTotal";
		}else {
			viewName = "board/boardDetail";
		}
		return viewName;
	}
}
