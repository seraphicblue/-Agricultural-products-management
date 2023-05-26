package stock_m.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface BroadcastDao {

	@Select("select userid from pricebroadcast where pno = #{pno} AND param >= #{param}")
	public List<String> broadPriceCheck(@Param("pno") int pno, @Param("param") int param);

	@Select("select count(stock_selec) from stockbroadcast where ((select stock_param from stockbroadcast where stock_selec=#{sno}) >= ((select s_volume from stock where sno=#{sno}) -40)) AND userid=#{userid}")
	public int broadStock(@Param("sno") int sno, @Param("userid") String userid);

	@Insert("insert into message(userid, content) values(#{userid}, #{content})")
	int insertMessage(@Param("userid") String userid, @Param("content") String content);
	
	@Select("select count(userid) from message where userid=#{userid} AND rcheck = false")
	int countMsg(@Param("userid") String userid);
	
	

}
