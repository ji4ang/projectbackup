package minseong.board.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;


// 우리가 알고있는 DAO와 같은 기능을 할 것
// @Repository
@Mapper
public interface BoardMapper {
				// mapper.xml과 이름 일치시킬것
	// Java 코드와 SQL문 따로 관리하게 되면서 둘을 연결 시킴(mapping)
	
	// 결과에 맞는 리턴 타입으로 지정
	// xml에서 id와 일치시키기


}