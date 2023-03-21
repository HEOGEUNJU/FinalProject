package kr.or.ddit.api.controller;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.text.MessageFormat;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.ResourceHttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

/**
 * @author 작성자명
 * @since 2023. 2. 26.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                 수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 26.   양서연               최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Controller
@RequestMapping("file")
public class FileDownloadController {
	
	@Value("#{appInfo.resumeFolder}")
	private File fileFolder;
	
	@RequestMapping
	public String viewer(Model model) {
		String[] children = fileFolder.list();
		model.addAttribute("files", children);
		//구인자 혹은 구직자가 채용과정 페이지에서 다운받을 수 있어야 함
		//tblId(이력서ID)+attno(순번) => pdfAttachVO
		
		return "pdf/fileView";
	}
	
	/**
	 * @param filename
	 * @return 파일 전송을 위해 {@link Resource} 구현체를 HttpEntity body 로 세팅하면  {@link ResourceHttpMessageConverter} 에 의해 response body 에 stream copy 되어 전송됨. 
	 * @see ResponseEntity
	 */
	@RequestMapping("single")
	public ResponseEntity<?> singleDownload(@RequestParam("what") String filename) {
		log.info("=======what : {}",filename);
		//pdfAttachVO.attFilename (원본이름 + 확장자)
		
		File downloadFile = new File(fileFolder, filename);
		if(!downloadFile.exists())
			return ResponseEntity.status(HttpStatus.NOT_FOUND)
								.contentType(new MediaType(MediaType.TEXT_HTML, StandardCharsets.UTF_8))
								.body(String.format("<html><body>%s 파일이 없음.</body></html>", filename));
		else
			return ResponseEntity.ok()
								.contentType(MediaType.APPLICATION_OCTET_STREAM)
								.contentLength(downloadFile.length())
//								.header(HttpHeaders.CONTENT_DISPOSITION, MessageFormat.format("attatchment;filename=\"{0}\"", new Object[] {filename}))
								.header(HttpHeaders.CONTENT_DISPOSITION, MessageFormat.format("attatchment;filename=\"{0}\"", new Object[] {filename+".pdf"}))
								.body(new FileSystemResource(downloadFile));
		
	}
}

