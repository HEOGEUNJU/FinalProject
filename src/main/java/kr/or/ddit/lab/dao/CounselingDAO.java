package kr.or.ddit.lab.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.lab.vo.CounselingVO;
import kr.or.ddit.vo.PagingVO;

/**
 * @author 작성자명
 * @since 2023. 2. 19.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                 수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 19.  양서연               최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface CounselingDAO {
	/**
	 * 전체 상담글 조회
	 * @param pagingVO
	 * @return
	 */
	public List<CounselingVO> selectCounList(PagingVO<CounselingVO> pagingVO);
	
	/**
	 * 검색 조건에 맞는 레코드 수 반환
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecord(PagingVO<CounselingVO> pagingVO);
	
	/**
	 * @param counNo
	 * @return 존재하지 않으면, null 반환
	 */
	public CounselingVO selectCoun(@Param("counNo") String counNo);
	
	/**
	 * 상담 신규 등록
	 * @param coun
	 * @return
	 */
	public int insertCoun(CounselingVO coun);
	
	/**
	 * 상담 수정
	 * @param coun
	 * @return
	 */
	public int updateCoun(CounselingVO coun);
	
	/**
	 * 글 상태코드 B2(삭제)로 update
	 * @param counNo
	 * @return
	 */
	public int deleteCoun(@Param("counNo") String counNo);
	
	/**
	 * 조회수 증가
	 * @param counNo
	 */
	public void incrementHit(@Param("counNo") String counNo);

}
