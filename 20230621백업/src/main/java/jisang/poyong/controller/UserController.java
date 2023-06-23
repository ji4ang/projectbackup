package jisang.poyong.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import jisang.poyong.mapper.BusinessMapper;
import jisang.poyong.mapper.ResumeMapper;
import jisang.poyong.mapper.UserMapper;
import jisang.poyong.vo.BusinessVO;
import jisang.poyong.vo.ResumeVO;
import jisang.poyong.vo.UserVO;

@Controller
public class UserController {

	@Autowired
	private UserMapper mapper;

	@Autowired
	private BusinessMapper businessmapper;

	// 개인 회원가입
	@PostMapping("/SignUp2.do")
	public String UserSignUp(UserVO vo) {
		try {
			mapper.UserSignUp(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/SignIn.do";
	}

	// 기업 회원가입
	@PostMapping("/SignUp3.do")
	public String BusinessSignUp(UserVO vo, BusinessVO vo2) {
		try {
			mapper.BusinessSignUp(vo);
			mapper.CompanyInsert(vo2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/SignIn.do";
	}

	// 로그인
	@PostMapping("/SignIn2.do")
	public String SignIn(UserVO vo, HttpServletRequest request, Model model) {
		System.out.println("요청받음");
		UserVO SignIn = mapper.SignIn(vo);
		HttpSession session = request.getSession();

		if (SignIn != null) {
			session.setAttribute("SignIn", SignIn);

			// BusinessVO 조회
			BusinessVO businessVO = businessmapper.loadBusiness(SignIn.getUserid());
			if (businessVO != null) {
				session.setAttribute("business", businessVO);
			}

			System.out.println("성공");
			return "redirect:/MainPage.do";
		} else {
			session.setAttribute("SignIn", null);
			System.out.println("실패");
			session.setAttribute("errorMessage", "로그인에 실패했습니다. 다시 확인해주세요.");
			return "redirect:/SignIn.do";
		}
	}

	// 로그아웃
	@RequestMapping("/Logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/MainPage.do";
	}

	@PostMapping("/Usermyinfoedit.do")
	public String updateUser(UserVO vo, HttpServletRequest request, Model model) {
		// UserVO의 값을 업데이트
		System.out.println("수정요청이 들어옴");
		System.out.println(vo);

		mapper.UpdateUser(vo);
		// 업데이트 후 필요한 작업 수행

		UserVO SignIn = mapper.SignIn(vo);
		HttpSession session = request.getSession();

		session.setAttribute("SignIn", SignIn);
		session.setAttribute("updateMessage", "수정이 완료되었습니다. 다시 로그인해주세요.");

		return "redirect:/SignIn.do?updateSuccess=true";
	}

	@GetMapping("/Companymyinfoedit.do")
	public String updateCompany(UserVO vo, HttpServletRequest request, Model model) {
		// UserVO의 값을 업데이트
		System.out.println("수정요청이 들어옴");

		mapper.UpdateCompany(vo);
		// 업데이트 후 필요한 작업 수행

		UserVO SignIn = mapper.SignIn(vo);
		HttpSession session = request.getSession();

		session.setAttribute("SignIn", SignIn);
		session.setAttribute("updateMessage", "수정이 완료되었습니다. 다시 로그인해주세요.");

		return "redirect:/SignIn.do?updateSuccess=true";
	}

	@GetMapping("/BusinessUpdate.do")
	public String updateBusiness(BusinessVO vo2, UserVO vo, HttpServletRequest request, Model model) {
		// UserVO의 값을 업데이트
		System.out.println("수정요청이 들어옴");
		mapper.BusinessUpdate(vo2);
		// 업데이트 후 필요한 작업 수행

		UserVO SignIn = mapper.SignIn(vo);
		HttpSession session = request.getSession();

		session.setAttribute("SignIn", SignIn);
		session.setAttribute("updateMessage", "수정이 완료되었습니다. 다시 로그인해주세요.");

		return "redirect:/SignIn.do?updateSuccess=true";
	}

	
	
//
//	@Autowired
//	private ResumeMapper resumemapper;
//
//	@GetMapping("/resume.do")
//	public String insertResume(@RequestBody ResumeVO resume) {
//		resumemapper.insertResume(resume);
//		System.out.println("이력서작성");
//		// 적절한 리다이렉션 경로 또는 응답을 반환합니다.
//		return "resumeresult";
//	}

}
