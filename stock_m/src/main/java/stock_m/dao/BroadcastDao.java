package stock_m.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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

	@Select("select count(*) from pricebroadcast where userid=#{userid} and br_search=#{pno}")
	public int pacheck(@Param("userid")String userid,@Param("pno")int pno);

	@Update("update pricebroadcast set br_param=#{aprice} where userid=#{userid} and br_search=#{pno}")
	public int paupdate(@Param("userid")String userid, @Param("pno")int pno,@Param("aprice") int aprice);

	@Insert("insert into pricebroadcast(userid,br_search,br_param) values(#{userid},#{pno},#{aprice})")
	public int painsert(@Param("userid")String userid,@Param("pno")int pno,@Param("aprice") int aprice);

	@Select("select count(*) from pricebroadcast where userid=#{userid}")
	public int palarmCount(String userid);
	
	@Select("select product.pno as pno, pname, pbrno, br_param from pricebroadcast inner join product on pricebroadcast.br_search = product.pno where userid=#{userid}")
	public List<Map<String, Object>> paAll(String userid);

	@Delete("delete from pricebroadcast where br_search = #{pno} and userid=#{userid}")
	public int padelete(Map<String, Object> map);

	@Update("update pricebroadcast set br_param = #{br_param} where userid = #{userid} and br_search = #{pno}")
	public int palarmupdate(Map<String, Object> map);
	
	

}
