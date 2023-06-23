package jisang.poyong.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import jisang.poyong.mapper.ChatMapper;
import jisang.poyong.mapper.NoticeMapper;
import jisang.poyong.mapper.ResumeMapper;
import jisang.poyong.vo.BusinessVO;
import jisang.poyong.vo.ChatVO;
import jisang.poyong.vo.NoticeVO;
import jisang.poyong.vo.ResumeVO;
import jisang.poyong.vo.UserVO;

@Controller
public class MainController {

	@Autowired
	private ChatMapper chatMapper;
	@Autowired
	private NoticeMapper noticeMapper;
	@Autowired
	private ResumeMapper resumemapper;
	
	@GetMapping("/MainPage.do")
	public String loadNoticeData(Model model, HttpServletRequest request) {
		List<NoticeVO> notices = noticeMapper.LoadNotice();

		for (NoticeVO notice : notices) {
			int noticejobcode = notice.getNoticejobcode();
			String noticejob = "";

			switch (noticejobcode) {
			case 1:
				noticejob = "IT⦁정보통신";
				break;
			case 2:
				noticejob = "제조⦁생산⦁화학업";
				break;
			case 3:
				noticejob = "건설업";
				break;
			case 4:
				noticejob = "미디어⦁광고업";
				break;
			case 5:
				noticejob = "판매⦁유통업";
				break;
			case 6:
				noticejob = "교육업";
				break;
			case 7:
				noticejob = "의료⦁제약업";
				break;
			case 8:
				noticejob = "문화⦁예술⦁디자인업";
				break;
			case 9:
				noticejob = "서비스업";
				break;
			case 10:
				noticejob = "사무직";
				break;
			default:
				noticejob = "기타";
				break;
			}

			notice.setNoticejob(noticejob);
		}

		model.addAttribute("notices", notices);
		model.addAttribute("path", request.getContextPath());

		return "/jisang/Main";
	}

	@RequestMapping("/InsertNotice.do")
	public String insertNotice(NoticeVO notice) {
		noticeMapper.insertNotice(notice);
		return "redirect:/MainPage.do";
	}

	@PostMapping("/resume.do")
	public String insertResume(ResumeVO resume) {
		System.out.println(resume.toString());
		resumemapper.insertResume(resume);
		System.out.println("ㅎㅇ");
		return "redirect:/MainPage.do";
	}

	@RequestMapping("/SignUp.do")
	public String SignUp() {

		return "/jisang/SignUp";

	}

	@RequestMapping("/Companyedit.do")
	public String Companyedit() {

		return "/jisang/companymyinfoedit";

	}

	@RequestMapping("/Useredit.do")
	public String Useredit() {

		return "/jisang/useredit";
	}

	@RequestMapping("/SignIn.do")
	public String SignIn() {

		return "/jisang/SignIn";

	}

	@RequestMapping("/ChatPage.do")
	public String loadChatData(HttpServletRequest request, Model model) {

		System.out.println("쪽지 페이지로 이동해요");
		HttpSession session = request.getSession();
		UserVO currentUser = (UserVO) session.getAttribute("SignIn");
		if (currentUser == null) {
			// 로그인되지 않은 사용자 처리
			return "/jisang/SignIn";
		}

		String userId = currentUser.getUserid();
		ArrayList<ChatVO> chatList = chatMapper.LoadChat(userId);

		// 데이터 확인을 위한 print 문 추가
		for (ChatVO chat : chatList) {
			System.out.println(chat);
		}

		model.addAttribute("chatList", chatList);
		model.addAttribute("currentUser", currentUser);

		// JSP 파일의 경로와 파일명을 리턴
		return "/jisang/ChatPage"; // JSP 파일명을 리턴
	}

	@RequestMapping("/UserMyinfo.do")
	public String UserMyinfo() {

		return "/jisang/userMyinfo";

	}

	@RequestMapping("/Chart.do")
	public String Chart() {

		return "/jisang/chart";

	}

	@RequestMapping("/CompanyMyinfo.do")
	public String CompanyMyinfo() {

		return "/jisang/companymyinfo";

	}

	@RequestMapping("/Resume.do")
	public String Resume() {

		return "/jisang/resume";

	}

	@RequestMapping("/Career.do")
	public String Carrer() {

		return "/jisang/carrer";

	}

	@RequestMapping("/Companybusinessedit.do")
	public String companybusinessedit() {

		return "/jisang/Companybusinessedit";
	}

	@RequestMapping("/Notice.do")
	public String Notice(HttpSession session) {
		BusinessVO businessAttribute = (BusinessVO) session.getAttribute("business");
		// businessAttribute를 사용하여 필요한 작업을 수행

		return "/jisang/notice";
	}

	@GetMapping("/NoticeResult.do")
	public String noticeResult(@RequestParam("noticeidx") int noticeidx, Model model) {
		System.out.println("noticeresult.do");
		List<NoticeVO> noticeList = noticeMapper.NoticeResult(noticeidx);
		// 필요한 로직 수행
		System.out.println(noticeList);
		model.addAttribute("noticeList", noticeList);
		System.out.println("모델 실행 확인");
		return "/jisang/noticeresult";
	}

	@GetMapping("/resumeresult.do")
	public String getResumeInfo(Model model) {
	    List<ResumeVO> resumeList = resumemapper.ResumeResult();
	    System.out.println(resumeList);

	    model.addAttribute("resumeList", resumeList);
	    return "/jisang/resumeresult"; // 사용자에게 보여줄 뷰의 이름
	}
}
