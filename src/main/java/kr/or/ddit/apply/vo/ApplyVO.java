package kr.or.ddit.apply.vo;

import kr.or.ddit.announcement.vo.AnnoDetailVO;
import kr.or.ddit.company.vo.CompanyVO;
import kr.or.ddit.myintro.vo.MyintroVO;
import kr.or.ddit.process.vo.ProcessVO;
import kr.or.ddit.announcement.vo.AnnoVO;
import kr.or.ddit.resume.vo.ResumeVO;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ApplyVO {
	private String applySn;
	private String daNo;
	private String memId;
	private String resumeSn;
	private String myintroSn;
	private String applyDate;
	private String applyUpdateDate;
	private String applyDeleteDate;
	private String processCodeId;
	private String applyResult;
	private Integer applyTotal;
	private String applyResultDate;
	private String annoNo;
	
	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate.substring(0, 10);
	}
	
	private ResumeVO resume;
	private AnnoDetailVO detail;
	private AnnoVO anno;
	private CompanyVO company;
	private ProcessVO process;
	private MyintroVO myintro;
	
	private Object selected;
	
	private ScoreResumeVO scoreResume;
	private ScoreIntroVO scoreIntro;
	private ScoreTestVO scoreTest;
	private ScoreCompVO scoreComp;
	private ScoreDiscussVO scoreDiscuss;
	private ScorePracticeVO scorePractice;
	private ScoreInternVO scoreIntern;
	private ScoreIndepthVO scoreIndepth;
	
}