package kr.or.ddit.apply.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ScoreTestVO {
	private String applySn;
	private Integer itm029;
	private Integer itm030;
	private Integer itm031;
	private Integer itm032;
	private Integer itm033;
	private Integer itm034;
	private Integer itm035;
	private Integer itm036;
	private Integer testTotal;
	private Integer total;
	private Integer avg;
	private String testScoreDate;
	private String incruiterId;
	
	public void setTestTotal(Integer testTotal) {
		if (testTotal == 0) {
			List<Integer> itmList = new ArrayList<>();
			itmList.add(itm029);
			itmList.add(itm030);
			itmList.add(itm031);
			itmList.add(itm032);
			itmList.add(itm033);
			itmList.add(itm034);
			itmList.add(itm035);
			itmList.add(itm036);
			
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
				testTotal += modifiedList.get(i);
			}
			
			this.total = testTotal;
			if (modifiedList.size() > 0) {
				this.avg = testTotal/modifiedList.size();
			} else {
				this.avg = 0;
			}
		} else {
			this.testTotal = testTotal;
			this.total = testTotal;
			this.avg = 0;
		}
	}
}
