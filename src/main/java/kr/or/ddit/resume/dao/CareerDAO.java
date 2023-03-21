package kr.or.ddit.resume.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.resume.vo.CareerVO;
import kr.or.ddit.resume.vo.EducationVO;

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
public interface CareerDAO {
	/**
	 * 하나의 경력 찾기
	 * @param CareerId
	 * @return 존재하지 않으면, null
	 */
	public CareerVO selectCareer(String careerSn);
	
	/**
	 * 한 회원이 쓴 모든 경력 목록
	 * @param memId
	 * @return List
	 */
	public List<CareerVO> selectCareerList(String memId);
	
	/**
	 * 신규 경력 등록
	 * @param Career
	 * @return 등록된 경력 수
	 */
	public int insertCareer(CareerVO career);
	
	/**
	 * 경력 수정
	 * @param Career
	 * @return 수정된 경력 수
	 */
	public int updateCareer(CareerVO career);

	/**
	 * 경력 삭제, 실제로는 삭제 날짜만 바꿔준다.
	 * @param careerSn
	 * @return 삭제된 경력 수 
	 */
	public int deleteCareer(String careerSn);
	
	/**
	 * 특정 이력서에 선택되지 않은 항목 목록 
	 * @param memId, resumeSn
	 * @return 이력서에서 쓰지 않은 사항 목록
	 */
	public List<CareerVO> selectCareerForResume(@Param("memId") String memId, @Param("resumeSn") String resumeSn);	
}
