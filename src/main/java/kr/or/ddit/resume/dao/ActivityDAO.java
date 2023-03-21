package kr.or.ddit.resume.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.resume.vo.ActivityVO;
import kr.or.ddit.resume.vo.CareerVO;
import kr.or.ddit.resume.vo.ResumeVO;

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
public interface ActivityDAO {
	/**
	 * 하나의 주요활동 찾기
	 * @param resumeId
	 * @return 존재하지 않으면, null
	 */
	public ActivityVO selectActivity(String actSn);
	
	/**
	 * 한 회원이 쓴 모든 주요활동 목록
	 * @param memId
	 * @return List
	 */
	public List<ActivityVO> selectActivityList(String memId);
	
	/**
	 * 신규 주요활동 등록
	 * @param activity
	 * @return 등록된 주요활동 수
	 */
	public int insertActivity(ActivityVO activity);
	
	/**
	 * 주요활동 수정
	 * @param activity
	 * @return 수정된 주요활동 수
	 */
	public int updateActivity(ActivityVO activity);
	
	/**
	 * 주요활동 삭제, 실제로는 삭제 날짜만 바꿔준다.
	 * @param actSn
	 * @return 삭제된 주요활동 수 
	 */
	public int deleteActivity(String actSn);
	
	/**
	 * 특정 이력서에 선택되지 않은 항목 목록 
	 * @param memId, resumeSn
	 * @return 이력서에서 쓰지 않은 사항 목록
	 */
	public List<ActivityVO> selectActivityForResume(@Param("memId") String memId, @Param("resumeSn") String resumeSn);
}
