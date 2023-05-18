package stock_m.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.PathVariable;


@Mapper
public interface StockDao {
	@Select("select s_val from stock where sno=#{sno}")
	int selecSval(@Param("sno")int sno);
	
	@Select("select s_volume from stock where sno=#{sno}")
	int selecSvol(int sno);
	
	@Insert("insert into stock(userid, s_val, scontent, s_volume, s_date) values('testcompany6',1,#{scontent},#{s_volume},#{s_date})")
	int inserts(@Param("scontent") String scontent, @Param("s_volume") int s_volume, @Param("s_date") String s_date);
}
                                 