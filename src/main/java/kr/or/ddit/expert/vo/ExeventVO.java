package kr.or.ddit.expert.vo;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.CommonsAttachVO;
import kr.or.ddit.vo.MenuVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="exeventId")
public class ExeventVO extends CommonsAttachVO implements Serializable{
	
	
	private int rnum;
	@NotNull(groups= {UpdateGroup.class, DeleteGroup.class})
	private String exeventId;
	private String exeventName;
	private String exeventContent;
	private String exeventStart;
	private String exeventEnd;
	private int exeventHits;
	private String preExevent;
	private String nextExevent;	
	
	public String getPreExevent() {
		if(preExevent!=null) {
			return preExevent;
		}else if(preExevent==null){
			preExevent = null;
		}
		return preExevent;
	}
	public String getNextExevent() {
		if(nextExevent!=null) {
			return nextExevent;
		}else if(nextExevent==null){
			nextExevent = null;
		}
		return nextExevent;
	}
	
	@Override
	public String getTblId() {
		return exeventId;
	}
	

}
