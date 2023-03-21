package kr.or.ddit.help.vo;

import kr.or.ddit.vo.CommonsAttachVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

/**
 * 
 * @author 박형준
 * @since 2023. 2. 10.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 10.   박형준       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode(of="helpSn")
@NoArgsConstructor
public class HelpVO extends CommonsAttachVO {
	private int rnum;				//행번호
	private String helpSn;			//도움말일련번호
	private String helpSort;        //구분
	private String helpCate;        //분류
	private String helpTitle;       //제목
	private String helpContent;     //내용
	private String helpDate;        //작성일
	private String helpModiDate;    //수정일
	private String helpDelDate;    	//수정일
	private int helpHit;            //조회수

	private String code;			//분류코드
	private String codeName;		//분류코드명
	
	public HelpVO(String helpSort, String helpCate) {
		super();
		this.helpSort = helpSort;
		this.helpCate = helpCate;
	}
	
	public String getHelpDate() {
		return helpDate;
	}
	public void setHelpDate(String helpDate) {
		this.helpDate = helpDate.substring(0, 10);
	}

	public String getHelpModiDate() {
		return helpModiDate;
	}
	public void setHelpModiDate(String helpModiDate) {
		this.helpModiDate = helpModiDate.substring(0, 10);
	}

	public String getHelpDelDate() {
		return helpDelDate;
	}
	public void setHelpDelDate(String helpDelDate) {
		this.helpDelDate = helpDelDate.substring(0, 10);
	}
	

	@Override
	public String getTblId() {
		return helpSn;
	}

}
