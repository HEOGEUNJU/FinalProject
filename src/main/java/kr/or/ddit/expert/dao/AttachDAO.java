package kr.or.ddit.expert.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.CommonsAttachVO;

@Mapper
public interface AttachDAO {
	public int insertAttatches(Object object);
	public int insertAttach(Object object);
	public List<AttachVO> selectAttatchList(String attId);
	public AttachVO selectAttach(String tblId);
	public <T>int deleteAttatchs(T vo);
	public <T>int updateAttatch(T vo);
	public <T>int deleteAttatch(String tblId);
}
