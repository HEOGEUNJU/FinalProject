package kr.or.ddit.expert.vo;

import java.io.Serializable;
import java.util.List;

import kr.or.ddit.vo.CommonsAttachVO;
import kr.or.ddit.vo.MemberVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="exprodId")
public class ExprodVO extends CommonsAttachVO implements Serializable{
	private int rnum;
	private String exprodId;
	private String exprodStart;
	private String exprodEnd;
	private String exprodTarget;
	private String exprodName;
	private String exprodPrice;
	private String exprodWay;
	private String exprodTime;
	private String exprodDetail;
	private String memId;
	private String expertId;
	private String memName;
	private String memEmail;
	private String memTel;
	private String expertField;
	private String exprodAproval;
	private String exlprodId;
	private String exfieldId;
	private String exjobId;
	private String exprodPr;
	private String preExprod;
	private String nextExprod;
	private String exprodAppliDate;
	private String exprodApprovalDate;
	private String attSavename;
	private ExprodVO exprod;
	private List<ExcartVO> excartList;
	private List<ExreviewVO> exreviewList;
	
	
	public String getPreExprod() {
		if(preExprod!=null) {
			return preExprod;
		}else if(preExprod==null){
			preExprod = null;
		}
		return preExprod;
		
	}
	public String getNextExprod() {
		if(nextExprod!=null) {
			return nextExprod;
		}else if(nextExprod==null){
			nextExprod = null;
		}		
		
		return nextExprod;
	}
	@Override
	public String getTblId() {
		// TODO Auto-generated method stub
		return exprodId;
	}
	
	
}
