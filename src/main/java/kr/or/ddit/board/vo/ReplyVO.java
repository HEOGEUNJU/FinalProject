package kr.or.ddit.board.vo;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString(exclude= {"replyContent"})
public class ReplyVO {
	@NotBlank
	private String replyNo;			// 댓글 번호
	@NotBlank(groups= {UpdateGroup.class, DeleteGroup.class})
	private String boardNo;			// 게시판 번호
	@NotBlank
	private String memId;			// 작성자 ID
	@NotBlank
	private String replyContent;	// 댓글 내용
	private String replyDate;		// 댓글 작성일
}
