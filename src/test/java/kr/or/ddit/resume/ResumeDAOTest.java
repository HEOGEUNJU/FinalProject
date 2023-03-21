package kr.or.ddit.resume;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Test;

import kr.or.ddit.resume.dao.CareerDAO;
import kr.or.ddit.resume.dao.EducationDAO;
import kr.or.ddit.resume.dao.ResumeDAO;

public class ResumeDAOTest {

	@Inject
	private CareerDAO careerDao;
	
	@Inject
	private EducationDAO eduDao;
	
	private String memId;
	private String resumeSn;
	
	@Before
	public void setup() {
		memId = "cks1111";
		resumeSn = "RSM000122";
		
	}
	
	@Test
	public void itemListTest() {
		careerDao.selectCareerForResume(memId, resumeSn);
	}
	
//	@Test
	public void eduListTest() {
		eduDao.selectEducationForResume(memId, resumeSn);
	}
	
	

}
