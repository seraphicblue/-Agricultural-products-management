/*
	   Date    : 2023.05.15
	   name    : StockDao
	   type    : Dao
	   ver     : 1.1
	   connect  : StockService
	   content : 재고관리 서비스
	   writer  : 이이지
	   api     : x
	  */
	
package stock_m.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.PathVariable;

import stock_m.dto.StockDto;


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
	//main코드 수정 23.05.23
	
	@Update("UPDATE stock SET s_volume = s_volume + #{s_volume} WHERE userid = #{userid} and scontent = #{scontent} AND s_val = #{s_val}")
	int updates(@Param("scontent") String scontent, @Param("s_volume") int s_volume, @Param("s_val") int s_val,@Param("userid") String userid);
	
			@Select("select * from stock where userid = #{'1'}")
			List<StockDto> sList(String userid);
			
			/*
			 * @Update("update stock set price=#{price} where sno=#{sno}") int
			 * supdate(List<StockDto> dto);
			 */
			//main코드 수정 23.05.23
			
			@Delete("delete from stock where sno = #{sno}")
			int sdelete(int sno);
			
			@Select("select * from stock where scontent like concat('%',#{scontent},'%')")
		    List<StockDto> searchscontent(String search);

			@Insert("insert into stock (scontent,s_val,userid,s_volume,s_date) values(#{scontent},#{s_val},#{userid}, #{s_volume}, now())")
		    int sinsert(Map<String, Object> m);
		    
			@Select("select count(*) from stock")
			int count();

			@Update("update stock set * where sno=#{sno}")
			int stockupdate(List<StockDto> dto);
			
			@Update("update sell set pno=#{pno}, price=#{price} where sno=#{sno} ") 
			int updateRefOne(Map<String, Integer> snomap);
			
			
			@Update("update stock set s_volume=#{s_volume} where sno=#{sno}")
			int supdate(@Param("s_volume")int s_volume, @Param("sno")int sno);

			

			//int supdate(String s_volume, String sno);
			

		
		
		//@Insert("insert into stock(userid, s_val, scontent, s_volume, s_date) values('testcompany6',1,#{scontent},#{s_volume},#{s_date})")
		//int inserts(@Param("scontent") String scontent, @Param("s_volume") int s_volume, @Param("s_date") String s_date);
			//main코드 수정 23.05.23
	
	                                 
}
