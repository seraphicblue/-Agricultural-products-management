/**
   Date    : 2023.05.16
   name    : MarketController
   type    : Controller
   ver     : 5.0
   conect  : MarketService
   content : 판매사이트 컨트롤러
   writer  : 김기덕
   api     : x
*/
package stock_m.controller;

import java.security.Principal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import stock_m.dto.Cart;
import stock_m.service.MarketService;

@Controller
public class MarketController {
	
	@Autowired
	MarketService service;		
	
	@GetMapping("/market") // 판매사이트 로그인시 메인화면
	public String mform(Model m, HttpServletRequest request, Principal principal) {
		String userid = principal.getName();
		HttpSession session = request.getSession();
		session.setAttribute("userid", userid);

	    List<Map<String, Object>> list = service.allProduct();
	    m.addAttribute("list", list);
	    int cprice = 0;
	    int ccount = service.cartCount(userid);
	    m.addAttribute("ccount", ccount);
	    if (ccount == 0) {
	        cprice = 0;
	    } else if (ccount > 0) {
	        cprice = service.cartPrice(userid);
	    }
	    m.addAttribute("cprice", cprice);
	    return "normal/marketform";
	}
	
	/*
	 * @GetMapping("/cartcount")
	 * 
	 * @ResponseBody() public String mlform(String userid) { int ccount =
	 * service.cartCount("${nuserid}"); int cprice = service.cartPrice("${nuserid}");
	 * Map<String, Object> map = new HashMap<>(); map.put("ccount", ccount);
	 * map.put("cprice", cprice); JSONObject jo = new JSONObject(map); return
	 * jo.toString(); }
	 */
	
	@GetMapping("/continue") // 장바구니에서 쇼핑계속하기 버튼
	public String csform(Model m) {
		List<Map<String,Object>> list = service.allProduct();
		m.addAttribute("list", list);
		return "normal/shop-grid";
	}
	
	@PostMapping("/search")// 메인화면 검색기능, 받아올건 이름이랑 가격만으로도 됨(pname, price)
	public String sform(String pname, Model m, HttpServletRequest request, Principal principal) {
		String userid = principal.getName();
		HttpSession session = request.getSession();
		session.setAttribute("userid", userid);
        
		int cprice =0;
		int ccount = service.cartCount(userid);
		m.addAttribute("ccount", ccount);
		if(ccount == 0) {
			cprice = 0;
		}
		else if(ccount > 0) {
			cprice = service.cartPrice(userid);
		}				
		m.addAttribute("cprice", cprice);
		m.addAttribute("pname", pname);
		int p_val = 0;
		int cproduct = service.countProduct(pname, p_val);
		m.addAttribute("cproduct", cproduct);
		List<Map<String,Object>> list = service.searchPname(pname);
		m.addAttribute("list", list);
		return "normal/shop-grid";
	}
	
	@GetMapping("/search/{p_val}")// 상품분류코드 별로 검색 기능, 받아올건 이름이랑 가격만으로도 됨(pname, price)
	public String svform(String pname, @PathVariable int p_val, Model m, HttpServletRequest request, Principal principal) {
		String userid = principal.getName();
		HttpSession session = request.getSession();
		session.setAttribute("nuserid", userid);
        
		int cprice =0;
		int ccount = service.cartCount(userid);
		m.addAttribute("ccount", ccount);
		if(ccount == 0) {
			cprice = 0;
		}
		else if(ccount > 0) {
			cprice = service.cartPrice(userid);
		}				
		m.addAttribute("cprice", cprice);
		m.addAttribute("p_val", p_val);
		System.out.println(p_val);
		int cproduct = service.countProduct(pname, p_val);
		System.out.println(pname);
		System.out.println(cproduct);
		m.addAttribute("cproduct", cproduct);
		List<Map<String,Object>> list = service.searchP_val(p_val);
		m.addAttribute("list", list);
		return "normal/shop-grid";
	}
	
	@GetMapping("/details/{pno}") // 특정상품 클릭시 그 상품 상세페이지로 이동
	public String sdform(@PathVariable int pno, Model m, HttpServletRequest request, Principal principal) {
		String userid = principal.getName();
		HttpSession session = request.getSession();
		session.setAttribute("userid", userid);
        
		int cprice =0;
		int ccount = service.cartCount(userid);
		m.addAttribute("ccount", ccount);
		if(ccount == 0) {
			cprice = 0;
		}
		else if(ccount > 0) {
			cprice = service.cartPrice(userid);
		}			
		m.addAttribute("cprice", cprice);
		Map<String,Object> product = service.detailProduct(pno);
		m.addAttribute("product", product);
		return "normal/shop-details";
	}
	
	@PostMapping("/addcart") // 장바구니에 상품 담기 기능
	public String addcart(Cart cart, int product_pno, String userid, int count) {
		service.addCart(cart, product_pno, userid, count);
		return "normal/shop-details";
	}
	
	@GetMapping("/cart/{userid}") // 유저아이디로 그 유저의 카트 목록을 가져오는 기능
	public String cform(Model m, HttpServletRequest request, Principal principal) {
		String userid = principal.getName();
		HttpSession session = request.getSession();
		session.setAttribute("userid", userid);
        
		int cprice =0;
		int ccount = service.cartCount(userid);
		m.addAttribute("ccount", ccount);
		if(ccount == 0) {
			cprice = 0;
		}
		else if(ccount > 0) {
			cprice = service.cartPrice(userid);
		}			
		m.addAttribute("cprice", cprice);
		List<Map<String,Object>> cart = service.userCart(userid);
		m.addAttribute("cart", cart);
		return "normal/shoping-cart";
	}
		
	@GetMapping("/countchange") // 장바구니에서 -,+버튼 클릭시 cart테이블에 해당상품 갯수 변경 기능
	public String cc(@Param("count") int count,@Param("userid") String userid,@Param("product_pno") int product_pno) {
		service.countChange(count, userid, product_pno);
		return "normal/shoping-cart";
	}
	
	@GetMapping("/checkout") // 결제완료시 해당 유저의 cart테이블에 모든 정보를 지우는 기능
	public String co(@Param("userid") String userid) {
		service.checkOut(userid);
		return "normal/shoping-cart";
	}
	
	@GetMapping("/delete") // 장바구니 X버튼 클릭시 cart테이블에서 해당상품 정보를 지우는 기능
	public String dc(@Param("product_pno") int product_pno, @Param("userid") String userid) {
		service.deleteCart(product_pno, userid);
		return "normal/shoping-cart";
	}
	
	@PostMapping("/addbuy") // 결제완료시 구매,판매,재고,상품,장부 테이블에 반영하는 기능
	public String ab(@Param("pno") int pno,@Param("suserid") String suserid, @Param("userid") String userid, @DateTimeFormat(pattern = "yyyyMMdd") @Param("bdate") Date bdate, @Param("price") int price, @Param("bcount") int bcount, @Param("s_volume") int s_volume, @Param("p_count") int p_count, @Param("ssum") int ssum, @Param("profit") int profit) {
		service.addbuy(pno, userid, bdate, price, bcount); 
		service.addsell(pno, suserid, bdate, price, bcount);
		service.updateStock(pno, suserid, bcount, s_volume);
		service.updateProduck(pno, bcount, p_count);
		service.updateRevenue(ssum, profit, price, bcount, suserid);
		return "nomal/shoping-cart";
	}
	
	
}
