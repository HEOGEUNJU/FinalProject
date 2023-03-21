package kr.or.ddit.resume.vo;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.vo.CommonsAttachVO;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AwardVO extends CommonsAttachVO {

	private String awardSn;
	private String memId;
	@NotBlank
	private String awardCompetition;
	@NotBlank
	private String awardName;
	@NotBlank
	private String awardCategory;
	@NotBlank
	private String awardDate;
	@NotBlank
	private String awardInstitution;
	private String awardInsertDate;
	private String awardDeleteDate;
	
	public void setAwardInsertDate(String awardInsertDate) {
		this.awardInsertDate = awardInsertDate.substring(0, 10);
	}
	
	public void setAwardDate(String awardDate) {
		this.awardDate = awardDate.substring(0, 10);
	}

	@Override
	public String getTblId() {
		
		return this.awardSn;
	}
	
	
}
