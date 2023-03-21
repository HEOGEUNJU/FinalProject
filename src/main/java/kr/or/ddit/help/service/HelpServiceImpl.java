package kr.or.ddit.help.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.or.ddit.expert.dao.AttachDAO;
import kr.or.ddit.help.dao.HelpDAO;
import kr.or.ddit.help.vo.HelpVO;
import kr.or.ddit.help.vo.NoticeVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;

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
 * 2023. 2. 10.   박형준              최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Service
public class HelpServiceImpl implements HelpService{
	@Inject
	private HelpDAO helpDAO;
	@Inject
	private AttachDAO attachDAO;
	
	@Value("#{appInfo.saveFiles}")
	private File saveFiles;
	
	@PostConstruct
	public void init() throws IOException{
		log.info("첨부파일 저장 경로 : {}", saveFiles.getCanonicalPath());
	}
	
	private int processAttachList(HelpVO help) {
		List<AttachVO> attachList = help.getAttatchList();
		if(attachList==null || attachList.isEmpty()) 
			return 0;
		//1. meatadata 저장 - DB (ATTATCH)
		int rowcnt = attachDAO.insertAttatches(help);
		//2. binary 저장 - Middle Tier (D:\saveFiles)
		try {
			for(AttachVO attach : attachList) {
				attach.saveTo(saveFiles);
			}
			return rowcnt;
		}catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	//분류 명
	@Override
	public List<HelpVO> retrieveListName(String helpSort) {
		List<HelpVO> listName = helpDAO.selectListName(helpSort);
		return listName;
	}
	
	//분류 목록
	@Override
	public List<HelpVO> retrieveList(String helpSort) {
		List<HelpVO> list = helpDAO.selectList(helpSort);
		return list;
	}
	
	//페이징 처리된 목록
	@Override
	public void retrieveHelpList(PagingVO<HelpVO> pagingVO) {
		pagingVO.setTotalRecord(helpDAO.selectTotalRecord(pagingVO));
		pagingVO.setDataList(helpDAO.selectHelpList(pagingVO));
	}

	//세부
	@Override
	public HelpVO retrieveHelp(String helpSn) {
		HelpVO help = helpDAO.selectHelp(helpSn);
		helpDAO.incrementHit(help);
		return help;
	}

	//등록
	@Override
	public int createHelp(HelpVO help) {
		int rowcnt = helpDAO.insertHelp(help);
		rowcnt += processAttachList(help);
		return rowcnt;
	}

	//수정
	@Override
	public int modifyHelp(HelpVO help) {
		int rowcnt = helpDAO.updateHelp(help);
		rowcnt += processAttachList(help);
		return rowcnt;
	}

	//삭제
	@Override
	public int removeHelp(HelpVO help) {
		int rowcnt = helpDAO.deleteHelp(help);
		return rowcnt;
	}

	


}
