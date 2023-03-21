package kr.or.ddit.board.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;


/**
 * 
 * @author 박형준
 * @since 2023. 3. 14.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일               수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 3. 14.    박형준          최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(of="memId")
@ToString(exclude= {"boardRptReason"})
public class BoardReportVO implements Serializable{
	private int rnum;
	private String boardRptSn;
	private String memId;
	private String boardRptNo;
	private String boardRptDate;
	private String boardRptReason;
	private String boardRptCheck;
	
}
