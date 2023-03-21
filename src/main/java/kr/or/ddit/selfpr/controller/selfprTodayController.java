package kr.or.ddit.selfpr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.security.AuthMember;
import kr.or.ddit.selfpr.service.TodaySeeService;
import kr.or.ddit.selfpr.vo.TodaySeeVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 윤호연
 * @since 2023. 2. 4.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일               수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2.22.  윤호연                최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */

@Slf4j
@Controller
@RequestMapping("/selfpr/today")
public class selfprTodayController {

	@Autowired
	TodaySeeService todaySeeService;
	
	@GetMapping
	public String selfprTodayList(
		@AuthMember MemberVO authMember
		, @RequestParam(value = "page", required=false, defaultValue="1") int currentPage
		, @ModelAttribute("simpleCondition") SearchVO searchVO
		, Model model
	) {
		String memId = authMember.getMemId();
		PagingVO<TodaySeeVO> pagingVO = new PagingVO<>();
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		pagingVO.setMemId(memId);
		
		todaySeeService.retrieveTodaySeeList(pagingVO);
		model.addAttribute("pagingVO", pagingVO);
		
//		System.out.println(pagingVO);
		
		return "selfpr/selfPrToday";
	}
	
	//오늘 본 인재 로그 저장 및 24시간 내 확인
	@ResponseBody
	@PostMapping
	public String selfprTodayInsert(@RequestBody TodaySeeVO todaySeeVO) {
		log.info("todaySeeVO : " + todaySeeVO);
		
		int result = todaySeeService.matchTodaySee(todaySeeVO);
		log.info("result : " + result);
		
		if(result < 1) {//오늘 등록한 데이터가 없으면..
			//TodaySeeVO(todayNo=0, prNo=32, memId=abcabc001, TODAY_DATE=null, TODAY_EDATE=null)
			result = this.todaySeeService.insertTodaySee(todaySeeVO);
		}else {//오늘 등록한 데이터가 있으면
			result = 0;//아무것도 안함
		}
		
		return result + "";
	}
	
}