package kr.or.ddit.resume.vo;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.vo.CommonsAttachVO;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class FacilityVO extends CommonsAttachVO {

	private String facilitySn;
	private String memId;
	@NotBlank
	private String facilityName;
	@NotBlank
	private String facilityCategory;
	@NotBlank
	private String facilityLevel;
	@NotBlank
	private String facilityGetdate;
	@NotBlank
	private String facilityPeriod;
	private String facilityInsertDate;
	private String facilityDeleteDate;
	
	public void setFacilityGetdate(String facilityGetdate) {
		this.facilityGetdate = facilityGetdate.substring(0, 10);
	}
	
	public void setFacilityInsertDatae(String facilityInsertDate) {
		this.facilityInsertDate = facilityInsertDate.substring(0, 10);
	}

	@Override
	public String getTblId() {
		
		return this.facilitySn;
	}
	
	
}