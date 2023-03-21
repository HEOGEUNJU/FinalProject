package kr.or.ddit.selfpr.service;

import kr.or.ddit.selfpr.vo.LikeVO;
import kr.or.ddit.vo.PagingVO;

public interface LikeService {

	// 관심인재
	public void retrieveLikeList(PagingVO<LikeVO> pagingVO);
	public int createLike(LikeVO like);
	
	public int matchLike(LikeVO like);
	
	public int removeLike(LikeVO like);
}
