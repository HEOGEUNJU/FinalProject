package kr.or.ddit.board.service;

import java.util.Comparator;

import kr.or.ddit.board.vo.BoardVO;

public class DateComparator implements Comparator {

	@Override
	public int compare(Object o1, Object o2) {
		String boardDate1 = ((BoardVO)o1).getBoardDate();
		String boardDate2 = ((BoardVO)o2).getBoardDate();
		return boardDate1.compareTo(boardDate2);
	}

}
