package kr.or.ddit.announcement.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.announcement.vo.AnnoDetailVO;
import kr.or.ddit.announcement.vo.AnnoVO;
import kr.or.ddit.vo.PagingVO;

/**
 * @author 작성자명
 * @since 2023. 2. 7.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 7.      양서연       최초작성
 * 2023. 2. 17.     최경수       회원아이디로 공고 찾기
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface AnnoDAO {
	/**
	 * 검색 조건과 현재 페이지에 맞는 공고 조회
	 * @param pagingVO
	 * @return
	 */
	public List<AnnoVO> selectAnnoList(PagingVO<AnnoVO> pagingVO);
	
	/**
	 * 검색 조건에 맞는 레코드 수 반환
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecord(PagingVO<AnnoVO> pagingVO);
	
	/**
	 * @param annoNo
	 * @return 존재하지 않으면, null 반환
	 */
	public AnnoVO selectAnno(@Param("annoNo") String annoNo);
	
	/**
	 * 공고 신규 등록
	 * @param anno
	 * @return
	 */
	public int insertAnno(AnnoVO anno);
	
	/**
	 * 세부공고 신규 등록
	 * @param detail
	 * @return
	 */
	public int insertAnnoDetail(AnnoDetailVO detailVO);
	
	/**
	 * 세부공고당 경력 등록
	 * @param careerName
	 * @return
	 */
	public int insertAnnoCareer(@Param("careerName") String careerName, @Param("daNo") String daNo);

	/**
	 * 세부공고당 직급직책조건 등록
	 * @param positionName
	 * @return
	 */
	public int insertAnnoPosition(@Param("positionCode") String positionCode, @Param("daNo") String daNo);
	
	/**
	 * 공고당 복지 리스트 등록
	 * @param welfare
	 * @return
	 */
	public int insertWelfareList(Map<String, Object> map);
	
	/**
	 * 모든 복지항목 삭제
	 * @param annoNo
	 * @return
	 */
	public int deleteAllWelfare(@Param("annoNo") String annoNo);
	
	/**
	 * 공고 업데이트
	 * @param anno
	 * @return
	 */
	public int updateAnno(AnnoVO anno);
	
	/**
	 * 세부공고 업데이트
	 * @param detailVO
	 * @return
	 */
	public int updateDetailAnno(AnnoDetailVO detailVO);
	
	/**
	 * 글 상태코드 B2(삭제)로 update
	 * @param annoNo
	 * @return
	 */
	public int deleteAnno(@Param("annoNo") String annoNo);
	
	/**
	 * 글 상태코드 B4(만료)로 update
	 * @param annoNo
	 * @return
	 */
	public int terminateAnno(@Param("annoNo") String annoNo);
	
	/**
	 * 관심공고 등록여부 조회
	 * @param annoNo
	 * @param memId
	 * @return
	 */
	public int selectLikeAnno(@Param("annoNo") String annoNo, @Param("memId") String memId);
	
	/**
	 * 관심공고 등록
	 * @param annoNo
	 * @param memId
	 * @return
	 */
	public int insertLikeAnno(@Param("annoNo") String annoNo, @Param("memId") String memId);
	
	/**
	 * 관심공고 삭제
	 * @param annoNo
	 * @param memId
	 * @return
	 */
	public int deleteLikeAnno(@Param("annoNo") String annoNo, @Param("memId") String memId);

	/**
	 * 관심기업 등록여부 조회
	 * @param cmpId
	 * @param memId
	 * @return
	 */
	public int selectLikeCmp(@Param("cmpId") String cmpId, @Param("memId") String memId);
	
	/**
	 * 관심기업 등록
	 * @param cmpId
	 * @param memId
	 * @return
	 */
	public int insertLikeCmp(@Param("cmpId") String cmpId, @Param("memId") String memId);
	
	/**
	 * 관심기업 삭제
	 * @param cmpId
	 * @param memId
	 * @return
	 */
	public int deleteLikeCmp(@Param("cmpId") String cmpId, @Param("memId") String memId);
	
	/**
	 * 멤버 로그 추가
	 * @param annoNo
	 * @param memId
	 * @return
	 */
	public int insertMemLog(@Param("annoNo") String annoNo, @Param("memId") String memId);
	
	/**
	 * 공고 추천
	 * @param annoNo
	 * @return
	 */
	public List<AnnoVO> selectRecommend(@Param("annoNo") String annoNo);
	
	/**
	 * 조회수 증가
	 * @param annoNo
	 */
	public void incrementHit(@Param("annoNo") String annoNo);
	
	/**
	 * 조회수 상위 15퍼센트 공고 조회
	 * @return
	 */
	public List<String> per15Chk();
	
	/**
	 * 경수
	 * 한 회사가 등록한 공고 목록
	 * @param memId
	 * @return List<AnnoVO>
	 */
	public List<AnnoVO> selectMyAnnoList(String memId);
	
	/**
	 * 경수
	 * 공고 하나가 가지는 세부공고(process 포함)
	 * @param annoNo
	 * @return AnnoVO
	 */
	public AnnoVO selectAnnoDetailProcess(String annoNo);
	
	/**
	 * 경수
	 * 찜한 공고
	 * @param memId
	 * @return List<AnnoVO>
	 */	
	public List<AnnoVO> selectLikeAnnoList(String memId);
	
	/**
	 * 근주
	 * 찜한 공고
	 * @param memId
	 * @return List<AnnoVO>
	 */	
	public List<AnnoVO> selectLikeAnnoListMypage(String memId);
	
	/**
	 * 경수
	 * 지원한 공고 목록
	 * @param memId
	 * @return List<AnnoVO>
	 */
	public List<AnnoVO> selectMyAnnoListSeeker(String memId);
}

