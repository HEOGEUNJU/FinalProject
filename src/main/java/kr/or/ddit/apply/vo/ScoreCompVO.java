package kr.or.ddit.apply.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ScoreCompVO {
	private String applySn;
	private Integer itm037;
	private Integer itm038;
	private Integer itm039;
	private Integer itm040;
	private Integer itm041;
	private Integer itm042;
	private Integer itm043;
	private Integer itm044;
	private Integer itm045;
	private Integer itm046;
	private Integer itm047;
	private Integer itm048;
	private Integer itm049;
	private Integer itm050;
	private Integer competeTotal;
	private Integer total;
	private Integer avg;
	private String competeScoreDate;
	private String incruiterId;
	
	public void setCompeteTotal(Integer competeTotal) {
		if (competeTotal == 0) {
			List<Integer> itmList = new ArrayList<>();
			itmList.add(itm037);
			itmList.add(itm038);
			itmList.add(itm039);
			itmList.add(itm040);
			itmList.add(itm041);
			itmList.add(itm042);
			itmList.add(itm043);
			itmList.add(itm044);
			itmList.add(itm045);
			itmList.add(itm046);
			itmList.add(itm047);
			itmList.add(itm048);
			itmList.add(itm049);
			itmList.add(itm050);
			
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
				competeTotal += modifiedList.get(i);
			}
			
			this.total = competeTotal;
			if (modifiedList.size() > 0) {
				this.avg = competeTotal/modifiedList.size();
			} else {
				this.avg = 0;
			}
		} else {
			this.competeTotal = competeTotal;
			this.total = competeTotal;
			this.avg = 0;
		}
	}
}
