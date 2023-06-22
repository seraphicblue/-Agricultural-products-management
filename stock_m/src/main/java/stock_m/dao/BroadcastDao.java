package stock_m.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import stock_m.dto.AdminstockDto;
import stock_m.dto.Message;


@Mapper
public interface BroadcastDao {

	@Select("select userid from pricebroadcast where pno = #{pno} AND param >= #{param}")
	public List<String> broadPriceCheck(@Param("pno") int pno, @Param("param") int param);

	@Select("select count(*) from stockbroadcast where (((select stock_param from stockbroadcast where stock_selec=#{sno}) >= ((select s_volume from stock where sno=#{sno}) -40)) AND userid=#{userid}) and stock_selec=#{sno}")
	public int broadStock(@Param("sno") int sno, @Param("userid") String userid);

	@Insert("insert into message(userid, sub,content) values(#{userid},#{sub}, #{content})")
	int insertMessage(@Param("userid") String userid, @Param("sub") String sub, @Param("content") String content);

	@Select("select count(userid) from message where userid=#{userid} AND rcheck = false")
	int countMsg(@Param("userid") String userid);


	@Select("select count(*) from pricebroadcast where userid=#{userid} and pno=#{pno}")
	public int pacheck(@Param("userid")String userid,@Param("pno")int pno);

	@Update("update pricebroadcast set param=#{aprice} where userid=#{userid} and pno=#{pno}")
	public int paupdate(@Param("userid")String userid, @Param("pno")int pno,@Param("aprice") int aprice);

	@Insert("insert into pricebroadcast(userid,pno,param) values(#{userid},#{pno},#{aprice})")
	public int painsert(@Param("userid")String userid,@Param("pno")int pno,@Param("aprice") int aprice);

	@Select("select count(*) from pricebroadcast where userid=#{userid}")
	public int palarmCount(String userid);
	
	@Select("select product.pno as pno, pname, pbrno, param from pricebroadcast inner join product on pricebroadcast.pno = product.pno where userid=#{userid}")
	public List<Map<String, Object>> paAll(String userid);

	@Delete("delete from pricebroadcast where pno = #{pno} and userid=#{userid}")
	public int padelete(Map<String, Object> map);

	@Update("update pricebroadcast set param = #{param} where userid = #{userid} and pno = #{pno}")
	public int palarmupdate(Map<String, Object> map);
	

	@Select("select count(userid) from message where userid=#{userid}")
	int messageCount(@Param("userid") String userid);

	@Select("select * from message where userid=#{userid} order by mesno desc")
	public List<Message> messageList(@Param("userid") String userid);

	@Select("select stock_param from stockbroadcast where stock_selec=#{sno}")
	public int getParam(@Param("sno") int sno);

	@Select("select s_volume from stock where sno=#{sno}")
	public int getVolume(@Param("sno") int sno);

	@Select("select content from message where mesno=#{mesno}")
	public String showMsg(@Param("mesno") int mesno);

	@Update("update message set rcheck = true where mesno=#{mesno}")
	public void turnMsg(@Param("mesno") int mesno);

	@Select("select broadcastlimit from limitbroadcast where userid=#{userid}")
	public int broadlimit(@Param("userid") String userid);

	@Select("select profit from revenue where userid=#{userid}")
	public int getProfit(@Param("userid") String userid);

	@Select("select count(*) from limitbroadcast where userid=#{userid}")
	public int getlimitCount(@Param("userid") String userid);
	
	@Update("updatelimitbroadcast set limit=#{limit}  where userid=#{userid}")
	public void updateLimit(@Param("userid") String userid,@Param("limit") int limit);

	@Insert("insert into limitbroadcast(userid,broadcastlimit) values(#{userid},#{limit})")
	public int insertLimit(@Param("userid")String userid, @Param("limit")int limit);
	
	@Select("select count(*) from management where c_userid = #{userid} and m_val = true")
	public int manageCount(@Param("userid") String userid);
	
	@Select("select userid from management where c_userid = #{userid} and m_val = true")
	public List<String> manageGet(@Param("userid") String userid);
	
	@Select("select count(*) from stockbroadcast where userid = #{userid} and stock_selec = #{stock_selec}")
	public int salarmCount(@Param("userid") String userid, @Param("stock_selec")int stock_selec);
	
	@Insert("INSERT INTO stockbroadcast(userid,stock_selec,stock_param) values(#{userid},#{stock_selec},#{stock_param})")
	public int sainsert(@Param("userid")String userid,@Param("stock_selec")int stock_selec,@Param("stock_param") int stock_param);
	
	@Update("update stockbroadcast set stock_param = #{stock_param} where userid = #{userid} and stock_selec = #{stock_selec}")
	public int saupdate(@Param("userid")String userid, @Param("stock_selec")int pstock_selecno, @Param("stock_param") int stock_param);
	
	
	@Select("select count(*) from pricebroadcast where userid = #{userid} and pno = #{pno}")
	public int pbalarmCount(@Param("userid") String userid, @Param("pno")int pno);
	
	@Insert("INSERT INTO pricebroadcast(userid,pno,param) values(#{userid},#{pno},#{param})")
	public int pbainsert(@Param("userid")String userid,@Param("pno")int pno,@Param("param") int param);
	
	@Update("update pricebroadcast set param = #{param} where userid = #{userid} and pno = #{pno}")
	public int pbaupdate(@Param("userid")String userid, @Param("pno")int pno, @Param("param") int param);
	
	@Select("select * from adminstock")
	public List<AdminstockDto> adminCheck();
	
	@Select("select count(*) from pricebroadcast where pno = #{pno} and param >= #{param}")
	public int abCount(@Param("pno") int pno, @Param("param")int param);
	
	@Select("select userid from pricebroadcast where pno = #{pno} and param >= #{param}")
	public List<String> abGet(@Param("pno") int pno, @Param("param")int param);
	
	@Select("select * from stockbroadcast inner join stock on stock_selec = sno where stock.userid = #{userid}")
	public List<Map<String, Object>> broadSelecStock(String userid);
	
	@Select("select * from pricebroadcast inner join adminstock on pno = ano where userid = #{userid}")
	public List<Map<String, Object>> pricebroadcast(String userid);
}
