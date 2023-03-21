package kr.or.ddit.board.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.or.ddit.board.dao.BoardDAO;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.LikeeVO;
import kr.or.ddit.expert.dao.AttachDAO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 작성자명
 * @since 2023. 3. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 *
 *      <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 3. 2.      작성자명       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 *      </pre>
 */
@Slf4j
@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;

	@Inject
	private AttachDAO attachDAO;

	@Value("#{appInfo.boardFolder}")
	private File saveFiles;

	private int processAttatchList(BoardVO board) {

		List<AttachVO> attatchList = board.getAttatchList();
		if (attatchList == null || attatchList.isEmpty())
			return 0;
		// 1. metadata 저장 - DB (ATTATCH)
		log.info("board : {}", board);
		log.info("attactchList : {}", attatchList);
		// 2. binary 저장 - Middle Tier : (D:\saveFiles)
		try {
			for (AttachVO attatch : attatchList) {
				attatch.saveTo(saveFiles);
			}
			int rowcnt = attachDAO.insertAttatches(board);
			return rowcnt;
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	// 상세조회
	@Override
	public BoardVO retrieveBoard(String boardNo) {
		BoardVO board = dao.selectBoard(boardNo);
		board.setAttatchList(attachDAO.selectAttatchList(boardNo));
		List<LikeeVO> likeList = dao.selectLikeList(boardNo);
		int like = 0;
		int fun = 0;
		int help = 0;
		int cheer = 0;
		for (LikeeVO vo : likeList) {
			String which = vo.getLiketype();
			if (which.equals("1")) {
				like++;
			} else if (which.equals("2")) {
				fun++;
			} else if (which.equals("3")) {
				help++;
			} else if (which.equals("4")) {
				cheer++;
			}
		}
		board.setLike(like);
		board.setFun(fun);
		board.setHelp(help);
		board.setCheer(cheer);

		if (board == null) {
			throw new UsernameNotFoundException(String.format(boardNo + "에 해당하는 게시글 없음."));
		}
		return board;
	}

	// 전체 조회(total), 메인(Main)
	@Override
	public void retrieveBoardList(PagingVO<BoardVO> pagingVO, String data) {
		Map<String, Object> map = new HashMap<>();
		map.put("PagingVO", pagingVO);
		map.put("data", data);
		pagingVO.setTotalRecord(dao.selectTotalRecord(map));
		List<BoardVO> boardList = boardList = dao.selectBoardList(map);
		pagingVO.setDataList(boardList);
	}

	// 지난 3일동안 조회수가 높았던 인기글 20개
	@Override
	public List<BoardVO> selectHotBoard() {
		return this.dao.selectHotBoard();
	}

	// 등록
	@Override
	public int createBoard(BoardVO board) {
		int rowcnt = dao.insertBoard(board);
		rowcnt += processAttatchList(board);
		return rowcnt;
	}

	// 수정
	@Override
	public int modifyBoard(BoardVO board) {
		int rowcnt = dao.updateBoard(board);
		if (board.getAttatchList() != null) {
			rowcnt += attachDAO.deleteAttatch(board.getBoardNo());
			rowcnt += processAttatchList(board);
		}
		return rowcnt;
	}

	// 삭제
	@Override
	public int removeBoard(BoardVO board) {
		int rowcnt = dao.deleteBoard(board);
		return rowcnt;
	}

	// 조회수
	@Override
	public int updateHits(String boardNo) {
		int rowcnt = dao.updateHits(boardNo);
		return rowcnt;
	}

	// 좋아요 추가
	@Override
	public int likeInsert(Map<String, String> m) {
		return dao.insertLike(m);
	}

	// 좋아요 개수
	@Override
	public int likeCount(String boardNo) {
		return dao.likeCount(boardNo);
	}

	// 좋아요 on
	@Override
	public String likeOn(String boardNo, String memId) {
		return dao.likeOn(boardNo, memId);
	}

//	HOT 이번주 전체 인기 글
	@Override
	public List<BoardVO> hotBoard() {
		return dao.hotBoard();
	}

	// 댓글 개수
	@Override
	public int replyCount(String boardNo) {
		return dao.replyCount(boardNo);
	}

	@Override
	public int removeLike(Map<String, String> map) {
		return dao.deleteLike(map);
	}
}
