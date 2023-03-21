package kr.or.ddit.lab.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.NotExistBoardException;
import kr.or.ddit.lab.dao.CounAttachDAO;
import kr.or.ddit.lab.dao.CounselingDAO;
import kr.or.ddit.lab.vo.CounAttachVO;
import kr.or.ddit.lab.vo.CounselingVO;
import kr.or.ddit.vo.PagingVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 작성자명
 * @since 2023. 2. 19.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                 수정자               수정내용
 * --------     --------    ----------------------
 * 2023.02.19.   양서연               최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class CounselingServiceImpl implements CounselingService {
	private final CounselingDAO counDAO;
	private final CounAttachDAO attachDAO;
	
	@Value("#{appInfo.counselingFolder}")
	private File saveFiles;
	
	private int processAttathList(CounselingVO coun) {
		log.info("1번======> {}", coun);
		CounAttachVO attach = coun.getCounAttach();
		if(attach==null) return 0;
		attach.setTblId(coun.getCounNo());
		attach.setAttStreCours(saveFiles.toString());
		log.info("2번======> {}", attach);
		int rowcnt = attachDAO.insertAttatches(attach);
		try {
			attach.saveTo(saveFiles);
			return rowcnt;
		}catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	@Override
	public void retrieveCounList(PagingVO<CounselingVO> pagingVO) {
		pagingVO.setTotalRecord(counDAO.selectTotalRecord(pagingVO));
		pagingVO.setDataList(counDAO.selectCounList(pagingVO));
	}

	@Override
	public CounselingVO retrieveCoun(String counNo) {
		CounselingVO coun = counDAO.selectCoun(counNo);
		if(coun==null)
			throw new NotExistBoardException(counNo);
		return coun;
	}

	@Override
	public ServiceResult createCoun(CounselingVO coun) {
		int rowcnt  = counDAO.insertCoun(coun);
		log.info("coun첨부파일 : {} ",coun);
		String attFilename = coun.getCounAttach().getAttFilename();
		if(attFilename!=null && ! attFilename.isEmpty()) {
			rowcnt += processAttathList(coun);
		}
		
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modifyCoun(CounselingVO coun) {
		int rowcnt = counDAO.updateCoun(coun);
		String attFilename = coun.getCounAttach().getAttFilename();
		if(attFilename!=null && !attFilename.isEmpty()) {
			rowcnt += processAttathList(coun);
		}
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}
	
	@Override
	public int deleteCoun(String counNo) {
		return counDAO.deleteCoun(counNo);
	}
}
