/*
   Date    : 2023.05.10
   name    : MarketService
   type    : Service
   ver     : 2.0
   conect  : MarketController,ProductDao
   content : 판매사이트 서비스
   writer  : 김기덕
   api     : x
*/
package stock_m.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stock_m.dao.ProductDao;
import stock_m.dto.Cart;

@Service
public class MarketService {
	
	@Autowired
	ProductDao dao;
	
	public List<Map<String,Object>> searchPname(String pname) {
		return dao.searchPname(pname);
	}
	
	public Map<String,Object> detailProduct(int pno) {
		return dao.detailProduct(pno);
	}
	
	public List<Map<String,Object>> searchP_val(int p_val) {
		return dao.searchP_val(p_val);
	}
	
	public void addCart(Cart cart, int product_pno, String userid, int count) {
		Map<String, Object> cmap = new HashMap<>();
		cmap.put("product_pno", product_pno);
		cmap.put("userid", userid);
		if(dao.cartCheck(cmap) == 0) {			
			dao.addCart(cart);
		}else {
			count = dao.countCheck(product_pno, userid) + count;
			System.out.println(userid);
			System.out.println(count);
			System.out.println(product_pno);
			Map<String, Object> map = new HashMap<>();
			map.put("product_pno", product_pno);
			map.put("userid", userid);
			map.put("count", count);
			
			dao.countChange(map);
		}
	}
	
	public List<Map<String,Object>> userCart(String userid) {
		return dao.userCart(userid);
	}
	
	public List<Map<String,Object>> allProduct() {
		return dao.allProduct();
	}
	
	public int countChange(int count, String userid, int product_pno) {
		Map<String, Object> map = new HashMap<>();
		map.put("product_pno", product_pno);
		map.put("userid", userid);
		map.put("count", count);
		return dao.countChange(map);
	}
	
	public int checkOut(String userid) {
		return dao.checkOut(userid);
	}
	
	public int deleteCart(int product_pno, String userid) {
		return dao.deleteCart(product_pno, userid);
	}
	
}
