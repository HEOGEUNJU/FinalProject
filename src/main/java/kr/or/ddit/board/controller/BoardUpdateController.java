package kr.or.ddit.board.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.board.service.BoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.vo.MemberVO;

@Controller
@RequestMapping("board/boardUpdate")
public class BoardUpdateController {

	@Inject
	private BoardService service;

	@GetMapping
	public String BoardForm(
			Model model,
			@RequestParam("what") String boardNo
	) {
		BoardVO board = service.retrieveBoard(boardNo);
		model.addAttribute("board", board);
		return "board/boardUpdate";
	}

	@PostMapping
	public String boardUpdate(
			@ModelAttribute("board") BoardVO board,
			Model model,
			@AuthMember MemberVO authMember
	) {
		String viewName = null;
		board.setMemId(authMember.getMemId());
		int rowcnt = service.modifyBoard(board);
		if(rowcnt > 0) {
			viewName = "redirect:boardTotal";
		}else {
			viewName = "board/boardUpdate";
		}
		return viewName;

	}

}
