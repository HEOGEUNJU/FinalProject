package kr.or.ddit.myintro.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.myintro.vo.MyintroVO;

@Mapper
public interface MyintroDAO {

	public MyintroVO selectMyintro(String myintroSn);
	public List<MyintroVO> selectMyintroList(String memId);
	public int insertMyintro(MyintroVO myintro);
	public int updateMyintro(MyintroVO myintro);
	public int deleteMyintro(String myintroSn);
}