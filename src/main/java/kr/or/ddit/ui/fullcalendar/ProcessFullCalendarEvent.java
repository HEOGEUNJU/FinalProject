package kr.or.ddit.ui.fullcalendar;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Random;

import com.fasterxml.jackson.annotation.JsonInclude;

import kr.or.ddit.announcement.vo.AnnoDetailVO;
import kr.or.ddit.announcement.vo.AnnoVO;
import kr.or.ddit.process.vo.ProcessVO;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class ProcessFullCalendarEvent extends FullCalendarEventAdapter<ProcessVO>{

	private SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	private String daNo;
	
	public ProcessFullCalendarEvent(ProcessVO source) {
		super(source);
		this.daNo = source.getDaNo();
	}

	@Override
	public String getId() {
		return getSource().getProcessCodeId();
	}

	@Override
	public boolean isAllDay() {
		return true;
	}
	
	@Override
	public long getStart() {
		long start = 0;
		String startDate = getSource().getProcessStartDate();
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
		String endDate = getSource().getProcessEndDate();
		if (endDate == null || endDate.equals("")) {
			try {
				end = formatter.parse("2020-01-01 00:00:00").getTime();
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
		str.append(getSource().getProcessCodeName()).append(" - ").append(getSource().getDaFd());
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
		StringBuilder str = new StringBuilder();
		str.append("/INUProject/process/").append(getSource().getAnnoNo()).append("/").append(getSource().getDaNo()).append("/");
		return str.toString();
	}

}
