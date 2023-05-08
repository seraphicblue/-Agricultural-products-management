/*
   Date    : 2023.05.08
   name    : MarketController
   type    : Controller
   ver     : 1.0
   conect  : MarketService
   content : 판매사이트 컨트롤러
   writer  : 김기덕
   api     : x
*/
package stock_m.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import stock_m.dto.Cart;
import stock_m.service.MarketService;

@Controller
public class MarketController {
	
	@Autowired
	MarketService service;
	
	@GetMapping("/market")
	public String mform() {
		return "normal/marketform";
	}
	
	@PostMapping("/search")//받아올건 이름이랑 가격만으로도 됨(pname, price)
	public String sform(String pname, Model m) {
		m.addAttribute("pname", pname);
		List<Map<String,Object>> list = service.searchPname(pname);
		m.addAttribute("list", list);
		return "normal/shop-grid";
	}
	
	@GetMapping("/search/{p_val}")//받아올건 이름이랑 가격만으로도 됨(pname, price)
	public String svform(@PathVariable int p_val, Model m) {
		m.addAttribute("p_val", p_val);
		List<Map<String,Object>> list = service.searchP_val(p_val);
		m.addAttribute("list", list);
		return "normal/shop-grid";
	}
	
	@GetMapping("/details/{pno}")
	public String sdform(@PathVariable int pno, Model m) {
		Map<String,Object> product = service.detailProduct(pno);
		m.addAttribute("product", product);
		return "normal/shop-details";
	}
	
	@PostMapping("/addcart")
	public String addcart(Cart cart, Model m) {
		service.addCart(cart);
		return "normal/shoping-cart";
	}
	
	@GetMapping("/cart")
	public String cform() {
		return "normal/shoping-cart";
	}
	
	
	
}
