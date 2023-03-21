package kr.or.ddit.apply.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ScoreDiscussVO {
	private String applySn;
	private Integer itm051;
	private Integer itm052;
	private Integer itm053;
	private Integer itm054;
	private Integer itm055;
	private Integer itm056;
	private Integer itm057;
	private Integer itm058;
	private Integer itm059;
	private Integer discussTotal;
	private Integer total;
	private Integer avg;
	private String discussScoreDate;
	private String incruiterId;
	
	public void setDiscussTotal(Integer discussTotal) {
		if (discussTotal == 0) {
			List<Integer> itmList = new ArrayList<>();
			itmList.add(itm051);
			itmList.add(itm052);
			itmList.add(itm053);
			itmList.add(itm054);
			itmList.add(itm055);
			itmList.add(itm056);
			itmList.add(itm057);
			itmList.add(itm058);
			itmList.add(itm059);
			
			List<Integer> modifiedList = new ArrayList<>();
			for (int itm : itmList) {
//			if (itm == 0) {
//				itmList.remove(itm);
//			}
				if (itm > 0) {
					modifiedList.add(itm);
				}
			}
			
			for (int i = 0; i < modifiedList.size(); i++) {
				discussTotal += modifiedList.get(i);
			}
			
			this.total = discussTotal;
			if (modifiedList.size() > 0) {
				this.avg = discussTotal/modifiedList.size();
			} else {
				this.avg = 0;
			}
		} else {
			this.discussTotal = discussTotal;
			this.total = discussTotal;
			this.avg = 0;
		}
	}
}
