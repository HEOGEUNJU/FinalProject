package kr.or.ddit.announcement.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 공고 지역, 업종, 직종 선택 UI 완성을 위한 데이터 조회.
 * @author 작성자명
 * @since 2023. 2. 7.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 7.      양서연       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface AnnoSearchDAO {
	public List<Map<String, Object>> selectRegionList(@Param("regionRef") String regionRef);
	public List<Map<String, Object>> selectIndustry(@Param("industryRef") String industryRef);
	public List<Map<String, Object>> selectJob(@Param("jobRef") String jobRef);
	public List<Map<String, Object>> selectEduCd();
	public List<Map<String, Object>> selectWelfareList(@Param("welfareRef") String welfareRef);
	public List<Map<String, Object>> selectPositionList(@Param("positionRef") String positionRef);
	public List<Map<String, Object>> selectEmpltypeList();
}
