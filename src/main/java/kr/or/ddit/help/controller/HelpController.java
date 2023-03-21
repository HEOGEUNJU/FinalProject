package kr.or.ddit.help.controller;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.help.service.HelpService;
import kr.or.ddit.help.vo.HelpVO;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.ui.PaginationRenderer;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;

/**
 * 
 * @author 박형준
 * @since 2023. 2. 10.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 10.   박형준              최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/help")
public class HelpController {
	@Resource(name="bootstrapPaginationRender")
	private PaginationRenderer renderer;
	
	@Inject
	private HelpService service;
	
	//개별 리스트
	@GetMapping 
	public String helpList(
//		Model model
//		, @RequestParam(value="helpSort", required=false , defaultValue="HPS") String helpSort
	) {
//		List<HelpVO> list = service.retrieveList(helpSort); //해당 구분을 받은 목록
//		List<HelpVO> listName = service.retrieveListName(helpSort); //해당 구분 명 목록
//		
//		model.addAttribute("list",list);
//		model.addAttribute("listName",listName);
		
		return "help/helpList";
	}
	
	//produces:생산 가능한 미디어타입의 목록을 지정해서 주요 매핑을 제한, Accept 요청헤더가 이러한 값 중 하나와 일치할 때만 요청이 매칭
	//서버에서 브라우저로 보냄
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String helpList(
//		@AuthMember MemberVO authMember
//		@RequestParam(value="page", required=false, defaultValue="1") int currentPage
		@RequestParam(value="helpSort", required=false , defaultValue="HPS") String helpSort
		, @RequestParam(value="helpCate", required=false, defaultValue="") String helpCate
//		, @ModelAttribute("detailCondition") HelpVO detailCondition
		, Model model
	) {
//		PagingVO<HelpVO> pagingVO = new PagingVO<>(10, 5); //페이징 
//		pagingVO.setCurrentPage(currentPage);	//현재페이지
//		pagingVO.setDetailCondition(detailCondition); //상세검색
		
//		service.retrieveHelpList(pagingVO); //전체 목록
//		model.addAttribute("pagingVO", pagingVO);
//		if(!pagingVO.getDataList().isEmpty())	//데이터가 있으면
//			model.addAttribute("pagingHTML", renderer.renderPagination(pagingVO));
//		
//		System.out.println(pagingVO);
		List<HelpVO> list = service.retrieveList(helpSort); //해당 구분을 받은 목록
		List<HelpVO> listName = service.retrieveListName(helpSort); //해당 구분 명 목록
		
		// helpCate가 동일하지 않은 것은 삭제하기
		// helpCate가 동일하지 않은 인덱스 삭제하기(뒤에서부터)
		
//		List<HelpVO> tempList = new ArrayList<>();
//		
//		if (!helpCate.equals("")) {
//			for (HelpVO vo : list) {
//				if (vo.getHelpCate().equals(helpCate)) {
//					tempList.add(vo);
//				}
//			}
//			list = tempList;
//		}
		
		model.addAttribute("list",list);
		model.addAttribute("listName",listName);
		
		return "jsonView";
	}
	
	
}














