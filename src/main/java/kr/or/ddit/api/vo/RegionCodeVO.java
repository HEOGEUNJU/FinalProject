package kr.or.ddit.api.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode
@ToString
public class RegionCodeVO {
	private String regionCode;
	private String regionName;
	private String regionRef;
}
