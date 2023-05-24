package stock_m.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;


@Mapper
public interface StockDao {
	@Select("select s_val from stock where sno=#{sno}")
	int selecSval(@Param("sno")int sno);
	
	@Select("select s_volume from stock where sno=#{sno}")
	int selecSvol(int sno);
	
	@Insert("insert into stock(userid, s_val, scontent, s_volume, s_date) values(#{userid},#{s_val},#{scontent},#{s_volume},#{s_date})")
	int inserts(@Param("scontent") String scontent, @Param("s_volume") int s_volume, @Param("s_date") String s_date,@Param("s_val") int s_val,@Param("userid") String userid);

	@Select("select count(*) from stock where userid = #{userid} and scontent=#{scontent}")
	int checki(@Param("scontent")String scontent,@Param("userid")String userid);
	
	/*
	 * ¿ @Select("select count(*) from stock wheren userid ='testcompany1' and s_val=#{s_val}"
	 * ) int checkr(@Param("s_val") int s_val);
	 */
	
	@Update("UPDATE stock SET s_volume = s_volume + #{s_volume} WHERE userid = #{userid} and scontent = #{scontent} AND s_val = #{s_val}")
	int updates(@Param("scontent") String scontent, @Param("s_volume") int s_volume, @Param("s_val") int s_val,@Param("userid") String userid);
}
                                 