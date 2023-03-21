package kr.or.ddit.company.vo;

import kr.or.ddit.vo.CommonsAttachVO;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CompanyVO extends CommonsAttachVO {
	
	private String cmpId;
	private String cmpNo;
	private String cmpName;
	private String cmpRepName;
	private String cmpBsnsNo;
	private String cmpAddr1;
	private String cmpAddr2;
	private String cmpZip;
	private String cmpPhone;
	private String cmpEmail;
	private String cmpUrl;
	private String cmpEstblDate;
	private String cmpSmenp;
	private String cmpEmpNo;
	private String cmpAvrWork;
	private String cmpAvrSalary;
	private String cmpMbName;
	private String cmpCheck;
	private String cmpContent;
	private int cmpLogo;
	private int attId;
	private String attSavename;
	
	private int ccheck; //관심기업여부
	
	public String getCmpEstblDate() {
		return cmpEstblDate;
	}

	public void setCmpEstblDate(String cmpEstblDate) {
		this.cmpEstblDate = cmpEstblDate.substring(0, 10);
	}

	@Override
	public String getTblId() {
		return cmpId;
	}
}
