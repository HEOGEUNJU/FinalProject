package kr.or.ddit.apply.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;

import kr.or.ddit.announcement.service.AnnoService;
import kr.or.ddit.announcement.vo.AnnoDetailVO;
import kr.or.ddit.announcement.vo.AnnoVO;
import kr.or.ddit.apply.service.ApplyService;
import kr.or.ddit.apply.vo.ApplyVO;
import kr.or.ddit.myintro.service.MyintroService;
import kr.or.ddit.myintro.vo.MyintroVO;
import kr.or.ddit.resume.service.ResumeService;
import kr.or.ddit.resume.vo.ResumeVO;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.vo.MemberVO;

/**
 * 
 * @author 최경수
 * @since 2023. 2. 13.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자        수정내용
 * --------     --------    ----------------------
 * 2023. 2. 13.      최경수       최초작성
 * 2023. 2. 27.      최경수       점수 입력
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/apply")
public class ApplyController {

	// 각 세부공고 페이지에서 지원 버튼 누르면,
	
	// 강사안
	// 1)이력서 새로 작성 or 2)기존 이력서 선택 화면이 나온다.
	// 1)이력서 새로 작성 시 이력서 작성화면으로 가서 이력서를 작성한 후 다시 입사지원하게 한다.
	// - 세부공고번호 어떻게 갖고 있을 건데?..
	// 2) 기존 이력서 선택 시 어떤 것을 선택할지 정한다.
	// * 1),2) 모두 채용과정 중 입사지원서에 정해진 항목만 작성하도록 하거나, 고지한다.
	
	// 원래 내꺼
	// 1)입사지원서 작성 or 2)기존 이력서 제출
	// 2)입사지원서는 채용과정에서 구인자가 설정해놓은 항목을 기존 것에서 고르게 하거나
	// 1)새로 입력하도록 하고, 완성된 것은 입사지원서로 저장된다.(pdf파일로 만들어서 첨부파일 테이블에다가 저장하기)
	// *만들어진 입사지원서는 이력서 테이블에 저장되고 관련 pdf파일이 첨부파일로 저장돼서 어디에다 썼는지 알 수 있다.
	// -이러면 구인자쪽에서 변하는 이력서 항목을 보지 않을 수도 있고, 첨부파일로 저장돼 구직자도 어떻게 작성했는지 알 수 있다.
	
	// 입력이 완료되면 세부공고번호 갖고 가서 지원 테이블에 입력해야 한다.
	// 후에 마감되지 않았다면 입사지원서를 수정할 수 있거나 취소할 수 있다.
	
	// 1.공고에서 지원버튼을 누르면 입사지원서 새로 제출과 기존 이력서 제출 중 선택하는 화면으로 이동
	// form태그 하나로 두고 비동기로? -> 이게 좋을 듯!
	// 
	
	// applyForm
	// 비동기 세 가지 
	// 1. 첫 화면 => 1) 기존 이력서 선택, 2) 새로운 입사지원서 작성(기존 이력서 항목 입력 가능
	// 2. 두 번째 화면 => 기존 이력서 선택 시 그냥 불러와서 보여주고 확인한 후 체크박스 체크 후 resumeSn과 daNo을 같이 지원테이블에 등록
	//				=> 새로운 입사지원서 작성 시, 채용과정에 등록된 입사지원서 항목<table>만 넣어놓고 새로 입력하게 하거나, 기존 항목에서 고르기
	// 3. 세 번째 화면 => 작성한 내용 확인 다 하면 checkBox 체크 후 컨트롤러로 보내서 입사지원시키기
	
	// apply(main)
	// applyList : 내 지원현황
	// 각 회사별 채용과정 다면평가 현황(달력형, 선형, 일정표)
	// 지원한 회사 목록, 입사지원서(or 이력서) 제목, 날짜, 지원결과, 채용과정 다면평가(간단히)
	
	// applyView
	// 지원별 지원 세부내용(입사지원서 or 이력서), 채용과정 다면평가, 각 과정 내 점수, 각 과정 내 통계(와중에 보여줄지 끝나고 보여줄지..), 결과, 제출서류
	// 이의신청?
	
	// applyDocument
	// 제출서류 관리
	// 회사별, 공고별, 문서별, 확장자별 등의 여러 뷰 제
	
	@Inject
	private ApplyService service;
	
	@Inject
	private AnnoService annoService;
	
	@Inject
	private ResumeService resumeService;
	
	@Inject
	private MyintroService myintroService;
	
	@ModelAttribute
	public ApplyVO apply() {
		return new ApplyVO();
	}
	
	@ModelAttribute
	public AnnoVO anno() {
		return new AnnoVO();
	}
	
	@ModelAttribute
	public AnnoDetailVO detail() {
		return new AnnoDetailVO();
	}
	
	// 목록
	@GetMapping
	public String main(
		Model model
		, @AuthMember MemberVO authMember
	) {
		List<ApplyVO> applyList = service.retrieveApplyList(authMember.getMemId());
		model.addAttribute("applyList", applyList);
		return "apply/applyMain";
	}
	
	@GetMapping("/{applySn}")
	public String view(
		Model model
		, @PathVariable String applySn
		, @ModelAttribute("apply") ApplyVO apply
	) {
		apply = service.retrieveApply(applySn);
		model.addAttribute("apply", apply);
		return "apply/applyView";
	}
	
	// 입력,수정 폼
	@GetMapping("/form")
	public String form(
		Model model
		, @ModelAttribute("apply") ApplyVO apply
		, @ModelAttribute("anno") AnnoVO anno
		, @ModelAttribute("annoDetail") AnnoDetailVO detail
		, @RequestParam(value="applySn", required=false, defaultValue="") String applySn
		, @RequestParam(value="annoNo", required=false, defaultValue="") String annoNo
		, @AuthMember MemberVO authMember
		
	) {
		if (!applySn.equals("")) {
			apply = service.retrieveApply(applySn);
			annoNo = apply.getAnnoNo();
			model.addAttribute("apply", apply);
		}
		
		// 수정 시 공고 찾기
		/*
		if (annoNo == null || annoNo.equals("")) {
			apply가 갖고 있는 daNo로 annoNO을 찾아야 함
			annoNo가 갖고 있는 detail들 중 apply의 daNo와 같은 값을 갖고 있는 것 찾기
			List<AnnoDetailVO> detailList = anno.getDetailList();
			String daNo = apply.getDaNo();
			for (AnnoDetailVO vo : detailList) {
				if (vo.getDaNo().equals(daNo)) {
					annoNo = vo.getAnnoNo();
				}
			}
		}
		 */
		
		String memId = authMember.getMemId();
		anno = annoService.retrieveAnno(annoNo);
		
		List<ResumeVO> resumeList = resumeService.retrieveResumeList(memId);
		List<MyintroVO> myintroList = myintroService.retrieveMyintroList(memId);
		
		model.addAttribute("anno", anno);
		model.addAttribute("resumeList", resumeList);
		model.addAttribute("myintroList", myintroList);
		
		return "apply/applyForm"; 
	}
	
	// 입력
	@PostMapping
	public String insert(
		Model model
		, @ModelAttribute("apply") ApplyVO apply
		, @AuthMember MemberVO authMember
	) {
		apply.setMemId(authMember.getMemId());
		service.createApply(apply);
		return "redirect:/apply/" + apply.getApplySn();
	}
	
	// 수정폼
	@GetMapping("/edit")
	public String edit(
			Model model
			, @ModelAttribute("apply") ApplyVO apply
			, @ModelAttribute("anno") AnnoVO anno
			, @ModelAttribute("annoDetail") AnnoDetailVO detail
			, @RequestParam(value="applySn") String applySn
			, @AuthMember MemberVO authMember
	) {
		apply = service.retrieveApply(applySn);
		
		String memId = authMember.getMemId();
		String annoNo = apply.getAnnoNo();
		anno = annoService.retrieveAnno(annoNo);
		
		List<ResumeVO> resumeList = resumeService.retrieveResumeList(memId);
		List<MyintroVO> myintroList = myintroService.retrieveMyintroList(memId);
		
		model.addAttribute("apply", apply);
		model.addAttribute("anno", anno);
		model.addAttribute("resumeList", resumeList);
		model.addAttribute("myintroList", myintroList);
		
		return "apply/applyEdit"; 		
	}
	
	// 수정
	@PutMapping("/{applySn}")
