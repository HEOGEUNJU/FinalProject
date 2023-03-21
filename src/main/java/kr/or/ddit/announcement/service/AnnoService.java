package kr.or.ddit.announcement.service;

import java.util.List;

import kr.or.ddit.announcement.vo.AnnoVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.PagingVO;

/**
 * @author 작성자명
 * @since 2023. 2. 7.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 7.      양서연       최초작성
 * 2023. 2. 17.     최경수       회원아이디로 공고 찾기
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
public interface AnnoService {
	public void retrieveAnnoList(PagingVO<AnnoVO> pagingVO);
	public AnnoVO retrieveAnno(String annoNo);
	public ServiceResult createAnno(AnnoVO anno);
	public ServiceResult modifyAnno(AnnoVO anno);
	public int removeAnno(String annoNo);
	public int terminateAnno(String annoNo);
	
	public int retrieveLikeAnno(String annoNo, String memId);
	public int createLikeAnno(String annoNo, String memId);
	public int removeLikeAnno(String annoNo, String memId);

	public int retrieveLikeCmp(String cmpId, String memId);
	public int createLikeCmp(String cmpId, String memId);
	public int removeLikeCmp(String cmpId, String memId);
	
	public int insertMemLog(String annoNo, String memId);
	public List<AnnoVO> retrieveRecommendList(String annoNo);
	
	public List<AnnoVO> retrieveMyAnnoList(String memId);
	public List<AnnoVO> retrieveMyAnnoListSeeker(String memId);
	public AnnoVO retrieveAnnoDetailProcess(String annoNo);
	public List<AnnoVO> retrieveLikeAnnoList(String memId);
	public List<AnnoVO> retrieveLikeAnnoListMypage(String memId);
}
