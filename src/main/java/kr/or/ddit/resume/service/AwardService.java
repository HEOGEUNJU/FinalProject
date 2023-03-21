package kr.or.ddit.resume.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.resume.vo.AwardVO;

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
public interface AwardService {

	
	/**
	 * 한 회원이 쓴 하나의 수상를 가져오기
	 * @param awardSn
	 * @return 수상
	 */
	public AwardVO retrieveAward(String awardSn);
	
	/**
	 * 한 회원이 쓴 모든 수상를 가져오기
	 * @param memId
	 * @return List<AwardVO> 수상 리스트
	 */
	public List<AwardVO> retrieveAwardList(String memId);
	
	/**
	 * 수상 작성하기
	 * @param award
	 * @return OK, FAIL, PKDUPLICATED
	 */
	public ServiceResult createAward(AwardVO award);
	
	/**
	 * 수상 변경하기
	 * @param award
	 * @return OK, FAIL
	 */
	public ServiceResult modifyAward(AwardVO award);
	
	/**
	 * 수상 삭제하기
	 * @param awardSn
	 * @return OK, FAIL
	 */
	public ServiceResult removeAward(String awardSn);
}
