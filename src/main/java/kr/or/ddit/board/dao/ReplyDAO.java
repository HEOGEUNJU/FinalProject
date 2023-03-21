package kr.or.ddit.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.board.vo.ReplyVO;

/**
 * @author 작성자명
 * @since 2023. 3. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 *
 *      <pre>
 * [[개정이력(Modification Information)]]
 * 수정일       수정자           수정내용
 * --------     --------    ----------------------
 * 2023. 3. 2.   임채리          최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 *      </pre>
 */
@Mapper
public interface ReplyDAO {
	/**
	 * 댓글 조회
	 *
	 * @param replyNo
	 * @return
	 */
	public List<ReplyVO> selectReply(String boardNo);

	/**
	 * 댓글 등록
	 *
	 * @param reply
	 * @return
	 */
	public int insertReply(ReplyVO reply);

	/**
	 * 댓글 수정
	 *
	 * @param reply
	 * @return
	 */
	public int updateReply(ReplyVO reply);

	/**
	 * 댓글 삭제
	 *
	 * @param reply
	 * @return
	 */
	public int deleteeReply(String replyNo);
}
