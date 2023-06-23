package jisang.poyong.mapper;

import jisang.poyong.vo.NoticeVO;

import java.util.List;

public interface NoticeMapper {

    // 작성된 공고 불러오기
    List<NoticeVO> LoadNotice();
    
    void insertNotice(NoticeVO notice);
    
    List<NoticeVO> NoticeResult(int noticeIdx);
    
}