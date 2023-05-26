package stock_m.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import stock_m.dto.UserDto;

@Mapper
public interface UserDao {
	@Select("select * from user where userid = #{userid}")
	UserDto findById(String userid);
	
	@Insert("insert into user values (#{userid}, #{userpw}, #{gender}, #{age}, #{username},#{role},#{enabled})")
	int insertUser(UserDto user);
	
	@Insert("INSERT INTO revenue(userid,revenuelimit,bsum,ssum,profit) values(#{userid}, 0, 0, 0, 1000000)")
	int insertRevenue(UserDto user);
	
	@Select("select count(*) from user where userid = #{userid}")
	int checkId(String userid);
}