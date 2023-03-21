package kr.or.ddit.lab.dao;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.lab.vo.NewsVO;
import kr.or.ddit.vo.PagingVO;

@Mapper
public interface NewsDAO {

	/**
	 * 뉴스 리스트 보여주기
	 * @param pagingVO
	 * @return
	 */
	public int insertNews(NewsVO news);
	
	public List<NewsVO> selectNewsList(PagingVO<NewsVO> pagingVO);
	public int selectTotalRecord(PagingVO<NewsVO> pagingVO);
	public NewsVO selectNews(String newsNo);
	public int incrementHit(String newsNo);
	
	public int updateNews(NewsVO news);
	
	
	public int getFieldRecord(int newsFieldSum);
	
	public int deleteNews(String newsNo);
	
	
}
