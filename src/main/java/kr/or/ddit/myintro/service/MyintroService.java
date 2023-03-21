package kr.or.ddit.myintro.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.myintro.vo.MyintroVO;

/**
 * @author 최경수
 * @since 2023. 2. 14.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 	    수정일               수정자                                     수정내용
 * --------     --------    ----------------------
 * 2023. 2. 14.       최경수        최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
public interface MyintroService {
	
	public MyintroVO retrieveMyintro(String myintroSn);
	public List<MyintroVO> retrieveMyintroList(String memId);
	public ServiceResult createMyintro(MyintroVO myintro);
	public ServiceResult modifyMyintro(MyintroVO myintro);
	public ServiceResult removeMyintro(String myintroSn);
}
