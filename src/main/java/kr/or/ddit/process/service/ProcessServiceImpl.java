package kr.or.ddit.process.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.or.ddit.apply.service.ApplyService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.process.dao.ProcessDAO;
import kr.or.ddit.process.vo.ItemVO;
import kr.or.ddit.process.vo.ProcessVO;
import kr.or.ddit.vo.AttachVO;

@Service
public class ProcessServiceImpl implements ProcessService {

	@Inject
	private ProcessDAO dao; 
	
	@Inject
	private ApplyService applyService;
	
	@Inject kr.or.ddit.expert.dao.AttachDAO attachDAO;
	
	@Value("#{appInfo.processFolder}")
	private File saveFiles;
	
	private int processAttachList(ProcessVO process) {
		List<ProcessVO> processList = process.getProcessList();
		int rowcnt = 0;
		for (ProcessVO vo : processList) {
			List<AttachVO> attachList = vo.getAttatchList();
			if (attachList == null || attachList.isEmpty()) return 0;
			try {
				for (AttachVO attach : attachList) {
					attach.saveTo(saveFiles);
				}
				rowcnt += attachDAO.insertAttatches(vo);
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
		return rowcnt;
	}
	
	@Override
	public List<ProcessVO> retrieveProcessList(String cmpId) {
		List<ProcessVO> processList = dao.selectProcessList(cmpId);
		return processList;
	}
	
	@Override
	public ProcessVO retrieveProcess(String daNo, String pc) {
		ProcessVO process = dao.selectProcess(daNo, pc);
		return process;
	}

	@Override
	public ServiceResult createProcess(ProcessVO process) {
		int rowcnt = dao.insertProcess(process);
		rowcnt += processAttachList(process);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modifyProcess(ProcessVO process) {
		int rowcnt = 0;
		rowcnt += dao.deleteTotallyProcess(process.getDaNo());
		List<ProcessVO> processList = process.getProcessList();
		List<ProcessVO> resultList = new ArrayList<>();
		for (ProcessVO vo : processList) {
			if (!vo.getProcessStartDate().equals("")) {
				resultList.add(vo);
			}
		}
		
		for (ProcessVO vo : resultList) {
			if (vo.getAttatchList().size() > 0) {
				rowcnt += attachDAO.deleteAttatchs(vo);
				rowcnt += processAttachList(vo);
			}
		}
		
		process.setProcessList(resultList);
		
		rowcnt = dao.insertProcess(process);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeProcess(String daNo) {
		int rowcnt = dao.deleteProcess(daNo);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<ItemVO> retrieveItemList(String daNo) {
		List<ItemVO> list = dao.selectItemList(daNo);
		return list;
	}

	@Override
	public List<ItemVO> retireveItemListNotAdded(String daNo) {
		List<ItemVO> list = dao.selectItemListNotAdded(daNo);
		return list;
	}

	@Override
	public void removeItem(ItemVO item) {
		dao.deleteItem(item);
		
		String processCodeId = item.getProcessCodeId();
		String table = null;
		if (processCodeId.equals("PRC01")) {
			table = "SCORE_RESUME";
		} else if (processCodeId.equals("PRC02")) {
			table = "SCORE_INTRO";	
		} else if (processCodeId.equals("PRC03")) {
			table = "SCORE_TEST";
		} else if (processCodeId.equals("PRC04")) {
			table = "SCORE_COMP";
		} else if (processCodeId.equals("PRC05")) {
			table = "SCORE_DISCUSS";
		} else if (processCodeId.equals("PRC06")) {
			table = "SCORE_PRACTICE";
		} else if (processCodeId.equals("PRC07")) {
			table = "SCORE_INTERN";
		} else if (processCodeId.equals("PRC08")) {
			table = "SCORE_INDEPTH";
		}
		List<String> applySnList = applyService.retireveApplySnList(item.getDaNo());
		for (String applySn : applySnList) {
			applyService.modifyScoreZero(table, item.getItemCodeId(), applySn);
		}
	}

	@Override
	public void createItemList(List<ItemVO> itemList, String cmpId) {
		// 항목(ITEM)에 입력
		dao.insertItemList(itemList);
		
		// 양식(ITEM_FORM)에 입력
		if (itemList.get(0).getItemCodeName() == null || itemList.get(0).getItemCodeName().equals("")) {
			Map<String, Object> map = new HashMap<>();
			map.put("itemList", itemList);
			map.put("cmpId", cmpId);
			dao.insertItemFormList(map);
		}
	}

	@Override
	public void modifyItem(ItemVO item, String originCodeId, String cmpId) {
		Map<String, Object> map = new HashMap<>();
		map.put("item", item);
		map.put("originCodeId", originCodeId);
		dao.updateItem(map);
		
		String processCodeId = item.getProcessCodeId();
		String table = null;
		if (processCodeId.equals("PRC01")) {
			table = "SCORE_RESUME";
		} else if (processCodeId.equals("PRC02")) {
			table = "SCORE_INTRO";	
		} else if (processCodeId.equals("PRC03")) {
			table = "SCORE_TEST";
		} else if (processCodeId.equals("PRC04")) {
			table = "SCORE_COMP";
		} else if (processCodeId.equals("PRC05")) {
			table = "SCORE_DISCUSS";
		} else if (processCodeId.equals("PRC06")) {
			table = "SCORE_PRACTICE";
		} else if (processCodeId.equals("PRC07")) {
			table = "SCORE_INTERN";
		} else if (processCodeId.equals("PRC08")) {
			table = "SCORE_INDEPTH";
		}
		List<String> applySnList = applyService.retireveApplySnList(item.getDaNo());
		for (String applySn : applySnList) {
			applyService.modifyScoreZero(table, originCodeId, applySn);
		}
		
		List<ItemVO> itemList = new ArrayList<>();
		itemList.add(item);
		map.put("itemList", itemList);
		map.put("cmpId", cmpId);
		dao.insertItemFormList(map);
		
	}

	@Override
	public List<ItemVO> retrieveItemFormList(String cmpId, String daNo) {
		Map<String, String> map = new HashMap<>();
		map.put("cmpId", cmpId);
		map.put("daNo", daNo);
		List<ItemVO> list = dao.selectItemFormList(map); 
		return list;
	}

	@Override
	public List<String> retrieveProcessListFor(String daNo) {
		List<String> list = dao.selectProcessListFor(daNo);
		return list;
	}

}
