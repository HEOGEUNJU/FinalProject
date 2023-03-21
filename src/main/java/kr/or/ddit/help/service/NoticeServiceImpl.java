package kr.or.ddit.help.service;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.or.ddit.exception.NotExistNoticeException;
import kr.or.ddit.expert.dao.AttachDAO;
import kr.or.ddit.help.dao.NoticeDAO;
import kr.or.ddit.help.vo.NoticeVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 박형준
 * @since 2023. 2. 7.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일              수정자              수정내용
 * --------     --------    ----------------------
 * 2023. 2. 7.    박형준             최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Service
public class NoticeServiceImpl implements NoticeService{
	@Inject
	private NoticeDAO noticeDAO;
	@Inject
	private AttachDAO attachDAO;
	
	@Value("#{appInfo.noticeFolder}")
	private File saveFiles;
	
	@PostConstruct
	public void init() throws IOException{
		log.info("첨부파일 저장 경로 : {}", saveFiles.getCanonicalPath());
	}
	
	private int processAttachList(NoticeVO notice) {
		List<AttachVO> attachList = notice.getAttatchList();
		if(attachList==null || attachList.isEmpty()) 
			return 0;
		log.info("notice : {}", notice);
		log.info("attactchList : {}", attachList);
		//1. meatadata 저장 - DB (ATTATCH)
		//2. binary 저장 - Middle Tier (D:\saveFiles)
		try {
			for(AttachVO attach : attachList) {
				attach.saveTo(saveFiles);
			}
			int rowcnt = attachDAO.insertAttatches(notice);
			return rowcnt;
		}catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	//공지사항 목록
	@Override
	public void retrieveNoticeList(PagingVO<NoticeVO> pagingVO) {
		pagingVO.setTotalRecord(noticeDAO.selectTotalRecord(pagingVO));	
		pagingVO.setDataList(noticeDAO.selectNoticeList(pagingVO));	//목록 페이징
	}

	//공지사항 조회
	@Override
	public NoticeVO retrieveNotice(String noticeSn) {
		NoticeVO notice = noticeDAO.selectNotice(noticeSn);
		if(notice==null)
			throw new NotExistNoticeException(noticeSn);
		noticeDAO.incrementHit(notice);
		return notice;
	}

	//공지사항 생성
	@Override
	public int createNotice(NoticeVO notice) {
		int rowcnt = noticeDAO.insertNotice(notice);
		rowcnt += processAttachList(notice);
		return rowcnt;
	}

	//공지사항 수정
	@Override
	public int modifyNotice(NoticeVO notice) {
		NoticeVO savedNotice = noticeDAO.selectNotice(notice.getNoticeSn());
		if(savedNotice==null)
			throw new NotExistNoticeException(notice.getNoticeSn());
		int rowcnt = noticeDAO.updateNotice(notice);
		rowcnt += processAttachList(notice);
//		int[] delAttNos = notice.getDelAttNos();
		/*Arrays.sort(delAttNos);
		if(delAttNos!=null && delAttNos.length>0) {
			rowcnt += attachDAO.deleteAttatchs(notice);
			String[] delAttSavenames = savedNotice.getAttatchList().stream()
					.filter(attach->{
 						return Arrays.binarySearch(delAttNos, attach.getAttno()) >= 0;
 					}).map(AttachVO::getAttSavename)
 					.toArray(String[]::new);
			for(String saveName : delAttSavenames) {
				FileUtils.deleteQuietly(new File(saveFiles, saveName));
			}
		}*/
		return rowcnt;
	}

	//공지사항 삭제
	@Override
	public int removeNotice(String noticeSn) {
		int rowcnt = noticeDAO.deleteNotice(noticeSn);
		return rowcnt;
	}

}



















