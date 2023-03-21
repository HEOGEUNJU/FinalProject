package kr.or.ddit.process.vo;

import java.util.List;

import kr.or.ddit.vo.CommonsAttachVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class ProcessVO extends CommonsAttachVO {

	private String daNo;
	private String processCodeId;
	private Integer processSn;
	private String processStartDate;
	private String processEndDate;
	private String processWay;
	private Integer processScore;
	private String tblId;
	private String processLimit;
	private String processDeleteDate;
	private String processInsertDate;
	
	private List<ProcessVO> processList;

	private String processCodeName;
	
	public void setProcessStartDate(String processStartDate) {
		if (processStartDate.length() < 16) {
			this.processStartDate = processStartDate;
		} else {
			this.processStartDate = processStartDate.substring(0, 16);
		}
	}

	public void setProcessEndDate(String processEndDate) {
		if (processEndDate.length() < 16) {
			this.processEndDate = processEndDate;
		} else {
			this.processEndDate = processEndDate.substring(0, 16);
		}
	}

	public void setProcessDeleteDate(String processDeleteDate) {
		this.processDeleteDate = processDeleteDate.substring(0, 10);
	}

	public void setProcessInsertDate(String processInsertDate) {
		this.processInsertDate = processInsertDate.substring(0, 10);
	}
	
	private List<ItemVO> itemList;
	
	private String annoNo;
	private String daFd;
	
	@Override
	public String getTblId() {
		return this.daNo + this.processCodeId;
	}
}
