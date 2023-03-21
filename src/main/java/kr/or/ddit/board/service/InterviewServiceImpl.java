package kr.or.ddit.board.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.or.ddit.board.dao.InterviewDAO;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.InterviewVO;
import kr.or.ddit.expert.dao.AttachDAO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class InterviewServiceImpl implements InterviewService {

	@Inject
	private InterviewDAO dao;

	@Inject
	private AttachDAO attachDAO;

	@Value("#{appInfo.interviewFolder}")
	private File saveFiles;

	private int processAttatchList(InterviewVO interview) {

		List<AttachVO> attatchList = interview.getAttatchList();
		if (attatchList == null || attatchList.isEmpty())
			return 0;
		// 1. metadata 저장 - DB (ATTATCH)
		log.info("interview : {}", interview);
		log.info("attactchList : {}", attatchList);
		// 2. binary 저장 - Middle Tier : (D:\saveFiles)
		try {
			for (AttachVO attatch : attatchList) {
				attatch.saveTo(saveFiles); // real file 저장
			}
			int rowcnt = attachDAO.insertAttatches(interview); // db에 meta data만 저장
			return rowcnt;
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	// 상세조회
	@Override
	public InterviewVO retrieveInterview(String incumNo) {
		InterviewVO interview = dao.selectInterview(incumNo);
		interview.setAttatchList(attachDAO.selectAttatchList(interview.getIncumNo()));
		return interview;
	}

	// 전체조회
	@Override
	public void retrieveInterviewList(PagingVO<InterviewVO> pagingVO) {
		pagingVO.setTotalRecord(dao.selectTotalRecord(pagingVO));
		pagingVO.setDataList(dao.selectInterviewList(pagingVO));
	}

	// 등록
	@Override
	public int createInterview(InterviewVO interview) {
		int rowcnt = dao.insertInterview(interview);
		rowcnt += processAttatchList(interview);
		return rowcnt;
	}

	// 수정
	@Override
	public int modifyInterview(InterviewVO interview) {
		int rowcnt = dao.updateInterview(interview);
		if (interview.getAttatchList() != null) {
			rowcnt += attachDAO.deleteAttatch(interview.getIncumNo());
			rowcnt += processAttatchList(interview);
		}
		return rowcnt;
	}

	// 삭제
	@Override
	public int removeInterview(InterviewVO interview) {
		int rowcnt = dao.deleteInterview(interview);
		return rowcnt;
	}

	// 조회수
	@Override
	public int updateHis(String incumNo) {
		int rowcnt = dao.updateHits(incumNo);
		return rowcnt;
	}



}
