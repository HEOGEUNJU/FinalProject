package kr.or.ddit.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.board.dao.ReplyDAO;
import kr.or.ddit.board.vo.ReplyVO;

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
@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;

	// 댓글 조회
	@Override
	public List<ReplyVO> retrieveReply(String boardNo) throws Exception{
		return dao.selectReply(boardNo);
	}

	// 댓글 등록
	@Override
	public int createReply(ReplyVO reply) throws Exception{
		int rowcnt = dao.insertReply(reply);
		return rowcnt;
	}

	// 댓글 수정
	@Override
	public int modifyReply(ReplyVO reply) throws Exception{
		int rowcnt = dao.updateReply(reply);
		return rowcnt;
	}

	// 댓글 삭제
	@Override
	public int removeReply(String replyNO) {
		int rowcnt = dao.deleteeReply(replyNO);
		return rowcnt;
	}

}
