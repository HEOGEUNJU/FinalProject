package kr.or.ddit.enumpkg;

public enum ResumeItem {
	EDU("학력"),
	CRR("경력"),
	CRT("자격증"),
	FAC("기능"),
	ACT("주요활동"),
	CRS("교육이수"),
	AWD("수상내역");

	private String name;
	
	ResumeItem(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	
}
