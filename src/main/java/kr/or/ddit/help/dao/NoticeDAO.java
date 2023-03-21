package kr.or.ddit.help.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.help.vo.NoticeVO;
import kr.or.ddit.vo.PagingVO;

/**
 * 
 * @author 박형준
 * @since 2023. 2. 7.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 7.      박형준       		최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface NoticeDAO {
	/**
	 * 공지사항 목록
	 * @param pagingVO
	 * @return
	 */
	public List<NoticeVO> selectNoticeList(PagingVO<NoticeVO> pagingVO);
	
	/**
	 * 검색
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecord(PagingVO<NoticeVO> pagingVO);
	
	/**
	 * 공지사항 세부
	 * @param noticeSn
	 * @return
	 */
	public NoticeVO selectNotice(String noticeSn);
	
	/**
	 * 조회수 증가
	 * @param notice
	 */
	public void incrementHit(NoticeVO notice);
	
	/**
	 * 공지사항 생성
	 * @param notice
	 * @return
	 */
	public int insertNotice(NoticeVO notice);
	
	/**
	 * 공지사항 수정
	 * @param notice
	 * @return
	 */
	public int updateNotice(NoticeVO notice);
	
	/**
	 * 공지사항 삭제
	 * @param noticeSn
	 * @return
	 */
	public int deleteNotice(String noticeSn);
}
























