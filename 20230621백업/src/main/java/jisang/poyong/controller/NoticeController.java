package jisang.poyong.controller;

import jisang.poyong.mapper.BusinessMapper;
import jisang.poyong.mapper.NoticeMapper;
import jisang.poyong.vo.BusinessVO;
import jisang.poyong.vo.ChatVO;
import jisang.poyong.vo.NoticeVO;
import jisang.poyong.vo.UserVO;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class NoticeController {
    private final BusinessMapper businessMapper;

    public NoticeController(BusinessMapper businessMapper) {
        this.businessMapper = businessMapper;
    }

    @GetMapping("/business.do")
    public String loadBusinessInfo(Model model, HttpSession session) {
        UserVO user = (UserVO) session.getAttribute("SignIn");
        String userid = user.getUserid();
        
        BusinessVO business = businessMapper.loadBusiness(userid);
        model.addAttribute("business", business);
        session.setAttribute("business", business);
        System.out.println(business);
        return "redirect:/Notice.do";
    }
    
    @GetMapping("/business2.do")
    public String loadBusinessInfo2(Model model, HttpSession session) {
        UserVO user = (UserVO) session.getAttribute("SignIn");
        String userid = user.getUserid();
        
        BusinessVO business = businessMapper.loadBusiness(userid);
        model.addAttribute("business", business);
        session.setAttribute("business", business);
        System.out.println(business);
        return "redirect:/CompanyMyinfo.do";
    }
    
    @GetMapping("/business3.do")
    public String loadBusinessInfo3(Model model, HttpSession session) {
        UserVO user = (UserVO) session.getAttribute("SignIn");
        String userid = user.getUserid();
        
        BusinessVO business = businessMapper.loadBusiness(userid);
        model.addAttribute("business", business);
        session.setAttribute("business", business);
        System.out.println(business);
        return "redirect:/CompanyMyinfo.do";
    }
//    @GetMapping("/NoticeResult.do")
//    public String NoticeResult(NoticeVO notice) {
//    	
//    	return "/jisang/noticeresult";
//    }
    		
}