package kr.or.ddit.lab.vo;

import java.sql.Date;

import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.AttachVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class NewsVO extends AttachVO{
	
	public NewsVO(MultipartFile realFile) {
		super(realFile);
	}

	@NotNull
	private String newsNo;
	private String newsField;
	private String newsName;
	private String newsSemiName;
	private int newsHit;
	private Date newsDate;
	private String newsContent;
	
	private int newsFieldSum;
	
	public String getTblId() {
		return this.newsNo;
	}
}
