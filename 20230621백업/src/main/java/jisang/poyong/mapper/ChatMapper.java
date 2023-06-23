package jisang.poyong.mapper;

import org.apache.ibatis.annotations.Mapper;

import jisang.poyong.vo.ChatVO;
import java.util.ArrayList;

@Mapper
public interface ChatMapper {

    // 채팅 보내기
    void SendChat(ChatVO chatVO);

    // 채팅 받기
    ArrayList<ChatVO> ReceiveChat(String receiveuser);

    // 채팅 목록 가져오기
    ArrayList<ChatVO> LoadChat(String user);
}