package kr.or.ddit.resume.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.resume.vo.FacilityVO;

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
public interface FacilityService {

	
	/**
	 * 한 회원이 쓴 하나의 기능를 가져오기
	 * @param facilitySn
	 * @return 기능
	 */
	public FacilityVO retrieveFacility(String facilitySn);
	
	/**
	 * 한 회원이 쓴 모든 기능를 가져오기
	 * @param memId
	 * @return List<FacilityVO> 기능 리스트
	 */
	public List<FacilityVO> retrieveFacilityList(String memId);
	
	/**
	 * 기능 작성하기
	 * @param facility
	 * @return OK, FAIL, PKDUPLICATED
	 */
	public ServiceResult createFacility(FacilityVO facility);
	
	/**
	 * 기능 변경하기
	 * @param facility
	 * @return OK, FAIL
	 */
	public ServiceResult modifyFacility(FacilityVO facility);
	
	/**
	 * 기능 삭제하기
	 * @param facilitySn
	 * @return OK, FAIL
	 */
	public ServiceResult removeFacility(String facilitySn);	
}
