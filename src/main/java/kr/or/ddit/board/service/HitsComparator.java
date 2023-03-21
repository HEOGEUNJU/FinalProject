package kr.or.ddit.board.service;

import java.util.Comparator;

import kr.or.ddit.board.vo.BoardVO;

public class HitsComparator implements Comparator {

	@Override
	public int compare(Object o1, Object o2) {
		int boardHit1 = ((BoardVO) o1).getBoardHits();
		int boardHit2 = ((BoardVO) o1).getBoardHits();

		if (boardHit1 > boardHit2) {
			return 1;
		} else if (boardHit1 < boardHit2) {
			return -1;
		} else {
			return 0;
		}

	}

}
