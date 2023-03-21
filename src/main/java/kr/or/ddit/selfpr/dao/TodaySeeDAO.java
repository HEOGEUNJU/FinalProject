package kr.or.ddit.selfpr.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.selfpr.vo.TodaySeeVO;
import kr.or.ddit.vo.PagingVO;

@Mapper
public interface TodaySeeDAO {
	
	//오늘 본 인재 로그 저장 및 24시간 내 확인
	public int insertTodaySee(TodaySeeVO todaySeeVO);
	
	public int checkTodaySee(TodaySeeVO todaySeeVO);
	
	public List<TodaySeeVO> selectListTodaySee(PagingVO<TodaySeeVO> pagingVO);
	public int selectTotalRecord(PagingVO<TodaySeeVO> pagingVO);
	
}
