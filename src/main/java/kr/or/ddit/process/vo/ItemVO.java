package kr.or.ddit.process.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString()
public class ItemVO {

	private String daNo;
	private String processCodeId;
	private String itemCodeId;
	private String itemCodeName;
	private String itemAsk;
	
	// 수정을 위해 원래 코드 저장용
//	private String originCodeId;
}
