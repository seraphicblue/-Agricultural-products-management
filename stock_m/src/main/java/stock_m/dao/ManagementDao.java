/*
   Date    : 2023.05.06
   name    : management
   type    : java
   ver     : 1.0
   conect  : managementDao
   content : 유의 업체 정보 저장
   writer  : 고상원
   api     : x
  */

package stock_m.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import stock_m.dto.ManagementDto;
import stock_m.dto.UserDto;

@Mapper
public interface ManagementDao {

		int count();
		int countSearch(String keyword);
		int insert(String id);
		int find(String m_content);
		List<ManagementDto>managementList(Map<String,Object> m);
		List<ManagementDto>maList(Map<String,Object> m);
		List<UserDto> UserList(Map<String, Object> m);
		List<UserDto> UList(Map<String, Object> m);
		int delete(int find); // insert,update,delete는 리턴 값 int
		int count1();
		int check(String id);

}
