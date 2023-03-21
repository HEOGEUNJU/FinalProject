package kr.or.ddit.resume.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.resume.vo.CourseVO;

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
public interface CourseService {

	
	/**
	 * 한 회원이 쓴 하나의 교육이수를 가져오기
	 * @param courseSn
	 * @return 교육이수
	 */
	public CourseVO retrieveCourse(String courseSn);
	
	/**
	 * 한 회원이 쓴 모든 교육이수를 가져오기
	 * @param memId
	 * @return List<CourseVO> 교육이수 리스트
	 */
	public List<CourseVO> retrieveCourseList(String memId);
	
	/**
	 * 교육이수 작성하기
	 * @param resume
	 * @return OK, FAIL, PKDUPLICATED
	 */
	public ServiceResult createCourse(CourseVO course);
	
	/**
	 * 교육이수 변경하기
	 * @param resume
	 * @return OK, FAIL
	 */
	public ServiceResult modifyCourse(CourseVO course);
	
	/**
	 * 교육이수 삭제하기
	 * @param courseSn
	 * @return OK, FAIL
	 */
	public ServiceResult removeCourse(String courseSn);	
}
