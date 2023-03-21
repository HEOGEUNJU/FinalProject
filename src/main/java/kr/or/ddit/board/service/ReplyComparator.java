package kr.or.ddit.board.service;

import java.util.Comparator;

import kr.or.ddit.board.vo.BoardVO;

public class ReplyComparator implements Comparator {

	@Override
	public int compare(Object o1, Object o2) {
		int reply1 = ((BoardVO) o1).getReplyCnt();
		int reply2 = ((BoardVO) o2).getReplyCnt();

		if (reply1 > reply2) {
			return 1;
		} else if (reply1 < reply2) {
			return -1;
		} else {
			return 0;
		}
	}

}
 