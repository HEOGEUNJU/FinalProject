package kr.or.ddit.exception;

public class NotExistBoardException extends RuntimeException {

	public NotExistBoardException(String boNo) {
		super(String.format("%s 번의 글은 존재하지 않습니다.",boNo));
	}
}
