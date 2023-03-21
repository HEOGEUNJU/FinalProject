package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.vo.BoardReportVO;

/**
 * 
 * @author 박형준
 * @since 2023. 3. 14.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일              수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 3. 14.   박형준              최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
public interface BoardReportService {

	// 게시글 신고 목록
	public List<BoardReportVO> retrieveReportList();
}
