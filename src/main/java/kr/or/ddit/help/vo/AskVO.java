package kr.or.ddit.help.vo;

import java.io.Serializable;

import kr.or.ddit.vo.CommonsAttachVO;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AskVO extends CommonsAttachVO implements Serializable{
	private int rnum;
	private String askNo;		// 글번호
	private String memId;		// 회원ID
	private String askCate;		// 회원구분(개인,기업)
	private String askTitle;	// 제목
	private String askContent;	// 내용
	private String askDate;		// 문의등록일
	private String refContent;	// 답글내용
	private String askType;		// 문의종류
	private String askStatus;	// 답변상태
	private String askDelDate;  // 삭제여부
	private String refDate;		// 답글등록일

	@Override
	public String getTblId() {
		return askNo;
	}
}
