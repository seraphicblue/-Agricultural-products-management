package stock_m.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import stock_m.dto.NameAndPrice_sabDto;

@Mapper
public interface NameAndPrice_sabDao {
	
	@Select("select sno,scontent,s_volume, s_val from stock where userid=#{userid}")
	List<NameAndPrice_sabDto> namePrice(String userid);
	
}
