package kr.or.ddit.board.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.board.service.BoardService;
import kr.or.ddit.board.service.ReplyService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.ReplyVO;
import kr.or.ddit.ui.PaginationRenderer;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {

	@Inject
	private BoardService service;

	@Inject
	private ReplyService replyService;

	@Resource(name="bootstrapPaginationRender")
	private PaginationRenderer renderer;

	@ModelAttribute("simpleCondition")
	public SearchVO searchVO() {
		return new SearchVO();
	}

	// ui
	@GetMapping("/boardTotal")
	public String totalBoardUI() {
		return "board/boardTotal";
	}

	/**
	 * @param model
	 * @return
	 * 게시판 메인
	 */
	@GetMapping("/boardMain")
	public String board(
			Model model,
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@ModelAttribute("simpleCondition") SearchVO searchVO,
			@RequestParam(value="gubun",required=false,defaultValue="") String gubun,
			@RequestParam(value="data", required=false) String data
	) {
		PagingVO<BoardVO> pagingVO = new PagingVO<>(70,1);
		BoardVO boardVO = new BoardVO();
		boardVO.setBoardSub(gubun);

		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		pagingVO.setDetailCondition(boardVO);

		service.retrieveBoardList(pagingVO, data);

		//HOT 이번주 전체 인기 글
		List<BoardVO> boardVOList = service.hotBoard();

		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("boardVOList",boardVOList);

		return "board/boardMain";
	}


	/**
	 * @param model
	 * @param currentPage
	 * @param searchVO
	 * @param boardNo
	 * @param gubun
	 * @return
	 * 게시판 전체조회 + 페이징 + 검색
	 */
	/*
	 요청URI : /board/boardTotal?gubun=0 or /board/boardTotal
	 null:전체 / 1:신입 / 2:취준 / 3:퇴사 / 4:잡담
	 */
	@GetMapping(value="/boardTotal", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String totalBoard(
			Model model,
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@ModelAttribute("simpleCondition") SearchVO searchVO,
			@RequestParam(value="gubun",required=false, defaultValue="") String gubun,
			@RequestParam(value="data", required=false) String data
	) {
		log.info("왓나");
		PagingVO<BoardVO> pagingVO = new PagingVO<>();
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);

		BoardVO boardVO = new BoardVO();
		boardVO.setBoardSub(gubun);

		//검색을 위해서..
		/*searchVO.setSearchWord(gubun);*/
		pagingVO.setSimpleCondition(searchVO);
		pagingVO.setDetailCondition(boardVO);

		service.retrieveBoardList(pagingVO, data);

		//지난 3일동안 조회수가 높았던 인기글 20개
		List<BoardVO> boardVOList = service.selectHotBoard();

		if(gubun.equals("7")) {
			pagingVO.setDataList(boardVOList);
		}

		model.addAttribute("pagingVO", pagingVO);

		if(!pagingVO.getDataList().isEmpty())
			model.addAttribute("pagingHTML", renderer.renderPagination(pagingVO));

		return "jsonView";
	}

	// 상세조회
	@GetMapping("/boardDetail")
	public String detailBoard(
			Model model,
			@RequestParam("boardNo") String boardNo,
			Authentication authentication,
			@ModelAttribute ReplyVO reply1

	) throws Exception {
		BoardVO board = service.retrieveBoard(boardNo);
		service.updateHits(boardNo);

		String memId = "";
		String likeOn = "";
		if(authentication!=null) {//로그인 정보가 있을 때
			memId = authentication.getName();
			if(memId!=null && memId.length()>0) {
				likeOn = service.likeOn(boardNo, memId);
			}
		}else {//로그인 정보가 없을 때
			memId = "anonymous";
			likeOn = "0";
		}
		model.addAttribute("likeOn",likeOn);
		model.addAttribute("board", board);

		// 댓글조회
		List<ReplyVO> reply = null;
		reply = replyService.retrieveReply(boardNo);
		model.addAttribute("reply", reply);
		model.addAttribute("memId", memId);
		return "board/boardDetail";
	}

	// 좋아요 추가
	@PostMapping(value="likeInsert",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody // 자바객체를 마샬링해서 응답데이터로 넘겨야 함
	public HashMap<String, String> boardLike(
			@RequestParam String boardNo,
			@RequestParam String likeType,
			Authentication authentication
	) {
		HashMap<String, String> m = new HashMap<>();
		m.put("boardNo", boardNo);
		m.put("likeType", likeType);
		m.put("memId", authentication.getName());
		try {
			service.likeInsert(m);

		} catch (Exception e) {
			m.put("error",e.getMessage());
		}
		return m;
	}

	// 좋아요 삭제
	@PostMapping(value="likeDelete",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody // 자바객체를 마샬링해서 응답데이터로 넘겨야 함
	public HashMap<String, String> boardLikeDelete(
			@RequestParam String boardNo,
			@RequestParam String likeType,
			Authentication authentication
			) {
		HashMap<String, String> m = new HashMap<>();
		m.put("boardNo", boardNo);
		m.put("memId", authentication.getName());
		try {
			service.removeLike(m);
		} catch (Exception e) {
			m.put("error",e.getMessage());
		}
		return m;
	}

	// 좋아요 개수
	@PostMapping(value="likeCount",produces=MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String boardCount(@RequestParam String boardNo) {
		int likeCnt = service.likeCount(boardNo);
		return likeCnt + "";
	}

	// 댓글 개수
	@ResponseBody
	@PostMapping(value="replyCount",produces=MediaType.TEXT_PLAIN_VALUE)
	public String replyCount(@RequestParam String boardNo) {
		int replyCnt = service.replyCount(boardNo);
		return replyCnt + "";
	}
}

