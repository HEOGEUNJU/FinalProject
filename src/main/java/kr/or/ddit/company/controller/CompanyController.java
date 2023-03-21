package kr.or.ddit.company.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.company.service.CompanyService;
import kr.or.ddit.company.vo.CompanyVO;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/company")
public class CompanyController {
	@Inject
	private CompanyService service;

	@ResponseBody
	@PostMapping(produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	public PagingVO companyRetrieve(
		@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage
		,@ModelAttribute("simpleCondition") SearchVO searchVO
		,Model model
		) throws JsonProcessingException {
		System.out.println(model);
		PagingVO<CompanyVO> pagingVO = new PagingVO<CompanyVO>(30,5);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		service.retrieveCompanyList(pagingVO);
		model.addAttribute("pagingVO", pagingVO);
//		CompanyVO company = service.retrieveCompany(cmpName);
//		ObjectMapper mapper = new ObjectMapper();
//		String companyJson = mapper.writeValueAsString(pagingVO);
		return pagingVO;
	}


	@ResponseBody
	@PostMapping(value = "/new", produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Map<String, String> companyCreate(
			@Validated(InsertGroup.class) @ModelAttribute("company") CompanyVO company
			,Errors errors
			, Model model
			) throws JsonProcessingException {
		boolean valid = !errors.hasErrors();
//		ObjectMapper mapper = new ObjectMapper();
		Map<String, String> companyData = new HashMap<>();
		String message ="";
		if(valid) {
			int result = service.createCompany(company);
			if(result > 0) {
				message = "성공적으로 입력되었습니다.";
			}
			else {
				message = "서버 오류";
			}
		}
		else {
			message = "오류났음.";
		}
		companyData.put("cmpName", company.getCmpName());
		companyData.put("cmpId", company.getCmpId());

		return companyData;
		
	}

}
