package kr.or.ddit.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AlarmVO {

	private String alarmId;
	private String memId;
	private String alarmContent;
	private String alarmDate;
	private String alarmStatus;
	private String alarmCategory;
	private String alarmDetail;	
}
