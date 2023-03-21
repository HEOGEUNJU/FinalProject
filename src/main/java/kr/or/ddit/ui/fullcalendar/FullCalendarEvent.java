package kr.or.ddit.ui.fullcalendar;

import java.util.Map;

/**
 * @see <a href="https://fullcalendar.io/docs/event-object">FullCalendar Event Model</a>
 */
// 자바8부터 인터페이스에서 default를 통해 메서드를 정의할 수 있다.
// 정의한 것은 구현체에서 따로 안 만들어줘도 됨.
public interface FullCalendarEvent<T> {
	public String getId();
	public default String getGroupId() {
		return null;
	}
	public default boolean isAllDay() {
		return false;
	};
	public long getStart();
	public long getEnd();
	public default String getStartStr() {
		return null;
	}
	public default String getEndStr() {
		return null;
	}
	public String getTitle();
	public default String getUrl() {
		return null;
	}
	public default String[] getClassNames() {
		return null;
	}
	public default boolean isEditable() {
		return false;
	}
	public default boolean isStartEditable() {
		return false;
	}
	public default boolean isDurationEditable() {
		return false;
	}
	public default String getDisplay() {
		return "auto";
	}
	public default String getBackgroundColor () {
		return null;
	}
	public default String getBorderColor() {
		return null;
	}
	public default String getTextColor() {
		return null;
	}
	public default Map<String, Object> getExtendedProps(){
		return null;
	}
	public T getSource();
}
