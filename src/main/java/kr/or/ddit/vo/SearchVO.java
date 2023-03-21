package kr.or.ddit.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SearchVO {
	private String searchType;
	private String searchWord;
	
	private String searchField;
	private String searchValue;
	private String newsField;
	private String startDate;
	private String endDate;
	private String searchId;
}
