package kr.or.ddit.resume.vo;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

import kr.or.ddit.vo.CommonsAttachVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="actSn")
public class ActivityVO extends CommonsAttachVO {
	
	private String actSn;
	private String memId;
	@NotBlank
	private String actName;
	@NotBlank
	private String actCategory;
	private String actInstitution;
	@NotBlank
	@Min(0)
	private String actPeriod;
	private String actInsertDate;
	private String actDeleteDate;
	
	public void SetActInsertDate(String actInsertDate) {
		this.actInsertDate = actInsertDate.substring(0, 10);
	}
	
	@Override
	public String getTblId() {
		
		return this.actSn;
	}
}