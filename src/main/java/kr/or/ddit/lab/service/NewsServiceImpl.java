package kr.or.ddit.lab.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.ddit.expert.dao.AttachDAO;
import kr.or.ddit.lab.dao.NewsDAO;
import kr.or.ddit.lab.vo.NewsVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.PagingVO;
import lombok.val;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class NewsServiceImpl implements NewsService {
	@Inject
	private NewsDAO NewsDAO;
	
	@Inject
	private AttachDAO attachDAO;
	
	@Value("#{appInfo.newsFolder}")
	private File saveFiles;
	
	@Override
	public void retrieveNewsList(PagingVO<NewsVO> pagingVO) {
		pagingVO.setTotalRecord(NewsDAO.selectTotalRecord(pagingVO));
		pagingVO.setDataList(NewsDAO.selectNewsList(pagingVO));
	}

	@Override
	public NewsVO retrieveNews(String newsNo) {
		NewsVO news = NewsDAO.selectNews(newsNo);
		NewsDAO.incrementHit(newsNo);
		return news;
	}

	@Override
	public int createNews(NewsVO news) {
		int rowcnt = NewsDAO.insertNews(news);
		try {
			AttachVO att = new AttachVO(news.getRealFile());
			news.setTblId(att.getTblId());
			news.setAttNo(1);
			news.setAttFilename(att.getAttFilename());
			news.setAttSavename(att.getAttSavename());
			news.setAttStreCours(att.getAttStreCours());
			news.setAttMime(att.getAttMime());
			news.setAttFilesize(att.getAttFilesize());
			news.setAttFancysize(att.getAttFancysize());
			news.setAttDownload(att.getAttDownload());
			news.saveTo(saveFiles);
			rowcnt += attachDAO.insertAttach(news);
		} catch (IOException e) {
			new RuntimeException(e);
		}
		return rowcnt;
	}

	@Override
	public int modifyNews(NewsVO news) {
		NewsVO savedNews = NewsDAO.selectNews(news.getNewsNo());
		int rowcnt = NewsDAO.updateNews(news);
		return rowcnt;
	}

	@Override
	public int removeNews(String newsNo) {
		int rowcnt = NewsDAO.deleteNews(newsNo);
		return rowcnt;
	}

}
