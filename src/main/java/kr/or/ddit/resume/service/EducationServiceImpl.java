package kr.or.ddit.resume.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.expert.dao.AttachDAO;
import kr.or.ddit.resume.dao.EducationDAO;
import kr.or.ddit.resume.dao.ResumeDAO;
import kr.or.ddit.resume.vo.EducationVO;
import kr.or.ddit.vo.AttachVO;

/**
 * @author 최경수
 * @since 2023. 2. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 	    수정일               수정자                                     수정내용
 * --------     --------    ----------------------
 * 2023. 2. 6.       최경수        최초작성
 * 2023. 2. 7.       최경수        삭제 추가
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Service
public class EducationServiceImpl implements EducationService {

	@Inject
	private EducationDAO dao;
	
	@Inject
	private ResumeDAO resumeDAO;
	
	@Inject
	private AttachDAO attachDAO;
	
	@Value("#{appInfo.resumeFolder}")
	private File saveFiles;

	private int processAttachList(EducationVO edu) {

		List<AttachVO> attatchList = edu.getAttatchList();
		if (attatchList == null || attatchList.isEmpty())
			return 0;
		try {
			for (AttachVO attatch : attatchList) {
				attatch.saveTo(saveFiles);
			}
			int rowcnt = attachDAO.insertAttatches(edu);
			return rowcnt;
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	@Override
	public EducationVO retrieveEducation(String eduSn) {
		EducationVO edu = dao.selectEducation(eduSn);
		edu.setAttatchList(attachDAO.selectAttatchList(edu.getTblId()));
		return edu;
	}

	@Override
	public List<EducationVO> retrieveEducationList(String memId) {
		List<EducationVO> eduList = dao.selectEducationList(memId);
		return eduList;
	}

	@Override
	public ServiceResult createEducation(EducationVO edu) {
		int rowcnt = dao.inserteEducation(edu);
		rowcnt += processAttachList(edu);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modifyEducation(EducationVO edu) {
		int rowcnt = dao.updateEducation(edu);
		if (edu.getAttatchList() != null) {
			rowcnt += attachDAO.deleteAttatch(edu.getTblId());
			rowcnt += processAttachList(edu);
		}
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeEducation(String eduSn) {
		int rowcnt = dao.deleteEducation(eduSn);
		rowcnt += resumeDAO.deleteItem(eduSn);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

}
