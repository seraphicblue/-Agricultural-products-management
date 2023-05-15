package stock_m.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import stock_m.dto.UserDto;

@Mapper
public interface UserDao {
	@Select("select * from users where userid = #{userid}")
	UserDto findById(String id);
	
	@Insert("insert into users values (#{userid}, #{userpw}, #{gender}, #{age}, #{username},#{role},#{enabled})")
	int insertUser(UserDto user);
}