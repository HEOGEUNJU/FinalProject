package kr.or.ddit.exception;

public class NotExistAnnoException extends RuntimeException {
	public NotExistAnnoException(String annoNo) {
		super(String.format("%s 번의 공고는 존재하지 않습니다.", annoNo));
	}
}
