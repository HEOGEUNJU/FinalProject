package kr.or.ddit.process.controller;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
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

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import kr.or.ddit.announcement.service.AnnoService;
import kr.or.ddit.announcement.vo.AnnoDetailVO;
import kr.or.ddit.announcement.vo.AnnoVO;
import kr.or.ddit.commons.AttachService;
import kr.or.ddit.process.service.ProcessService;
import kr.or.ddit.process.vo.ItemVO;
import kr.or.ddit.process.vo.ProcessVO;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.system.service.AlarmService;
import kr.or.ddit.ui.fullcalendar.AnnoFullCalendarEvent;
import kr.or.ddit.ui.fullcalendar.DetailFullCalendarEvent;
import kr.or.ddit.ui.fullcalendar.FullCalendarEvent;
import kr.or.ddit.ui.fullcalendar.ProcessFullCalendarEvent;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemberVOWrapper;
import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 최경수
 * @since 2023. 2. 4.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자         수정내용
 * --------     --------    ----------------------
 * 2023. 2. 4.      최경수       최초작성
 * 2023. 2. 17.     최경수       채용과정 추가, 수정, 삭제
 * 2023. 2. 20.     최경수       채용과정 세부
 * 2023. 2. 23.     최경수       세부 항목
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */

@Slf4j
@Controller
@RequestMapping("/process")
public class ProcessController {

	// 세부공고 작성 시 or 세부공고 작성 후 채용과정 등록 가능
	// 등록버튼을 누르면 해당 폼으로 이동하여 어떤 채용과정을 거칠지 과정 사용 여부를 결정한다.(checkBox??)
	// 등록하면 각 채용과정에서 세부항목들을 정할 수 있다. 안 정하면 그냥 기본을 다 들어가게 된다.
	// 세부항목의 경우 질문을 정할 수 있다. ex) 자기소개서 성격장단점 -> 자신의 성격의 단점을 어떻게 극복하셨나요?
	
	@Inject
	private ProcessService service;
	
	@Inject
	private AnnoService annoService;
	
	@Inject
	private AttachService attachService;
	
	@Inject
	private AlarmService alarmService;
	
	@ModelAttribute
	public ProcessVO process() {
		return new ProcessVO();
	}
	
	@ModelAttribute
	public AnnoVO anno() {
		return new AnnoVO();
	}
	
	@ModelAttribute
	public AnnoDetailVO detail() {
		return new AnnoDetailVO();
	}
	
	@ModelAttribute
	public ItemVO item() {
		return new ItemVO();
	}
	
	// 채용과정 메인
	@GetMapping
	public String main(
		Model model
		, @AuthMember MemberVO authMember
	) throws ParseException {
		String cmpId = authMember.getIncruiterVO().getCmpId();
		String memId = authMember.getMemId();
//		List<ProcessVO> processList = service.retrieveProcessList(cmpId);
//		List<AnnoVO> list = annoService.retrieveMyAnnoList(memId);
//		
//		for (AnnoVO anno : list) {
//			anno.setDetailList((annoService.retrieveAnno(anno.getAnnoNo()).getDetailList()));
//			for (AnnoDetailVO da : anno.getDetailList()) {
//				if (da.getDaNo().equals(processList.get(0).getDaNo())) {
//					da.setProcessList(processList);
//				}
//			}
//		}
//		model.addAttribute("processList", processList);
		
		List<AnnoVO> list = annoService.retrieveMyAnnoList(memId);
		
		String now = LocalDate.now().toString().replace("-", "");
		DateFormat format = new SimpleDateFormat("yyyyMMdd");
		Date n = format.parse(now);
		double nDays = n.getTime()/(1000*60*60*24);
		for (AnnoVO vo : list) {
			Date sd = format.parse(vo.getAnnoStartdate().replace("-", ""));
			double sDays = sd.getTime()/(1000*60*60*24);
			Date ed = format.parse(vo.getAnnoEnddate().replace("-", ""));
			double eDays = ed.getTime()/(1000*60*60*24);
			double percent = 0;
			if (sDays <= nDays && nDays <= eDays) {
				percent = (double)(100/(eDays-sDays))*(nDays-sDays);
			} else if (eDays < nDays) {
				percent = 100;
			} 
			vo.setPercent(percent);
		}
		
		model.addAttribute("list", list);
		return "process/processMain";
	}
	
