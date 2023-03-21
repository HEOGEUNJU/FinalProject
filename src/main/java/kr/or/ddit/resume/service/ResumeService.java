package kr.or.ddit.resume.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.resume.vo.ResumeItemVO;
import kr.or.ddit.resume.vo.ResumeVO;

/**
 * @author 최경수
 * @since 2023. 2. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자      	수정내용
 * --------     --------    ----------------------
 * 2023. 2. 6.     최경수        최초작성
 * 2023. 2. 10.    최경수        이력서 항목 추가, 선택, 삭제
 * 2023. 2. 13.    최경수        이력서 추가, 수정, 삭
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
public interface ResumeService {
	
	/**
	 * 한 회원이 쓴 하나의 이력서를 가져오기
	 * @param resumeId
	 * @return ResumeVO 한 이력서
	 */
	public ResumeVO retrieveResume(String resumeSn);
	
	/**
	 * 한 회원이 쓴 모든 이력서를 가져오기
	 * @param memId
	 * @return List<ResumeVO> 이력서 리스트
	 */
	public List<ResumeVO> retrieveResumeList(String memId);
	
	/**
	 * 이력서 작성하기
	 * @param resume
	 * @return OK, FAIL, PKDUPLICATED
	 */
	public ServiceResult createResume(ResumeVO resume);
	
	/**
	 * 이력서 변경하기
	 * @param resume
	 * @return OK, FAIL
	 */
	public ServiceResult modifyResume(ResumeVO resume);
	
	/**
	 * 이력서 삭제하기
	 * @param resumeSn
	 * @return OK, FAIL
	 */
	public ServiceResult removeResume(String resumeSn);
	
	/**
	 * 한 이력서의 항목 목록 가져오기
	 * @param resumeSn, resume
	 * @return ResumeVO가 들어있는 목록(List) -> ResumeVO에 있는 itemList에 다 담기?
	 */
	public void retrieveItemList(String resumeSn, ResumeVO resume);
	
	/**
	 * 특정 이력서에 이력서 항목 넣기
	 * @param resumeSn, vo
	 * @return OK, FAIL, PKDUPLICATED 
	 */
	public ServiceResult createItem(String resumeSn, Object vo);
	
	/**
	 * 이력서 안에 있는 항목 지우기
	 * @param resumeItemSn
	 * @return OK, FAIL
	 */
	public ServiceResult removeItem(String resumeItemSn); 
	
	/**
	 * 특정 이력서 안에 항목 중 넣지 않은 항목들
	 * @param memId, resumeSn
	 * @return 안 쓴 항목들이 들어있는 resume
	 */
	public ResumeVO retrieveItemForResume(@Param("memId") String memId, @Param("resumeId") String resumeSn);
	
	/**
	 * 이력서에서 체크박스를 통해서 넣는 항목들
	 * @param resume
	 * @return OK,FAIL, PKDUPLICATED
	 */
	public ServiceResult createResumeItemListForResume(ResumeVO resume);
	
	/**
	 * 한 이력서 안에서 어떤 항목을 삭제하기(항목 목록에는 존재함)
	 * @param item
	 * @return 지운 항목 수
	 */
	public ServiceResult removeItemInResume(ResumeItemVO item);
	
}
