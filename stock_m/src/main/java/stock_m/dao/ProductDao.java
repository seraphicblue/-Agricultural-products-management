package stock_m.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ProductDao {
	@Select("select * from product where pname like concat('%',#{pname},'%')")
	//@Select("select * from product")
	public List<Map<String,Object>> searchPname(String pname);
}
