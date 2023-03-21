package kr.or.ddit.resume.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.resume.vo.CareerVO;
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
@Mapper
public interface CourseDAO {
	/**
	 * 하나의 교육이수 찾기
	 * @param courseId
	 * @return 존재하지 않으면, null
	 */
	public CourseVO selectCourse(String courseSn);
	
	/**
	 * 한 회원이 쓴 모든 교육이수 목록
	 * @param memId
	 * @return List
	 */
	public List<CourseVO> selectCourseList(String memId);
	
	/**
	 * 신규 교육이수 등록
	 * @param course
	 * @return 등록된 교육이수 수
	 */
	public int insertCourse(CourseVO course);
	
	/**
	 * 교육이수 수정
	 * @param course
	 * @return 수정된 교육이수 수
	 */
	public int updateCourse(CourseVO course);
	
	/**
	 * 교육이수 삭제, 실제로는 삭제 날짜만 바꿔준다.
	 * @param courseSn
	 * @return 삭제된 교육이수 수 
	 */
	public int deleteCourse(String courseSn);	

	/**
	 * 특정 이력서에 선택되지 않은 항목 목록 
	 * @param memId, resumeSn
	 * @return 이력서에서 쓰지 않은 사항 목록
	 */
	public List<CourseVO> selectCourseForResume(@Param("memId") String memId, @Param("resumeSn") String resumeSn);
}
