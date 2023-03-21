package kr.or.ddit.selfpr.vo;

import java.util.Date;

import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class TodaySeeVO {
	
	private int todayNo;
	@NotNull
	private String prNo;
	@NotNull
	private String memId;
	
	// 등록일
	private Date todayDate;
	// 만료일(1일뒤 삭제)
	private Date todayEdate;
	
	// 화면에 보여줄 내용
	private String prName;
	private String prAnnual;
	private String prWantmn;
	private String prWantjob;
	private String prWantType;
	private String prEdu;
	private String regionCode;
	private String industryCode;
	
	private String memName;
	
	private String industryName;
	private String regionName;	
	
	private String attSavename;
	
}
