package kr.or.ddit.help.controller;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.expert.dao.AttachDAO;
import kr.or.ddit.help.service.NoticeService;
import kr.or.ddit.help.vo.NoticeVO;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.ui.PaginationRenderer;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

/**
 *
 * @author 박형준
 * @since 2023. 2. 1.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 1.      박형준       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Controller
@RequestMapping("/help/notice")
public class NoticeController {
	@Resource(name="bootstrapPaginationRender")
	private PaginationRenderer renderer;

	@Inject
	private NoticeService service;
	@Inject
	private AttachDAO attachDao;

	@PostConstruct
	public void init() {
		log.info("주입된 service객체 : {}", service.getClass().getName());
	}

	@ModelAttribute("notice")
	public NoticeVO notice() {
		return new NoticeVO();
	}

	//공지사항 목록 페이징
	@GetMapping
	public String noticeListData(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage	//요청된 파라미터(page)를 currentpage에 넣음
		, Model model
		, @ModelAttribute("simpleCondition") SearchVO searchVO
	) {
		PagingVO<NoticeVO> pagingVO = new PagingVO<>(10, 5);
		pagingVO.setCurrentPage(currentPage); //현재페이지
		pagingVO.setSimpleCondition(searchVO); // 검색 키워드

		service.retrieveNoticeList(pagingVO);

		model.addAttribute("pagingVO", pagingVO);
		return "help/notice/noticeList";
	}

	//공지사항 상세
	@RequestMapping("/{noticeSn}")
	public String noticeView(
		@PathVariable String noticeSn,
		Model model
	) {
		List<AttachVO> files = attachDao.selectAttatchList(noticeSn);
		model.addAttribute("files", files);
		NoticeVO notice = service.retrieveNotice(noticeSn);
		model.addAttribute("notice", notice);
		return "help/notice/noticeView";
	}


	//공지사항 등록폼
	@GetMapping("/noticeInsert")
	public String insertForm() {
		return "help/notice/noticeForm";
	}

	//공지사항 등록
	@PostMapping("/noticeInsert")
	public String noticeInsert(
		@ModelAttribute("notice") NoticeVO notice
		, @AuthMember MemberVO authMember
		, Model model
	) {
		String viewName = null;
		notice.setMemId(authMember.getMemId());
		int rowcnt = service.createNotice(notice);
		if(rowcnt>0) {
			viewName = "redirect:/help/notice";
		}else {
			model.addAttribute("message","서버 오류");
			viewName = "help/notice/noticeForm";
		}
		return viewName;
	}

	//공지사항 수정폼
	@GetMapping("/noticeUpdate")
	public String updateForm(
		@RequestParam("what") String noticeSn
		, Model model
	) {
		NoticeVO notice = service.retrieveNotice(noticeSn);
		model.addAttribute("notice", notice);
		return "help/notice/noticeForm";
	}

	//공지사항 수정
	@PostMapping("/noticeUpdate")
	public String noticeUpdate(
		@ModelAttribute("notice") NoticeVO notice
		, Model model
	) {
		String viewName = null;
		int rowcnt = service.modifyNotice(notice);
		if(rowcnt>0) {
			viewName = "redirect:/help/notice/"+notice.getNoticeSn();
		}else {
			model.addAttribute("message", "서버 오류");
			viewName = "help/notice/noticeForm";
		}
		return viewName;
	}

	//공지사항 삭제
	@PostMapping("/noticeDelete")
	public String noticeDelete(
		@RequestParam("noticeSn") String noticeSn
		, Model model
	) {
		service.removeNotice(noticeSn);
		return "redirect:/help/notice";
	}

}









