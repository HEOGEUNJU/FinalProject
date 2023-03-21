package kr.or.ddit.system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.AlarmVO;

@Mapper
public interface AlarmDAO {

	public List<AlarmVO> selectAlarmList(String memId);
	public AlarmVO selectAlarm(String alarmId);
	public int insertAlarm(AlarmVO alarm);
	public int updateAlarm(AlarmVO alarm);
	public int deleteAlarm(String alarmId);
}
