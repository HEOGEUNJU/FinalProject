package kr.or.ddit.commons;

import java.util.List;

import kr.or.ddit.vo.AttachVO;

/**
 * @author 최경수
 * @since 2023. 3. 8.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 	    수정일               수정자                                     수정내용
 * --------     --------    ----------------------
 * 2023. 3. 8.       최경수        최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
public interface AttachService {
	public List<AttachVO> retireveAttatchList(String tblId);
}