	// 공고 목록
	@GetMapping("/list")
	public String processAnnoView(
		Model model
		, @AuthMember MemberVO authMember
	) throws ParseException { // 예외처리 하기
		String memId = authMember.getMemId();
		List<AnnoVO> list = annoService.retrieveMyAnnoList(memId);
		
		// 서비스로 옮기기
		String now = LocalDate.now().toString().replace("-", "");
		DateFormat format = new SimpleDateFormat("yyyyMMdd");
		Date n = format.parse(now);
		double nDays = n.getTime()/(1000*60*60*24);
		for (AnnoVO vo : list) {
			Date sd = format.parse(vo.getAnnoStartdate().replace("-", ""));
			double sDays = sd.getTime()/(1000*60*60*24);
			Date ed = format.parse(vo.getAnnoEnddate().replace("-", ""));
			double eDays = ed.getTime()/(1000*60*60*24);
			double percent = 0;
			if (sDays <= nDays && nDays <= eDays) {
				percent = (double)(100/(eDays-sDays))*(nDays-sDays);
			} else if (eDays < nDays) {
				percent = 100;
			} 
			vo.setPercent(percent);
		}
		
		model.addAttribute("list", list);
		return "process/processAnnoList";
	}
	
	// 한 공고 - 여러 세부 공고 - 여러 채용과정
	@GetMapping("/{annoNo}")
	public String processDaView(
		Model model
		, @PathVariable String annoNo
		, @AuthMember MemberVO authMember
	) throws ParseException { // 예외처리 하기
		AnnoVO anno = annoService.retrieveAnnoDetailProcess(annoNo);
		
		String now = LocalDate.now().toString().replace("-", "");
		// 서비스로 옮기기
		// 선형진행도
		DateFormat format = new SimpleDateFormat("yyyyMMdd");
		Date n = format.parse(now);
		double nDays = n.getTime()/(1000*60*60*24);
		List<AnnoDetailVO> detailList = anno.getDetailList();
		for (AnnoDetailVO vo : detailList) {
			List<ProcessVO> processList = vo.getProcessList();
			double percent = 0;
			if (processList.size() > 1){
				int index = 0;
				Date sd = null;
				double sDays = 0;
				Date ed = null;
				double eDays = 0;
				for (ProcessVO pvo : processList) {
					if (index == 0) {
						sd = format.parse(pvo.getProcessStartDate().replace("-", ""));
						sDays = sd.getTime()/(1000*60*60*24);
					} else if (index == processList.size() - 1) {
						ed = format.parse(pvo.getProcessEndDate().replace("-", ""));
						eDays = ed.getTime()/(1000*60*60*24);
					}
					index++;
				}
				if (sDays <= nDays && nDays <= eDays) {
					percent = (double)(100/(eDays-sDays))*(nDays-sDays);
				} else if (eDays < nDays) {
					percent = 100;	
				}
					
			}
			vo.setPercent(percent);
		}
		
		model.addAttribute("now", now);
		model.addAttribute("anno", anno);
		return "process/processDaView";
	}
	
