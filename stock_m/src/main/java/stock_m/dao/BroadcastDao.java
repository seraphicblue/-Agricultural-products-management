package stock_m.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import stock_m.dto.Message;

@Mapper
public interface BroadcastDao {

	@Select("select userid from pricebroadcast where pno = #{pno} AND param >= #{param}")
	public List<String> broadPriceCheck(@Param("pno") int pno, @Param("param") int param);

	@Select("select count(stock_selec) from stockbroadcast where ((select stock_param from stockbroadcast where stock_selec=#{sno}) >= ((select s_volume from stock where sno=#{sno}) -40)) AND userid=#{userid}")
	public int broadStock(@Param("sno") int sno, @Param("userid") String userid);

	@Insert("insert into message(userid, sub,content) values(#{userid},#{sub}, #{content})")
	int insertMessage(@Param("userid") String userid,@Param("sub") String sub ,@Param("content") String content);
	
	@Select("select count(userid) from message where userid=#{userid} AND rcheck = false")
	int countMsg(@Param("userid") String userid);
	

	@Select("select count(userid) from message where userid=#{userid}")
	int messageCount(@Param("userid") String userid);
	
	@Select("select * from message where userid=#{userid}")
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
	public int broadlimit(@Param("userid")String userid);
	
	@Select("select profit from revenue where userid=#{userid}")
	public int getProfit(@Param("userid")String userid);
}
