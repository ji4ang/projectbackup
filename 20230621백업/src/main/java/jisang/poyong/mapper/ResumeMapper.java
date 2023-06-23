package jisang.poyong.mapper;

import java.util.List;

import jisang.poyong.vo.ResumeVO;


public interface ResumeMapper {

    
    void insertResume(ResumeVO Resume);
    	
    List<ResumeVO> ResumeResult();
}