/*
   Date    : 2023.05.16
   name    : MarketService
   type    : Service
   ver     : 5.0
   conect  : MarketController,ProductDao
   content : 판매사이트 서비스
   writer  : 김기덕
   api     : x
*/
package stock_m.service;

import java.util.Date;
import java.util.HashMap;
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
	
	//pname(상품명)으로 상품 검색 pname : 검색 때 입력한 문자열, start : 시작할 상품순서, count : 한페이지에 보여줄 상품수 
	public List<Map<String,Object>> searchPname(String pname, int start, List<String> nuserid) {
		return dao.searchPname(pname, start, nuserid);
	}
	
	public List<Map<String,Object>> palarmSearch(String pname, int start, List<String> nuserid) {
		return dao.palarmSearch(pname, start, nuserid);
	}
	
	public int countProduct(String pname, int p_val, List<String> nuserid) {
		if(pname == null) {
			pname = "없음";			
		}
	    return dao.countProduct(pname, p_val, nuserid);
	}
	
	public Map<String,Object> detailProduct(int pno) {
		return dao.detailProduct(pno);
	}
	
	public int cartCount(String userid) {
		return dao.cartCount(userid);
	}
	
	public int cartPrice(String userid) {
		return dao.cartPrice(userid);
	}
	
	public List<Map<String,Object>> searchP_val(int p_val, int start, List<String> nuserid) {
		return dao.searchP_val(p_val, start, nuserid);
	}
	
	public void addCart(Cart cart, int product_pno, String userid, int count) {
		Map<String, Object> cmap = new HashMap<>();
		cmap.put("product_pno", product_pno);
		cmap.put("userid", userid);
		if(dao.cartCheck(cmap) == 0) {			
			dao.addCart(cart);
		}else {
			count = dao.countCheck(product_pno, userid) + count;
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
	
	public int addbuy(int pno, String userid, Date bdate, int price, int bcount) {
		Map<String, Object> abmap = new HashMap<>();
		abmap.put("pno", pno);
		abmap.put("userid", userid);
		abmap.put("bdate", bdate);
		abmap.put("price", price);
		abmap.put("bcount", bcount);
		return dao.addbuy(abmap);
	}
	
	public int addsell(int pno, String suserid, Date bdate, int price, int bcount) {
		Map<String, Object> asmap = new HashMap<>();
		asmap.put("pno", pno);
		asmap.put("suserid", suserid);
		asmap.put("bdate", bdate);
		asmap.put("price", price);
		asmap.put("bcount", bcount);
		return dao.addsell(asmap);
	}
	
	public int updateStock(int sno, String suserid, int bcount, int s_volume) {
		Map<String, Object> usmap = new HashMap<>();
		usmap.put("sno", sno);
		usmap.put("suserid", suserid);
		usmap.put("s_volume", s_volume);
		usmap.put("bcount", bcount);
		return dao.updateStock(usmap);
	}
	
	public int updateProduck(int pno, int bcount, int p_count) {
		Map<String, Object> upmap = new HashMap<>();
		upmap.put("pno", pno);
		upmap.put("p_count", p_count);
		upmap.put("bcount", bcount);
		return dao.updateProduck(upmap);
	}
	
	public int updateRevenue(int ssum, int profit, int price, int bcount, String suserid) {
		Map<String, Object> urmap = new HashMap<>();
		urmap.put("ssum", ssum);
		urmap.put("profit", profit);
		urmap.put("price", price);
		urmap.put("bcount", bcount);
		urmap.put("suserid", suserid);
		return dao.updateRevenue(urmap);
	}
	
	public List<String> negativeUserid(String userid) {		
		return dao.negativeUserid(userid);
	}
	
}
