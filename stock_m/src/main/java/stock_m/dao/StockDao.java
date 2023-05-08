package stock_m.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;


@Mapper
public interface StockDao {
	@Select("select s_val from stock where sno=#{sno}")
	int selecSval(int sno);
	
	@Select("select s_volume from stock where sno=#{sno}")
	int selecSvol(int sno);
}
                                 