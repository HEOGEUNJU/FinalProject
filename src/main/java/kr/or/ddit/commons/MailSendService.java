package kr.or.ddit.commons;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailSendService {
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNumber;

	//난수 발생
	public void makeRandomNumber() {
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);
		authNumber = checkNum;
	}


	//인증번호 이메일 보낼 양식!
	public String joinEmail(String email) throws UnsupportedEncodingException {
		makeRandomNumber();
		String setFrom = "hjpark9833@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력
		String toMail = email;
		String title = "[INU] 이메일 인증번호가 도착하였습니다."; // 이메일 제목
		String content =
				"<div style='background: rgb(255, 255, 255);margin: 0px;padding: 0px;"
				+ "font-family: AppleSDGothicNeo-Regular, Malgun Gothic, 맑은고딕, 돋움, dotum,sans-serif;'>" 
				+ "<div style='background: rgb(255, 255, 255);margin: 0px auto;padding: 0px;width: 100%;"
				+ "letter-spacing: -1px;font-family: AppleSDGothicNeo-Regular, Malgun Gothic, 맑은고딕, 돋움,dotum, sans-serif;"
				+ "max-width: 600px;box-sizing: border-box;-webkit-text-size-adjust: none;'>"
				+ "<table width='100%'' style='margin: 0px; padding: 0px; max-width: 600px'"
				+ "border='0' cellspacing='0' cellpadding='0'>"
				+ "<tbody>"
				+ "<tr>"
				+ "<td height='37' style='margin: 0px;padding: 0px;text-align: center;"
				+ "font-family: AppleSDGothicNeo-Regular, Malgun Gothic, 맑은고딕,돋움, dotum, sans-serif;'>"
				+ "<table style='margin: 0px;padding: 0px;width: 100%;"
				+ "font-family: AppleSDGothicNeo-Regular, Malgun Gothic, 맑은고딕,돋움, dotum, sans-serif;'"
				+ "border='0' cellspacing='0' cellpadding='0'></table>"
				+ "</td></tr>"
				+ "<tr><td height='12'></td></tr>"
				+ "<tr><td style='background: rgb(246, 247, 251);"
				+ "padding: 0px 16px;border-radius: 20px 20px 0px 0px;'>"
				+ "<table width='100%' style='margin: 0px; padding: 0px'"
				+ "border='0' cellspacing='0' cellpadding='0'>"
				+ "<tbody><tr><td height='64'></td></tr>"
				+ "<tr><td style='margin: 0px;padding: 0px;text-align: center;"
				+ "color: rgb(34, 34, 34);line-height: 32px;letter-spacing: -1px;"
				+ "font-family: AppleSDGothicNeo-Regular, Malgun Gothic,맑은고딕, 돋움, dotum, sans-serif;"
				+ "font-size: 24px;'>이메일 인증을 완료하려면<br />"
				+ "<span style='color: rgb(72, 118, 239)'>아래의 인증번호를<br />입력</span>해주세요.</td></tr>"
				+ "<tr><td height='48'></td></tr>"
				+ "<tr><td style='background: rgb(255, 255, 255);"
				+ "padding: 24px 20px 48px;border-radius: 10px;text-align: center;'>"
				+ "<table width='100%'style='margin: 0px 0px 24px;padding: 0px;"
				+ "font-family: AppleSDGothicNeo-Regular, Malgun Gothic,맑은고딕, 돋움, dotum, sans-serif;'"
				+ "border='0' cellspacing='0' cellpadding='0'>"
				+ "<tbody><tr><td align='center'"
				+ "style='padding: 0px 0px 16px;color: rgb(34, 34, 34);line-height: 24px;"
				+ "letter-spacing: -0.5px;font-family: AppleSDGothicNeo-Regular,Malgun Gothic, 맑은고딕, 돋움, dotum, sans-serif;"
				+ "font-size: 16px;font-weight: bold;border-bottom-color: rgb(222, 225, 234);"
				+ "border-bottom-width: 1px;border-bottom-style: solid;'>인증번호</td></tr>"
				+ "<tr><td style='padding: 35px 0px 0px;color: rgb(51, 51, 51);line-height: 24px;font-size: 20px;'>"
				+ "<strong>" + authNumber + "</strong>"
				+ "</td></tr></tbody></table>"
				+ "<p style='margin: 0px;color: rgb(148, 148, 148);line-height: 18px;letter-spacing: -0.5px;font-size: 12px;'>"
				+ "* 개인정보 보호를 위해 이메일 인증번호는 3분간 유효합니다.</p>"
				+ "</td></tr>"
				+ "<tr><td height='64'></td></tr></tbody></table>"
				+ "</td></tr></tbody></table></div></div>";  
				
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}
	
	//승인 시 보낼 이메일
	public String acceptEmail(String email) throws UnsupportedEncodingException{
		String setFrom = "hjpark9833@gmail.com";
		String toMail = email;
		String title = "[INU] 신청이 승인되었습니다.";
		String content =
				"<div style='background: rgb(255, 255, 255);margin: 0px;padding: 0px;"
				+ "font-family: AppleSDGothicNeo-Regular, Malgun Gothic, 맑은고딕, 돋움, dotum,sans-serif;'>"
				+ "<div style='background: rgb(255, 255, 255);margin: 0px auto;"
				+ "padding: 0px;width: 100%;letter-spacing: -1px;"
				+ "font-family: AppleSDGothicNeo-Regular, Malgun Gothic, 맑은고딕, 돋움,dotum, sans-serif;"
				+ "max-width: 600px;box-sizing: border-box;-webkit-text-size-adjust: none;'>"
				+ "<table width='100%'style='margin: 0px; padding: 0px; max-width: 600px'"
				+ "border='0' cellspacing='0' cellpadding='0'>"
				+ "<tbody><tr><td height='37'style='margin: 0px;padding: 0px;'>"
				+ "<table style='margin: 0px;padding: 0px;width: 100%;'"
				+ "border='0' cellspacing='0' cellpadding='0'>"
				+ "</table></td></tr>"
				+ "<tr><td height='12'></td></tr>"
				+ "<tr><td style='background: rgb(246, 247, 251);"
				+ "padding: 0px 16px;border-radius: 20px 20px 0px 0px;'>"
				+ "<table width='100%'style='margin: 0px; padding: 0px'"
				+ "border='0'cellspacing='0'cellpadding='0'>"
				+ "<tbody><tr><td height='32'></td></tr>"
				+ "<tr><td align='center'>"
				+ "<img style='border: 0px currentColor;width: 128px;vertical-align: top;'alt='회원님 반갑습니다.'"
				+ "src='http://www.saraminimage.co.kr/sri/mail/person/img_welcome.png'loading='lazy'/>"
				+ "</td></tr>"
				+ "<tr><td height='24'></td></tr>"
				+ "<tr><td style='margin: 0px;padding: 0px;text-align: center;"
				+ "color: rgb(34, 34, 34);line-height: 32px;letter-spacing: -1px;"
				+ "font-family: AppleSDGothicNeo-Regular, Malgun Gothic,맑은고딕, 돋움, dotum, sans-serif;"
				+ "font-size: 24px;'>"
				+ "<strong style='display: inline-block'>고객</strong>님의<br />"
				+ "신청이 승인되었습니다!</td></tr>"
				+ "<tr><td height='16'></td></tr>"
				+ "<tr><td style='margin: 0px;padding: 0px;text-align: center;"
				+ "color: rgb(102, 102, 102);line-height: 20px;letter-spacing: -0.5px;"
				+ "font-family: AppleSDGothicNeo-Regular, Malgun Gothic,맑은고딕, 돋움, dotum, sans-serif;"
				+ "font-size: 14px;'>저희"
				+ "<span style='color: rgb(72, 118, 239)'>INU를 사용</span>"
				+ "해주셔서 감사합니다!</td></tr>"
				+ "<tr><td height='40'></td></tr>"
				+ "<tr><td align='center'>"
				+ "<img width='258'height='150'style='margin: 0px; vertical-align: top'"
				+ "alt='회원님 반갑습니다.'border='0'"
				+ "src='http://www.saraminimage.co.kr/sri/mail/person/img_join_main.png'"
				+ "loading='lazy'/></td></tr>"
				+ "<tr><td style='background: rgb(255, 255, 255);padding: 24px 20px 48px;"
				+ "border-radius: 10px;'>"
				+ "<table width='100%'style='margin: 0px;padding: 0px;"
				+ "font-family: AppleSDGothicNeo-Regular, Malgun Gothic,맑은고딕, 돋움, dotum, sans-serif;'"
				+ "border='0' cellspacing='0' cellpadding='0'>"
				+ "<tbody><tr><td align='center'"
				+ "style='padding: 0px 0px 16px;color: rgb(34, 34, 34);"
				+ "line-height: 24px;letter-spacing: -0.5px;"
				+ "font-family: AppleSDGothicNeo-Regular,Malgun Gothic, 맑은고딕, 돋움, dotum, sans-serif;"
				+ "font-size: 16px;font-weight: bold;border-bottom-color: rgb(222, 225, 234);"
				+ "border-bottom-width: 1px;border-bottom-style: solid;'>"
				+ "나의 회원가입 정보</td></tr>"
				+ "<tr><td style='padding: 24px 0px 0px; text-align: center'>"
				+ "<table width='100%'style='margin: 0px;padding: 0px;"
				+ "font-family: AppleSDGothicNeo-Regular,Malgun Gothic, 맑은고딕, 돋움, dotum,sans-serif;'"
				+ "border='0'cellspacing='0'cellpadding='0'>"
				+ "<tbody><tr><td style='padding: 0px 0px 12px;width: 88px;"
				+ "text-align: left;color: rgb(102, 102, 102);line-height: 20px;"
				+ "letter-spacing: -0.5px;font-size: 15px;vertical-align: top;'>아이디</td>"
				+ "<td style='padding: 0px 0px 12px 8px;text-align: left;color: rgb(34, 34, 34);"
				+ "line-height: 20px;letter-spacing: 0px;font-size: 16px;'>hjpark9833</td></tr>"
				+ "<tr><td style='padding: 0px 0px 12px;width: 88px;"
				+ "text-align: left;color: rgb(102, 102, 102);line-height: 20px;"
				+ "letter-spacing: -0.5px;font-size: 15px;vertical-align: top;'>이메일</td>"
				+ "<td style='padding: 0px 0px 12px 8px;text-align: left;color: rgb(34, 34, 34);"
				+ "line-height: 20px;letter-spacing: 0px;font-size: 16px;'>hjpark9833@naver.com</td></tr>"
				+ "<tr><td style='padding: 0px 0px 12px;width: 88px;"
				+ "text-align: left;color: rgb(102, 102, 102);line-height: 20px;"
				+ "letter-spacing: -0.5px;font-size: 15px;vertical-align: top;'>가입 일시</td>"
				+ "<td style='padding: 0px 0px 12px 8px;text-align: left;color: rgb(34, 34, 34);"
				+ "line-height: 20px;letter-spacing: 0px;font-size: 16px;'>2023-03-16(목)</td></tr>"
				+ "</tbody></table></td></tr></tbody></table></td></tr>"
				+ "<tr><td height='64'></td></tr></tbody></table>"
				+ "</td></tr></tbody></table></div></div>"
			    
				
				+"안녕하세요 INU입니다. 고객님의 신청이 승인되었습니다. " 
			    +"저희 INU를 사용해 주셔서 감사합니다.";
				
		mailSend(setFrom, toMail, title, content);
		return "/";
	}
	//반려 시 보낼 이메일
	public String returnEmail(String email) throws UnsupportedEncodingException{
		String setFrom = "hjpark9833@gmail.com";
		String toMail = email;
		String title = "[INU] 신청이 승인되지 않았습니다.";
		String content =
				"안녕하세요 INU입니다. 고객님의 신청이 요구사항에 부적합하여 승인이 되지 않았습니다. " + 
						"다시 확인하여 신청해 주세요.";
		
		mailSend(setFrom, toMail, title, content);
		return "/";
	}
	

	//이메일 전송 메소드
	public void mailSend(String setFrom, String toMail, String title, String content) throws UnsupportedEncodingException {
		MimeMessage message = mailSender.createMimeMessage();
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자  인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(new InternetAddress(setFrom,"INU"));
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
