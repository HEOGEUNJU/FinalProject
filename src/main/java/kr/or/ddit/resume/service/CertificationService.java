package kr.or.ddit.resume.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.resume.vo.CertificationVO;

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
public interface CertificationService {

	
	/**
	 * 한 회원이 쓴 하나의 자격증를 가져오기
	 * @param certSn
	 * @return 자격증
	 */
	public CertificationVO retrieveCertification(String certSn);
	
	/**
	 * 한 회원이 쓴 모든 자격증를 가져오기
	 * @param memId
	 * @return List<CertificationVO> 자격증 리스트
	 */
	public List<CertificationVO> retrieveCertificationList(String memId);
	
	/**
	 * 자격증 작성하기
	 * @param cert
	 * @return OK, FAIL, PKDUPLICATED
	 */
	public ServiceResult createCertification(CertificationVO cert);
	
	/**
	 * 자격증 변경하기
	 * @param cert
	 * @return OK, FAIL
	 */
	public ServiceResult modifyCertification(CertificationVO cert);
	
	/**
	 * 자격증 삭제하기
	 * @param courseSn
	 * @return OK, FAIL
	 */
	public ServiceResult removeCertification(String certSn);	
}
