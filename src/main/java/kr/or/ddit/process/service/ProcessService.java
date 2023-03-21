package kr.or.ddit.process.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
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
 * 2023. 2. 17.     최경수        최초작성
 * 2023. 2. 18.     최경수        목록 찾기 세분화 
 * 2023. 2. 23.     최경수        세부항목
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
public interface ProcessService {
	
	/**
	 * 한 회사가 가진 모든 공고에 대한 모든 채용과정
	 * @param cmpId
	 * @return
	 */
	public List<ProcessVO> retrieveProcessList(String cmpId);
	
	/**
	 * 하나의 채용과정
	 * @param daNo
	 * @param pc
	 * @return
	 */
	public ProcessVO retrieveProcess(String daNo, String pc);
	
	/**
	 * 채용과정 입력(2개 ~ 8개) - 입사지원서와 임원면접은 고정 
	 * @param process지만 ProcessVO가 가진 processList가 들어감
	 * @return입력된 채용과정 수
	 */
	public ServiceResult createProcess(ProcessVO process);
	
	/**
	 * 채용과정 수정(1개 ~ 8개) - 컨트롤러에서 기존 것과 같은지 확인 후 다른 것만 담아서 보내온 processList
	 * @param process지만 ProcessVO가 가진 processList가 들어감
	 * @return 수정된 채용과정 수
	 */
	public ServiceResult modifyProcess(ProcessVO process);
	
	/**
	 * 채용과정 삭제 - 여러 개로 할지 한 개로 할지 안 정함, 지금은 한 개
	 * @param daNo
	 * @return 삭제된 채용과정 수
	 */
	public ServiceResult removeProcess(String daNo);
	
	/**
	 * 한 상세공고가 갖고 있는 채용과정의 각 항목들
	 * @param daNo
	 * @return	List<ItemVO>
	 */
	public List<ItemVO> retrieveItemList(String daNo);
	
	/**
	 * 모달에 띄울 것들, 추가되지 않은 항목만 불러오기
	 * 그냥 다 갖고 와서 daNo가 없는 거랑 있는 거 나눠도 됨
	 * @param daNo
	 * @return List<ItemVO>
	 */
	public List<ItemVO> retireveItemListNotAdded(String daNo);
	
	/**
	 * 세부 공고 항목 목록에서 항목 하나 삭제하는 것 - 비동기
	 * @param item
	 */
	public void removeItem(ItemVO item);
	
	/**
	 * 비동기로 모달에서 체크한 항목 입력하기
	 * , 양식에도 들어감(cmpId)
	 * @param itemList, cmpId
	 * @return 입력된 항목 수 
	 */
	public void createItemList(List<ItemVO> itemList, String cmpId);
	
	/**
	 * 입력되어 있는 항목 수정하
	 * , 양식에도 들어감(수정한 양식은 insert로 for cmpId)
	 * @param item, originCodeId, cmpId
	 * @return 수정된 항목 수 
	 */
	public void modifyItem(ItemVO item, String originCodeId, String cmpId);
	
	/**
	 * 회사의 인사담당자들이 작성한 항목들 전체
	 * @param cmpId
	 * @return List<ItemVO>
	 */
	public List<ItemVO> retrieveItemFormList(String cmpId, String daNo);
	
	public List<String> retrieveProcessListFor(String daNo);
}
