package kr.or.ddit.help.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.help.vo.AskVO;
import kr.or.ddit.vo.PagingVO;

@Mapper
public interface AskDAO {

	// 상세보기
	public AskVO selectAsk(String askNo);

	// 문의사항 리스트
	public List<AskVO> selectAskList(PagingVO<AskVO> pagingVO);

	// 전체레코드
	public int selectTotalRecord(PagingVO<AskVO> pagingVO);

	// 등록
	public int insertAsk(AskVO ask);

	// 삭제(관리자만 가능)
	public int deleteAsk(AskVO ask);

	// 답변 등록
	public int updateRef(AskVO ask);
	
	
	
	
	//문의 전체 리스트(시스템 관리)
	public List<AskVO> selectAllList(PagingVO<AskVO> pagingVO);

}
