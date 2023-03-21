package kr.or.ddit.exception;

public class NotExistNoticeException extends RuntimeException {

	public NotExistNoticeException(String noticeSn) {
		super(String.format("%s 번의 글은 존재하지 않습니다.",noticeSn));
	}
}
