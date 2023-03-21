package kr.or.ddit.vo;

import kr.or.ddit.company.vo.CompanyVO;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class IncruiterVO extends MemberVO{
	
	private String cmpId;
	private String incruiterEmail;
	private String memTel;
	private String memApproval;
	private String memDate;
	private String memDelete;
	private String memEmail;
	private CompanyVO companyVO;
	private String cmpBsnsNo; //사업자 등록번호 (기업회원 아이디 찾을때 필요 - 형준)

	private String attSavename;
	
	public String getMemDate() {
		return memDate;
	}

	public void setMemDate(String memDate) {
		this.memDate = memDate.substring(0,10);
	}
	
}
