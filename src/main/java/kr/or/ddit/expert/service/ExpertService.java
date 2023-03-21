package kr.or.ddit.expert.service;

import kr.or.ddit.expert.vo.ExpertVO;
import kr.or.ddit.vo.MemberVO;

public interface ExpertService {
	public int aplicationExpert(ExpertVO expert);
	
	public ExpertVO retrieveMember(String memId);
	
	
	//전문가 신청 삭제
	public int removeAppliExp(ExpertVO expert);
}