//	@PatchMapping("/{applySn")
	public String update(
		Model model
		, @ModelAttribute("apply") ApplyVO apply
		, @PathVariable String applySn
	) {
		apply.setApplySn(applySn);
		service.modifyApply(apply);
		return "redirect:/apply/" + applySn;
	}
	
	// 삭제
	@DeleteMapping("/{applySn}")
	public String delete(
		Model model
		, @PathVariable String applySn
	) {
		service.removeApply(applySn);
		return "redirect:/apply";
	}
	
	// 지원 목록
	@ResponseBody
	@GetMapping(value="/applicant", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<ApplyVO> applicantList(
		@RequestParam String daNo
		, @RequestParam String processCodeId
		, @RequestParam(value="finalResult", required=false) String finalResult
		, @AuthMember MemberVO member
	) throws JsonProcessingException, IllegalArgumentException {
		Map<String, String> map = new HashMap<>();
		map.put("daNo", daNo);
		map.put("processCodeId", processCodeId);
		if (finalResult != null) {
			map.put("finalResult", finalResult);
		}
		List<ApplyVO> applicant = service.retrieveApplicant(map);
		return applicant;
	}
	
//	// 지원 목록 순위
//	@ResponseBody
//	@GetMapping(value="/applyRanking", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
//	public List<ApplyVO> applyRanking(
//			@RequestParam String daNo
//			, @RequestParam String processCodeId
//			) throws JsonProcessingException, IllegalArgumentException {
//		List<ApplyVO> applicant = service.retrieveApplicant(daNo, processCodeId);
//		return applicant;
//	}
	
	// 점수 입력
	@ResponseBody
	@PatchMapping(value="/updateScore", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public void updateScore(
		@RequestBody Map<String, String> param
	) {
/*		Iterator<Map.Entry<String, Object>> itr = param.entrySet().iterator();
		while (itr.hasNext()) {
			Map.Entry<String, Object> it = itr.next();
			System.out.println("key : " + it.getKey() + ", value : " + it.getValue()); 
		}*/
		service.modifyScore(param);
	}
	
	// 명단 결과 상태 수정
	@ResponseBody
	@PatchMapping(value="/updateResult", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public void updateResult(
//		@RequestBody ObjectNode obj
		@RequestBody List<ApplyVO> resultList
	) throws JsonProcessingException, IllegalArgumentException {
//		ObjectMapper mapper = new ObjectMapper();
//		mapper.enable(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY); 
//		List<ApplyVO> resultList = mapper.treeToValue(obj.get("resultList"), List.class);
//		List<ApplyVO> resultList = mapper.readValue(obj, new TypeReference<List<ApplyVO>>() {});
//		String daNo = mapper.treeToValue(obj.get("daNo"), String.class);
		service.modifyResult(resultList);
	}
}
