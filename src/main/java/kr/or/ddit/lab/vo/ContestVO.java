package kr.or.ddit.lab.vo;

import java.util.Date;
import javax.validation.constraints.NotNull;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

@Data
public class ContestVO {

	@NotNull
	private String contNo;
	private String contName;	//공모전명
	private String contCo;		//주관 기관
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date contStart;		//시작일
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date contDead;		//종료일
	
	private String contField;	//공모분야
	private String contContent;	//공모내용
	private String memId;		//회원아이디
	private int contHit;		//조회수
	private String contSummery;	//모집개요
	private String contTarget;	//모집대상
	private int contAward;		//상금
	private String contRoad;	//접수방법
	private String contFile;	//제출서류
	private String contAsk;		//문의사항
	private String contURL;		//지원하기 URL
}
