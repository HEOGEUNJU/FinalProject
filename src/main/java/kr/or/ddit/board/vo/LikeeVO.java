package kr.or.ddit.board.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class LikeeVO {
	private String boardNo;
	private String memId;
	private String liketype;
}
