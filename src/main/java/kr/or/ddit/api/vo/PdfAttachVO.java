package kr.or.ddit.api.vo;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.nio.file.Files;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.web.context.support.ServletContextResource;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Data
@EqualsAndHashCode(of="attNo")
@NoArgsConstructor
@ToString(exclude="realFile")
public class PdfAttachVO implements Serializable {
	@JsonIgnore
	private transient File realFile;
	public PdfAttachVO(File realFile) throws IOException {
		super();
		this.realFile = realFile;
		this.attStreCours = realFile.getPath();
		this.attSavename = realFile.getName();
		this.attFilename = realFile.getName();
		this.attMime = Files.probeContentType(realFile.toPath());
		this.attFilesize = realFile.length();
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
}
