package kr.or.ddit.expert.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.expert.dao.ExprodDAO;
import kr.or.ddit.expert.vo.ExcartVO;
import kr.or.ddit.expert.vo.ExprodVO;
import kr.or.ddit.expert.vo.ExreviewVO;
import kr.or.ddit.expert.vo.LikeExprodVO;
import kr.or.ddit.vo.PagingVO;
@Service
public class ExprodServiceImpl implements ExprodService {
	
	@Inject
	private ExprodDAO exprodDAO;
	
	@Override
	public int InsertExprod(ExprodVO exprod) {
		int rowcnt = exprodDAO.InsertExprod(exprod);
		return rowcnt;
	}

	@Override
	public ExprodVO selectExprod(String exprodId) {
		ExprodVO exprod = exprodDAO.selectExprod(exprodId);
		exprod.setExreviewList(exprodDAO.selectExreviewList(exprodId));
		return exprod;
	}

	@Override
	public int updateExprod(ExprodVO exprod) {
		int rowcnt = exprodDAO.updateExprod(exprod);
		return rowcnt;
	}

	@Override
	public void selectExprodList(PagingVO<ExprodVO> pagingVO) {
		pagingVO.setTotalRecord(exprodDAO.selectTotalRecord(pagingVO));
		List<ExprodVO> exprodList = exprodDAO.selectExprodList(pagingVO);
		pagingVO.setDataList(exprodList);
		exprodList.stream().forEach(System.out::println);
	}
	
	@Override
	public List<ExprodVO> selectTopExprodList() {
		List<ExprodVO> exprodList = exprodDAO.selectTopExprodList();
		exprodList.stream().forEach(System.out::println);
		return exprodList;
	}
	@Override
	public List<ExcartVO> retrieveExcartMypage(String memId) {
		List<ExcartVO> excartList = exprodDAO.selectExcartMypage(memId);
		excartList.stream().forEach(System.out::println);
		return excartList;
	}

	@Override
	public int removeExprod(String exprodId) {
		int rowcnt = exprodDAO.deleteExprod(exprodId);
		return rowcnt;
	}
	
	@Override
	public int updateExprodName(ExprodVO exprod) {
		int rowcnt = exprodDAO.updateExprodName(exprod);
		return rowcnt;
	}

	@Override
	public List<ExprodVO> retrieveExpertExprodList(String memId) {
		return exprodDAO.selectExpertExprodList(memId);
	}
	/*=========================시스템 관리 부분=========================*/
	//상품 신청 목록
	@Override
	public void retrieveAppliProdList(PagingVO<ExprodVO> pagingVO) {
		pagingVO.setTotalRecord(exprodDAO.selectTotalCount(pagingVO));
		pagingVO.setDataList(exprodDAO.selectAppliProdList(pagingVO));
	}
	
	//상품 신청 세부
	@Override
	public ExprodVO retrieveAppliProd(String exprodId) {
		return exprodDAO.selectAppliProd(exprodId);
	}
	
	//상품 신청 승인
	@Override
	public int modifyAppliProd(ExprodVO exprod) {
		int rowcnt = exprodDAO.updateAppliProd(exprod);
		return rowcnt;
	}

	//상품 신청 반려
	@Override
	public int removeAppliProd(ExprodVO exprod) {
		int rowcnt = exprodDAO.deleteAppliProd(exprod);
		return rowcnt;
	}

	@Override
	public int createLikeExprod(String likeExprodId, String memId) {
		return exprodDAO.insertExprodlike(likeExprodId, memId);
		}

	@Override
	public int retrieveLikeExprod(String likeExprodId, String memId) {
	
		return exprodDAO.selectExprodlike(likeExprodId, memId);
	}

	@Override
	public int removeLikeExprod(String likeExprodId, String memId) {
		return exprodDAO.deleteExprodlike(likeExprodId, memId);
	}

	@Override
	public void selectExprodMissionList(PagingVO<ExprodVO> pagingVO) {
		pagingVO.setTotalRecord(exprodDAO.selectTotalRecord(pagingVO));
		List<ExprodVO> exprodList = exprodDAO.selectExprodMissionList(pagingVO);
		pagingVO.setDataList(exprodList);
		exprodList.stream().forEach(System.out::println);
		
	}

}
