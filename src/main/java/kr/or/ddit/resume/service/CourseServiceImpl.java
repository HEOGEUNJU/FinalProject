package kr.or.ddit.resume.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.resume.dao.CourseDAO;
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
@Service
public class CourseServiceImpl implements CourseService {

	@Inject
	private CourseDAO dao;
	
	@Override
	public CourseVO retrieveCourse(String courseSn) {
		CourseVO course = dao.selectCourse(courseSn);
		return course;
	}

	@Override
	public List<CourseVO> retrieveCourseList(String memId) {
		List<CourseVO> courseList = dao.selectCourseList(memId);
		return courseList;
	}

	@Override
	public ServiceResult createCourse(CourseVO course) {
		int rowcnt = dao.insertCourse(course);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modifyCourse(CourseVO course) {
		int rowcnt = dao.updateCourse(course);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeCourse(String courseSn) {
		int rowcnt = dao.deleteCourse(courseSn);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

}
