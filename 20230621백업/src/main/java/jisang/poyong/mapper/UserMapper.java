package jisang.poyong.mapper;

import org.apache.ibatis.annotations.Mapper;

import jisang.poyong.vo.BusinessVO;
import jisang.poyong.vo.UserVO;

@Mapper
public interface UserMapper {


	
	
	public UserVO SignIn(UserVO vo);

	public UserVO UserSignUp(UserVO vo);
	
	void BusinessSignUp(UserVO vo);
	
	void CompanyInsert (BusinessVO vo);
	
	void UpdateUser(UserVO vo);
	
	void UpdateCompany(UserVO vo);
	
	void BusinessUpdate(BusinessVO vo);
	
	 BusinessVO findBusinessInfoByUserid(String userid);
	
//	public void boardInsert(Board vo);
//
//	public Board boardContent(int theIdx);
//
//	public void boardDelete(int idx);
//
//	public void boardUpdate(Board vo);
	
}	 

