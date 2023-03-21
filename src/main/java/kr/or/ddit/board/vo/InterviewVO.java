package kr.or.ddit.board.vo;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.company.vo.CompanyVO;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.CommonsAttachVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of="cmpId")
@ToString(exclude= {"question1"})
public class InterviewVO extends CommonsAttachVO implements Serializable{
	private int rnum;			// 순번
	@NotBlank(groups = { UpdateGroup.class, DeleteGroup.class })
	private String incumNo;		// 인터뷰번호
	private String cmpId;		// 회사ID
	private String memId;		// 운영자ID
	@NotBlank
	private String subTitle;	// 담당업무(카드 가장 윗부분)
	@NotBlank
	private String department;	// 부서명
	@NotBlank
	private String incumTitle;	// 제목
	private String jobSub;		// 직업분류
	@NotBlank
	private String incumName;	// 작성자
	private String incumDate;	// 작성일
	private Integer incumHits;	// 조회수
	@NotBlank
	private String topTitle;	// 상위제목(상세보기에서 "" 안에 들어가는 타이틀)
	private String incumDelDate;// 삭제여부(삭제, 미삭제)
	private String cmpName;
	private String imageFile; 		// 파일 담기

	// private String replySort;	//질문선택


	private String question1;   // 질문1
	private String answer1;		// 답변1
	private String question2;	// 질문2
	private String answer2;		// 답변2
	private String question3;	// 질문3
	private String answer3;		// 답변3
	private String question4;	// 질문4
	private String answer4;		// 답변4
	private String question5;	// 질문5
	private String answer5;		// 답변5
	private String question6;	// 질문6
	private String answer6;		// 답변6
	private String question7;	// 질문7
	private String answer7;		// 답변7
	private String question8;	// 질문8
	private String answer8;		// 답변8
	private String question9;	// 질문9
	private String answer9;		// 답변9
	private String question10;	// 질문10
	private String answer10;	// 답변10


	@Override
	public String getTblId() {
		return incumNo;
	}
}
