package kr.or.ddit.lab.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.lab.vo.ContestVO;
import kr.or.ddit.vo.PagingVO;

@Mapper
public interface ContestDAO {
	
//	전체 리스트 조회
	public List<ContestVO> selectContestList(PagingVO<ContestVO> pagingVO);
	public int selectTotalRecord(PagingVO<ContestVO> pagingVO);
	
//	detail 조회
	public ContestVO selectContest(String contNo);
	
//	조회수
	public void incrementHit(String contNo);
	
	public int insertContest(ContestVO contest);
}
