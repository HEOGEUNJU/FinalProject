package kr.or.ddit.api.controller;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import kr.or.ddit.api.service.ApiService;
import kr.or.ddit.api.vo.CommonCodeVO;
import kr.or.ddit.api.vo.JobCodeVO;
import kr.or.ddit.api.vo.RegionCodeVO;
import lombok.RequiredArgsConstructor;
/**
 * 
 * @author 작성자명
 * @since 2023. 2. 4.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 4.      양서연       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequiredArgsConstructor
@RequestMapping("/api")
public class ApiController {
	private final ApiService service;
	
//	@GetMapping("common")
	public String common() {
		Set<CommonCodeVO> voSet = new HashSet<>();
		Set<String> codeSet = new HashSet<>();
		
		Iterator<CommonCodeVO> iter = voSet.iterator();
		while(iter.hasNext()) {
			CommonCodeVO vo = iter.next();
			service.createCommonCode(vo);
		}
		
		return "";
	}
	
//	@GetMapping("region")
	public String region() {
		Set<RegionCodeVO> voSet = new HashSet<>();
		Set<String> codeSet = new HashSet<>();
		
		region(voSet,codeSet);
		
		Iterator<RegionCodeVO> iter = voSet.iterator();
		while(iter.hasNext()) {
			RegionCodeVO vo = iter.next();
			service.createRegionCode(vo);
		}
		
		return "";
	}
	
//	@GetMapping("job")
	public String job() {
		Set<JobCodeVO> voSet = new HashSet<>();
		Set<String> codeSet = new HashSet<>();
		
		job(voSet,codeSet);
		
		Iterator<JobCodeVO> iter = voSet.iterator();
		while(iter.hasNext()) {
			JobCodeVO vo = iter.next();
			service.createJobCode(vo);
		}
		
		return "";
	}
	
	public static void region(Set<RegionCodeVO> voSet,Set<String> codeSet) {
		try {
			String url = "http://openapi.work.go.kr/opi/commonCode/commonCode.do?returnType=XML&target=CMCD&authKey=WNLDI1R2XSLJ46KDFBTDT2VR1HK&dtlGb=1";
			DocumentBuilderFactory dbfaFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dbBuilder = dbfaFactory.newDocumentBuilder();
			Document doc = dbBuilder.parse(url);
			
			doc.getDocumentElement().normalize();
			
			NodeList nList = doc.getElementsByTagName("oneDepth");
			NodeList nList2 = doc.getElementsByTagName("twoDepth");
			
			System.out.println("코드1 개수 : " + nList.getLength());
			System.out.println("코드2 개수 : " + nList2.getLength());
			
			for(int i=0;i<nList.getLength();i++) {
				Node nNode = nList.item(i);
				Element eElement = (Element) nNode;
				
				RegionCodeVO vo = new RegionCodeVO();
				String code = getTagValue("regionCd",eElement);
				String name = getTagValue("regionNm",eElement);
				
				//PK 중복검사
				if(codeSet.contains(code)) continue;

				vo.setRegionCode(code);
				vo.setRegionName(name);
//				vo.setRegionRef(regionRef);
				
				voSet.add(vo);
				codeSet.add(code);
				
//				System.out.println("코드1 : " + getTagValue("regionCd",eElement));
//				System.out.println("코드1 : " + getTagValue("regionNm",eElement));
				
			}
			for(int i=0;i<nList2.getLength();i++) {
				Node nNode = nList2.item(i);
				Element eElement = (Element) nNode;
				
				RegionCodeVO vo = new RegionCodeVO();
				String code = getTagValue("regionCd",eElement);
				String name = getTagValue("regionNm",eElement);
				String regionRef = getTagValue("superCd",eElement);
				
				//PK 중복검사
				if(codeSet.contains(code)) continue;
				
				vo.setRegionCode(code);
				vo.setRegionName(name);
				vo.setRegionRef(regionRef);
				
				voSet.add(vo);
				codeSet.add(code);
				
//				System.out.println("코드2 : " + getTagValue("regionCd",eElement2));
//				System.out.println("코드2 : " + getTagValue("regionNm",eElement2));
//				System.out.println("상위코드 : " + getTagValue("superCd",eElement2));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void job(Set<JobCodeVO> voSet,Set<String> codeSet) {
		try {
			String url = "http://openapi.work.go.kr/opi/commonCode/commonCode.do?returnType=XML&target=CMCD&authKey=WNLDI1R2XSLJ46KDFBTDT2VR1HK&dtlGb=2";
			DocumentBuilderFactory dbfaFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dbBuilder = dbfaFactory.newDocumentBuilder();
			Document doc = dbBuilder.parse(url);
			
			doc.getDocumentElement().normalize();
			
			NodeList nList = doc.getElementsByTagName("oneDepth");
			NodeList nList2 = doc.getElementsByTagName("twoDepth");
			NodeList nList3 = doc.getElementsByTagName("threeDepth");
			
			System.out.println("코드1 개수 : " + nList.getLength());
			System.out.println("코드2 개수 : " + nList2.getLength());
			System.out.println("코드3 개수 : " + nList3.getLength());
			
			for(int i=0;i<nList.getLength();i++) {
				Node nNode = nList.item(i);
				Element eElement = (Element) nNode;
				
				JobCodeVO vo = new JobCodeVO();
				String code = getTagValue("jobsCd",eElement);
				String name = getTagValue("jobsNm",eElement);
				
				//PK 중복검사
				if(codeSet.contains(code)) continue;
				
				vo.setJobCode(code);
				vo.setJobName(name);
//				vo.setJobRef(refCode);
				
				voSet.add(vo);
				codeSet.add(code);
				
//				System.out.println("코드1 : " + getTagValue("jobsCd",eElement));
//				System.out.println("코드1 : " + getTagValue("jobsNm",eElement));
			}
			
			for(int i=0;i<nList2.getLength();i++) {
				Node nNode = nList2.item(i);
				Element eElement = (Element) nNode;
				
				JobCodeVO vo = new JobCodeVO();
				String code = getTagValue("jobsCd",eElement);
				String name = getTagValue("jobsNm",eElement);
				String refCode = getTagValue("superCd",eElement);
				
				//PK 중복검사
				if(codeSet.contains(code)) continue;
				
				vo.setJobCode(code);
				vo.setJobName(name);
				vo.setJobRef(refCode);
				
				voSet.add(vo);
				codeSet.add(code);
				
//				System.out.println("코드2 : " + getTagValue("jobsCd",eElement2));
//				System.out.println("코드2 : " + getTagValue("jobsNm",eElement2));
//				System.out.println("상위코드 : " + getTagValue("superCd",eElement2));
			}
			
			for(int i=0;i<nList3.getLength();i++) {
				Node nNode = nList3.item(i);
				Element eElement = (Element) nNode;
				
				JobCodeVO vo = new JobCodeVO();
				String code = getTagValue("jobsCd",eElement);
				String name = getTagValue("jobsNm",eElement);
				String refCode = getTagValue("superCd",eElement);
				
				//PK 중복검사
				if(codeSet.contains(code)) continue;
				
				vo.setJobCode(code);
				vo.setJobName(name);
				vo.setJobRef(refCode);
				
				voSet.add(vo);
				codeSet.add(code);
				
//				System.out.println("코드3 : " + getTagValue("jobsCd",eElement3));
//				System.out.println("코드3 : " + getTagValue("jobsNm",eElement3));
//				System.out.println("상위코드 : " + getTagValue("superCd",eElement3));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// tag값의 정보를 가져오는 함수
		public static String getTagValue(String tag, Element eElement) {
	    	//결과를 저장할 result 변수 선언
	    	String result = "";
	    	NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    	result = nlList.item(0).getTextContent();
	    	return result;
		}
		
		public static String getTagValue(String tag, String childTag, Element eElement) {
			//결과를 저장할 result 변수 선언
			String result = "";
			NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
			for(int i = 0; i < eElement.getElementsByTagName(childTag).getLength(); i++) {
				//result += nlList.item(i).getFirstChild().getTextContent() + " ";
				result += nlList.item(i).getChildNodes().item(0).getTextContent() + " ";
			}
			return result;
		}
	

}