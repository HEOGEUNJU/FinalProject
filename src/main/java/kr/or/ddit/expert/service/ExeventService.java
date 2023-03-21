package kr.or.ddit.expert.service;

import kr.or.ddit.expert.vo.ExeventVO;
import kr.or.ddit.expert.vo.ExpertVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.PagingVO;

public interface ExeventService {
	
	public void retrieveExeventList(PagingVO<ExeventVO> exevent);
	
	public ExeventVO retrieveExevent(String exeventId);
	
	public void retrieveEndExeventList(PagingVO<ExeventVO> exevent);
	
	public ExeventVO retrieveEndExevent(String exeventId);
	
	public int createExevent(ExeventVO exevent);
	
	public AttachVO retrieveFordownload(String attId);
	
	public int updateHits(String exeventId);
	
	public int updateExevent(ExeventVO exevent);
	
	public int deleteExevent(String exeventId);
}
