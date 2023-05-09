/*
   Date    : 2023.05.08
   name    : MarketService
   type    : Service
   ver     : 1.0
   conect  : MarketController,ProductDao
   content : 판매사이트 서비스
   writer  : 김기덕
   api     : x
*/
package stock_m.service;

import java.util.List;
import java.util.Map;

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
	
	public int addCart(Cart cart) {
		return dao.addCart(cart);
	}
	
	public List<Map<String,Object>> userCart(String userid) {
		return dao.userCart(userid);
	}
	
	public List<Map<String,Object>> allProduct() {
		return dao.allProduct();
	}
	
	public int countChange(int count, String userid, int product_pno) {
		return dao.countChange(count, userid, product_pno);
	}
	
}
