package kr.or.ddit.expert.vo;

import java.util.List;

import lombok.Data;

@Data
public class ExreviewVO extends ExcartVO{
	private String exreviewId;
	private String exreviewName;
	private String exreviewWriter;
	private String exreviewPass;
	private String exreviewContent;
	private Integer exreviewHit;
	private String excartId;
	private String exreviewDate;
	private String exreviewScore;
	private String exprodName;
	private String exprodId;
	private String excartPrice;
	private String exfieldName;
	private String exjobName;
	private String expertName;
	private String expertId;
	private String attSavename;

}

