package kr.or.ddit.exception;

public class SpelEvaluationException extends Exception {
	public SpelEvaluationException() {
		super(String.format("로그인 후 이용하시기 바랍니다."));
	}
}
