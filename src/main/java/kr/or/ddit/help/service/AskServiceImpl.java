package kr.or.ddit.help.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.expert.dao.AttachDAO;
import kr.or.ddit.help.dao.AskDAO;
import kr.or.ddit.help.vo.AskVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AskServiceImpl implements AskService {

	@Inject
	private AskDAO dao;

	@Inject
	private AttachDAO attachDAO;

	@Value("#{appInfo.askFolder}")
	private File saveFiles;

	private int processAttatchList(AskVO ask) {

		List<AttachVO> attatchList = ask.getAttatchList();
		if (attatchList == null || attatchList.isEmpty())
			return 0;
		// 1. metadata 저장 - DB (ATTATCH)
		log.info("ask : {}", ask);
		log.info("attactchList : {}", attatchList);
		// 2. binary 저장 - Middle Tier : (D:\saveFiles)
		try {
			for (AttachVO attatch : attatchList) {
				attatch.saveTo(saveFiles);
			}
			int rowcnt = attachDAO.insertAttatches(ask);
			return rowcnt;
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	// 상세 조회
	@Override
	public AskVO retrieveAsk(String askNo) {
		AskVO ask = dao.selectAsk(askNo);
		ask.setAttatchList(attachDAO.selectAttatchList(askNo));
		return ask;
	}

	// 전체 조회 + 페이징
	@Override
	public void retrieveAskList(PagingVO<AskVO> pagingVO) {
		pagingVO.setTotalRecord(dao.selectTotalRecord(pagingVO));
		pagingVO.setDataList(dao.selectAskList(pagingVO));
	}

	// 등록
	@Override
	public int createAsk(AskVO ask) {
		int rowcnt = dao.insertAsk(ask);
		rowcnt +=processAttatchList(ask);
		return rowcnt;
	}

	// 삭제(관리자만 가능)
	@Override
	public int removeAsk(AskVO ask) {
		int rowcnt = dao.deleteAsk(ask);
		return rowcnt;
	}

	// 수정
	@Override
	public int modifyRef(AskVO ask) {
		int rowcnt = dao.updateRef(ask);
		return rowcnt;
	}

	//전체 리스트(시스템 관리)
	@Override
	public void retrieveAllList(PagingVO<AskVO> pagingVO) {
		pagingVO.setTotalRecord(dao.selectTotalRecord(pagingVO));
		pagingVO.setDataList(dao.selectAllList(pagingVO));
	}

}
