package stock_m.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface RevenueDao {
	
	@Select("select profit from revenue where userid = 'testcompany1'")
	int checks();
	 
}
