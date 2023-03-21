package kr.or.ddit.announcement.vo;

import java.util.List;

import kr.or.ddit.process.vo.ProcessVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode
@ToString
public class AnnoDetailVO {
	private String daNo;
	private String annoNo;
	private String daFd; //모집분야
	private String daCount; //모집인원
	private String daTask; //담당업무
	private String daDepartment;
	private String daCondition;
	private String daPrefer;
	private String daWorkday;
	private String daWorktime;
	private String daCarYeer;
	private String job0; //code
	private String job1; //code
	private String jobCode; //code
	private String jobName;
	private String regionCode; //code
	private String regionName;
	private String empltypeCode; //code
	private String empltypeName; 
	private List<String> inpositionCode; //insert용
	
	private AnnoRegionVO regionVO;
	private List<AnnoPositionVO> positionList;
	private List<String> careerNames;
	
	private List<ProcessVO> processList;
	private double percent;
	private String annoTitle;
	
//	public void setProcessList(List<ProcessVO> processList) {
//		if (processList == null) {
//			ProcessVO vo = new ProcessVO();
//			vo.setProcessStartDate("2020-01-01");
//			vo.setProcessEndDate("2020-01-01");
//			this.processList.add(vo);
//		} else {
//			this.processList = processList;
//		}
//	}
}
