package kr.or.ddit.help.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.expert.dao.AttachDAO;
import kr.or.ddit.help.service.AskService;
import kr.or.ddit.help.vo.AskVO;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.ui.PaginationRenderer;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;

@PreAuthorize("isAuthenticated()")
@Slf4j
@Controller
@RequestMapping("/ask")
public class AskController {

	@Inject
	private AskService service;

	@Inject
	private AttachDAO attachDao;

	// @Resource : Name으로 Bean을 지정한다.(필드/메서드에만 적용 가능)
	@Resource(name="bootstrapPaginationRender")
	private PaginationRenderer renderer;

	// 폼 띄우기
	@GetMapping
	public String ask() {
		return "ask/askForm";
	}

	// ui 띄우기
	@GetMapping("/askList")
	public String askUI() {
		return "ask/askList";
	}

	// 리스트 조회 + 페이징
	@GetMapping(value="/askList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String askList(
			Model model,
			@AuthMember MemberVO authMember,
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage
	) {
		String memId = authMember.getMemId();

		log.info("memId>>>>>>>>>>>{}", memId);
		PagingVO<AskVO> pagingVO = new PagingVO<>();
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setMemId(memId);
		service.retrieveAskList(pagingVO);
		model.addAttribute("pagingVO", pagingVO);


		if(!pagingVO.getDataList().isEmpty())
			model.addAttribute("pagingHTML", renderer.renderPagination(pagingVO));

		return "jsonView";
	}

	// 상세조회
	@GetMapping("/detailAsk")
	public String detailAsk(
			Model model,
			@RequestParam("askNo") String askNo,
			Authentication authentication) {

		String memId = "";
		// 운영자로 로그인 했나?
		if(authentication!= null) {
			String role = authentication.getAuthorities().toString();
			if(role.equals("[ROLE_ADMIN]")) {
				memId = authentication.getName();
			}
		}

		List<AttachVO> files = attachDao.selectAttatchList(askNo);
		AskVO ask = service.retrieveAsk(askNo);
		model.addAttribute("ask", ask);
		model.addAttribute("memId", memId);
		model.addAttribute("files", files);
		return "ask/detailAsk";
	}
}
