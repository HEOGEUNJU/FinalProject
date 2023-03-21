package kr.or.ddit.api.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.api.vo.CommonCodeVO;
import kr.or.ddit.api.vo.JobCodeVO;
import kr.or.ddit.api.vo.RegionCodeVO;

@Mapper
public interface ApiDAO {
	public int insertCommonCode(CommonCodeVO vo);
	public int insertRegionCode(RegionCodeVO vo);
	public int insertJobCode(JobCodeVO vo);
}
