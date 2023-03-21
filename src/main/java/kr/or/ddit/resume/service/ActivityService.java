package kr.or.ddit.resume.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.resume.vo.ActivityVO;

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
public interface ActivityService {

	
	/**
	 * 한 회원이 쓴 하나의 주요활동를 가져오기
	 * @param actSn
	 * @return 주요활동
	 */
	public ActivityVO retrieveActivity(String actSn);
	
	/**
	 * 한 회원이 쓴 모든 주요활동를 가져오기
	 * @param memId
	 * @return List<ActivityVO> 주요활동 리스트
	 */
	public List<ActivityVO> retrieveActivityList(String memId);
	
	/**
	 * 주요활동 작성하기
	 * @param resume
	 * @return OK, FAIL, PKDUPLICATED
	 */
	public ServiceResult createActivity(ActivityVO activity);
	
	/**
	 * 주요활동 변경하기
	 * @param resume
	 * @return OK, FAIL
	 */
	public ServiceResult modifyActivity(ActivityVO activity);
	
	/**
	 * 주요활동 삭제하기
	 * @param actSn
	 * @return OK, FAIL
	 */
	public ServiceResult removeActivity(String actSn);
}
