package kr.or.ddit.expert.service;

import java.util.List;

import kr.or.ddit.expert.vo.ExcartVO;
import kr.or.ddit.expert.vo.ExprodVO;
import kr.or.ddit.expert.vo.ExreviewVO;
import kr.or.ddit.expert.vo.LikeExprodVO;
import kr.or.ddit.vo.PagingVO;

public interface ExprodService {
	public int InsertExprod(ExprodVO exprod);
	
	public ExprodVO selectExprod(String exprodId);
	
	public int updateExprod(ExprodVO exprod);
	
	public void selectExprodList(PagingVO<ExprodVO> pagingVO);
	
	public void selectExprodMissionList(PagingVO<ExprodVO> pagingVO);
	
	public List<ExcartVO> retrieveExcartMypage(String memId);
	
	public List<ExprodVO> selectTopExprodList();
	
	public int removeExprod(String exprodId);
	
	public int updateExprodName(ExprodVO exprod);
	
	public int retrieveLikeExprod(String likeExprodId, String memId);
	
	public int createLikeExprod(String likeExprodId, String memId);
	
	public int removeLikeExprod(String likeExprodId, String memId);
	
	public List<ExprodVO> retrieveExpertExprodList(String memId);
	
	/*=========================시스템 관리 부분=========================*/
	//상품 신청 목록
	public void retrieveAppliProdList(PagingVO<ExprodVO> pagingVO);
	//상품 신청 세부
	public ExprodVO retrieveAppliProd(String exprodId);
	//상품 신청 승인
	public int modifyAppliProd(ExprodVO exprod);
	//상품 신청 반려
	public int removeAppliProd(ExprodVO exprod);
}
