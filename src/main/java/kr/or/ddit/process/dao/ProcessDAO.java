package kr.or.ddit.process.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.process.vo.ItemVO;
import kr.or.ddit.process.vo.ProcessVO;

/**
 * @author 최경수
 * @since 2023. 2. 18.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 	    수정일               수정자                                     수정내용
 * --------     --------    ----------------------
 * 2023. 2. 17.      최경수        최초작성
 * 2023. 2. 18.      최경수        리스트 가져오기 다양화
 * 2023. 2. 23.      최경수        항목 관리
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface ProcessDAO {
	/**
	 * 한 회사가 가진 모든 공고에 대한 모든 채용과정
	 * @param cmpId
	 * @return List<ProcessVO> 
	 */
	public List<ProcessVO> selectProcessList(String cmpId);
	
	/**
	 * 한 회사의 한 공고가 가진 모든 세부 공고에 대한 모든 채용과정
	 * @param annoNo
	 * @return List<ProcessVO>
	 */
	public List<ProcessVO> selectProcessListForAnno(String annoNo);
	
	/**
	 * 한 회사의 한 공고가 가진 한 세부 공고의 모든 채용과정
	 * @param daNo
	 * @return
	 */
	public List<ProcessVO> selectProcessListForDetail(String daNo);
	
	/**
	 * 하나의 채용과정
	 * @param daNo, processCodeId
	 * @return ProcessVO
	 */
	public ProcessVO selectProcess(String daNo, String processCodeId);
	
	/**
	 * 채용과정 입력(2개 ~ 8개) - 입사지원서와 임원면접은 고정 
	 * @param process지만 ProcessVO가 가진 processList가 들어감
	 * @return 입력된 채용과정 수
	 */
	public int insertProcess(ProcessVO	process);
	
	/**
	 * 채용과정 수정(1개 ~ 8개) - 컨트롤러에서 기존 것과 같은지 확인 후 다른 것만 담아서 보내온 processList
	 * @param process지만 ProcessVO가 가진 processList가 들어감
	 * @return 수정된 채용과정 수
	 */
	public int updateProcess(ProcessVO process);
	
	/**
	 * 채용과정 삭제 - 여러 개로 할지 한 개로 할지 안 정함, 지금은 한 개
	 * @param daNo
	 * @return 삭제된 채용과정 수
	 */
	public int deleteProcess(String daNo);
	
	/**
	 * 채용과정 삭제 - 여러 개
	 * @param daNo
	 * @return 삭제된 채용과정 수
	 */
	public int deleteTotallyProcess(String daNo);
	
	/**
	 * 한 상세공고가 갖고 있는 채용과정의 각 항목들
	 * @param daNo
	 * @return	List<ItemVO>
	 */
	public List<ItemVO> selectItemList(String daNo);
	
	/**
	 * 모달에 띄울 것들, 추가되지 않은 항목만 불러오기
	 * 그냥 다 갖고 와서 daNo가 없는 거랑 있는 거 나눠도 됨
	 * @param daNo
	 * @return List<ItemVO>
	 */
	public List<ItemVO> selectItemListNotAdded(String daNo);
	
	/**
	 * 비동기로 항목 삭제하는 것
	 * @param item
	 * @return 삭제된 항목 수
	 */
	public int deleteItem(ItemVO item);
	
	/**
	 * 비동기로 모달에서 체크한 항목 입력하기
	 * @param itemList
	 * @return 입력된 항목 수 
	 */
	public int insertItemList(List<ItemVO> itemList);
	
	/**
	 * 항목 추가 시 양식에 들어감
	 * @param itemFormList
	 * @return 입력된 항목 수
	 */
	public int insertItemFormList(Map<String, Object> map);
	
	/**
	 * 항목 수정 시 양식도 수정됨
	 * @param map - 바꿀 원래의 itemCodeId, 바꿀 내용 vo
	 * @return 수정된 항목 수
	 */
	public int updateItem(Map<String, Object> map);
	
	/**
	 * 작성했던 항목 양식들 가져오기 
	 * @param cmpId
	 * @return List<ItemVO>
	 */
	public List<ItemVO> selectItemFormList(Map<String, String> map);
	
	public List<String> selectProcessListFor(String daNo);
}
