package kr.or.ddit.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.websocket.server.PathParam;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.announcement.service.AnnoService;
import kr.or.ddit.announcement.vo.AnnoVO;
import kr.or.ddit.apply.service.ApplyService;
import kr.or.ddit.apply.vo.ApplyVO;
import kr.or.ddit.company.service.CompanyService;
import kr.or.ddit.company.vo.CompanyVO;
import kr.or.ddit.expert.service.ExcartService;
import kr.or.ddit.expert.service.ExpertService;
import kr.or.ddit.expert.service.ExprodService;
import kr.or.ddit.expert.service.ExreviewService;
import kr.or.ddit.expert.vo.ExcartVO;
import kr.or.ddit.expert.vo.ExpertVO;
import kr.or.ddit.expert.vo.ExreviewVO;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.resume.service.ResumeService;
import kr.or.ddit.resume.vo.ResumeVO;
import kr.or.ddit.security.AuthMember;
import kr.or.ddit.selfpr.service.SelfprService;
import kr.or.ddit.selfpr.vo.SelfprVO;
import kr.or.ddit.vo.IncruiterVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.SeekerVO;

@Controller
@RequestMapping("/mypage")
public class MemberMypageController {
	
	@Inject
	private ApplyService applyService;
	@Inject
	private ResumeService service;
	@Inject
	private MemberService memService;
	@Inject
	private ExcartService excartService;
	@Inject
	private ExpertService expertService;
	@Inject
	private PasswordEncoder encoder;
	@Inject
	private AnnoService annoService;	
	@Inject
	private CompanyService companyService;	
	@Inject
	private SelfprService selfprService;	
	@Inject
	private ExprodService exprodService;	
	@Inject
	private ExreviewService exreviewService;	
	@GetMapping("/seeker")
	public String seekerMypage(
		@AuthMember MemberVO authMember,
		Model model
		) {
		String memId = authMember.getMemId();
		SeekerVO seeker = new SeekerVO();
		List<ExcartVO> excartList = excartService.MypageSelectExcartList(memId);
		List<ResumeVO> resumeList = service.retrieveResumeList(authMember.getMemId());
		List<ApplyVO> applyList = applyService.retrieveApplyList(authMember.getMemId());
		List<AnnoVO> likeAnnoList = annoService.retrieveLikeAnnoListMypage(memId);
		List<CompanyVO> likeCompanyList = companyService.retrieveLikeCompanyList(memId);
		List<SelfprVO> selfPrList = selfprService.retrieveSelfprMypage(memId);
		seeker = memService.retrieveSeeker(memId);
		model.addAttribute("likeAnnoList", likeAnnoList);
		model.addAttribute("applyList", applyList);
		model.addAttribute("seeker", seeker);
		model.addAttribute("excartList", excartList);
		model.addAttribute("resumeList", resumeList);	
		model.addAttribute("likeCompanyList", likeCompanyList);	
		model.addAttribute("selfPrList", selfPrList);	
		return "mypage/seekerMypage";
	}
	@GetMapping("/incruiter")
	public String incuiterMypage(
		@AuthMember MemberVO authMember
		, Model model
		) {
		IncruiterVO incruiter = new IncruiterVO();
		List<AnnoVO> list = annoService.retrieveMyAnnoList(authMember.getMemId());
		incruiter = memService.retrieveMypageIncruiter(authMember.getMemId());
		System.out.println("+++++++++++++++"+incruiter);
		model.addAttribute("incruiter", incruiter);
		model.addAttribute("list", list);
		return "mypage/incruiterMypage";
	}
	@GetMapping("/expert")
	public String expertMypage(
		@AuthMember MemberVO authMember,
		Model model
		) {
		String memId = authMember.getMemId();
		SeekerVO seeker = new SeekerVO();
		ExpertVO expert = new ExpertVO();
		List<ExcartVO> excartList = exprodService.retrieveExcartMypage(memId);
		List<ExreviewVO> exreviewList = exreviewService.retrieveReviewMypageList(memId);
		seeker = memService.retrieveSeeker(memId);
		expert  = expertService.retrieveMember(memId);
		model.addAttribute("seeker", seeker);
		model.addAttribute("expert", expert);
		model.addAttribute("excartList", excartList);
		model.addAttribute("exreviewList", exreviewList);
		return "mypage/expertMypage";
	}
	
	@PostMapping(value="/checkMempass", produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> checkMempass(
		@RequestBody Map<String, String> inputMember	,
		@AuthMember MemberVO authMember
		) {
		String memPass = inputMember.get("memPass");
		String memId = authMember.getMemId();
		MemberVO member = new MemberVO();
		member = memService.retrieveMember(memId);
		String originMempass = member.getMemPass();
		
		Map<String, Object> message = new HashMap<>();
		if(encoder.matches(memPass, originMempass)) {
			message.put("message","equal");
		}else {
			message.put("message","not equal");
		}
		return message;
	}
}
