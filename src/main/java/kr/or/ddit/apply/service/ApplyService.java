package kr.or.ddit.apply.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.apply.vo.ApplyVO;
import kr.or.ddit.enumpkg.ServiceResult;

/**
 * 
 * @author 최경수
 * @since 2023. 2. 13.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자        수정내용
 * --------     --------    ----------------------
 * 2023. 2. 13.      최경수       최초작성
 * 2023. 2. 27.      최경수       지원자 목록 가져오기
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
public interface ApplyService {

	public ApplyVO retrieveApply(String applySn);
	public List<ApplyVO> retrieveApplyList(String memId);
	public List<String> retireveApplySnList(String daNo);
	public ServiceResult createApply(ApplyVO apply);
	public ServiceResult modifyApply(ApplyVO apply);
	public ServiceResult removeApply(String applySn);
	
	public List<ApplyVO> retrieveApplicant(Map<String, String> map);
	public ServiceResult modifyScore(Map<String, String> map);
	public ServiceResult modifyScoreZero(String table, String itemCodeId, String applySn);
	public ServiceResult modifyResult(List<ApplyVO> resultList);
}
