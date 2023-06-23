package jisang.poyong.mapper;

import org.apache.ibatis.annotations.Mapper;

import jisang.poyong.vo.BusinessVO;
import jisang.poyong.vo.ChatVO;
import jisang.poyong.vo.UserVO;

import java.util.ArrayList;

@Mapper
public interface BusinessMapper {
  
	BusinessVO loadBusiness(String userid);
    
}