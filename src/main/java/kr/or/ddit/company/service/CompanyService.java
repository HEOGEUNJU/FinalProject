package kr.or.ddit.company.service;


import java.util.List;

import kr.or.ddit.company.vo.CompanyVO;
import kr.or.ddit.exception.UserNotFoundException;
import kr.or.ddit.vo.PagingVO;

/**
 * 회사(CRUD)를 위한 Business Logic Layer
 */
public interface CompanyService {

	public void retrieveCompanyList(PagingVO<CompanyVO> company);
	/**
	 * 회사 정보 상세 조회
	 * @param comId
	 * @return 존재하지 않는 경우, {@link UserNotFoundException} 발생.
	 */
	public CompanyVO retrieveCompany(String cmpName);
	
	public CompanyVO retrieveUpdateCompany(String cmpId);
	
	public List<CompanyVO> retrieveLikeCompanyList(String memId);
	
	public int createCompany(CompanyVO company);
	public int modifyCompany(CompanyVO company);
	
	/**
	 * 회사 신청 삭제
	 * @param company
	 * @return
	 */
	public int removeAppliCmp(CompanyVO company);
	/**
	 * 기업 상세
	 * @param cmpId
	 * @return
	 */
	public CompanyVO retrieveCmp(String cmpId);
	
}


















