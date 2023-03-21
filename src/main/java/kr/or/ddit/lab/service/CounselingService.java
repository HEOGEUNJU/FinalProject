package kr.or.ddit.lab.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.lab.dao.CounselingDAO;
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
@Service
public interface CounselingService {
	public void retrieveCounList(PagingVO<CounselingVO> pagingVO);
	public CounselingVO retrieveCoun(String counNo);
	public ServiceResult createCoun(CounselingVO coun);
	public ServiceResult modifyCoun(CounselingVO coun);
	public int deleteCoun(String counNo);
}
