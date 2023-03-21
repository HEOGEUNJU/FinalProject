package kr.or.ddit.myintro.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.myintro.dao.MyintroDAO;
import kr.or.ddit.myintro.vo.MyintroVO;

@Service
public class MyintroServiceImpl implements MyintroService {

	@Inject
	private MyintroDAO dao;
	
	@Override
	public MyintroVO retrieveMyintro(String myintroSn) {
		MyintroVO myintro = dao.selectMyintro(myintroSn);
		return myintro;
	}

	@Override
	public List<MyintroVO> retrieveMyintroList(String memId) {
		List<MyintroVO> myintroList = dao.selectMyintroList(memId);
		return myintroList;
	}

	@Override
	public ServiceResult createMyintro(MyintroVO myintro) {
		int rowcnt = dao.insertMyintro(myintro);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modifyMyintro(MyintroVO myintro) {
		int rowcnt = dao.updateMyintro(myintro);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeMyintro(String myintroSn) {
		int rowcnt = dao.deleteMyintro(myintroSn);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

}
