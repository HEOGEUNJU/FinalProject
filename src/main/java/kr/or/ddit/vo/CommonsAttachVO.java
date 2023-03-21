package kr.or.ddit.vo;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Alias("CommonsAttachVO")
@Data
public abstract class CommonsAttachVO {

	private List<AttachVO> attatchList;	// has many

	private int[] delAttNos; // 게시글 수정시 삭제할 첨부파일 번호 유지.

	private int attCount;

	private MultipartFile[] attachFiles;

	private int startAttNo;

	public void setAttachFiles(MultipartFile[] attachFiles) {
		if(attachFiles!=null && attachFiles.length > 0) {
			this.attachFiles = attachFiles;
			this.attatchList = Arrays.stream(attachFiles)
					.filter((f) ->!f.isEmpty())
					.map((f)->{
						return new AttachVO(f);
					}).collect(Collectors.toList());
		}

	}

	public abstract String getTblId();

}
