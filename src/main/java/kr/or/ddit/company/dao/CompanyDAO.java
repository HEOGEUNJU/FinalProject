package kr.or.ddit.company.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.company.vo.CompanyVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;

/**
 * 회사관리(CRUD)를 위한 Persistence Layer
 *
 */
@Mapper
public interface CompanyDAO{
	public int selectTotalRecord(PagingVO<CompanyVO> pagingVO);
	
	public List<CompanyVO> selectCompanyList(PagingVO<CompanyVO> panginVo);
	
	public CompanyVO selectCompany(String cmpName);
	
	public CompanyVO selectUpdateCompany(String cmpId);
	
	public List<CompanyVO> selectLikeCompanyList(String memId);
	
	public int insertCompany(CompanyVO company);
	
	public int updateCompany(CompanyVO company);

	//회사 신청 삭제
	public int deleteAppliCmp(CompanyVO company);
	//회사 상세
	public CompanyVO selectCmp(String cmpId);
	
}                     