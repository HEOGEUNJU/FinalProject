package kr.or.ddit.selfpr.vo;

import java.sql.Date;

import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class LikeVO {
	
	@NotNull
	private int inteNo;
	@NotNull
	private Date inteDate;
	@NotNull
	private int prNo;
	@NotNull
	private String memId;	// 기업 회원 id
	
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
