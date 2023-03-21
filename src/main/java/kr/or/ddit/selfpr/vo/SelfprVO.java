package kr.or.ddit.selfpr.vo;

import java.sql.Date;

import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class SelfprVO {
	
	@NotNull
	private int prNo;
	private String prName;
	private String prContent;
	private Date prDate;
	private String memId;
	private String prWantjob;
	private String memName;
	private String prWantmn;	// 연봉
	
	// 검색
	private String industryCode;// 직무검색 대분류
	private String industry1;   // 직무검색 중분류
	private String metro;		// 지역검색 대분류
	private String regionCode;	// 지역검색 소분류
	private String prAnnual;	// 경력
	private String prWanttype;  // 직급  
	private String prEdu;		// 학력
	
	// detail view에 쏴줄 code
	private String regionName;	 // 원하는 근무지역
	private String industryName; // 원하는 산업 
	
	// detail 개인정보
	private String memGender;
	private String memEmail;
	private String memTel;
	private String memAddr1;
	
	// detail 학력 
	private String eduName;
	private String eduDepart;
	private String eduMajor;
	private String eduStatus;
	private String eduScore;
	private Date eduEntered;
	private Date eduGraduated;
	
	// detail 경력
	private String careerCategory;
	private String careerCompany;
	private String careerTask;
	private String careerClass;
	private Date careerJoin;
	private Date careerResign;
	private Integer careerAnnual;
	
	// detail 자격증
	private String certNo;
	private String certName;
	private Date certDate;
	private String certInstitution;
	
	// detail 주요활동
	private String actName;
	private String actCategory;
	private String actInstitution;
	private String actPeriod;
	
	// detail 수상경력
	private String awardCompetition;
	private String awardName;
	private String awardCategory;
	private Date awardDate;
	private String awardInstitution;
	
	// detail 교육이수
	private String courseName;
	private String courseCategory;
	private String courseInstitution;
	private String coursePeriod;
	
	// 관심인재 좋아요 관련
	private String memId2;	// 기업 회원 id 저장
	private int likeresult;	// 좋아요 유무 결과 저장
	
	private String attSavename;
}
