package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.vo.PagingVO;

/**
 * @author 임채리
 * @since 2023. 2. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자        수정내용
 * --------     --------    ----------------------
 * 2023. 2. 8.   임채리       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 *
 * 커뮤니티 관리를 위한 Business Logic Object interface
 * </pre>
 */
public interface BoardService {

	/**
	 * 특정 글 조회
	 * @param boardNo
	 * @return 존재여부(NotExistBoardException)
	 */
	public BoardVO retrieveBoard(String boardNo);

	/**
	 * 전체 조회 및 메인
	 * @param pagingVO
	 */
	public void retrieveBoardList(PagingVO<BoardVO> pagingVO, String data);

	/**
	 * 신규 글 생성
	 * @param board
	 * @return
	 */
	public int createBoard(BoardVO board);

	/**
	 * 게시글 수정
	 * @param board
	 * @return 존재여부(NotExistBoardException), 인증성공여부(AuthenticationException), rowcnt
	 */
	public int modifyBoard(BoardVO board);

	/**
	 * 게시글 삭제
	 * @param board
	 * @return
	 */
	public int removeBoard(BoardVO board);

	/**
	 * 지난 3일동안 조회수가 높았던 인기글 20개
	 * @return
	 */
	public List<BoardVO> selectHotBoard();

	/**
	 * 조회수
	 * @param boardNo
	 * @return
	 */
	public int updateHits(String boardNo);

	// 좋아요 추가
	public int likeInsert(Map<String, String> m);

	// 좋아요 개수
	public int likeCount(String boardNo);

	// 좋아요 on
	public String likeOn(@Param("boardNo") String boardNo, @Param("memId") String memId);

	//HOT 이번주 전체 인기 글
	public List<BoardVO> hotBoard();

	// 댓글 개수
	public int replyCount(String boardNo);

	// 좋아요 취소
	public int removeLike(Map<String, String> map);



}
