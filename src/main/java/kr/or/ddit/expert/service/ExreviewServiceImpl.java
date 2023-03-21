package kr.or.ddit.expert.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.expert.dao.ExcartDAO;
import kr.or.ddit.expert.dao.ExreviewDAO;
import kr.or.ddit.expert.vo.ExeventVO;
import kr.or.ddit.expert.vo.ExreviewVO;
import kr.or.ddit.vo.PagingVO;

@Service
public class ExreviewServiceImpl implements ExreviewService{
 
	@Inject
	public ExreviewDAO exreviewDAO;
	
	@Inject
	public ExcartDAO excartDAO;

	@Override
	public int insertReview(ExreviewVO exreview) {
		String excartId = exreview.getExcartId();
		int rowcnt = exreviewDAO.insertReview(exreview);
		rowcnt += excartDAO.updateReviewState(excartId);
		return rowcnt;
	}

	@Override
	public int updateReview(ExreviewVO exreview) {
		int rowcnt =  exreviewDAO.updateReview(exreview);
		return rowcnt;
	}

	@Override
	public ExreviewVO selectReview(String exreviewId) {
		ExreviewVO exreview = exreviewDAO.selectExreview(exreviewId);
		return exreview;
	}
	
	@Override
	public List<ExreviewVO> retrieveReviewMypageList(String memId) {
		List<ExreviewVO> exreview = exreviewDAO.selectReviewMypageList(memId);
		return exreview;
	}

	@Override
	public void selectReveiwList(PagingVO<ExreviewVO> pagingVO) {
		pagingVO.setTotalRecord(exreviewDAO.selectTotalRecord(pagingVO));
		List<ExreviewVO> exreviewList =  exreviewDAO.selectReviewList(pagingVO);
		pagingVO.setDataList(exreviewList);
		exreviewList.stream().forEach(System.out::println);
	}
	
	
}
