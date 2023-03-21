package kr.or.ddit.expert.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.company.vo.CompanyVO;
import kr.or.ddit.expert.vo.ExeventVO;
import kr.or.ddit.vo.PagingVO;

@Mapper
public interface ExeventDAO {
	
	/**
	 * 진행중인 이벤트 목록
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecord(PagingVO<ExeventVO> pagingVO);
	
	public List<ExeventVO> selectEventList(PagingVO<ExeventVO> paignVo);
	
	public ExeventVO selectEvent(String exeventId);

	/**
	 * 종료된 이벤트 목록
	 * @param pagingVO
	 * @return
	 */
	public int selectEndTotalRecord(PagingVO<ExeventVO> pagingVO);
	
	public List<ExeventVO> selectEndEventList(PagingVO<ExeventVO> paignVo);
	
	public ExeventVO selectEndEvent(String exeventId);
	
	public int insertExevent(ExeventVO exevent);
	
	public int updateHits(String exeventId);
	
	public int updateExevent(ExeventVO exevent);
	
	public int deleteExevent(String exeventId);
}
