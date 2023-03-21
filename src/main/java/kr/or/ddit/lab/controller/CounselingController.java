package kr.or.ddit.lab.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.text.MessageFormat;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.ResourceHttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.NotExistBoardException;
import kr.or.ddit.lab.dao.CounAttachDAO;
import kr.or.ddit.lab.dao.CounselingDAO;
import kr.or.ddit.lab.service.CounselingService;
import kr.or.ddit.lab.vo.CounAttachVO;
import kr.or.ddit.lab.vo.CounselingVO;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.ui.PaginationRenderer;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 작성자명
 * @since 2023. 2. 1.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                 수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 1.   양서연              최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/lab/counseling")
@RequiredArgsConstructor
@Slf4j
public class CounselingController {

	private final CounselingService service;
	private final CounselingDAO counDAO;
	private final CounAttachDAO counAttachDAO;
	
	@Value("#{appInfo.counselingFolder}")
	private File fileFolder;
	
	@Resource(name="bootstrapPaginationRender")
	private PaginationRenderer renderer;

	@ModelAttribute("coun")
	public CounselingVO counVO() {
		return new CounselingVO();
	}

	@GetMapping
	public String listUI() {
		return "lab/counList";
	}

	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String counList(
		Model model
		, @RequestParam(value="page",required=false, defaultValue="1") int currentPage
		, @ModelAttribute SearchVO searchVO
	) {
		PagingVO<CounselingVO> pagingVO = new PagingVO<>();
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		
		service.retrieveCounList(pagingVO);
		model.addAttribute("pagingVO", pagingVO);
		
		if(!pagingVO.getDataList().isEmpty())
			model.addAttribute("pagingHTML", renderer.renderPagination(pagingVO));
		
		return "jsonView";
	}

	@GetMapping("view/{counNo}")
	public String counView(
		@PathVariable String counNo
		, Model model
	) {
		CounselingVO coun = service.retrieveCoun(counNo);
		if(!coun.getCounState().equals("B1")) {
			throw new NotExistBoardException(counNo);
		}
		coun.setCounAttach(counAttachDAO.selectAttach(counNo));
		counDAO.incrementHit(counNo);
		model.addAttribute("coun",coun);
		return "lab/counView";
	}

	@GetMapping("insert")
	public String insertCoun(
		Model model
		, @RequestParam(required=false) String refCoun
	) {
		model.addAttribute("refCoun",refCoun);
		return "lab/counForm";
	}

	@PostMapping("insert")
	public String insertCounProcess(
		Model model
		, @Validated(InsertGroup.class) @ModelAttribute("coun") CounselingVO coun
		, Errors errors 
	) {
		String viewName="";
		ServiceResult result = service.createCoun(coun);
		if(!errors.hasErrors()) {
			if(ServiceResult.OK == result) {
				viewName = "redirect:/lab/counseling";
			} else {
				viewName = "lab/counForm";
			}
		}
		return viewName;
	}
	
	@GetMapping("update")
	public String updateCoun(
		@RequestParam("counNo") String counNo
		, Model model	
	) {
		CounselingVO coun = service.retrieveCoun(counNo);
		CounAttachVO attachedVO = counAttachDAO.selectAttach(counNo);
		model.addAttribute("coun", coun);
		model.addAttribute("attachedVO", attachedVO);
		return "lab/counForm";
	}
	
	@PostMapping("update")
	public String updateCounProcess(
		@Validated(UpdateGroup.class) @ModelAttribute("coun") CounselingVO coun
		, BindingResult errors
		, Model model
	) {
		String viewName = null;
		if(!errors.hasErrors()) {
			ServiceResult result = service.modifyCoun(coun);
			if(ServiceResult.OK == result) {
				viewName="redirect:/lab/counseling/view/"+coun.getCounNo();
			} else {
				model.addAttribute("message", "서버 오류");
				viewName = "lab/counForm";
			}
		} else {
			viewName = "lab/counForm";
		}
		return viewName;
	}

	@GetMapping("delete")
	public String deleteCounProcess(
		@RequestParam(required=false) String counNo
		, @AuthMember MemberVO authMember
	) {
		String result = "";
		CounselingVO coun = service.retrieveCoun(counNo);
		if(authMember.getMemId().equals(coun.getMemId())) {
			result = service.deleteCoun(counNo) > 0 ? "redirect:/lab/counseling" : "redirect:/lab/counseling/view/"+coun.getCounNo();
		} else {
			result = "redirect:/lab/counseling/view/"+coun.getCounNo();
		}
		return result;
	}
	
	/**
	 * @param filename
	 * @return 파일 전송을 위해 {@link Resource} 구현체를 HttpEntity body 로 세팅하면  {@link ResourceHttpMessageConverter} 에 의해 response body 에 stream copy 되어 전송됨. 
	 * @see ResponseEntity
	 */
	@RequestMapping("single")
	public ResponseEntity<?> singleDownloadCase1(
		@RequestParam("what") String filename
		, @RequestParam("realName") String realName
		, @RequestBody(required = false) Map<String, Object> param
	) {
		File downloadFile = new File(fileFolder, filename);
		try {
			realName = new String(realName.getBytes("UTF-8"), "ISO-8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		if(!downloadFile.exists())
			return ResponseEntity.status(HttpStatus.NOT_FOUND)
								.contentType(new MediaType(MediaType.TEXT_HTML, StandardCharsets.UTF_8))
								.body(String.format("<html><body>%s 파일이 없음.</body></html>", filename));
		else
			return ResponseEntity.ok()
								.contentType(MediaType.APPLICATION_OCTET_STREAM)
								.contentLength(downloadFile.length())
								.header(HttpHeaders.CONTENT_DISPOSITION, MessageFormat.format("attatchment;filename=\"{0}\"", new Object[] {realName}))
								.body(new FileSystemResource(downloadFile));
	}
}
