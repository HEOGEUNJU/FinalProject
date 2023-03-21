package kr.or.ddit.resume.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.resume.vo.ResumeItemVO;
import kr.or.ddit.resume.vo.ResumeVO;

/**
 * 
 * @author 최경수
 * @since 2023. 2. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 6.      최경수              최초작성
 * 2023. 2. 10.     최경수            이력서 항목 추가, 선택, 삭제
 * 2023. 2. 13.     최경수            이력서 추가, 수정, 삭제
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface ResumeDAO {
	
	/**
	 * 하나의 이력서 찾기
	 * @param resumeId
	 * @return 존재하지 않으면, null
	 */
	public ResumeVO selectResume(String resumeSn);
	
	/**
	 * 한 회원이 쓴 모든 이력서 찾기
	 * @param memId
	 * @return List
	 */
	public List<ResumeVO> selectResumeList(String memId);
	
	/**
	 * 신규 이력서 등록
	 * @param resume
	 * @return 등록된 이력서 수
	 */
	public int insertResume(ResumeVO resume);
	
	/**
	 * 이력서 수정
	 * @param resume
	 * @return 수정된 이력서 수
	 */
	public int updateResume(ResumeVO resume);
	
	/**
	 * 이력서 삭제
	 * @param resumeSn
	 * @return 삭된 이력서 수
	 */
	public int deleteResume(String resumeSn);
	
	/**
	 * 이력서에 쓰인 항목 목록 찾기
	 * @param resumeId
	 * @return 항목(ResumeItemVO)가 들어있는 목록(List)
	 */
	public List<ResumeItemVO> selectItemList(String resumeSn);
	
	/**
	 * 어떤 특정 이력서에 항목 추가하기
	 * @param resumeSn
	 * @param obj
	 * @return 들어간 항목 수
	 */
	public int insertItem(ResumeItemVO itemVO);
	
	/**
	 * 항목 목록에서 지운 항목과 관련한 이력서 안 항목 지우기(항목 목록에 존재하지 않음)
	 * @param resumeItemSn
	 * @return 지운 항목 수
	 */
	public int deleteItem(String resumeItemSn);
	
	/**
	 * 한 이력서의 들어있지 않은 항목들을 추가하여등록하기
	 * @param resume
	 * @return 등록한 항목 수
	 */
	public int insertItemList(ResumeVO resume);
	
	/**
	 * 한 이력서 안에서 어떤 항목을 삭제하기(항목 목록에는 존재함)
	 * @param item
	 * @return 지운 항목 수
	 */
	public int deleteItemInResume(ResumeItemVO item);
}
