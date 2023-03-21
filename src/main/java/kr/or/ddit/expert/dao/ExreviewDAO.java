package kr.or.ddit.expert.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.expert.vo.ExeventVO;
import kr.or.ddit.expert.vo.ExreviewVO;
import kr.or.ddit.vo.PagingVO;

@Mapper
public interface ExreviewDAO {
	
	public int selectTotalRecord(PagingVO<ExreviewVO> pagingVO);
	
	public List<ExreviewVO> selectReviewList(PagingVO<ExreviewVO> pagingVO);
	
	public int insertReview(ExreviewVO exreview);
	
	public int updateReview(ExreviewVO exreview);
	
	public ExreviewVO selectExreview(String exreviewId);
	
	public List<ExreviewVO> selectReviewMypageList(String memId);
}
