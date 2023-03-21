package kr.or.ddit.lab.service;

import kr.or.ddit.lab.vo.ContestVO;
import kr.or.ddit.vo.PagingVO;

public interface ContestService {
	
	public void retrieveContestList(PagingVO<ContestVO> pagingVO);
	
	public ContestVO retrieveContest(String contNo);
	
	public int createContest(ContestVO contest);
}
