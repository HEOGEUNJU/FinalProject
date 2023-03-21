package kr.or.ddit.announcement.dao;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.or.ddit.announcement.vo.AnnoDetailVO;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:webapp/WEB-INF/spring/*-context.xml")
@WebAppConfiguration
public class AnnoDAOTest {

	@Inject
	private AnnoDAO annoDAO;
	
	@Inject
	private AnnoDetailVO detail;
	
	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void insertDetailTest() {
		
	}

}
