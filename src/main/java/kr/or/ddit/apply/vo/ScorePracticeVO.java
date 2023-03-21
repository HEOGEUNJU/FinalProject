package kr.or.ddit.apply.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ScorePracticeVO {
	private String applySn;
	private Integer itm060;
	private Integer itm061;
	private Integer itm062;
	private Integer itm063;
	private Integer itm064;
	private Integer itm065;
	private Integer itm066;
	private Integer itm067;
	private Integer itm068;
	private Integer practiceTotal;
	private Integer total;
	private Integer avg;
	private String practiceScoreDate;
	private String incruiterId;
	
	public void setPracticeTotal(Integer practiceTotal) {
		if (practiceTotal == 0){
			List<Integer> itmList = new ArrayList<>();
			itmList.add(itm060);
			itmList.add(itm061);
			itmList.add(itm062);
			itmList.add(itm063);
			itmList.add(itm064);
			itmList.add(itm065);
			itmList.add(itm066);
			itmList.add(itm067);
			itmList.add(itm068);
			
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
				practiceTotal += modifiedList.get(i);
			}
			
			this.total = practiceTotal;
			if (modifiedList.size() > 0) {
				this.avg = practiceTotal/modifiedList.size();
			} else {
				this.avg = 0;
			}
		} else {
			this.practiceTotal = practiceTotal;
			this.total = practiceTotal;
			this.avg = 0;
		}
	}
}
