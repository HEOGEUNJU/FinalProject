package kr.or.ddit.help.service;

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
 * 수정일             수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 7.   박형준                최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */

public interface NoticeService {
	
	/**
	 * 공지사항 목록
	 * @param notice
	 */
	public void retrieveNoticeList(PagingVO<NoticeVO> pagingVO);
	
	/**
	 * 공지사항 세부
	 * @param noticeSn
	 * @return
	 */
	public NoticeVO retrieveNotice(String noticeSn);
	
	/**
	 * 공지사항 생성
	 * @param notice
	 * @return
	 */
	public int createNotice(NoticeVO notice);
	
	/**
	 * 공지사항 수정
	 * @param notice
	 * @return
	 */
	public int modifyNotice(NoticeVO notice);
	
	/**
	 * 공지사항 삭제
	 * @param noticeSn
	 * @return
	 */
	public int removeNotice(String noticeSn);
}
