package kr.or.ddit.help.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.help.vo.HelpVO;
import kr.or.ddit.vo.PagingVO;

/**
 * 
 * @author 박형준
 * @since 2023. 2. 10.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                   수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 10.  박형준       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface HelpDAO {
	
	/**
	 * 분류 명
	 * @param helpSort
	 * @return
	 */
	public List<HelpVO> selectListName(String helpSort);
	
	/**
	 * 분류 목록
	 * @param help
	 * @return
	 */
	public List<HelpVO> selectList(String helpSort);
	
	/**
	 * 페이징된 목록
	 * @param pagingVO
	 * @return
	 */
	public List<HelpVO> selectHelpList(PagingVO<HelpVO> pagingVO);
	
	/**
	 * 검색
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecord(PagingVO<HelpVO> pagingVO);
	
	/**
	 * 도움말 세부
	 * @param helpSn
	 * @return
	 */
	public HelpVO selectHelp(String helpSn);
	
	/**
	 * 조회수 증가
	 * @param helpVO
	 */
	public void incrementHit(HelpVO helpVO);
	
	/**
	 * 등록
	 * @param helpVO
	 * @return
	 */
	public int insertHelp(HelpVO helpVO);
	
	/**
	 * 수정
	 * @param helpVO
	 * @return
	 */
	public int updateHelp(HelpVO helpVO);
	
	/**
	 * 삭제
	 * @param helpVO
	 * @return
	 */
	public int deleteHelp(HelpVO helpVO);
	
	
}
