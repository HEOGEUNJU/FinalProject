package kr.or.ddit.resume.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
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
public interface EducationService {

	
	/**
	 * 한 회원이 쓴 하나의 학력를 가져오기
	 * @param eduSn
	 * @return 학력
	 */
	public EducationVO retrieveEducation(String eduSn);
	
	/**
	 * 한 회원이 쓴 모든 학력를 가져오기
	 * @param memId
	 * @return List<EducationVO> 학력 리스트
	 */
	public List<EducationVO> retrieveEducationList(String memId);
	
	/**
	 * 학력 작성하기
	 * @param edu
	 * @return OK, FAIL, PKDUPLICATED
	 */
	public ServiceResult createEducation(EducationVO edu);
	
	/**
	 * 학력 변경하기
	 * @param edu
	 * @return OK, FAIL
	 */
	public ServiceResult modifyEducation(EducationVO edu);
	
	/**
	 * 학력 삭제하기
	 * @param eduSn
	 * @return OK, FAIL
	 */
	public ServiceResult removeEducation(String eduSn);	
}
