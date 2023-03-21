package kr.or.ddit.selfpr.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import kr.or.ddit.selfpr.dao.SelfprDAO;
import kr.or.ddit.selfpr.vo.SelfprVO;
import kr.or.ddit.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SelfprServiceImpl implements SelfprService {
	
	@Inject
	private SelfprDAO selfprDAO;
	
	@Override
	public List<SelfprVO> retrieveSelfprList(PagingVO<SelfprVO> pagingVO) {
		int totalRecord = selfprDAO.selectTotalRecord(pagingVO);
		log.info("토탈레코드:",totalRecord);
		pagingVO.setTotalRecord(totalRecord);
		log.info("페이징VO 토탈레코드:",pagingVO.getTotalRecord());
		
		List<SelfprVO> dataList = selfprDAO.selectSelfprList(pagingVO);
		pagingVO.setDataList(dataList);
		
		return dataList;
	}
	
//	세부사항 가져오는 메소드
	@Override
	public SelfprVO retrieveSelfprMember(int prNo) {
		SelfprVO selfprmem = selfprDAO.selectSelfprMember(prNo);
		return selfprmem;
	}
	@Override
	public List<SelfprVO> retrieveSelfprEducation(int prNo) {
		List<SelfprVO> selfpredu = selfprDAO.selectSelfprEducation(prNo);
		return selfpredu;
	}
	@Override
	public List<SelfprVO> retrieveSelfprCareer(int prNo) {
		List<SelfprVO> selfprcareer = selfprDAO.selectSelfprCareer(prNo);
		return selfprcareer;
	}
	@Override
	public List<SelfprVO> retrieveSelfprCert(int prNo) {
		List<SelfprVO> selfprcert = selfprDAO.selectSelfprCert(prNo);
		return selfprcert;
	}
	@Override
	public List<SelfprVO> retrieveSelfprAct(int prNo) {
		List<SelfprVO> selfpract = selfprDAO.selectSelfprAct(prNo);
		return selfpract;
	}
	@Override
	public List<SelfprVO> retrieveSelfprAward(int prNo) {
		List<SelfprVO> selfpraward = selfprDAO.selectSelfprAward(prNo);
		return selfpraward;
	}
	@Override
	public List<SelfprVO> retrieveSelfprCourse(int prNo) {
		List<SelfprVO> selfprcourse = selfprDAO.selectSelfprCourse(prNo);
		return selfprcourse;
	}
	@Override
	public List<SelfprVO> retrieveSelfprMypage(String memId) {
		List<SelfprVO> selfprcourse = selfprDAO.selectSelfprMypage(memId);
		return selfprcourse;
	}

	
	@Override
	public int createSelfpr(SelfprVO selfpr) {
		int rowcnt = selfprDAO.insertSelfpr(selfpr);
		return rowcnt;
	}

	@Override
	public int modifySelfpr(SelfprVO selfpr) {
		int rowcnt = selfprDAO.updateSelfpr(selfpr);
		return rowcnt;
	}

	@Override
	public int removeSelfpr(int prNo) {
		int rowcnt = selfprDAO.deleteSelfpr(prNo);
		return rowcnt;
	}

//	관심인재 확인
	@Override
	public int matchLike(SelfprVO matchselfpr) {
		int rowcnt = selfprDAO.matchingLike(matchselfpr);
		return rowcnt;
	}

}
