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
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import stock_m.dto.Cart;
import stock_m.dto.ManagementDto;
import stock_m.service.BroadcastService;
import stock_m.service.ManagementService;
import stock_m.service.MarketService;

@Controller
public class MarketController {
	
	@Autowired
	MarketService service;
	
	@Autowired
	ManagementService m_service;
	
	@Autowired
	BroadcastService b_service;
	
	@GetMapping("/normal/market") // 판매사이트 로그인시 메인화면
	public String mform(@RequestParam(name = "page", defaultValue = "1") int page,Model m, HttpSession session) {		
		String userid = (String) session.getAttribute("userid");	//세션의 userid정보를 받아옴
	    //판매사이트 모든 페이지의 상단 장바구니 아이콘에 나타낼 정보들
	    int cprice = 0;												//cprice : 장바구니에 저장된 모든 상품의 가격 총합
	    int ccount = service.cartCount(userid);						//ccount : 장바구니에 저장된 모든 상품의 갯수
	    m.addAttribute("ccount", ccount);
	    if (ccount == 0) {											//ccount가 0이면 cprice 계산시 오류가 나서 cprice값을 0으로 만들어줌
	        cprice = 0;
	    } else if (ccount > 0) {									
	        cprice = service.cartPrice(userid);
	    }
	    m.addAttribute("cprice", cprice);
	    
	    int count =m_service.count();

		if (count > 0) {

			int perPage = 3; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;
			List<ManagementDto> mainList = m_service.managementListall(startRow,userid);
			m.addAttribute("userid", userid);
			m.addAttribute("mainList", mainList);

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수

			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			if (end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("begin", begin);
			m.addAttribute("end", end);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);

		}

		m.addAttribute("count", count);
	    return "normal/marketform";
	}
	
