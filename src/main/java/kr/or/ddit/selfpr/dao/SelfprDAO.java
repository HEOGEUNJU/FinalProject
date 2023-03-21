package kr.or.ddit.selfpr.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import kr.or.ddit.selfpr.vo.SelfprVO;
import kr.or.ddit.vo.PagingVO;

@Mapper
public interface SelfprDAO {

//	검색 관련

	public List<Map<String, Object>> selectRegionList(@Param("regionRef") String regionRef);
	public List<Map<String, Object>> selectIndustry(@Param("industryRef") String industryRef);
	
//	리스트 뽑기
	
	public List<SelfprVO> selectSelfprList(PagingVO<SelfprVO> pagingVO);
	public int selectTotalRecord(PagingVO<SelfprVO> pagingVO);
	
	
//	세부사항 메소드
	public SelfprVO selectSelfprMember(int prNo);
	public List<SelfprVO> selectSelfprEducation(int prNo);
	public List<SelfprVO> selectSelfprCareer(int prNo);
	public List<SelfprVO> selectSelfprCert(int prNo);
	public List<SelfprVO> selectSelfprAct(int prNo);
	public List<SelfprVO> selectSelfprAward(int prNo);
	public List<SelfprVO> selectSelfprCourse(int prNo);
	public List<SelfprVO> selectSelfprMypage(String member);
	
	public int insertSelfpr(SelfprVO selfpr); 
	public int updateSelfpr(SelfprVO selfpr);
	
	public int deleteSelfpr(int prNo);
	
//	관심인재 확인
	public int matchingLike(SelfprVO matchselfpr);
}
