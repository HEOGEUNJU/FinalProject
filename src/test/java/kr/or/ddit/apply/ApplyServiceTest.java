package kr.or.ddit.apply;

import static org.junit.Assert.*;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.or.ddit.apply.dao.ApplyDAO;
import kr.or.ddit.apply.vo.ApplyVO;
import kr.or.ddit.apply.vo.ScoreResumeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringRunner.class)
@ContextConfiguration("file:webapp/WEB-INF/spring/*-context.xml")
@WebAppConfiguration
public class ApplyServiceTest {

	@Inject
	private ApplyDAO dao;
	
	private String daNo;
	private String processCodeId;
	
	@Before
	public void setup() {
		daNo = "AD000178";
		processCodeId = "PRC01";
	}
	
	@Test
	public void test() {
		Map<String, String> map = new HashMap<>();
		map.put("daNo", daNo);
		map.put("processCodeId", processCodeId);
		List<ApplyVO> applicantList = dao.selectApplicant(map);
		List<ApplyVO> modifiedList = new ArrayList<>();
		for (ApplyVO vo : applicantList) {
			String vp = vo.getProcessCodeId();
			if (processCodeId.equals("PRC01")) {
				ScoreResumeVO score = vo.getScoreResume();
				for (Field field : ScoreResumeVO.class.getDeclaredFields()) {
					if (field.getName().startsWith("itm")) {
						log.info("필드 가져오기 >>> {}", field.getName());
					}
				}
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
		
	}

}
