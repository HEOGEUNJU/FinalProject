package kr.or.ddit.expert.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.expert.vo.ExpertVO;
import kr.or.ddit.expert.vo.ExprodVO;

@Mapper
public interface ExpertDAO {
	public int applicationExpert(ExpertVO expert);
	
	public ExpertVO selectExpert(String memId); 
	
	//전문가 신청 반려
	public int deleteAppliExp(ExpertVO expert);
}
