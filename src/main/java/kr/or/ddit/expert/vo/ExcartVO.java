package kr.or.ddit.expert.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ExcartVO extends ExprodVO{
	private String reviewState;
	private String excartId;
	private String exprodId;
	private String memId;
	private String excartPrice;
	private String excartDate;
	private String excartState;
	
	public String getReviewState() {
		if(reviewState.equals("N")) {
			reviewState = "미등록";
		}else if(reviewState.equals("Y")){
			reviewState = "등록완료";
		}
		return reviewState;
	}
	public String getExcartState() {
		if(excartState.equals("N")) {
			excartState = "미사용";
		}else if(excartState.equals("Y")){
			excartState = "사용완료";
		}
		return excartState;
	}
	
	
}



