package kr.or.ddit.api.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode
@ToString
public class CommonCodeVO {
	private String code;
	private String codeName;
	private String refCode;
	private String codeDesc;
}
