package kr.or.ddit.transparency.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("transparency")
public class TransController {

	@GetMapping("transForm")
	public String transForm() {
		return "transparency/transForm";
	}

}
