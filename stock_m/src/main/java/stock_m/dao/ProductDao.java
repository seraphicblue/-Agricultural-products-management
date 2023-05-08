package stock_m.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ProductDao {
	
	@Insert("insert into product(sno,pname,price,p_val,p_count,userid) values(#{sno},#{pname},#{price},#{p_val},#{p_count},#{userid})")
	void insertproduct(@Param("sno")int sno, @Param("pname")String pname, @Param("price")int price, @Param("p_val")int p_val, @Param("p_count")int p_count,@Param("userid")String userid );
	
	@Select("select count(*) from product where userid=#{userid} AND sno=#{sno}")
	int selecCount(@Param("userid")String userid, @Param("sno")int sno);
	
	@Select("select p_count from product where userid=#{userid} AND sno=#{sno}")
	int selecVol(@Param("userid")String userid, @Param("sno")int sno);
}
