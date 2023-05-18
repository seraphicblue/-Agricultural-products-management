package stock_m.dao;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;



@Mapper
public interface BroadcastDao {
	
	@Select("select userid from pricebroadcast where pno = #{pno} AND param <= #{param}")
	public List<String> broadPriceCheck(@Param("pno")int pno, @Param("param")int param);
	
	
	
	  
}
