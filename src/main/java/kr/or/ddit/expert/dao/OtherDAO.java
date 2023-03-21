package kr.or.ddit.expert.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.expert.vo.ExfieldVO;
import kr.or.ddit.expert.vo.ExjobVO;
import kr.or.ddit.expert.vo.ExlprodVO;

@Mapper
public interface OtherDAO {
	
	public List<ExfieldVO> selectExfieldList();
	public List<ExjobVO> selectExjobList(@Param("exfieldId") String exfieldId);
	public List<ExlprodVO> selectExlprodList(@Param("exlprodId") String exlprodId);
}
