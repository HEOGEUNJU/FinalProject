package kr.or.ddit.resume.vo;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.vo.CommonsAttachVO;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CertificationVO extends CommonsAttachVO {

	private String certSn;
	private String memId;
	@NotBlank
	private String certNo;
	@NotBlank
	private String certName;
	@NotBlank
	private String certDate;
	@NotBlank
	private String certInstitution;
	private String certInsertDate;
	private String certDeleteDate;
	
	public void setCertInsertDate(String certInsertDate) {
		this.certInsertDate = certInsertDate.substring(0, 10);
	}
	
	public void setCertDate(String certDate) {
		this.certDate = certDate.substring(0, 10);
	}

	@Override
	public String getTblId() {
		
		return this.certSn;
	}
	
}
