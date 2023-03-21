package kr.or.ddit.commons;

import java.text.ParseException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.announcement.dao.AnnoDAO;
import kr.or.ddit.announcement.service.AnnoService;
import kr.or.ddit.announcement.vo.AnnoVO;
import kr.or.ddit.expert.service.ExprodService;
import kr.or.ddit.expert.vo.ExprodVO;

@Controller
public class IndexController{
	
	@Inject
	private AnnoService annoService;
	
	@Inject
	private AnnoDAO annoDAO;
	@Inject
	private ExprodService exprodservice;
	
	@RequestMapping("/index.do")
	public String index(Model model, Authentication auth) throws ParseException {
		
		if (auth == null) {
			return "redirect:/login";
		} else if (auth.getName().contains("ADMIN")) {
			return "redirect:/systemManagement/memberList";
		}
		
		List<String> per15List = annoDAO.per15Chk();
		List<AnnoVO> annoList = new ArrayList<>();
		for (String str : per15List) {
			annoList.add(annoService.retrieveAnno(str)); // 여기
		}
		model.addAttribute("annoList", annoList);
		
		List<AnnoVO> list = new ArrayList<>();
		List<AnnoVO> likeList = new ArrayList<>();
		List<ExprodVO> topExprodList = new ArrayList<>(); 
		String now = "";
		
		try {
			String memId = auth.getName();
			String role = auth.getAuthorities().toString();
			topExprodList = exprodservice.selectTopExprodList();
			if (role.contains("SEEKER")) {
				list = annoService.retrieveMyAnnoListSeeker(memId); // 여기
				likeList = annoService.retrieveLikeAnnoList(memId);
				now = LocalDate.now().toString().replace("-", "");

			} else if (role.contains("INCRUITER")) {
				list = annoService.retrieveMyAnnoList(memId);
				likeList = annoService.retrieveLikeAnnoList(memId);
				now = LocalDate.now().toString().replace("-", "");
			} else if (role.contains("ADMIN")) {
				return "redirect:systemManagement/memberList";
			}
			model.addAttribute("likeList", likeList);
			model.addAttribute("list", list);				
			model.addAttribute("now", now);
			model.addAttribute("topExprodList", topExprodList);
			
		} catch (NullPointerException e) {
			return "index";
		}

		return "index";
	}
}
