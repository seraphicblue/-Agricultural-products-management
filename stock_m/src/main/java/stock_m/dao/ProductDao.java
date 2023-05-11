/*
   Date    : 2023.05.11
   name    : ProductDao
   type    : Dao
   ver     : 3.0
   conect  : MarketService
   content : 상품 Dao
   writer  : 김기덕
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
import org.springframework.web.bind.annotation.DeleteMapping;

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
	
	@Select("select product_pno, count, product.price, name, stock.userid, s_volume, p_count from cart inner join stock inner join product on cart.product_pno = stock.sno and cart.product_pno = product.pno where cart.userid = #{userid}")
	public List<Map<String,Object>> userCart(String userid);
	
	@Select("select * from product")
	public List<Map<String,Object>> allProduct();
	
	@Update("update cart set count = #{count} where userid = #{userid} and product_pno = #{product_pno}")
	public int countChange(Map<String, Object> map);
	
	@Select("select count(*) from cart where product_pno = #{product_pno} and userid = #{userid}")
	public int cartCheck(Map<String, Object> cmap);
	
	@Update("update cart set count = #{count} where userid = #{userid} and product_pno = #{product_pno}")
	public int countAdd(@Param("count") int count, @Param("userid") String userid, @Param("product_pno") int product_pno);
	
	@Select("select count from cart where product_pno = #{product_pno} and userid = #{userid}")
	public int countCheck(@Param("product_pno") int product_pno, @Param("userid") String userid);
	
	@Delete("delete from cart where userid = #{userid}")
	public int checkOut(@Param("userid") String userid);
	
	@Delete("delete from cart where userid = #{userid} and product_pno = #{product_pno}")
	public int deleteCart(@Param("product_pno") int product_pno, @Param("userid") String userid);
	
	@Insert("INSERT INTO buy(pno,userid,bdate,price,bcount) values(#{pno},#{userid},#{bdate},#{price},#{bcount})")
	public int addbuy(Map<String, Object> abmap);
	
	@Insert("INSERT INTO sell(product_pno,userid,sdate,price,scount) values(#{pno},#{suserid},#{bdate},#{price},#{bcount})")
	public int addsell(Map<String, Object> asmap);
	
	@Update("update stock set s_volume = #{s_volume}-#{bcount} where sno = #{pno} and userid = #{suserid}")
	public int updateStock(Map<String, Object> usmap);
	
	@Update("update product set p_count = #{p_count}-#{bcount} where pno = #{pno}")
	public int updateProduck(Map<String, Object> upmap);
	
}
