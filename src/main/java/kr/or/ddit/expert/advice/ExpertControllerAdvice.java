package kr.or.ddit.expert.advice;

import java.util.List;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.expert.dao.OtherDAO;
import kr.or.ddit.expert.vo.ExfieldVO;
import kr.or.ddit.expert.vo.ExjobVO;
import kr.or.ddit.expert.vo.ExlprodVO;

@ControllerAdvice("kr.or.ddit.expert.controller")
public class ExpertControllerAdvice {
	@Inject
	private OtherDAO otherDAO;
	
	@ModelAttribute("exfield")
	public List<ExfieldVO> exFieldList(){
		return otherDAO.selectExfieldList();
	}
	@ModelAttribute("exjob")
	public List<ExjobVO> exJobList(){
		return otherDAO.selectExjobList(null);
	}
	
	@ModelAttribute("exlprod")
	public List<ExlprodVO> exLprodList(){
		return otherDAO.selectExlprodList(null);
	}
	

}
