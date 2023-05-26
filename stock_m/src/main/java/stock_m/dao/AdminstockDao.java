package stock_m.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import stock_m.dto.AdminstockDto;

@Mapper
public interface AdminstockDao {

	int inserta(@Param("a_content") String a_content, @Param("a_val") int a_val, @Param("a_volum") int a_volum);
	List<AdminstockDto> option(Map<String, Object> m);
	int admincheck(@Param("a_content") String a_content, @Param("a_val") int a_val);
	int updatea(@Param("a_content")String a_content, @Param("a_val") int a_val, @Param("a_volum") int a_volum);

}
