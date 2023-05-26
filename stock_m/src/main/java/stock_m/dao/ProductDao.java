/*
   Date    : 2023.05.23
   name    : ProductDao
   type    : Dao
   ver     : 6.0
   conect  : MarketService/sell
   content : 상품 Dao
   writer  : 김재영
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

import stock_m.dto.Cart;

@Mapper
public interface ProductDao {
	public List<Map<String,Object>> searchPname(@Param("pname")String pname, @Param("start")int start, @Param("nuserid") List<String> nuserid);
	
	@Select("select m_content from management where userid like #{userid} and m_val = 0")
	public List<String> negativeUserid(String userid);
	
	//false인 업체(userid)를 제외하고 받아오기
	public int countProduct(@Param("pname") String pname, @Param("p_val") int p_val, @Param("nuserid") List<String> nuserid);
	
	@Select("select * from product where pno = #{pno}")
	public Map<String,Object> detailProduct(int pno);
	
	@Select("select count(userid) from cart where userid = #{userid}")
	public int cartCount(String userid);
	
	@Select("select sum(count*price) from cart where userid = #{userid}")
	public int cartPrice(String userid);
	
	public List<Map<String,Object>> searchP_val(@Param("p_val")int p_val, @Param("start")int start, @Param("nuserid") List<String> nuserid);
	
	@Insert("INSERT INTO cart(userid,product_pno,count,price,name) values(#{userid},#{product_pno},#{count},#{price},#{name})")
	public int addCart(Cart cart);
	
	@Select("select stock.sno, product_pno, count, product.price, name, stock.userid, s_volume, p_count, ssum, profit from cart inner join stock inner join product inner join revenue on product.sno = stock.sno and cart.product_pno = product.pno and stock.userid = revenue.userid  where cart.userid = #{userid}")
	public List<Map<String,Object>> userCart(@Param("userid")String userid);
	
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
	
	@Insert("INSERT INTO sell(pno,userid,sdate,price,scount) values(#{pno},#{suserid},#{bdate},#{price},#{bcount})")
	public int addsell(Map<String, Object> asmap);
	
	@Update("update stock set s_volume = #{s_volume}-#{bcount} where sno = #{sno} and userid = #{suserid}")
	public int updateStock(Map<String, Object> usmap);
	
	@Update("update product set p_count = #{p_count}-#{bcount} where pno = #{pno}")
	public int updateProduck(Map<String, Object> upmap);
	
	@Update("update revenue set ssum = #{ssum}+(#{price}*#{bcount}), profit = #{profit}+(#{price}*#{bcount}) where userid = #{suserid}")
	public int updateRevenue(Map<String, Object> urmap);
	
	@Select("select count(*) from product where sno=#{sno}")
	int selecCount(@Param("sno")int sno);
	
	@Select("select p_count from product where sno=#{sno}")
	int selecVol(@Param("sno")int sno);
	
	@Insert("insert into product(sno,pname,price,p_val,p_count) values(#{sno},#{pname},#{price},#{p_val},#{p_count})")
	void insertproduct(@Param("sno")int sno, @Param("pname")String pname, @Param("price")int price, @Param("p_val")int p_val, @Param("p_count")int p_count);
	
	@Update("UPDATE product SET p_count = #{p_count},price = #{price} where sno=#{sno}")
	void updateproduct(@Param("price")int price, @Param("p_count")int p_count, @Param("sno")int sno);
	
	@Select("select pno from product where sno=#{sno}")
	int broadprice(@Param("sno")int sno);
}
