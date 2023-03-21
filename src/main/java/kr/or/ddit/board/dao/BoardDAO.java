package kr.or.ddit.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.LikeeVO;
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
 * 커뮤니티 관리를 위한 DataAccessObject interface, Persistence Layer
 * </pre>
 */
@Mapper
public interface BoardDAO {

	/**
	 * 특정 글 조회
	 * @param boardNo 조회할 글 번호
	 * @return
	 */
	public BoardVO selectBoard(String boardNo);

	/**
	 * 글 목록 조회, 메인
	 * @param pagingVO
	 * @return
	 */
	public List<BoardVO> selectBoardList(Map<String, Object> map);

	/**
	 * 지난 3일동안 조회수가 높았던 인기글 20개
	 * @return
	 */
	public List<BoardVO> selectHotBoard();

	/**
	 * 게시글 목록 수 조회
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecord(Map<String, Object> map);

	/**
	 * 새글 등록
	 * @param board
	 * @return
	 */
	public int insertBoard(BoardVO board);

	/**
	 * 글 수정
	 * @param board
	 * @return
	 */
	public int updateBoard(BoardVO board);

	/**
	 * 글 삭제
	 * @param board
	 * @return
	 */
	public int deleteBoard(BoardVO board);

	/**
	 * 글 조회수 카운트
	 * @param boardNo
	 * @return
	 */
	public int updateHits(String boardNo);

	// 좋아요 조회
	public int selectLikeBoard(@Param("boardNo") String boardNo, @Param("memId") String memId);

	// 좋아요 등록
	public int insertLike(Map<String, String> map);

	// 좋아요 취소
	public int deleteLike(Map<String, String> map);

	// 좋아요 개수
	public int likeCount(String boardNo);

	// 좋아요 on
	public String likeOn(@Param("boardNo") String boardNo, @Param("memId") String memId);

	//	HOT 이번주 전체 인기 글
	public List<BoardVO> hotBoard();

	// 댓글 개수
	public int replyCount(String boardNo);

	// 좋아요 목록
	public List<LikeeVO> selectLikeList(String boardNo);


}



















