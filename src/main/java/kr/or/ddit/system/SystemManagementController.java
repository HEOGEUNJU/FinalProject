package kr.or.ddit.system;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.MessageFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.omg.CORBA.portable.OutputStream;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.ResourceHttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.board.service.BoardReportService;
import kr.or.ddit.board.vo.BoardReportVO;
import kr.or.ddit.company.service.CompanyService;
import kr.or.ddit.company.vo.CompanyVO;
import kr.or.ddit.expert.dao.AttachDAO;
import kr.or.ddit.expert.service.ExpertService;
import kr.or.ddit.expert.service.ExprodService;
import kr.or.ddit.expert.vo.ExpertVO;
import kr.or.ddit.expert.vo.ExprodVO;
import kr.or.ddit.help.service.AskService;
import kr.or.ddit.help.vo.AskVO;
import kr.or.ddit.lab.dao.CounAttachDAO;
import kr.or.ddit.lab.dao.CounselingDAO;
import kr.or.ddit.lab.service.CounselingService;
import kr.or.ddit.lab.vo.CounselingVO;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.ui.PaginationRenderer;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.BlackVO;
import kr.or.ddit.vo.CutVO;
import kr.or.ddit.vo.IncruiterVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 박형준
 * @since 2023. 2. 4.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                 수정자               수정내용
 * --------        --------    ----------------------
 * 2023. 2. 4.      박형준              최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/systemManagement")
public class SystemManagementController {
	@Resource(name="bootstrapPaginationRender")
	private PaginationRenderer renderer;
	
	private final AttachDAO attachDao;
	private final MemberService memberService;
	private final CompanyService companyService;
	private final ExprodService exprodService;
	private final ExpertService expertService;
	private final AskService askService;
	private final CounselingService counService;
	private final BoardReportService boardReportService;
	
	//저장된 파일
	@Value("#{appInfo.saveFiles}")
	private File saveFiles;
	
/*========================================================회원관리========================================================*/	
	//회원 목록
	@GetMapping("/memberList")
	public String memberProcess(
		Model model
	) {
		//일반
		List<MemberVO> seekerList = memberService.retrieveSkrList();
		model.addAttribute("seekerList", seekerList);
		
		//기업
		List<MemberVO> incruiterList = memberService.retrieveIncList();
		model.addAttribute("incruiterList", incruiterList);
		
		//전문가
		List<MemberVO> expertList = memberService.retrieveExpList();
		model.addAttribute("expertList", expertList);
		
		//차단
		List<MemberVO> cutList = memberService.retrieveCutList();
		model.addAttribute("cutList", cutList);
		
		//블랙리스트
		List<MemberVO> blackList = memberService.retrieveBlackList();
		model.addAttribute("blackList", blackList);
		
		//탈퇴
		List<MemberVO> delMemList = memberService.retrieveDelMemList();
		model.addAttribute("delMemList", delMemList);
		
		return "system/memberList";
	}
	
	//일반회원 목록
	@GetMapping("/memberList/seekerList")
	public String seekerProcess(
		Model model
	) {
		List<MemberVO> seekerList = memberService.retrieveSkrList();
		model.addAttribute("seekerList", seekerList);
		
		return "system/seekerList";
	}
	//일반회원 상세
	@GetMapping("/memberList/seekerList/{memId}")
	public String seekerView(
		@PathVariable String memId
		, Model model
	) {
		MemberVO seeker = memberService.retrieveSkr(memId);
		model.addAttribute("seeker", seeker);
		return "system/seekerView";
	}
	
	//기업회원 목록
	@GetMapping("/memberList/incruiterList")
	public String incruiterProcess(
		Model model
	) {
		List<MemberVO> incruiterList = memberService.retrieveIncList();
		model.addAttribute("incruiterList", incruiterList);
		return "system/incruiterList";
	}
	//기업회원 상세
	@GetMapping("/memberList/incruiterList/{memId}")
	public String incruiterView(
		@PathVariable String memId
		, Model model
	) {
		MemberVO incruiter = memberService.retrieveInc(memId);
		model.addAttribute("incruiter", incruiter);
		return "system/incruiterView";
	}
	
