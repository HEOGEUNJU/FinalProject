package kr.or.ddit.system.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.system.dao.AlarmDAO;
import kr.or.ddit.vo.AlarmVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AlarmServiceImpl implements AlarmService {

	private final AlarmDAO dao;
	
	@Override
	public List<AlarmVO> retrieveAlarmList(String memId) {
		return dao.selectAlarmList(memId);
	}

	@Override
	public AlarmVO retrieveAlarm(String alarmId) {
		return dao.selectAlarm(alarmId);
	}

	@Override
	public int createAlarm(AlarmVO alarm) {
		int rowcnt = dao.insertAlarm(alarm);
		return rowcnt;
	}

	@Override
	public int modifyAlarm(AlarmVO alarm) {
		int rowcnt = dao.updateAlarm(alarm);
		return rowcnt;
	}

	@Override
	public int removeAlarm(String alarmId) {
		int rowcnt = dao.deleteAlarm(alarmId);
		return rowcnt;
	}

}
