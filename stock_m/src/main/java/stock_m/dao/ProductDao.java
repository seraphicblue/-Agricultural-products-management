/*
   Date    : 2023.05.10
   name    : ProductDao
   type    : Dao
   ver     : 2.0
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
	
	@Select("select * from cart where userid like concat('%',#{userid},'%')")
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
	
	@Select("select count(*) from product where userid=#{userid} AND sno=#{sno}")
	int selecCount(@Param("userid")String userid, @Param("sno")int sno);
	
	@Select("select p_count from product where userid=#{userid} AND sno=#{sno}")
	int selecVol(@Param("userid")String userid, @Param("sno")int sno);
	
	@Insert("insert into product(sno,pname,price,p_val,p_count,userid) values(#{sno},#{pname},#{price},#{p_val},#{p_count},#{userid})")
	void insertproduct(@Param("sno")int sno, @Param("pname")String pname, @Param("price")int price, @Param("p_val")int p_val, @Param("p_count")int p_count,@Param("userid")String userid );
	
	@Update("UPDATE product SET p_count = #{p_count},price = #{price} where userid=#{userid} AND sno=#{sno}")
	void updateproduct(@Param("price")int price, @Param("p_count")int p_count, @Param("userid")String userid, @Param("sno")int sno);
}
