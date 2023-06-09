package kr.or.ddit.lab.vo;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="attNo")
@NoArgsConstructor
@ToString(exclude="realFile")
public class CounAttachVO implements Serializable {
	@JsonIgnore
	private transient MultipartFile realFile;
	public CounAttachVO(MultipartFile realFile) {
		super();
		this.realFile = realFile;
		this.attFilename = realFile.getOriginalFilename();
		this.attSavename = UUID.randomUUID().toString();
		this.attMime = realFile.getContentType();
		this.attFilesize = realFile.getSize();
		this.attFancysize = FileUtils.byteCountToDisplaySize(attFilesize);
	}
	
	private String tblId;
	private Integer attNo;
	private String attStreCours;
	private String attSavename;
	private String attFilename;
	private String attMime;
	private Long attFilesize;
	private String attFancysize;
	private Integer attDownload;
	private int startAttNo;
	
	public void saveTo(File saveFolder) throws IOException {
		if(realFile==null || realFile.isEmpty()) return;
		realFile.transferTo(new File(saveFolder, attSavename));
	}
}
