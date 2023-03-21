package kr.or.ddit.help.vo;

import kr.or.ddit.vo.CommonsAttachVO;
import lombok.Data;
import lombok.EqualsAndHashCode;


/**
 * 
 * @author 박형준
 * @since 2023. 2. 7.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                수정자           수정내용
 * --------     --------    ----------------------
 * 2023. 2. 7.     박형준           최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode(of="noticeSn")
public class NoticeVO extends CommonsAttachVO{
	private int rnum;				//행번호
	private String noticeSn;		//공지사항일련번호
	private String memId;           //회원아이디
	private String noticeSort;      //구분
	private String noticeTitle;     //제목
	private String noticeContent;   //내용
	private String noticeDate;      //작성일
	private int noticeHit;       //조회수
	private String noticeDelDate; //삭제일자
	
	private int[] delAttNos; //게시글 수정시 삭제할 첨부파일 번호 유지
	
	public String getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate.substring(0, 10);
	}
	@Override
	public String getTblId() {
		return noticeSn;
	}
	
	
}