	//전문가회원 목록
	@GetMapping("/memberList/expertList")
	public String expertProcess(
		Model model
	) {
		List<MemberVO> expertList = memberService.retrieveExpList();
		model.addAttribute("expertList", expertList);
		return "system/expertList";
	}
	//전문가 상세
	@GetMapping("/memberList/expertList/{memId}")
	public String expertView(
		Model model
		, @PathVariable String memId
	) {
		MemberVO expert = memberService.retrieveExp(memId);
		model.addAttribute("expert", expert);
		List<ExprodVO> exprodList = exprodService.retrieveExpertExprodList(memId);
		model.addAttribute("exprodList", exprodList);
		return "system/expertView";
	}
	
	
	//차단회원 목록
	@GetMapping("/memberList/cutList")
	public String cutProcess(
		Model model
	) {
		List<MemberVO> cutList = memberService.retrieveCutList();
		model.addAttribute("cutList",cutList);
		return "system/cutList";
	}
	//차단회원 상세
	@GetMapping("/memberList/cutList/{memId}")
	public String cutView(
		Model model
		, @PathVariable String memId
	) {
		MemberVO cut = memberService.retrieveCut(memId);
		model.addAttribute("cut", cut);
		return "system/cutView";
	}
	
	//차단 하기
	@PostMapping("/insertCut")
	public String cut(
		Model model
		, @RequestParam("memId") String memId
		, @ModelAttribute("member") CutVO cut
	) {
		String viewName = null;
		int cut2 = memberService.createCut(cut);
		int role = memberService.modifyCutRole(memId);
		if(cut2 * role > 0) {
			viewName = "redirect:/systemManagement/memberList/cutList/" + memId;
		}else {
			model.addAttribute("message", "서버 오류");
			viewName = "system/seekerList";
		}
		return viewName;
	}
	//차단 해제
	@PostMapping("/releaseCut")
	public String releaseCut(
		Model model
		, @RequestParam("memId") String memId
		, @ModelAttribute("member") CutVO cut
	) {
		String viewName = null;
		int cut2 = memberService.removeCut(cut);
		int role = memberService.modifyRole(memId);
		if(cut2 * role > 0) {
			viewName = "redirect:/systemManagement/memberList/seekerList/" + memId;
		}else {
			model.addAttribute("message", "서버 오류");
			viewName = "system/cutList";
		}
		return viewName;
	}
	
	//블랙리스트 목록
	@GetMapping("/memberList/blackList")
	public String blackProcess(
		Model model
	) {
		List<MemberVO> blackList = memberService.retrieveBlackList();
		model.addAttribute("blackList",blackList);
		return "system/blackList";
	}
	//블랙리스트 상세
	@GetMapping("/memberList/blackList/{memId}")
	public String blackView(
		Model model
		, @PathVariable String memId
	) {
		MemberVO black = memberService.retrieveBlack(memId);
		model.addAttribute("black", black);
		return "system/blackView";
	}
	
	//블랙리스트 추가
	@PostMapping("/insertBlack")
	public String black(
		Model model
		, @RequestParam("memId") String memId
		, @ModelAttribute("member") BlackVO black
	) {
		String viewName = null;
		int black2 = memberService.createBlack(black);
		int role = memberService.modifyBlackRole(memId);
		if(black2 * role > 0) {
			viewName = "redirect:/systemManagement/memberList/blackList/" + memId;
		}else {
			model.addAttribute("message", "서버 오류");
			viewName = "system/seekerList";
		}
		return viewName;
	}
	//블랙 해제
	@PostMapping("/releaseBlack")
	public String releaseBlack(
		Model model
		, @RequestParam("memId") String memId
		, @ModelAttribute("member") BlackVO black
	) {
		String viewName = null;
		int cut2 = memberService.removeBlack(black);
		int role = memberService.modifyRole(memId);
		if(cut2 * role > 0) {
			viewName = "redirect:/systemManagement/memberList/seekerList/" + memId;
		}else {
			model.addAttribute("message", "서버 오류");
			viewName = "system/blackList";
		}
		return viewName;
	}
	
	
	
	
	//탈퇴회원 목록
	@GetMapping("/memberList/delMemList")
	public String delMemProcess(
		Model model
	) {
		List<MemberVO> delMemList = memberService.retrieveDelMemList();
		model.addAttribute("delMemList", delMemList);
		return "system/delMemList";
	}

/*========================================================기업관리========================================================*/		
	//기업 목록
	@GetMapping("/companyList")
	public String companyProcess(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage
		, @ModelAttribute("simpleCondition") SearchVO searchVO
		, Model model
	) {
		PagingVO<CompanyVO> pagingVO = new PagingVO<>(20, 10);
		pagingVO.setCurrentPage(currentPage); //현재페이지
		pagingVO.setSimpleCondition(searchVO); // 검색 키워드
		
		companyService.retrieveCompanyList(pagingVO);
		
		model.addAttribute("pagingVO", pagingVO);
		return "system/companyList";
	}
	//기업 상세
	@GetMapping("/companyList/{cmpId}")
	public String company(
		Model model
		, @PathVariable String cmpId
	) {
		CompanyVO company = companyService.retrieveCmp(cmpId);
		model.addAttribute("company", company);
		
		return "system/companyView";
	}

	
/*========================================================승인관리========================================================*/		
	//승인 관리
	@GetMapping("/acceptManagement")
	public String acceptProcess(
		Model model
		, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
	) {
		PagingVO<ExprodVO> pagingVO = new PagingVO<>(20, 10);
		pagingVO.setCurrentPage(currentPage);
		exprodService.retrieveAppliProdList(pagingVO);
		
		List<MemberVO> incruiterList = memberService.retrieveIncruiterList();
		List<MemberVO> expertList = memberService.retrieveExpertList();
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("incruiterList", incruiterList);
		model.addAttribute("expertList", expertList);
		return "system/acceptManagement";
	}
	
