package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.vo.ReplyVO;
import kr.or.ddit.vo.PagingVO;

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
 *
 * 게시글의 답글관리를 위한 Business Logic Object interface
 *      </pre>
 */
public interface ReplyService {

	/**
	 * 댓글 조회
	 * @param pagingVO
	 */
	public List<ReplyVO> retrieveReply(String boardNo) throws Exception;

	/**
	 * 댓글 작성
	 *
	 * @param reply
	 * @return
	 */
	public int createReply(ReplyVO reply) throws Exception;

	/**
	 * 댓글 수정
	 *
	 * @param reply
	 * @return
	 */
	public int modifyReply(ReplyVO reply) throws Exception;

	/**
	 * 댓글 삭제
	 *
	 * @param reply
	 * @return
	 */
	public int removeReply(String replyNo);

}
