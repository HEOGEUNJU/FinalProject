package kr.or.ddit.ui.fullcalendar;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Random;

import com.fasterxml.jackson.annotation.JsonInclude;

import kr.or.ddit.announcement.vo.AnnoDetailVO;
import kr.or.ddit.announcement.vo.AnnoVO;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class DetailFullCalendarEvent extends FullCalendarEventAdapter<AnnoDetailVO>{

	private SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	private String daNo;
	
	public DetailFullCalendarEvent(AnnoDetailVO source) {
		super(source);
		this.daNo = source.getDaNo();
	}

	@Override
	public String getId() {
		return getSource().getDaNo();
	}

	@Override
	public boolean isAllDay() {
		return true;
	}
	
	//start, end => processCodeId 중 가장 마지막인 것(or processSn)으로 바꿔주기
	
	@Override
	public long getStart() {
		long start = 0;
		String startDate = getSource().getProcessList().get(0).getProcessStartDate();
		if (startDate == null || startDate.equals("")) {
			try {
				start = formatter.parse("2020-01-01 00:00:00").getTime();
			} catch (ParseException e) {
				new RuntimeException(e);
			}
		} else {
			try {
				start = formatter.parse(startDate.substring(0, 16)).getTime();
			} catch (ParseException e) {
				new RuntimeException(e);
			}
		}
		return start;
	}

	@Override
	public long getEnd() {
		long end = 0;
		int last = getSource().getProcessList().size() - 1;
		String endDate = getSource().getProcessList().get(last).getProcessEndDate();
		if (endDate == null || endDate.equals("")) {
			try {
				end = formatter.parse("2020-01-01 12:00:00").getTime();
			} catch (ParseException e) {
				new RuntimeException(e);
			}
		} else {
			try {
				end = formatter.parse(endDate.substring(0, 16)).getTime();
			} catch (ParseException e) {
				new RuntimeException(e);
			}
		}
		return end;
	}

	@Override
	public String getTitle() {
		StringBuilder str = new StringBuilder();
		str.append(getSource().getDaFd()).append(" - ").append(getSource().getAnnoTitle());
		return str.toString();
	}
	
	@Override
	public String getBackgroundColor() {
		String color = "";
		String daNo = this.daNo.substring(7);
		if (daNo.equals("0")) {
			color = "#54478c";
		} else if (daNo.equals("1")) {
			color = "#2c699a";
		} else if (daNo.equals("2")) {
			color = "#048ba8";
		} else if (daNo.equals("3")) {
			color = "#0db39e";
		} else if (daNo.equals("4")) {
			color = "#16db93";
		} else if (daNo.equals("5")) {
			color = "#83e377";
		} else if (daNo.equals("6")) {
			color = "#b9e769";
		} else if (daNo.equals("7")) {
			color = "#efea5a";
		} else if (daNo.equals("8")) {
			color = "#f1c453";
		} else if (daNo.equals("9")) {
			color = "#f29e4c";
		}
		return color;
	}
	
	@Override
	public String getUrl() {
		return "/INUProject/process/"+ getSource().getAnnoNo() + "/"+ getSource().getDaNo();
	}

}