	//총괄기업회원 신청목록
	@GetMapping("/acceptManagement/appliIncruiterList")
	public String generalIncruiterProcess(
		Model model
	) {
		List<MemberVO> incruiterList = memberService.retrieveIncruiterList();
		model.addAttribute("incruiterList", incruiterList);
		return "system/appliIncruiterList";
	}
	
	//총괄기업회원 신청세부
	@GetMapping("/acceptManagement/appliIncruiterList/{memId}")
	public String incruiterAppliView(
			@PathVariable String memId,
			Model model
	) {
		MemberVO incruiter = memberService.retrieveIncruiter(memId);
		CompanyVO cmp = incruiter.getCompanyVO();
		String cmpId = cmp.getCmpId();
		List<AttachVO> files = attachDao.selectAttatchList(cmpId);
		model.addAttribute("files",files);
		model.addAttribute("incruiter", incruiter);
		return "system/appliIncruiterView";
	}
	
	/*@ResponseBody
	@GetMapping("/showPdf")
	public void showPdf(
		HttpServletResponse resp
		, @RequestParam("file") String file
		, @RequestParam(value="path", required=false, defaultValue="D://saveFiles/") String path
	) throws IOException {
		File pdf = new File(path + file);
		FileInputStream fis = null;
		ServletOutputStream os = null;
		resp.setContentType("application/pdf");
		int read = -1;
		try {
			fis = new FileInputStream(pdf);
			os = resp.getOutputStream();
			while((read = fis.read()) != -1) {
				os.write(read);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			fis.close();
			os.close();
		}
	}*/
	
	//파일 다운로드
	@GetMapping("/fileDownLoad")
	public void downloadFile(
		HttpServletResponse resp
		, @RequestParam("tblId") String tblId
	) throws IOException {
		List<AttachVO> attachList = attachDao.selectAttatchList(tblId);
		AttachVO attVO = attachList.get(0);
		String path = attVO.getAttStreCours();
		String saveName = attVO.getAttSavename();
		String fileName = attVO.getAttFilename();
		File downloadFile = new File(path+saveName);
		
		byte fileByte[] = FileUtils.readFileToByteArray(downloadFile);
        
		resp.setContentType("application/octet-stream");
		resp.setContentLength(fileByte.length);
        
		resp.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(fileName,"UTF-8") +"\";");
		resp.setHeader("Content-Transfer-Encoding", "binary");
        
