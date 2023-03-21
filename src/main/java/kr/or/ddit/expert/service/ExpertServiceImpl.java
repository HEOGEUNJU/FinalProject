package kr.or.ddit.expert.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.or.ddit.expert.dao.AttachDAO;
import kr.or.ddit.expert.dao.ExpertDAO;
import kr.or.ddit.expert.dao.ExprodDAO;
import kr.or.ddit.expert.vo.ExeventVO;
import kr.or.ddit.expert.vo.ExpertVO;
import kr.or.ddit.vo.AttachVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class ExpertServiceImpl implements ExpertService {

	@Inject
	private AttachDAO attachDAO;
	@Inject
	private ExpertDAO expertDAO;
	@Inject
	private ExprodDAO exprodDAO;
	
	@Value("#{appInfo.saveFiles}")
	private File saveFiles;

	@PostConstruct
	public void init() throws IOException {
		log.info("EL로 주입된 첨부파일 저장 경로 : {}", saveFiles.getCanonicalPath());
	}

	private int processAttatchList(ExpertVO expert) {
		
		List<AttachVO> attatchList = expert.getAttatchList();
		if (attatchList == null || attatchList.isEmpty())
			return 0;
		// 1. metadata 저장 - DB (ATTATCH)
		log.info("exevent : {}", expert);
		log.info("attactchList : {}" , attatchList);
		// 2. binary 저장 - Middle Tier : (D:\saveFiles)
		try {
			for (AttachVO attatch : attatchList) {
				attatch.saveTo(saveFiles);
			}
			int rowcnt = attachDAO.insertAttatches(expert);
			return rowcnt;
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}	
	@Override
	public int aplicationExpert(ExpertVO expert) {
		int rowcnt = expertDAO.applicationExpert(expert);
		rowcnt += processAttatchList(expert);
		
		return rowcnt;
	}

	@Override
	public ExpertVO retrieveMember(String memId) {
		ExpertVO expert = expertDAO.selectExpert(memId);
		expert.setExprodList(exprodDAO.selectExpertExprodList(memId));
		return expert;
	}

	//전문가 신청 삭제
	@Override
	public int removeAppliExp(ExpertVO expert) {
		int rowcnt = expertDAO.deleteAppliExp(expert);
		return rowcnt;
	}

}
