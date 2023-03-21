package kr.or.ddit.board.service;

import java.util.List;

import javax.inject.Inject;

import kr.or.ddit.board.dao.InterviewDAO;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.InterviewVO;
import kr.or.ddit.vo.PagingVO;

public interface InterviewService {

	// 상세조회
	public InterviewVO retrieveInterview(String incumNo);

	// 전체조회
	public void retrieveInterviewList(PagingVO<InterviewVO> pagingVO);

	// 등록
	public int createInterview(InterviewVO interview);

	// 수정
	public int modifyInterview(InterviewVO interview);

	// 삭제
	public int removeInterview(InterviewVO interview);

	// 조회수
	public int updateHis(String incumNo);
}
