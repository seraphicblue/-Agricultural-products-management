package stock_m.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface AdminstockDao {
	
 int inserta(@Param("a_content") String a_content,@Param("a_val") int a_val,@Param("a_volum") int a_volum);
 
	
}
