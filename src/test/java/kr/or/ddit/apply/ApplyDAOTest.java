package kr.or.ddit.apply;

import static org.junit.Assert.*;

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
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringRunner.class)
@ContextConfiguration("file:webapp/WEB-INF/spring/*-context.xml")
@WebAppConfiguration
public class ApplyDAOTest {

	@Inject
	private ApplyDAO dao;
	
	private Map<String, String> map = new HashMap();
	
	@Before
	public void setup() {
		map.put("daNo", "AD000178");
		map.put("processCodeId", "PRC04");
		map.put("finalResult", "Y");
	}
	
//	@Test
	public void test() {
		List<ApplyVO> applicantList = dao.selectApplicant(map);
		for (ApplyVO vo : applicantList) {
			log.info("가져온 지원자들 : {}", vo.getResume().getResumeName());
			
		}
	}
	
//	@Test
	public void applySnList() {
		List<String> list = dao.selectApplySnList("AD000178");
		for (String str : list) {
			log.info("가져온 목록 {}", str);
		}
	}
	
	@Test
	public void finalList() {
		List<ApplyVO> list = dao.selectApplicant(map);
		for (ApplyVO vo : list) {
			log.info("이름  >>> {}", vo.getResume().getResumeName());
			log.info("이력서>>> {}", vo.getResume().getResumeTitle());
			log.info("총점1  >>> {}", vo.getScoreIndepth().getTotal());
			log.info("총점2  >>> {}", vo.getScoreIndepth().getIndepthTotal());
			log.info("평귱  >>> {}", vo.getScoreIndepth().getAvg());
		}
	}

}
