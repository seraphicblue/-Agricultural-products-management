package stock_m.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface RevenueDao {
	
	@Select("select `limit` from revenue where userid = 'testcompany'")
	int checks();
 
}