		resp.getOutputStream().write(fileByte);
		resp.getOutputStream().flush();
		resp.getOutputStream().close();
	}
	
	
	//총괄 승인
	@PostMapping("/acceptManagement/updateAcceptInc")
	public String updateAcceptInc(
		Model model
		, @ModelAttribute("incruiter") IncruiterVO incruiter
 	) {
		int inc = memberService.modifyAcceptInc(incruiter);
		int cmp = memberService.modifyAcceptCmp(incruiter);
		String viewName = null;
		if(inc * cmp > 0) {
			viewName = "redirect:/systemManagement/acceptManagement/appliIncruiterList";
		}else {
			model.addAttribute("message", "서버 오류");
			viewName = "system/appliIncruiterList";
		}
		return viewName;
	}
	
	//총괄 신청 삭제
	@PostMapping("/deleteAppli")
	public String deleteAppli(
		Model model
		, @ModelAttribute("memId") MemberVO memId
		, @ModelAttribute("cmpId") CompanyVO cmpId
	) {
		int inc = memberService.removeAppliInc(memId);
		int cmp = companyService.removeAppliCmp(cmpId);
		String viewName = null;
		if(inc * cmp > 0) {
			viewName = "redirect:/systemManagement/acceptManagement/appliIncruiterList";
		}else {
			model.addAttribute("message", "서버 오류");
			viewName = "system/appliIncruiterView";
		}
		return viewName;
	}
	
	
	//전문가 신청 목록
	@GetMapping("/acceptManagement/appliExpertList")
	public String acceptExpert(
		Model model
	) {
		List<MemberVO> expertList = memberService.retrieveExpertList();
		model.addAttribute("expertList", expertList);
		return "system/appliExpertList";
	}
	
	//전문가 신청 세부
	@GetMapping("/acceptManagement/appliExpertList/{memId}")
	public String expertAppliView(
		Model model
		, @PathVariable String memId
	) {
		List<AttachVO> files = attachDao.selectAttatchList("C"+memId);
		model.addAttribute("files",files);
		MemberVO expert = memberService.retrieveExpert(memId);
		model.addAttribute("expert", expert);
		return "system/appliExpertView";
	}
	
	//전문가 승인
	@PostMapping("/acceptManagement/updateAcceptExp")
	public String acceptExp(
		Model model
		, @ModelAttribute("expert") MemberVO expert
	) {
		int expRole = memberService.modifyAcceptExpRole(expert);
		int exp = memberService.modifyAcceptExp(expert);
		String viewName = null; 
		if(expRole * exp > 0) {
			viewName = "redirect:/systemManagement/acceptManagement/appliExpertList";
		}else {
			model.addAttribute("message", "서버 오류");
			viewName = "system/appliExpertList";
		}
		return viewName;
	}
	
	//전문가 신청 삭제
	@PostMapping("/deleteAppliExp")
	public String deleteAppliExp(
		Model model
		, @ModelAttribute("memId") ExpertVO memId
	) {
		int exp = expertService.removeAppliExp(memId);
		String viewName = null;
		if(exp > 0) {
			viewName = "redirect:/systemManagement/acceptManagement/appliExpertList";
		}else {
			model.addAttribute("message", "서버 오류");
			viewName = "system/appliExpertView";
		}
		return viewName;
	}
	
	
	//상품 신청 목록
	@GetMapping("/acceptManagement/appliProdList")
	public String prodList(
		Model model
		, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
	) {
		PagingVO<ExprodVO> pagingVO = new PagingVO<>(20, 5);
		pagingVO.setCurrentPage(currentPage);
		
		exprodService.retrieveAppliProdList(pagingVO);
		
		model.addAttribute("pagingVO", pagingVO);
		
		return "system/appliProdList";
	}
	
	//상품 신청 세부
	@GetMapping("/acceptManagement/appliprodList/{exprodId}")
	public String prodAppliView(
		Model model
		, @PathVariable String exprodId
	) {
		ExprodVO exprod = exprodService.retrieveAppliProd(exprodId);
		model.addAttribute("exprod",exprod);
		
		return "system/appliExprodView";
	}
	
	//상품 신청 승인
	@PostMapping("/acceptManagement/updateAcceptProd")
	public String acceptProd(
		@ModelAttribute("exprod") ExprodVO exprod
		, Model model
	) {
		int appliProd = exprodService.modifyAppliProd(exprod);
		String viewName = null;
		if(appliProd > 0) {
			viewName = "redirect:/systemManagement/acceptManagement/appliProdList";
		}else {
			model.addAttribute("message","서버 오류");
			viewName = "system/appliExprodList";
		}
		return viewName;
	}
	
	//상품 신청 반려
	@PostMapping("/deleteAppliProd")
	public String delteAppliProd(
		Model model
		, @ModelAttribute("exprodId") ExprodVO exprodId
	) {
		int prod = exprodService.removeAppliProd(exprodId);
		String viewName = null;
		if(prod>0) {
			viewName = "redirect:/systemManagement/acceptManagement/appliProdList";
		}else {
			model.addAttribute("message", "서버 오류");
			viewName = "system/appliExprodView";
		}
		return viewName;
	}
	
/*========================================================문의관리========================================================*/	
	
	//문의 
	@GetMapping("/ask")
	public String askUi() {
		return "system/ask";
	}
	
	//문의 리스트 뷰에 보내기
	@GetMapping(value="/ask", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String askProcess(
		Model model
		, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
	) {
		PagingVO<AskVO> pagingVO = new PagingVO<>();
		pagingVO.setCurrentPage(currentPage);
		askService.retrieveAllList(pagingVO);
		model.addAttribute("askList", pagingVO);
		
		if(!pagingVO.getDataList().isEmpty())
			model.addAttribute("pagingHTML", renderer.renderPagination(pagingVO));
		
		PagingVO<CounselingVO> pagingVO2 = new PagingVO<>();
		pagingVO2.setCurrentPage(currentPage);
		counService.retrieveCounList(pagingVO2);
		model.addAttribute("counList", pagingVO2);
		
		if(!pagingVO2.getDataList().isEmpty())
			model.addAttribute("pagingHTML2", renderer.renderPagination(pagingVO2));
		
		return "jsonView";
	}
	
	
	
	
	//신고 목록
	@GetMapping("/reportList")
	public String reportProcess(
		Model model
	) {
		List<BoardReportVO> reportList = boardReportService.retrieveReportList();
		model.addAttribute("reportList", reportList);
		return "system/reportList";
	}
}

















