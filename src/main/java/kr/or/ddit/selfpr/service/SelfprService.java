package kr.or.ddit.selfpr.service;

import java.util.List;
import kr.or.ddit.selfpr.vo.SelfprVO;
import kr.or.ddit.vo.PagingVO;

public interface SelfprService {

	public List<SelfprVO> retrieveSelfprList(PagingVO<SelfprVO> pagingVO);
	
//	세부사항 가져오는 메소드
	public SelfprVO retrieveSelfprMember(int prNo);
	public List<SelfprVO> retrieveSelfprEducation(int prNo);
	public List<SelfprVO> retrieveSelfprCareer(int prNo);
	public List<SelfprVO> retrieveSelfprCert(int prNo);
	public List<SelfprVO> retrieveSelfprAct(int prNo);
	public List<SelfprVO> retrieveSelfprAward(int prNo);
	public List<SelfprVO> retrieveSelfprCourse(int prNo);
	public List<SelfprVO> retrieveSelfprMypage(String memId);
	
	public int createSelfpr(SelfprVO selfpr);
	public int modifySelfpr(SelfprVO selfpr);
	
	public int removeSelfpr(int prNo);
		
// 관심인재 확인
	public int matchLike(SelfprVO matchselfpr);
}
