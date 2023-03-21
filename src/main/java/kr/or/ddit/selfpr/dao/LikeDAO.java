package kr.or.ddit.selfpr.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.selfpr.vo.LikeVO;
import kr.or.ddit.vo.PagingVO;

@Mapper
public interface LikeDAO {

	// 관심인재 
	public List<LikeVO> selectLikeList(PagingVO<LikeVO> pagingVO);
	public int selectTotalRecord(PagingVO<LikeVO> pagingVO);
	
	public int insertLike(LikeVO like);
	
	public int matchingLike(LikeVO like);
	
	public int deleteLike(LikeVO like);
	
}