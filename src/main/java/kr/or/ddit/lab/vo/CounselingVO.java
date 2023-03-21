package kr.or.ddit.lab.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode
@ToString
@NoArgsConstructor
public class CounselingVO {
	private int rnum;
	private String counNo;
	private String memId;
	private String memName;
	private String counTitle;
	private String counContent;
	private String counDate;
	private String counState;
	private String refCoun;
	private int isrefed;
	private int isAttached;
	private int counHit;
	private String pubChk; //공개글여부 Y,N
	
	private CounselingVO reCoun;
	
	private MultipartFile counFile;
	private CounAttachVO counAttach;
	
	public void setCounFile(MultipartFile counFile) {
		if(counFile!=null) {
			this.counFile = counFile;
			this.counAttach = new CounAttachVO(counFile);
		}
	}
}
