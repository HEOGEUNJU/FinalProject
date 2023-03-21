package kr.or.ddit.resume.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.resume.vo.AwardVO;
import kr.or.ddit.resume.vo.CareerVO;

/**
 * @author 최경수
 * @since 2023. 2. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 	    수정일               수정자                                     수정내용
 * --------     --------    ----------------------
 * 2023. 2. 6.       최경수        최초작성
 * 2023. 2. 7.       최경수        삭제 추가
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface AwardDAO {
	/**
	 * 하나의 수상 찾기
	 * @param awardId
	 * @return 존재하지 않으면, null
	 */
	public AwardVO selectAward(String awardSn);
	
	/**
	 * 한 회원이 쓴 모든 수상 목록
	 * @param memId
	 * @return List
	 */
	public List<AwardVO> selectAwardList(String memId);
	
	/**
	 * 신규 수상 등록
	 * @param Award
	 * @return 등록된 수상 수
	 */
	public int insertAward(AwardVO award);
	
	/**
	 * 수상 수정
	 * @param Award
	 * @return 수정된 수상 수
	 */
	public int updateAward(AwardVO award);
	
	/**
	 * 수상 삭제, 실제로는 삭제 날짜만 바꿔준다.
	 * @param actSn
	 * @return 삭제된 수상 수 
	 */
	public int deleteAward(String awardSn);
	
	/**
	 * 특정 이력서에 선택되지 않은 항목 목록 
	 * @param memId, resumeSn
	 * @return 이력서에서 쓰지 않은 사항 목록
	 */
	public List<AwardVO> selectAwardForResume(@Param("memId") String memId, @Param("resumeSn") String resumeSn);
}
