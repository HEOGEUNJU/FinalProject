package kr.or.ddit.ui.fullcalendar;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Random;

import com.fasterxml.jackson.annotation.JsonInclude;

import kr.or.ddit.announcement.vo.AnnoVO;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class AnnoFullCalendarEvent extends FullCalendarEventAdapter<AnnoVO>{

	private SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	private String annoNo;
	
	public AnnoFullCalendarEvent(AnnoVO source) {
		super(source);
		this.annoNo = source.getAnnoNo();
	}

	@Override
	public String getId() {
		return getSource().getAnnoNo();
	}

	@Override
	public boolean isAllDay() {
		return true;
	}
	
	@Override
	public long getStart() {
		long start = 0;
		try {
			 start = formatter.parse(getSource().getAnnoStartdate().substring(0, 16)).getTime();
		} catch (ParseException e) {
			new RuntimeException(e);
		}
		return start;
	}

	@Override
	public long getEnd() {
		long end = 0;
		try {
			end = formatter.parse(getSource().getAnnoEnddate().substring(0, 16)).getTime();
		} catch (ParseException e) {
			new RuntimeException(e);
		}
		return end;
	}

	@Override
	public String getTitle() {
		return getSource().getAnnoTitle();
	}
	
	@Override
	public String getBackgroundColor() {
		String color = "";
		String annoNo = this.annoNo.substring(7);
		if (annoNo.equals("0")) {
			color = "#54478c";
		} else if (annoNo.equals("1")) {
			color = "#2c699a";
		} else if (annoNo.equals("2")) {
			color = "#048ba8";
		} else if (annoNo.equals("3")) {
			color = "#0db39e";
		} else if (annoNo.equals("4")) {
			color = "#16db93";
		} else if (annoNo.equals("5")) {
			color = "#83e377";
		} else if (annoNo.equals("6")) {
			color = "#b9e769";
		} else if (annoNo.equals("7")) {
			color = "#efea5a";
		} else if (annoNo.equals("8")) {
			color = "#f1c453";
		} else if (annoNo.equals("9")) {
			color = "#f29e4c";
		}
		return color;
	}
	
	@Override
	public String getUrl() {
		return "/INUProject/announcement/view/"+getId();
	}

}