	// 한 세부 공고 - 여러 채용과정 - 여러 항목들
	@GetMapping("/{annoNo}/{daNo}")
	public String view(
		Model model
		, @PathVariable String annoNo
		, @PathVariable String daNo
		, @ModelAttribute("process") ProcessVO process
	) throws ParseException { // 예외처리 하기, 서비스로 옮기기
		AnnoVO anno = annoService.retrieveAnnoDetailProcess(annoNo);
		
		List<AnnoDetailVO> detailList = anno.getDetailList();
		if (detailList.size() > 1 ) {
			List<AnnoDetailVO> removed = new ArrayList<>();
			for (AnnoDetailVO vo : detailList) {
				if (!vo.getDaNo().equals(daNo)) {
					removed.add(vo);
				}
			}
			detailList.removeAll(removed);
		}
		
		for(ProcessVO vo : detailList.get(0).getProcessList()) {
			String tblId = vo.getDaNo() + vo.getProcessCodeId();
			vo.setAttatchList(attachService.retireveAttatchList(tblId));
		}
		
		String now = LocalDate.now().toString().replace("-", "");
		// 서비스로 옮기기
		// 선형진행도
		DateFormat format = new SimpleDateFormat("yyyyMMdd");
		Date n = format.parse(now);
		double nDays = n.getTime()/(1000*60*60*24);
		
		for (AnnoDetailVO vo : detailList) {
			List<ProcessVO> processList = vo.getProcessList();
			double percent = 0;
			if (processList.size() > 1){
				int index = 0;
				Date sd = null;
				double sDays = 0;
				Date ed = null;
				double eDays = 0;
				for (ProcessVO pvo : processList) {
					if (index == 0) {
						sd = format.parse(pvo.getProcessStartDate().replace("-", ""));
						sDays = sd.getTime()/(1000*60*60*24);
					} else if (index == processList.size() - 1) {
						ed = format.parse(pvo.getProcessEndDate().replace("-", ""));
						eDays = ed.getTime()/(1000*60*60*24);
					}
					index++;
				}
				if (sDays <= nDays && nDays <= eDays) {
					percent = (double)(100/(eDays-sDays))*(nDays-sDays);
				} else if (eDays < nDays) {
					percent = 100;	
				}
					
			}
			vo.setPercent(percent);
		}
		
		// 서비스로 옮기기
		// 세부항목 넣기
		List<ItemVO> itemList = service.retrieveItemList(daNo);
		
		for (AnnoDetailVO vo : detailList) {
			List<ProcessVO> processList = vo.getProcessList();
			for (ProcessVO pvo : processList) {
				List<ItemVO> iList = pvo.getItemList();
					iList.remove(0);
					for (ItemVO itemVO : itemList) {
						if(pvo.getProcessCodeId().equals(itemVO.getProcessCodeId())) {
							iList.add(itemVO);
						}
					}
				
			}
		}
		
		
		model.addAttribute("now", now);
		model.addAttribute("anno", anno);
		return "process/processView";
	}
	
	// 한 세부 공고 - 여러 채용과정 - 여러 항목들(ajax)
	// value 똑같아도 되나?...
	// 나중에 합치기
	@GetMapping(value="/{annoNo}/{daNo}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String ajaxView(
			Model model
			, @PathVariable String annoNo
			, @PathVariable String daNo
			, @ModelAttribute("process") ProcessVO process
			) throws ParseException { // 예외처리 하기
		AnnoVO anno = annoService.retrieveAnnoDetailProcess(annoNo);
		
		List<AnnoDetailVO> detailList = anno.getDetailList();
		if (detailList.size() > 1 ) {
			List<AnnoDetailVO> removed = new ArrayList<>();
			for (AnnoDetailVO vo : detailList) {
				if (!vo.getDaNo().equals(daNo)) {
					removed.add(vo);
				}
			}
			detailList.removeAll(removed);
		}
		
		String now = LocalDate.now().toString().replace("-", "");
		// 서비스로 옮기기
		// 선형진행도
		DateFormat format = new SimpleDateFormat("yyyyMMdd");
		Date n = format.parse(now);
		double nDays = n.getTime()/(1000*60*60*24);
		
		for (AnnoDetailVO vo : detailList) {
			List<ProcessVO> processList = vo.getProcessList();
			double percent = 0;
			if (processList.size() > 1){
				int index = 0;
				Date sd = null;
				double sDays = 0;
				Date ed = null;
				double eDays = 0;
				for (ProcessVO pvo : processList) {
					if (index == 0) {
						sd = format.parse(pvo.getProcessStartDate().replace("-", ""));
						sDays = sd.getTime()/(1000*60*60*24);
					} else if (index == processList.size() - 1) {
						ed = format.parse(pvo.getProcessEndDate().replace("-", ""));
						eDays = ed.getTime()/(1000*60*60*24);
					}
					index++;
				}
				if (sDays <= nDays && nDays <= eDays) {
					percent = (double)(100/(eDays-sDays))*(nDays-sDays);
				} else if (eDays < nDays) {
					percent = 100;	
				}
				
			}
			vo.setPercent(percent);
		}
		
		// 서비스로 옮기기
		// 세부항목 넣기
		List<ItemVO> itemList = service.retrieveItemList(daNo);
		
		for (AnnoDetailVO vo : detailList) {
			List<ProcessVO> processList = vo.getProcessList();
			for (ProcessVO pvo : processList) {
				List<ItemVO> iList = pvo.getItemList();
				iList.remove(0);
				for (ItemVO itemVO : itemList) {
					if(pvo.getProcessCodeId().equals(itemVO.getProcessCodeId())) {
						iList.add(itemVO);
					}
				}
				
			}
		}
		
		model.addAttribute("now", now);
		model.addAttribute("anno", anno);
		return "jsonView";
	}
	
