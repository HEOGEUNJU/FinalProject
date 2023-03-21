package kr.or.ddit.api.service;

import javax.servlet.http.HttpServletRequest;


public interface PdfService {

//	String createPdf(String keyword);

	int createHtmlPdf(String filename, String htmlStr, HttpServletRequest request);

}
