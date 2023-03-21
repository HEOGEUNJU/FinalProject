package kr.or.ddit.lab.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.lab.vo.CounAttachVO;

@Mapper
public interface CounAttachDAO {
	public int insertAttatches(CounAttachVO coun);
	public List<CounAttachVO> selectAttatchList(String counNo);
	public CounAttachVO selectAttach(String counNo);
}