	@ResponseBody
	@GetMapping(value="/notAdded", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<ItemVO> ajaxNotAdded(@RequestParam("daNo") String daNo) {
		List<ItemVO> notAddedList = service.retireveItemListNotAdded(daNo);
		return notAddedList;
	}
	
	// 입력폼
	@GetMapping("/form")
	public String form(
		Model model
		, @ModelAttribute("process") ProcessVO process
		, @RequestParam("annoNo") String annoNo
		, @RequestParam("daNo") String daNo
	) {
		AnnoVO anno = annoService.retrieveAnnoDetailProcess(annoNo);
		
		List<AnnoDetailVO> detailList = anno.getDetailList();
		if (detailList.size() > 1 ) {
			List<AnnoDetailVO> removed = new ArrayList<>();
			for (AnnoDetailVO vo : detailList) {
				if (!vo.getDaNo().equals(daNo)) {
					removed.add(vo);
				}
			}
			detailList.removeAll(removed);
		}
		
		model.addAttribute("anno",anno);
		model.addAttribute("daNo", daNo);
		return "process/processForm";
	}
	
	// 채용과정 입력
	@PostMapping
	public String insert(
		Model model
		, @ModelAttribute("process") ProcessVO process
		, @RequestParam String annoNo
		, @RequestParam String daNo
	) {
		//jsp에서 넘어옴
		List<ProcessVO> list = process.getProcessList();
		
		//최종
		List<ProcessVO> resultList = new ArrayList<ProcessVO>();
		
		for (ProcessVO vo : list) {
			if (!vo.getProcessStartDate().equals("")) {
				resultList.add(vo);
			}
		}
		
		process.setProcessList(resultList);
		
		service.createProcess(process);
		return "redirect:/process/" + annoNo + "/" + daNo; // /{annoNo}/{daNo}
	}
	
	// 채용과정 수정폼
	@GetMapping("/edit")
	public String edit(
		Model model
		, @ModelAttribute("process") ProcessVO process
		, @RequestParam("daNo") String daNo
		, @RequestParam("annoNo") String annoNo
	) {
		AnnoVO anno = annoService.retrieveAnnoDetailProcess(annoNo);
		
		List<AnnoDetailVO> detailList = anno.getDetailList();
		if (detailList.size() > 1 ) {
			List<AnnoDetailVO> removed = new ArrayList<>();
			for (AnnoDetailVO vo : detailList) {
				if (!vo.getDaNo().equals(daNo)) {
					removed.add(vo);
				}
			}
			detailList.removeAll(removed);
		}
		
		model.addAttribute("anno",anno);
		model.addAttribute("daNo", daNo);
		
		model.addAttribute("process", process);
		return "process/processEdit";
	}
	
	// 채용과정 수정
//	@PutMapping("{daNo}")
	@PostMapping("/edit")
	public String update(
		Model model
		, @RequestParam String daNo
		, @RequestParam String annoNo
		, @ModelAttribute("process") ProcessVO process
	) {
		service.modifyProcess(process);
		return "redirect:/process/" + annoNo + "/" + daNo;
	}
	
	// 채용과정 삭제
	@DeleteMapping("{daNo}")
	public String delete(
		Model model
		, @PathVariable String daNo
	) {
		service.removeProcess(daNo);
		return "redirect:/process";
	}

	// 세부공고 - 모달 : 항목 추가
	@PostMapping(value="/item", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String ajaxInsertOriginItem(
		Model model
		, @ModelAttribute("process") ProcessVO process
		, @AuthMember MemberVO member
	) {
		// 양식에도 등록하기 위한 cmpId
		String cmpId = member.getIncruiterVO().getCmpId();
		
		service.createItemList(process.getItemList(), cmpId);
		return "jsonView";
	}
	
	// 세부공고 - 항목 삭제
	@ResponseBody
	@DeleteMapping(value="/item", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public void ajaxDeleteItem(
		@RequestBody ItemVO item
	) {
		service.removeItem(item);
	}
	
	// 세부공고 - 항목 수정
	// https://blog.naver.com/PostView.naver?blogId=admass&logNo=222116280957&parentCategoryNo=&categoryNo=4&viewDate=&isShowPopularPosts=false&from=postView
	@ResponseBody
	@PutMapping(value="/item", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public void ajaxUpdateItem(
		@RequestBody ObjectNode saveObj
		, @AuthMember MemberVO member // 되나 이거?
	) throws JsonProcessingException, IllegalArgumentException { // 나중에 예외처리 해야 함
		 ObjectMapper mapper = new ObjectMapper();
		 ItemVO item = mapper.treeToValue(saveObj.get("item"), ItemVO.class);
		 String originCodeId = mapper.treeToValue(saveObj.get("originCodeId"), String.class);
		 
		 // 양식도 수정하기 위한 cmpId
		 String cmpId = member.getIncruiterVO().getCmpId();
		 
		 service.modifyItem(item, originCodeId, cmpId);
	}
	
	@ResponseBody
	@GetMapping(value="/itemFormList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<ItemVO> ajaxSelectAllItem(
		@AuthMember MemberVO member
		, @RequestParam String daNo
	) {
		String cmpId = member.getIncruiterVO().getCmpId();
		List<ItemVO> formList = service.retrieveItemFormList(cmpId, daNo);
		return formList;
	}
	
	@ResponseBody
	@GetMapping(value="/events", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<FullCalendarEvent<AnnoVO>> events(
		@RequestParam @DateTimeFormat(iso=ISO.DATE_TIME) LocalDateTime start
		, @RequestParam @DateTimeFormat(iso=ISO.DATE_TIME) LocalDateTime end
		, @RequestParam @DateTimeFormat(pattern="yyyy-MM-dd") Date date
		, @RequestParam("date") @DateTimeFormat(pattern="yyyy-MM-dd") long dateTime
		, @AuthMember MemberVO authMember
		, Authentication auth
	) {
		String role = auth.getAuthorities().toString();
		String memId = authMember.getMemId();
		List<AnnoVO> annoList = new ArrayList<>();
		if (role.contains("SEEKER")) {
			annoList = annoService.retrieveMyAnnoListSeeker(memId);
		} else if (role.contains("INCRUITER")) {
			annoList = annoService.retrieveMyAnnoList(memId);
		}
		List<FullCalendarEvent<AnnoVO>> list = annoList.stream().map(AnnoFullCalendarEvent::new).collect(Collectors.toList());
		return list;
	}
	
	@ResponseBody
	@GetMapping(value="/events/details", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<FullCalendarEvent<AnnoDetailVO>> details(
		@RequestParam @DateTimeFormat(iso=ISO.DATE_TIME) LocalDateTime start
		, @RequestParam @DateTimeFormat(iso=ISO.DATE_TIME) LocalDateTime end
		, @RequestParam @DateTimeFormat(pattern="yyyy-MM-dd") Date date
		, @RequestParam("date") @DateTimeFormat(pattern="yyyy-MM-dd") long dateTime
		, @AuthMember MemberVO authMember
		, Authentication auth
	) {
		String role = auth.getAuthorities().toString();
		String memId = authMember.getMemId();
		List<AnnoVO> annoList = new ArrayList<>();
		List<AnnoDetailVO> detailList = new ArrayList<>();
		
		if (role.contains("SEEKER")) {
			annoList = annoService.retrieveMyAnnoListSeeker(memId);
			for (AnnoVO vo : annoList) {
				List<AnnoDetailVO> dList = vo.getDetailList();
				for (AnnoDetailVO da : dList) {
					detailList.add(da);
				}
			}
		} else if (role.contains("INCRUITER")) {
			annoList = annoService.retrieveMyAnnoList(memId);
			for (AnnoVO vo : annoList) {
				List<AnnoDetailVO> dList = vo.getDetailList();
				for (AnnoDetailVO da : dList) {
					detailList.add(da);
				}
			}
		}
		
		List<FullCalendarEvent<AnnoDetailVO>> list = detailList.stream().map(DetailFullCalendarEvent::new).collect(Collectors.toList());
		return list;
	}
	
	@ResponseBody
	@GetMapping(value="/events/details/process", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<FullCalendarEvent<ProcessVO>> process(
		@RequestParam @DateTimeFormat(iso=ISO.DATE_TIME) LocalDateTime start
		, @RequestParam @DateTimeFormat(iso=ISO.DATE_TIME) LocalDateTime end
		, @RequestParam @DateTimeFormat(pattern="yyyy-MM-dd") Date date
		, @RequestParam("date") @DateTimeFormat(pattern="yyyy-MM-dd") long dateTime
		, @AuthMember MemberVO authMember
		, Authentication auth
	) {
		String role = auth.getAuthorities().toString();
		String memId = authMember.getMemId();
		List<AnnoVO> annoList = new ArrayList<>();
		List<ProcessVO> processList = new ArrayList<>();
		if (role.contains("SEEKER")) {
			annoList = annoService.retrieveMyAnnoListSeeker(authMember.getMemId());
			for (AnnoVO vo : annoList) {
				List<AnnoDetailVO> dList = vo.getDetailList();
				for (AnnoDetailVO da : dList) {
					List<ProcessVO> pList = da.getProcessList();
					for (ProcessVO pv : pList) {
						processList.add(pv);
					}
				}
			}
		} else if (role.contains("INCRUITER")) {
			annoList = annoService.retrieveMyAnnoList(authMember.getMemId());
			for (AnnoVO vo : annoList) {
				List<AnnoDetailVO> dList = vo.getDetailList();
				for (AnnoDetailVO da : dList) {
					List<ProcessVO> pList = da.getProcessList();
					for (ProcessVO pv : pList) {
						processList.add(pv);
					}
				}
			}
		}
		
//		List<FullCalendarEvent<ProcessVO>> list = new ArrayList<FullCalendarEvent<ProcessVO>>();
//		for(ProcessVO pv : processList) {
//			String color = new ProcessFullCalendarEvent(pv).getBackgroundColor();
//			list.add(new ProcessFullCalendarEvent(pv));
//		}
		
		List<FullCalendarEvent<ProcessVO>> list = processList.stream().map(ProcessFullCalendarEvent::new).collect(Collectors.toList());
		return list;
	}
	
	@ResponseBody
	@GetMapping(value="/alarm", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<AlarmVO> alarm(
		Authentication auth
		, Model model
	){
		String memId = auth.getName();
		List<AlarmVO> list = alarmService.retrieveAlarmList(memId);
		return list;
	}
}
