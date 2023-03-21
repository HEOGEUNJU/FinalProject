//package kr.or.ddit.ui.fullcalendar;
//
//import java.util.Random;
//
//import com.fasterxml.jackson.annotation.JsonInclude;
//
//import kr.or.ddit.vo.ProdVO;
//
//@JsonInclude(JsonInclude.Include.NON_NULL)
//public class ProdFullCalendarEvent extends FullCalendarEventAdapter<ProdVO>{ // 인터페이스를 구현한 추상클래스를 상속 받음
//
//	public ProdFullCalendarEvent(ProdVO source) {
//		super(source);
//	}
//
//	@Override
//	public String getId() {
//		return getSource().getProdId();
//	}
//
//	@Override
//	public boolean isAllDay() {
//		return true;
//	}
//	
//	@Override
//	public long getStart() {
//		return getSource().getProdInsdate().getTime();
//	}
//
//	@Override
//	public long getEnd() {
//		return getSource().getProdInsdate().getTime();
//	}
//	
//
//	@Override
//	public String getTitle() {
//		return getSource().getProdName();
//	}
//
//	private Random random = new Random(System.currentTimeMillis());
//	private static int bound = (int) (1*Math.pow(16, 6)); 
//	
//	@Override
//	public String getBackgroundColor() {
//		return "#"+Integer.toString(random.nextInt(bound), 16);
//	}
//	
//	@Override
//	public String getUrl() {
//		return "../prod/"+getId();
//	}
//}