	@GetMapping("/normal/search")// 상품명 검색기능, 받아올건 이름이랑 가격만으로도 됨(pname, price)
	public String sform(String pname, Model m, HttpSession session, @RequestParam(name = "p", defaultValue = "1") int page) {		
		String userid = (String) session.getAttribute("userid");
        
		int cprice =0;
		int ccount = service.cartCount(userid);
		m.addAttribute("ccount", ccount);
		if(ccount == 0) {
			cprice = 0;
		}
		else if(ccount > 0) {
			cprice = service.cartPrice(userid);
		}				
		m.addAttribute("cprice", cprice);									//장바구니 공통 사항
		m.addAttribute("pname", pname);										//pname : 상품명
		int p_val = 0;														//p_val : 상품 분류코드
		List<String> nuserid = service.negativeUserid(userid);
		if(nuserid.isEmpty()) {
			nuserid.add("등록하지 않았습니다.");
		}
		int cproduct = service.countProduct(pname, p_val, nuserid);			//검색결과에 해당하는 상품의 수
		m.addAttribute("cproduct", cproduct);

		if (cproduct > 0) {													//검색 페이지 하단에 표시할 페이지수 

			int perPage = 9; // 한 페이지에 보일 상품의 갯수


			int startRow = (page - 1) * perPage;
			
			List<Map<String,Object>> list = service.searchPname(pname, startRow, nuserid);			
			m.addAttribute("list", list);
			
			int pageNum = 5;//보여줄 페이지 번호 갯수
			int totalPages = cproduct / perPage + (cproduct % perPage > 0 ? 1 : 0); //전체 페이지 수
			
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			if (end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("begin", begin);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
			m.addAttribute("end", end);
		}
		
		return "normal/shop-grid";
	}
	
	@GetMapping("/normal/p_val")// 상품분류코드 별로 검색 기능, 받아올건 이름이랑 가격만으로도 됨(pname, price)
	public String pvform(String pname, int p_val, Model m, HttpSession session, @RequestParam(name = "p", defaultValue = "1") int page) {		
		String userid = (String) session.getAttribute("userid");
        
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
		List<String> nuserid = service.negativeUserid(userid);
		if(nuserid.isEmpty()) {
			nuserid.add("등록하지 않았습니다.");
		}
		int cproduct = service.countProduct(pname, p_val, nuserid);
		m.addAttribute("cproduct", cproduct);
		
		if (cproduct > 0) {
			int perPage = 9; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;
			
			List<Map<String,Object>> list = service.searchP_val(p_val, startRow, nuserid);
			m.addAttribute("list", list);
			
			int pageNum = 5;//보여줄 페이지 번호 갯수
			int totalPages = cproduct / perPage + (cproduct % perPage > 0 ? 1 : 0); //전체 페이지 수
			
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			if (end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("begin", begin);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
			m.addAttribute("end", end);
		}
		
		
		return "normal/shop-grid";
	}
	
	@GetMapping("/normal/details/{pno}") // 특정상품 클릭시 그 상품 상세페이지로 이동
	public String sdform(@PathVariable int pno, Model m, HttpSession session) {		
		String userid = (String) session.getAttribute("userid");
        
		int cprice =0;
		int ccount = service.cartCount(userid);
		m.addAttribute("ccount", ccount);
		if(ccount == 0) {
			cprice = 0;
		}
		else if(ccount > 0) {
			cprice = service.cartPrice(userid);
		}			
		m.addAttribute("cprice", cprice);							//공통부분
		
		Map<String,Object> product = service.detailProduct(pno);	//해당 상품의 상품번호로 해당 상품 정보를 받아서 product에 저장
		m.addAttribute("product", product);
		return "normal/shop-details";
	}
	
	@PostMapping("/normal/addcart") // 장바구니에 상품 담기 기능
	public String addcart(Cart cart, int product_pno, String userid, int count) {
		service.addCart(cart, product_pno, userid, count);
		return "normal/shop-details";
	}
	
	@GetMapping("/normal/cart/{userid}") // 유저아이디로 그 유저의 카트 목록을 가져오는 기능
	public String cform(Model m, HttpSession session) {		
		String userid = (String) session.getAttribute("userid");

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
		m.addAttribute("uid", userid);
		return "normal/shoping-cart";
	}
		
	@GetMapping("/normal/countchange") // 장바구니에서 -,+버튼 클릭시 cart테이블에 해당상품 갯수 변경 기능
	public String cc(@Param("count") int count,@Param("userid") String userid,@Param("product_pno") int product_pno) {
		service.countChange(count, userid, product_pno);
		return "normal/shoping-cart";
	}
	
	@GetMapping("/normal/checkout") // 결제완료시 해당 유저의 cart테이블에 모든 정보를 지우는 기능
	public String co(@Param("userid") String userid) {
		service.checkOut(userid);
		return "normal/shoping-cart";
	}
	
	@GetMapping("/normal/delete") // 장바구니 X버튼 클릭시 cart테이블에서 상품번호를 통해 해당 유저 장바구니에 상품의 정보를 지우는 기능
	public String dc(@Param("product_pno") int product_pno, @Param("userid") String userid) {
		service.deleteCart(product_pno, userid);
		return "normal/shoping-cart";
	}
	
	@PostMapping("/normal/addbuy") // 결제완료시 구매,판매,재고,상품,장부 테이블에 반영하는 기능
	public String ab(@Param("pno") int pno, @Param("sno") int sno, @Param("suserid") String suserid, @Param("userid") String userid, @DateTimeFormat(pattern = "yyyyMMdd") @Param("bdate") Date bdate, @Param("price") int price, @Param("bcount") int bcount, @Param("s_volume") int s_volume, @Param("p_count") int p_count, @Param("ssum") int ssum, @Param("profit") int profit) {
		service.addbuy(pno, userid, bdate, price, bcount); 
		service.addsell(pno, suserid, bdate, price, bcount);
		service.updateStock(sno, suserid, bcount, s_volume);
		service.updateProduck(pno, bcount, p_count);
		service.updateRevenue(ssum, profit, price, bcount, suserid);
		return "nomal/shoping-cart";
	} 
	
	@GetMapping("/logout")
    public String logout(HttpSession session) {
        // 세션에서 사용자 정보 제거
        session.removeAttribute("userid");
        return "redirect:/login";
	}
	
	@GetMapping("/normal/broadSelecMenu") // 특정상품 클릭시 그 상품 상세페이지로 이동
	public String bsform(Model m, HttpSession session) {		
		String userid = (String) session.getAttribute("userid");
        
		int cprice =0;
		int ccount = service.cartCount(userid);
		m.addAttribute("ccount", ccount);
		if(ccount == 0) {
			cprice = 0;
		}
		else if(ccount > 0) {
			cprice = service.cartPrice(userid);
		}			
		m.addAttribute("cprice", cprice);							//공통부분
		
		int palarmcount = b_service.palarmCount(userid);
		m.addAttribute("palarmcount", palarmcount);
		List<Map<String,Object>> palist = b_service.paAll(userid);			
		m.addAttribute("palist", palist);
		
		return "normal/broadSelecMenu";
	}
	
	
}
