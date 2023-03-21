package kr.or.ddit.apply.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.apply.dao.ApplyDAO;
import kr.or.ddit.apply.vo.ApplyVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.process.service.ProcessService;
import kr.or.ddit.resume.service.ResumeService;
import kr.or.ddit.resume.vo.ResumeVO;
import kr.or.ddit.system.service.AlarmService;
import kr.or.ddit.vo.AlarmVO;

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
 * 2023. 2. 27.      최경수       지원자 목록 가져오기
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Service
public class ApplyServiceImpl implements ApplyService {

	@Inject
	private ApplyDAO dao;
	
	@Inject
	private ProcessService processService;
	
	@Inject
	private ResumeService resumeService;
	
	@Inject
	private AlarmService alarmService;
	
	@Override
	public ApplyVO retrieveApply(String applySn) {
		ApplyVO apply = dao.selectApply(applySn);
		return apply;
	}

	@Override
	public List<ApplyVO> retrieveApplyList(String memId) {
		List<ApplyVO> list = dao.selectApplyList(memId);
		return list;
	}

	@Override
	public ServiceResult createApply(ApplyVO apply) {
		int rowcnt = dao.insertApply(apply);
		String applySn = apply.getApplySn();
		rowcnt += dao.insertScore(applySn);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modifyApply(ApplyVO apply) {
		int rowcnt = dao.updateApply(apply);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeApply(String applySn) {
		int rowcnt = dao.deleteApply(applySn);
		List<String> processList = new ArrayList<>();
		processList.add("SCORE_COMP");
		processList.add("SCORE_DISCUSS");
		processList.add("SCORE_INDEPTH");
		processList.add("SCORE_INTERN");
		processList.add("SCORE_INTRO");
		processList.add("SCORE_PRACTICE");
		processList.add("SCORE_RESUME");
		processList.add("SCORE_TEST");
		Map<String, String> map = new HashMap<>();
		map.put("applySn", applySn);
		for (String str : processList) {
			map.put("process", str);
			dao.deleteScore(map);
		}
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<ApplyVO> retrieveApplicant(Map<String, String> map) {
		String processCodeId = map.get("processCodeId");
		List<ApplyVO> applicantList = dao.selectApplicant(map);
		List<ApplyVO> modifiedList = new ArrayList<>();
		for (ApplyVO vo : applicantList) {
			String vp = vo.getProcessCodeId();
			if (processCodeId.equals("PRC01")) {
				vo.setSelected(vo.getScoreResume());
				modifiedList.add(vo);
			} else if (processCodeId.equals("PRC02") && !vp.equals("PRC01")) {
				vo.setSelected(vo.getScoreIntro());
				modifiedList.add(vo);
			} else if (processCodeId.equals("PRC03") && !vp.equals("PRC01") && !vp.equals("PRC02")) {
				vo.setSelected(vo.getScoreTest());
				modifiedList.add(vo);
			} else if (processCodeId.equals("PRC04") && !vp.equals("PRC01") && !vp.equals("PRC02") && !vp.equals("PRC03")) {
				vo.setSelected(vo.getScoreComp());
				modifiedList.add(vo);
			} else if (processCodeId.equals("PRC05") && !vp.equals("PRC01") && !vp.equals("PRC02") && !vp.equals("PRC03") && !vp.equals("PRC04")) {
				vo.setSelected(vo.getScoreDiscuss());
				modifiedList.add(vo);
			} else if (processCodeId.equals("PRC06") && !vp.equals("PRC01") && !vp.equals("PRC02") && !vp.equals("PRC03") && !vp.equals("PRC04") && !vp.equals("PRC05")) {
				vo.setSelected(vo.getScorePractice());
				modifiedList.add(vo);
			} else if (processCodeId.equals("PRC07") && !vp.equals("PRC01") && !vp.equals("PRC02") && !vp.equals("PRC03") && !vp.equals("PRC04") && !vp.equals("PRC05") && !vp.equals("PRC06")) {
				vo.setSelected(vo.getScoreIntern());
				modifiedList.add(vo);
			} else if (processCodeId.equals("PRC08") && !vp.equals("PRC01") && !vp.equals("PRC02") && !vp.equals("PRC03") && !vp.equals("PRC04") && !vp.equals("PRC05") && !vp.equals("PRC06") && !vp.equals("PRC07")) {
				vo.setSelected(vo.getScoreIndepth());
				modifiedList.add(vo);
			}
		}
		
		return modifiedList;
	}

	@Override
	public ServiceResult modifyScore(Map<String, String> map) {
		String processCodeId = map.get("processCodeId");
//		List<ApplyVO> oneList = dao.selectApplicant(map);
//		ApplyVO one = oneList.get(0);
		if (processCodeId.equals("PRC01")) {
			map.put("table", "SCORE_RESUME");
//			map.put("total", "RESUME_TOTAL");
//			map.put("totalScore", one.getScoreResume().getTotal() + Integer.parseInt(map.get("score")) + "");
		} else if (processCodeId.equals("PRC02")) {
			map.put("table", "SCORE_INTRO");	
//			map.put("total", "INTRO_TOTAL");
//			map.put("totalScore", one.getScoreIntro().getTotal() + Integer.parseInt(map.get("score")) + "");
		} else if (processCodeId.equals("PRC03")) {
			map.put("table", "SCORE_TEST");
//			map.put("total", "TEST_TOTAL");
//			map.put("totalScore", one.getScoreTest().getTotal() + Integer.parseInt(map.get("score")) + "");
		} else if (processCodeId.equals("PRC04")) {
			map.put("table", "SCORE_COMP");
//			map.put("total", "COMPETE_TOTAL");
//			map.put("totalScore", one.getScoreComp().getTotal() + Integer.parseInt(map.get("score")) + "");
		} else if (processCodeId.equals("PRC05")) {
			map.put("table", "SCORE_DISCUSS");
//			map.put("total", "DISCUSS_TOTAL");
//			map.put("totalScore", one.getScoreDiscuss().getTotal() + Integer.parseInt(map.get("score")) + "");
		} else if (processCodeId.equals("PRC06")) {
			map.put("table", "SCORE_PRACTICE");
//			map.put("total", "PRACTICE_TOTAL");
//			map.put("totalScore", one.getScorePractice().getTotal() + Integer.parseInt(map.get("score")) + "");
		} else if (processCodeId.equals("PRC07")) {
			map.put("table", "SCORE_INTERN");
//			map.put("total", "INTERN_TOTAL");
//			map.put("totalScore", one.getScoreIntern().getTotal() + Integer.parseInt(map.get("score")) + "");
		} else if (processCodeId.equals("PRC08")) {
			map.put("table", "SCORE_INDEPTH");
//			map.put("total", "INDEPTH_TOTAL");
//			map.put("totalScore", one.getScoreIndepth().getTotal() + Integer.parseInt(map.get("score")) + "");
		}
		int rowcnt = dao.updateScore(map);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modifyScoreZero(String table, String itemCodeId, String applySn) {
		Map<String, String> map = new HashMap<>();
		map.put("table", table);
		map.put("itemCodeId", itemCodeId);
		map.put("applySn", applySn);
		int rowcnt = dao.updateScoreZero(map);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<String> retireveApplySnList(String daNo) {
		List<String> list = dao.selectApplySnList(daNo);
		return list;
	}
	
	@Override
	public ServiceResult modifyResult(List<ApplyVO> resultList) {
		int rowcnt = 0;
		String daNo = resultList.get(0).getDaNo();
		List<String> processList = processService.retrieveProcessListFor(daNo);
		for (ApplyVO vo : resultList) {
			
			String pcid = vo.getProcessCodeId();
			String result = vo.getApplyResult();
			ApplyVO origin = dao.selectApply(vo.getApplySn());
			String memId = origin.getMemId();
			String daFd = origin.getDetail().getDaFd();
			String pcn = origin.getProcess().getProcessCodeName();
			String cmpName = origin.getCompany().getCmpName();
			for (int i = 0; i < processList.size(); i++) {
				if (pcid.equals(processList.get(i))) {
					AlarmVO alarm = new AlarmVO();
					alarm.setMemId(memId);
					alarm.setAlarmCategory("채용과정");
					alarm.setAlarmDetail(pcid);
					if (!pcid.equals("PRC08")) {
						if (result.equals("합격")) {
							vo.setProcessCodeId(processList.get(i + 1));
							vo.setApplyResult("진행중");
							dao.updateResult(vo);
							alarm.setAlarmContent(cmpName + " " + daFd + "공고의" + pcn +"과정에 합격하셨습니다. 다음 과정을 확인해주세요.");
						} else {
							dao.updateResult(vo);
							alarm.setAlarmContent(cmpName + " " + daFd + "에 불합격하셨습니다.");
						}
					} else {
						if (result.equals("합격")) {
							vo.setApplyResult("최종합격");
							dao.updateResult(vo);
							alarm.setAlarmContent(cmpName + " " + daFd + "에 최종합격하셨습니다. 축하합니다!");
						} else {
							dao.updateResult(vo);
							alarm.setAlarmContent(cmpName + " " + daFd + "에 불합격하셨습니다.");
						}
					}
					alarmService.createAlarm(alarm);
				}
			}

		}
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

}