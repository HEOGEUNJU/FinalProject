package kr.or.ddit.board.service;

import java.util.Comparator;

import kr.or.ddit.board.vo.BoardVO;

public class LikeComparator implements Comparator {

	@Override
	public int compare(Object o1, Object o2) {
		int like1 = ((BoardVO) o1).getLikeCnt();
		int like2 = ((BoardVO) o2).getLikeCnt();

		if (like1 > like2) {
			return 1;
		} else if (like1 < like2) {
			return -1;
		} else {
			return 0;
		}
	}

}
