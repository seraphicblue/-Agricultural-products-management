/*
   Date    : 2023.05.08
   name    : ProductDao
   type    : Dao
   ver     : 1.0
   conect  : MarketService
   content : 상품 Dao
   writer  : 김기덕
   api     : x
*/
package stock_m.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import stock_m.dto.Cart;

@Mapper
public interface ProductDao {
	@Select("select * from product where pname like concat('%',#{pname},'%')")
	//@Select("select * from product")
	public List<Map<String,Object>> searchPname(String pname);
	
	@Select("select * from product where pno = #{pno}")
	public Map<String,Object> detailProduct(int pno);
	
	@Select("select * from product where p_val = #{p_val}")
	public List<Map<String,Object>> searchP_val(int p_val);
	
	@Insert("INSERT INTO cart(userid,product_pno,count,price,name) values(#{userid},#{product_pno},#{count},#{price},#{name})")
	public int addCart(Cart cart);
}
