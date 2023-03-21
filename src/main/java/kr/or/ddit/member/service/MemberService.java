package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.UserNotFoundException;
import kr.or.ddit.vo.BlackVO;
import kr.or.ddit.vo.CutVO;
import kr.or.ddit.vo.IncruiterVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SeekerVO;

/**
 * 
 * @author 공통
 * @since 2023. 2. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일              수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 6.    박형준            아이디 찾기 추가
 * 2023. 2. 22.   박형준           시스템 관리 부분 추가
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
public interface MemberService {

	/**
	 * 회원 가입
	 * @param seeker
	 * @return 아이디 중복으로 인한 실패(PKDUPLICATED), 가입 성공(OK), 가입 실패(FAIL)
	 */
	public ServiceResult createSeeker(SeekerVO seeker);
	/**
	 * 회원 가입
	 * @param incruiter
	 * @return 아이디 중복으로 인한 실패(PKDUPLICATED), 가입 성공(OK), 가입 실패(FAIL)
	 */
	public ServiceResult createIcruiter(IncruiterVO incruiter);
	
	/**
	 * 회원 정보 상세 조회
	 * @param memId
	 * @return 존재하지 않는 경우, {@link UserNotFoundException} 발생.
	 */
	public MemberVO retrieveMember(String memId);
	public SeekerVO retrieveSeeker(String memId);
	public IncruiterVO retrieveMypageIncruiter(String memId);
	/**
	 * 회원 수정
	 * @param member
	 * @return 존재 부(NOTEXIST), 비번 인증 실패(INVALIDPASSWORD), 성공(OK), 실패(FAIL)
	 */
	public ServiceResult modifySeeker(SeekerVO member);
	public ServiceResult modifyIncruiter(IncruiterVO member);
	/**
	 * 회원 탈퇴
	 * @param memId
	 * @return 존재 부(NOTEXIST), 비번 인증 실패(INVALIDPASSWORD), 성공(OK), 실패(FAIL)
	 */
	public ServiceResult removeMember(MemberVO member);
	
	
	
	
	
	
	
	
	/*=======================================시스템관리 부분======================================*/
	/* ========================= 회원 관리 부분 ========================= */
	/**
	 * 일반 회원 목록
	 * @param memAuthCd
	 * @return
	 */
	public List<MemberVO> retrieveSkrList();
	/**
	 * 일반 회원 상세
	 * @param memId
	 * @return
	 */
	public MemberVO retrieveSkr(String memId);
	
	/**
	 * 기업 회원 목록
	 * @return
	 */
	public List<MemberVO> retrieveIncList();
	/**
	 * 기업 회원 상세
	 * @param memId
	 * @return
	 */
	public MemberVO retrieveInc(String memId);
	
	/**
	 * 전문가 회원 목록
	 * @return
	 */
	public List<MemberVO> retrieveExpList();
	/**
	 * 전문가 회원 상세
	 * @param memId
	 * @return
	 */
	public MemberVO retrieveExp(String memId);
	
	/**
	 * 차단 회원 목록
	 * @return
	 */
	public List<MemberVO> retrieveCutList();
	/**
	 * 차단 회원 상세
	 * @param memId
	 * @return
	 */
	public MemberVO retrieveCut(String memId);
	/**
	 * 차단 하기
	 * @param member
	 * @return
	 */
	public int createCut(CutVO cut);
	public int modifyCutRole(String memId);
	/**
	 * 차단 해제
	 * @param member
	 * @return
	 */
	public int removeCut(CutVO cut);
	/**
	 * 일반회원으로 되돌리기
	 * @param memId
	 * @return
	 */
	public int modifyRole(String memId);
	
	/**
	 * 블랙 회원 목록
	 * @return
	 */
	public List<MemberVO> retrieveBlackList();
	/**
	 * 블랙 회원 상세
	 * @param memId
	 * @return
	 */
	public MemberVO retrieveBlack(String memId);
	
	/**
	 * 블랙리스트 등록
	 * @param member
	 */
	public int createBlack(BlackVO member);
	public int modifyBlackRole(String memId);
	/**
	 * 블랙리스트 해제
	 * @param member
	 */
	public int removeBlack(BlackVO black);
	
	/**
	 * 탈퇴 회원 목록
	 * @return
	 */
	public List<MemberVO> retrieveDelMemList();
	/**
	 * 탈퇴 회원 상세
	 * @param memId
	 * @return
	 */
	public MemberVO retrieveDelMem(String memId);
	
	/* ========================= 승인 관리 부분 ========================= */
	/**
	 * 총괄 기업회원 목록
	 * @return
	 */
	public List<MemberVO> retrieveIncruiterList();
	
	/**
	 * 총괄 기업회원 세부
	 * @param memId
	 * @return
	 */
	public MemberVO retrieveIncruiter(String memId);
	
	/**
	 * 총괄 승인
	 * @param member
	 * @return
	 */
	public int modifyAcceptInc(IncruiterVO incruiter);
	public int modifyAcceptCmp(IncruiterVO incruiter);
	
	/**
	 * 총괄 신청 삭제
	 * @param member
	 * @return
	 */
	public int removeAppliInc(MemberVO member);
	
	/**
	 * 전문가 신청 목록
	 * @return
	 */
	public List<MemberVO> retrieveExpertList();
	
	/**
	 * 전문가 신청 세부
	 * @param memId
	 * @return
	 */
	public MemberVO retrieveExpert(String memId);
	
	/**
	 * 전문가 승인
	 * @param member
	 * @return
	 */
	public int modifyAcceptExpRole(MemberVO member);
	public int modifyAcceptExp(MemberVO member);
	/*=======================================아이디,비번 찾기 부분======================================*/
	/**
	 * 일반회원 아이디 찾기
	 * @param seeker
	 * @return
	 */
	public List<SeekerVO> searchSeekerId(SeekerVO seeker);
	
	/**
	 * 일반회원의 비밀번호를 찾기위한 회원존재 확인
	 * @param seeker
	 * @return
	 */
	public int retrieveGetSeekerResult(SeekerVO seeker);
	
	/**
	 * 기업회원 아이디 찾기
	 * @param incruiter
	 * @return
	 */
	public MemberVO retrieveIncruiterId(IncruiterVO incruiter);
	
	/**
	 * 기업회원의 비밀번호를 찾기위한 회원존재 확인
	 * @param incruiter
	 * @return
	 */
	public int retrieveGetIncruiterResult(IncruiterVO incruiter);
	
	/**
	 * 비밀번호 수정
	 * @param seeker
	 * @return
	 */
	public int modifyPw(MemberVO member);
	
	/*=======================================아이디,비번 찾기 부분======================================*/
	public List<String> retrieveMemIdList();
}


















