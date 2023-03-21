package kr.or.ddit.vo;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

/**
 * 
 * @author 박형준
 * @since 2023. 2. 20.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 20.   박형준             menuTitle, subTitle 추가
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode(of="menuCode")
@AllArgsConstructor(access=AccessLevel.PRIVATE)
@Builder
public class MenuVO {
	private String menuCode;
	private String menuText;
	private String menuURL;
	private String menuColor;
	private String menuTitle;
	private String subTitle;
	private String menuId;
}
