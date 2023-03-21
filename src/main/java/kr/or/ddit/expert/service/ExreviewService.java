package kr.or.ddit.expert.service;

import java.util.List;

import kr.or.ddit.expert.vo.ExreviewVO;
import kr.or.ddit.vo.PagingVO;

public interface ExreviewService {
	
	public int insertReview(ExreviewVO exreview);
	
	public int updateReview(ExreviewVO exreview);
	
	public ExreviewVO selectReview(String exreviewId);
	
	public List<ExreviewVO> retrieveReviewMypageList(String memId);
	
	public void selectReveiwList(PagingVO<ExreviewVO> paginVO);
}
