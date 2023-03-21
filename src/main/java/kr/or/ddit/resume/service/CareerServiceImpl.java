package kr.or.ddit.resume.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.resume.dao.CareerDAO;
import kr.or.ddit.resume.vo.CareerVO;

/**
 * @author 최경수
 * @since 2023. 2. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 	    수정일               수정자                                     수정내용
 * --------     --------    ----------------------
 * 2023. 2. 6.       최경수        최초작성
 * 2023. 2. 7.       최경수        삭제 추가
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Service
public class CareerServiceImpl implements CareerService {

	@Inject
	private CareerDAO dao;
	
	@Override
	public CareerVO retrieveCareer(String careerSn) {
		CareerVO career = dao.selectCareer(careerSn);
		return career;
	}

	@Override
	public List<CareerVO> retrieveCareerList(String memId) {
		List<CareerVO> careerList = dao.selectCareerList(memId);
		return careerList;
	}

	@Override
	public ServiceResult createCareer(CareerVO career) {
		int rowcnt = dao.insertCareer(career);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modifyCareer(CareerVO career) {
		int rowcnt = dao.updateCareer(career);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeCareer(String careerSn) {
		int rowcnt = dao.deleteCareer(careerSn);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

}
