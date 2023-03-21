package kr.or.ddit.system.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.vo.AlarmVO;

public interface AlarmService {

	public List<AlarmVO> retrieveAlarmList(String memId);
	public AlarmVO retrieveAlarm(String alarmId);
	public int createAlarm(AlarmVO alarm);
	public int modifyAlarm(AlarmVO alarm);
	public int removeAlarm(String alarmId);
}
