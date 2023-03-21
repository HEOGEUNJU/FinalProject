package kr.or.ddit.api.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode
@ToString
public class JobCodeVO {
	private String jobCode;
	private String jobName;
	private String jobRef;
}
