package kr.or.ddit.commons;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MailCheckController {

	@Autowired
	private MailSendService mailService;
	
	//이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) throws UnsupportedEncodingException {
		log.info("이메일 인증 요청 이메일 : {}",email);
		return mailService.joinEmail(email);
	}
	
	//신청 반려시 이메일 전송
	@GetMapping("/returnMail")
	@ResponseBody
	public String returnMail(String email) throws UnsupportedEncodingException{
		log.info("이메일 인증 요청 이메일 : {}",email);
		return mailService.returnEmail(email);
	}
	
	//신청 승인시 이메일 전송
	@GetMapping("/acceptMail")
	@ResponseBody
	public String acceptMail(String email) throws UnsupportedEncodingException{
		log.info("이메일 인증 요청 이메일 : {}",email);
		return mailService.acceptEmail(email);
	}
}
