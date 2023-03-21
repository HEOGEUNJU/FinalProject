package kr.or.ddit.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.expert.vo.ExpertVO;
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
 * 2023. 2. 6.    박형준             아이디, 비번 찾기 추가
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface MemberDAO{
	public int selectTotalRecord(PagingVO<MemberVO> pagingVO);
	
	/**
	 * 회원 신규 등록
	 * @param member
	 * @return 등록된 레코드 수 (rowcnt) > 0 : 성공, <= 0 : 실패 
	 */
	public int insertMember(MemberVO member);
	public int insertMemberIN(MemberVO member);
	
	/**
	 * 일반회원 신규 등록
	 * @param member
	 * @return 등록된 레코드 수 (rowcnt) > 0 : 성공, <= 0 : 실패 
	 */
	public int insertSeeker(SeekerVO seeker);
	
	/**
	 * 기업회원 신규 등록
	 * @param member
	 * @return 등록된 레코드 수 (rowcnt) > 0 : 성공, <= 0 : 실패 
	 */
	public int insertIncruiter(IncruiterVO incruiter);
	
	/** 회원 상세 조회
	 * @param memId
	 * @return 조건에 맞는 레코드 없는 경우, null 반환
	 */
	public MemberVO selectMember(@Param("memId") String memId);
	public SeekerVO selectSeeker(@Param("memId") String memId);
	public IncruiterVO selectIncruiterMypage(@Param("memId") String memId);
	
	/**
	 * 회원 정보 수정
	 * @param member
	 * @return 수정된 레코드 수(rowcnt) > 0 : 성공, <= 0 : 실패  
	 */
	public int updateMember(SeekerVO member);
	public int updateMemberIN(IncruiterVO member);
	public int updateSeeker(SeekerVO member);
	public int updateIncruiter(IncruiterVO member);
	/**
	 * 회원 정보 삭제(?)
	 * @param memId
	 * @return 삭제된 레코드 수(rowcnt) > 0 : 성공, <= 0 : 실패  
	 */
	public int deleteMember(String memId);
	
	
	
	
	/*======================================= 시스템 관리 부분 ======================================*/
	/*======================== 회원 관리 부분 ========================*/
	/**
	 * 일반 회원 목록
	 * @param memAuthCd
	 * @return
	 */
	public List<MemberVO> selectSkrList();
	/**
	 * 일반 회원 상세
	 * @param memId
	 * @return
	 */
	public MemberVO selectSkr(String memId);
	
	/**
	 * 기업 회원 목록
	 * @param member
	 * @return
	 */
	public List<MemberVO> selectIncList();
	/**
	 * 기업 회원 상세
	 * @param memId
	 * @return
	 */
	public MemberVO selectInc(String memId);
	
	/**
	 * 전문가 회원 목록
	 * @return
	 */
	public List<MemberVO> selectExpList();
	/**
	 * 전문가 회원 상세
	 * @param memId
	 * @return
	 */
	public MemberVO selectExp(String memId);
	
	
	/**
	 * 차단 회원 목록 
	 * @return
	 */
	public List<MemberVO> selectCutList();
	/**
	 * 차단 회원 상세
	 * @param memId
	 * @return
	 */
	public MemberVO selectCut(String memId);
	/**
	 * 차단 하기
	 * @param member
	 * @return
	 */
	public int insertCut(CutVO cut);
	public int updateCutRole(String memId);
	/**
	 * 차단 해제
	 * @param member
	 * @return
	 */
	public int deleteCut(CutVO cut);
	/**
	 * 일반회원으로 되돌리기
	 * @param memId
	 */
	public int changeRole(String memId);
	
	/**
	 * 블랙 회원 목록
	 * @return
	 */
	public List<MemberVO> selectBlackList();
	/**
	 * 블랙 회원 상세
	 * @param memId
	 * @return
	 */
	public MemberVO selectBlack(String memId);
	/**
	 * 블랙리스트 등록
	 * @param member
	 * @return
	 */
	public int insertBlack(BlackVO member);
	public int updateBlackRole(String memId);
	/**
	 * 블랙리스트 해제
	 * @param member
	 * @return
	 */
	public int deleteBlack(BlackVO black);
	
	/**
	 * 탈퇴 회원 목록
	 * @return
	 */
	public List<MemberVO> selectDelMemList();
	/**
	 * 탈퇴 회원 상세
	 * @param memId
	 * @return
	 */
	public MemberVO selectDelMem(String memId);
	
	/*======================== 승인 관리 부분 ========================*/
	/**
	 * 총괄 기업회원 신청 목록
	 * @return
	 */
	public List<MemberVO> selectIncruiterList();
	
	/**
	 * 총괄 기업회원 신청 세부
	 * @param memId
	 * @return
	 */
	public MemberVO selectIncruiter(String memId);
	
	/**
	 * 총괄 승인(update)
	 * @param member
	 * @return
	 */
	public int updateAcceptInc(IncruiterVO incruiter);
	public int updateAcceptCmp(IncruiterVO incruiter);
	
	/**
	 * 총괄 신청 삭제
	 * @param incruiter
	 * @return
	 */
	public int deleteAppliInc(MemberVO member);
	
	/**
	 * 전문가 신청 리스트
	 * @return
	 */
	public List<MemberVO> selectExpertList();
	
	/**
	 * 전문가 신청 세부
	 * @param memId
	 * @return
	 */
	public MemberVO selectExpert(String memId);
	
	/**
	 * 전문가 승인(update)
	 * @param member
	 * @return
	 */
	public int updateAcceptExpRole(MemberVO member);
	public int updateAcceptExp(MemberVO member);
	
	
	/*=======================================아이디,비번 찾기 부분======================================*/
	/**
	 * 일반회원 아이디 찾기
	 * @param seekerVO
	 * @return
	 */
	public List<SeekerVO> seekerFindId(SeekerVO seeker);
	
	/**
	 * 일반회원의 비밀번호를 찾기위한 회원존재 확인
	 * @param memberVO
	 * @return
	 */
	public int getSeekerFindResult(SeekerVO seeker);
	
	/**
	 * 기업회원 아이디 찾기
	 * @param incruiter
	 * @return
	 */
	public MemberVO incruiterFindId(IncruiterVO incruiter);
	
	/**
	 * 기업회원의 비밀번호를 찾기위한 회원존재 확인
	 * @param incruiter
	 * @return
	 */
	public int getIncruiterFindResult(IncruiterVO incruiter);
	
	/**
	 * 비밀번호 수정
	 * @param seekerVO
	 * @return
	 */
	public int updatePw(MemberVO member);
	
	/*=======================================회원 아이디 중복확인======================================*/
	public List<String> selectMemIdList();
}






