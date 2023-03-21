package kr.or.ddit.resume.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
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
public interface CareerService {

	
	/**
	 * 한 회원이 쓴 하나의 경력를 가져오기
	 * @param careerSn
	 * @return 경력
	 */
	public CareerVO retrieveCareer(String careerSn);
	
	/**
	 * 한 회원이 쓴 모든 경력를 가져오기
	 * @param memId
	 * @return List<CareerVO> 경력 리스트
	 */
	public List<CareerVO> retrieveCareerList(String memId);
	
	/**
	 * 경력 작성하기
	 * @param career
	 * @return OK, FAIL, PKDUPLICATED
	 */
	public ServiceResult createCareer(CareerVO career);
	
	/**
	 * 경력 변경하기
	 * @param career
	 * @return OK, FAIL
	 */
	public ServiceResult modifyCareer(CareerVO career);
	
	/**
	 * 경력 삭제하기
	 * @param careerSn
	 * @return OK, FAIL
	 */
	public ServiceResult removeCareer(String careerSn);	
}
