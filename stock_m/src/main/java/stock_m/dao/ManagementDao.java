/*
   Date    : 2023.05.11
   name    : management
   type    : java
   ver     : 1.1
   conect  : managementDao
   content : 회사 유의 업체 구분 변경
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
		int insert2(String id);
		int find(String m_content);
		int delete(int find); // insert,update,delete는 리턴 값 int
		int count1();
		int check(String id);
		int update(String m_content);
		int update2(String m_content);
		boolean check2(String m_content);
		List<ManagementDto>managementList(Map<String,Object> m);
		List<ManagementDto>maList(Map<String,Object> m);
		List<UserDto> UserList(Map<String, Object> m);
		List<UserDto> UList(Map<String, Object> m);
		List<ManagementDto> mainList(Map<String, Object> m);
		boolean switch1(String m_content);
		
		
		
		

}
