package kr.or.ddit.resume.vo;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.vo.CommonsAttachVO;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class EducationVO extends CommonsAttachVO {
	
	private String eduSn;
	private String memId;
	@NotBlank
	private String eduName;
	private String eduDepartment;
	private String eduMajor;
	@NotBlank
	private String eduEntered;
	@NotBlank
	private String eduGraduated;
	@NotBlank
	private String eduStatus;
	private double eduScore;
	private double eduStandard;
	private String eduInsertDate;
	private String eduDeleteDate;
	
	public void setEduEntered(String eduEntered) {
		this.eduEntered = eduEntered.substring(0, 10);
	}
	
	public void setEduGraduated(String eduGraduated) {
		this.eduGraduated = eduGraduated.substring(0, 10);
	}
	
	public void setEduInsertDate(String eduInsertDate) {
		this.eduInsertDate = eduInsertDate.substring(0, 10);
	}
	
	@Override
	public String getTblId() {
		
		return eduSn;
	}
	
	public String getResumeItemSn() {
		return eduSn;
	}
}
