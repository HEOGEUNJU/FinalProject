package kr.or.ddit.apply.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.apply.vo.ApplyVO;

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
 * 2023. 2. 27.      최경수       지원자
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface ApplyDAO {

	public ApplyVO selectApply(String applySn);
	public List<ApplyVO> selectApplyList(String memId);
	public List<String> selectApplySnList(String daNo);
	public int insertApply(ApplyVO apply);
	public int updateApply(ApplyVO apply);
	public int deleteApply(String applySn);
	public int deleteScore(Map<String, String> map);
	
	public List<ApplyVO> selectApplicant(Map<String, String> map);
	public int insertScore(String applySn);
	public int updateScore(Map<String, String> map);
	public int updateScoreZero(Map<String, String> map);
	public int updateResult(ApplyVO apply);
}
