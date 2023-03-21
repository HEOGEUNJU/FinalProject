package kr.or.ddit.selfpr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/selfpr/recommend")
public class selfprRecommendController {

	@GetMapping
	public String selfprRecommendView() {
		return "selfpr/selfPrRecommend";
	}
	
}