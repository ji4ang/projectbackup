package jisang.poyong.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import jisang.poyong.mapper.ChatMapper;
import jisang.poyong.vo.UserVO;
import jisang.poyong.vo.ChatVO;

import jisang.poyong.mapper.ChatMapper;
import jisang.poyong.vo.ChatVO;
import jisang.poyong.vo.UserVO;


@Controller
public class ChatController {
	
	@Autowired
    private final ChatMapper chatMapper;

    @Autowired
    public ChatController(ChatMapper chatMapper) {
        this.chatMapper = chatMapper;
    }

    @GetMapping("/LoadChat.do")
    public String chatPage(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        UserVO currentUser = (UserVO) session.getAttribute("SignIn");
        if (currentUser == null) {
            // 로그인되지 않은 사용자 처리
            return "redirect:/SignIn.do";
        }

        String userId = currentUser.getUserid();
        ArrayList<ChatVO> chatList = chatMapper.LoadChat(userId);

        // 데이터 확인을 위한 print 문 추가
        for (ChatVO chat : chatList) {
            System.out.println(chat);
        }

        model.addAttribute("chatList", chatList);
        model.addAttribute("currentUser", currentUser);

       return "/jisang/ChatPage"; // ChatPage.jsp로 직접 이동
   }
    
    @PostMapping("/SendChat.do")
    public String sendChat(HttpServletRequest request, ChatVO chatVO) {
    	System.out.println("메시지 전송");
    	HttpSession session = request.getSession();
        UserVO currentUser = (UserVO) session.getAttribute("SignIn");
        if (currentUser == null) {
            // 로그인되지 않은 사용자 처리
            return "redirect:/SignIn.do";
        }
        chatVO.setSenduser(currentUser.getUserid());
        chatMapper.SendChat(chatVO);
        return "redirect:/ChatPage.do";
    }


}