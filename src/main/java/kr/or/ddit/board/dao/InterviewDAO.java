package kr.or.ddit.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.board.vo.InterviewVO;
import kr.or.ddit.vo.PagingVO;

/**
 * @author 임채리
 * @since 2023. 2. 7.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자           수정내용
 * --------     --------    ----------------------
 * 2023. 2. 7.  작성자명          최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 *
 * 인터뷰 게시판
 * </pre>
 */
@Mapper
public interface InterviewDAO {

	// 상세조회
	public InterviewVO selectInterview(String incumNo);

	// 전체조회
	public List<InterviewVO> selectInterviewList(PagingVO<InterviewVO> pagingVO);

	// 전체레코드
	public int selectTotalRecord(PagingVO<InterviewVO> pagingVO);

	// 등록
	public int insertInterview(InterviewVO interview);

	// 수정
	public int updateInterview(InterviewVO interview);

	// 삭제
	public int deleteInterview(InterviewVO interview);

	// 조회수
	public int updateHits(String incumNo);
}
