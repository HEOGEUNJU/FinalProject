package kr.or.ddit.process;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.or.ddit.process.dao.ProcessDAO;
import kr.or.ddit.process.vo.ItemVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringRunner.class)
@ContextConfiguration("file:webapp/WEB-INF/spring/*-context.xml")
@WebAppConfiguration
public class ProcessDAOTest {

	@Inject
	private ProcessDAO dao;
	
	private	ItemVO item1 = new ItemVO();
	private String daNo1 = "AD000089";
	private String itemCodeId1 = "ITM001";
	private String itemAsk1 = "세부내용 작성하기1";
	
	private	ItemVO item2 = new ItemVO();
	private String daNo2 = "AD000089";
	private String itemCodeId2 = "ITM003";
	private String itemAsk2 = "세부내용 작성하기2";
	
	private List<ItemVO> itemList = new ArrayList<>();
	
	private Map<String, Object> map = new HashMap<>();
	private String cmpId = "C777777";

	@Before
	public void setup() {
		item1.setDaNo(daNo1);
		item1.setItemCodeId(itemCodeId1);
		item1.setItemAsk(itemAsk1);
		
		item2.setDaNo(daNo2);
		item2.setItemCodeId(itemCodeId2);
		item2.setItemAsk(itemAsk2);
		
		itemList.add(item1);
		itemList.add(item2);
		
		map.put("itemList", itemList);
		map.put("cmpId", cmpId);
	}
	
//	@Test
	public void test() {
		List<ItemVO> itemList = dao.selectItemListNotAdded(daNo1);
		log.info("추가하지 않은 항목 목록 : {}", itemList.size());
	}
	
//	@Test
	public void deleteItemTest() {
		dao.deleteItem(item1);
	}
	
//	@Test
	public void insertOriginItemListTest() {
		dao.insertItemList(itemList);
	}

//	@Test
	public void insertItemFormListTest() {
		dao.insertItemFormList(map);
	}
	
//	@Test
	public void selectItemFormList() {
//		dao.selectItemFormList(cmpId);
	}
	
	private String daNo = "AD000178";
	
	@Test
	public void selectProcessListFor() {
		List<String> processList = dao.selectProcessListFor(daNo);
		log.info("해당 공고의 채용과정들 {}", processList.toString());
	}
}
