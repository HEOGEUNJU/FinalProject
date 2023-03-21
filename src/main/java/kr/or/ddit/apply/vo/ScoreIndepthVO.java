package kr.or.ddit.apply.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ScoreIndepthVO {
	private Integer indepthTotal;
	private Integer total;
	private Integer avg;
	private String indepthScoreDate;
	private String incruiterId;
	private String applySn;
	private Integer itm086;
	private Integer itm087;
	private Integer itm088;
	private Integer itm089;
	private Integer itm090;
	private Integer itm091;
	private Integer itm092;
	private Integer itm093;
	private Integer itm094;
	private Integer itm095;
	private Integer itm096;
	private Integer itm097;
	private Integer itm098;
	private Integer itm099;
	private Integer itm100;
	private Integer itm101;
	private Integer itm102;
	private Integer itm103;
	private Integer itm104;
	private Integer itm105;
	private Integer itm106;
	private Integer itm107;
	
	public void setIndepthTotal(Integer indepthTotal) {
		if (indepthTotal == 0) {
			List<Integer> itmList = new ArrayList<>();
			itmList.add(itm086);
			itmList.add(itm087);
			itmList.add(itm088);
			itmList.add(itm089);
			itmList.add(itm090);
			itmList.add(itm091);
			itmList.add(itm092);
			itmList.add(itm093);
			itmList.add(itm094);
			itmList.add(itm095);
			itmList.add(itm096);
			itmList.add(itm097);
			itmList.add(itm098);
			itmList.add(itm099);
			itmList.add(itm100);
			itmList.add(itm101);
			itmList.add(itm102);
			itmList.add(itm103);
			itmList.add(itm104);
			itmList.add(itm105);
			itmList.add(itm106);
			itmList.add(itm107);
			
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
				indepthTotal += modifiedList.get(i);
			}
			
			this.total = indepthTotal;
			if (modifiedList.size() > 0) {
				this.avg = indepthTotal/modifiedList.size();
			} else {
				this.avg = 0;
			}
		} else {
			this.indepthTotal = indepthTotal;
			this.total = indepthTotal;
			this.avg = 0;
		}
	}
}
