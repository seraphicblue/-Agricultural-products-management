package stock_m.dao;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;



@Mapper
public interface BroadcastDao {
	
	@Select("select userid from pricebroadcast where pno = #{pno} AND param >= #{param}")
	public List<String> broadPriceCheck(@Param("pno")int pno, @Param("param")int param);
	
	@Select("select count(userid) from stockbroadcast where stock_param > ((select s_volume from stock where sno=#{sno})-40)")
	public int broadStock(@Param("sno")int sno);  
}
