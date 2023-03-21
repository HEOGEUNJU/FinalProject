package kr.or.ddit.apply.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ScoreIntroVO {
	private String introScoreDate;
	private String incruiterId;
	private String applySn;
	private Integer itm013;
	private Integer itm014;
	private Integer itm015;
	private Integer itm016;
	private Integer itm017;
	private Integer itm018;
	private Integer itm019;
	private Integer itm020;
	private Integer itm021;
	private Integer itm022;
	private Integer itm023;
	private Integer itm024;
	private Integer itm025;
	private Integer itm026;
	private Integer itm027;
	private Integer itm028;
	private Integer introTotal;
	private Integer total;
	private Integer avg;
	
	public void setIntroTotal(Integer introTotal) {
		if (introTotal == 0) {
			List<Integer> itmList = new ArrayList<>();
			itmList.add(itm013);
			itmList.add(itm014);
			itmList.add(itm015);
			itmList.add(itm016);
			itmList.add(itm017);
			itmList.add(itm018);
			itmList.add(itm019);
			itmList.add(itm020);
			itmList.add(itm021);
			itmList.add(itm022);
			itmList.add(itm023);
			itmList.add(itm024);
			itmList.add(itm025);
			itmList.add(itm026);
			itmList.add(itm027);
			itmList.add(itm028);
			
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
				introTotal += modifiedList.get(i);
			}
			
			this.total = introTotal;
			if (modifiedList.size() > 0) {
				this.avg = introTotal/modifiedList.size();
			} else {
				this.avg = 0;
			}
		} else {
			this.introTotal = introTotal;
			this.total = introTotal;
			this.avg = 0;
		}
	}
}
