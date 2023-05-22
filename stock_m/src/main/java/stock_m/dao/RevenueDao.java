package stock_m.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface RevenueDao {
	
	@Select("select profit from revenue where userid =#{userid}")
	int checks(String userid);
	
	@Update("UPDATE revenue SET profit=profit-#{s_price} WHERE userid = #{userid}")
	int updater(@Param("s_price")int s_price, @Param("userid") String userid);
	 
}
