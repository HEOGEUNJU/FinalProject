package kr.or.ddit.resume.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.expert.dao.AttachDAO;
import kr.or.ddit.resume.dao.ActivityDAO;
import kr.or.ddit.resume.vo.ActivityVO;
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
 * 2023. 2. 6.       최경수       최초작성
 * 2023. 2. 7.       최경수       삭제 추가
 * 2023. 2. 8.       최경수	첨부파일 추가
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Service
public class ActivityServiceImpl implements ActivityService {

	@Inject
	private ActivityDAO dao;
	
	@Inject
	private AttachDAO attachDAO;
	
	@Value("#{appInfo.saveFiles}")
	private File saveFiles; // svn repository안 아무 폴더로 바꿔주면 될 듯
	
	private int processAttachList(ActivityVO activity) {
		List<AttachVO> attachList = activity.getAttatchList();
		if (attachList == null || attachList.isEmpty()) {
			return 0;
		}
		int rowcnt = attachDAO.insertAttatches(activity);
		try {
			for (AttachVO attach : attachList) {
				attach.saveTo(saveFiles);
			}
			return rowcnt;
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	@Override
	public ActivityVO retrieveActivity(String actSn) {
		ActivityVO activity = dao.selectActivity(actSn);
		return activity;
	}

	@Override
	public List<ActivityVO> retrieveActivityList(String memId) {
		List<ActivityVO> activityList = dao.selectActivityList(memId);
		return activityList;
	}

	@Override
	public ServiceResult createActivity(ActivityVO activity) {
		int rowcnt = dao.insertActivity(activity);
		rowcnt += processAttachList(activity);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modifyActivity(ActivityVO activity) {
		int rowcnt = dao.updateActivity(activity);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeActivity(String actSn) {
		int rowcnt = dao.deleteActivity(actSn);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}
}
