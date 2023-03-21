package kr.or.ddit.vo;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import kr.or.ddit.validate.InsertGroup;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SeekerVO extends MemberVO{
	
	private String memNickname;
	@Pattern(regexp="\\d{4}-\\d{2}-\\d{2}", groups=InsertGroup.class)
	@NotBlank(groups=InsertGroup.class)
	private String memBirth;
	private String memGender;
	@NotBlank
	private String memZip;
	@NotBlank
	private String memAddr1;
	@NotBlank
	private String memAddr2;
	@Email
	private String memEmail;
	@NotBlank
	private String memTel;
	private String memCertification;
	private int memCarttotal;
	private int memScore;
	private String memDate;
	
	private String memProfile; // 임시(경수) 

	public String getMemBirth() {
		return memBirth;
	}

	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth.substring(0,10);
	}

	
	
}
