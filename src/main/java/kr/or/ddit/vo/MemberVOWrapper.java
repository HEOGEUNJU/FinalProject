package kr.or.ddit.vo;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

public class MemberVOWrapper extends User {
	private MemberVO realMember;

	//로그인 시도 유저의 모든 정보를 vo에 담아서 회원id,회원비밀번호,권한들을 
	//스프링 시큐리티의 고유 User의 정보로 세팅
	//이제 로그인 관련 작업은 스프링 니가 해줘
	public MemberVOWrapper(MemberVO realMember) {
		super(realMember.getMemId(), realMember.getMemPass()
				, AuthorityUtils.createAuthorityList(realMember.getMemAuthCd()));
		//jsp에서 
		//<security:authentication property="principal.realMember" var="memberVO"/>  
		this.realMember = realMember;
	}
	
	public MemberVO getRealMember() {
		return realMember;
	}
	
//	@Override
//	public boolean isEnabled() {
//		return !realMember.isMemDelete();
//	}
}
