package kr.or.ddit.board.vo;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.CommonsAttachVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of="memId")
@ToString(exclude= {"boardContent"})
public class BoardVO extends CommonsAttachVO implements Serializable{
	private int rnum;			// 순번
	@NotBlank(groups= {UpdateGroup.class, DeleteGroup.class})
	private String boardNo; 	// 게시판번호
	private String memId; 		// 회원ID
	@NotBlank
	private String boardSub;	// 구분(신입, 취준 등)
	@NotBlank
	private String boardTitle;	// 제목
	private String boardContent;// 내용
	private String boardDate;	// 등록일
	private int boardHits;		// 조회수
	private String boardStatus;	// 상태여부(삭제,미삭제)
	private int likeCnt; 		// 공감수
	private int likeCheck;		// 공감여부
	private char likeType;		// 공감타입
	private int replyCnt;		// 댓글개수

	private List<LikeeVO> likeList;
	private int like;
	private int fun;
	private int help;
	private int cheer;

	@Override
	public String getTblId() {
		return boardNo;
	}
}
