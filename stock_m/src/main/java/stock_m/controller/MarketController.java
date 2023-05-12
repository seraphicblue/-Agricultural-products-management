/*
   Date    : 2023.05.11
   name    : MarketController
   type    : Controller
   ver     : 3.0
   conect  : MarketService
   content : 판매사이트 컨트롤러
   writer  : 김기덕
   api     : x
*/
package stock_m.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import stock_m.dto.Cart;
import stock_m.service.MarketService;

@Controller
public class MarketController {
	
	@Autowired
	MarketService service;
	
	@GetMapping("/market")
	public String mform(String userid, Model m) {
		List<Map<String,Object>> list = service.allProduct();
		m.addAttribute("list", list);
		int cprice =0;
		int ccount = service.cartCount("test1");
		m.addAttribute("ccount", ccount);
		if(ccount == 0) {
			cprice = 0;
		}
		else if(ccount > 0) {
			cprice = service.cartPrice("test1");
		}			
		m.addAttribute("cprice", cprice);
		return "normal/marketform";
	}
	
	/*
	 * @GetMapping("/cartcount")
	 * 
	 * @ResponseBody() public String mlform(String userid) { int ccount =
	 * service.cartCount("test1"); int cprice = service.cartPrice("test1");
	 * Map<String, Object> map = new HashMap<>(); map.put("ccount", ccount);
	 * map.put("cprice", cprice); JSONObject jo = new JSONObject(map); return
	 * jo.toString(); }
	 */
	
	@GetMapping("/continue")
	public String csform(Model m) {
		List<Map<String,Object>> list = service.allProduct();
		m.addAttribute("list", list);
		return "normal/shop-grid";
	}
	
	@PostMapping("/search")//받아올건 이름이랑 가격만으로도 됨(pname, price)
	public String sform(String userid, String pname, Model m) {
		int cprice =0;
		int ccount = service.cartCount("test1");
		m.addAttribute("ccount", ccount);
		if(ccount == 0) {
			cprice = 0;
		}
		else if(ccount > 0) {
			cprice = service.cartPrice("test1");
		}			
		m.addAttribute("cprice", cprice);
		m.addAttribute("pname", pname);
		List<Map<String,Object>> list = service.searchPname(pname);
		m.addAttribute("list", list);
		return "normal/shop-grid";
	}
	
	@GetMapping("/search/{p_val}")//받아올건 이름이랑 가격만으로도 됨(pname, price)
	public String svform(String userid, @PathVariable int p_val, Model m) {
		int cprice =0;
		int ccount = service.cartCount("test1");
		m.addAttribute("ccount", ccount);
		if(ccount == 0) {
			cprice = 0;
		}
		else if(ccount > 0) {
			cprice = service.cartPrice("test1");
		}			
		m.addAttribute("cprice", cprice);
		m.addAttribute("p_val", p_val);
		List<Map<String,Object>> list = service.searchP_val(p_val);
		m.addAttribute("list", list);
		return "normal/shop-grid";
	}
	
	@GetMapping("/details/{pno}")
	public String sdform(String userid, @PathVariable int pno, Model m) {
		int cprice =0;
		int ccount = service.cartCount("test1");
		m.addAttribute("ccount", ccount);
		if(ccount == 0) {
			cprice = 0;
		}
		else if(ccount > 0) {
			cprice = service.cartPrice("test1");
		}			
		m.addAttribute("cprice", cprice);
		Map<String,Object> product = service.detailProduct(pno);
		m.addAttribute("product", product);
		return "normal/shop-details";
	}
	
	@PostMapping("/addcart")
	public String addcart(Cart cart, int product_pno, String userid, int count) {
		//System.out.println(cart);
		service.addCart(cart, product_pno, userid, count);
		return "normal/shop-details";
	}
	
	@GetMapping("/cart/{userid}")
	public String cform(@PathVariable String userid, Model m) {
		int cprice =0;
		int ccount = service.cartCount("test1");
		m.addAttribute("ccount", ccount);
		if(ccount == 0) {
			cprice = 0;
		}
		else if(ccount > 0) {
			cprice = service.cartPrice("test1");
		}			
		m.addAttribute("cprice", cprice);
		List<Map<String,Object>> cart = service.userCart(userid);
		m.addAttribute("cart", cart);
		return "normal/shoping-cart";
	}
		
	@GetMapping("/countchange")
	public String cc(@Param("count") int count,@Param("userid") String userid,@Param("product_pno") int product_pno) {
		service.countChange(count, userid, product_pno);
		return "normal/shoping-cart";
	}
	
	@GetMapping("/checkout")
	public String co(@Param("userid") String userid) {
		service.checkOut(userid);
		return "normal/shoping-cart";
	}
	
	@GetMapping("/delete")
	public String dc(@Param("product_pno") int product_pno, @Param("userid") String userid) {
		service.deleteCart(product_pno, userid);
		return "normal/shoping-cart";
	}
	
	@PostMapping("/addbuy")
	public String ab(@Param("pno") int pno,@Param("suserid") String suserid, @Param("userid") String userid, @DateTimeFormat(pattern = "yyyyMMdd") @Param("bdate") Date bdate, @Param("price") int price, @Param("bcount") int bcount, @Param("s_volume") int s_volume, @Param("p_count") int p_count, @Param("ssum") int ssum, @Param("profit") int profit) {
		service.addbuy(pno, userid, bdate, price, bcount);
		service.addsell(pno, suserid, bdate, price, bcount);
		service.updateStock(pno, suserid, bcount, s_volume);
		service.updateProduck(pno, bcount, p_count);
		service.updateRevenue(ssum, profit, price, bcount, suserid);
		return "nomal/shoping-cart";
	}
	
	
}
