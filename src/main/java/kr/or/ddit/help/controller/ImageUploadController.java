package kr.or.ddit.help.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ImageUploadController {
	
	@Value("#{appInfo.noticeFolder}")
	private File attachFolder;
	
	@Value("#{appInfo.noticeFolder}")
	private String attachFolderURL;
	
	@PostConstruct
	public void init() throws IOException {
		log.info("이미지 저장 경로 : {}", attachFolder.getCanonicalPath());
		if(!attachFolder.exists())
			attachFolder.mkdirs();
	}
	
	@RequestMapping(value="/help/notice/noticeAttach", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object>  uploadAttach(@RequestPart MultipartFile upload, HttpServletRequest req) throws IllegalStateException, IOException {
//		1. 업로드: 2진 데이터 저장(web resource)
		String saveName = UUID.randomUUID().toString();
		upload.transferTo(new File(attachFolder, saveName));
//		2. JSON 생성 (filename, uploaded, url)
		Map<String, Object> marshallingTarget = new HashMap<>();
		marshallingTarget.put("filename", upload.getOriginalFilename());
		marshallingTarget.put("uploaded", 1);
		String url = req.getContextPath() + attachFolderURL + "/" +saveName;
		marshallingTarget.put("url", url);
		return marshallingTarget;
	}
}










