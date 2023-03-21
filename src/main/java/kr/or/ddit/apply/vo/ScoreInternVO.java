package kr.or.ddit.apply.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ScoreInternVO {
	private String applySn;
	private Integer itm069;
	private Integer itm070;
	private Integer itm071;
	private Integer itm072;
	private Integer itm073;
	private Integer itm074;
	private Integer itm075;
	private Integer itm076;
	private Integer itm077;
	private Integer itm078;
	private Integer itm079;
	private Integer itm080;
	private Integer itm081;
	private Integer itm082;
	private Integer itm083;
	private Integer itm084;
	private Integer itm085;
	private Integer internTotal;
	private Integer total;
	private Integer avg;
	private String internScoreDate;
	private String incruiterId;
	
	public void setInternTotal(Integer internTotal) {
		if (internTotal == 0) {
			List<Integer> itmList = new ArrayList<>();
			itmList.add(itm069);
			itmList.add(itm070);
			itmList.add(itm071);
			itmList.add(itm072);
			itmList.add(itm073);
			itmList.add(itm074);
			itmList.add(itm075);
			itmList.add(itm076);
			itmList.add(itm077);
			itmList.add(itm078);
			itmList.add(itm079);
			itmList.add(itm080);
			itmList.add(itm081);
			itmList.add(itm082);
			itmList.add(itm083);
			itmList.add(itm084);
			itmList.add(itm085);
			
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
				internTotal += modifiedList.get(i);
			}
			
			this.total = internTotal;
			if (modifiedList.size() > 0) {
				this.avg = internTotal/modifiedList.size();
			} else {
				this.avg = 0;
			}
		} else {
			this.internTotal = internTotal;
			this.total = internTotal;
			this.avg = 0;
		}
	}
}
