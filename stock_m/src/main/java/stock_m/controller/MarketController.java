/**
   Date    : 2023.05.16
   name    : MarketController
   type    : Controller
   ver     : 5.0
   conect  : MarketService
   content : �뙋留ㅼ궗�씠�듃 而⑦듃濡ㅻ윭
   writer  : 源�湲곕뜒
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
import stock_m.service.ManagementService;
import stock_m.service.MarketService;

@Controller
public class MarketController {
	
	@Autowired
	MarketService service;
	
	@Autowired
	ManagementService m_service;
	
	@GetMapping("/normal/market") // �뙋留ㅼ궗�씠�듃 濡쒓렇�씤�떆 硫붿씤�솕硫�
	public String mform(@RequestParam(name = "page", defaultValue = "1") int page,Model m, HttpSession session) {		
		String userid = (String) session.getAttribute("userid");	//�꽭�뀡�쓽 userid�젙蹂대�� 諛쏆븘�샂
	    //�뙋留ㅼ궗�씠�듃 紐⑤뱺 �럹�씠吏��쓽 �긽�떒 �옣諛붽뎄�땲 �븘�씠肄섏뿉 �굹���궪 �젙蹂대뱾
	    int cprice = 0;												//cprice : �옣諛붽뎄�땲�뿉 ���옣�맂 紐⑤뱺 �긽�뭹�쓽 媛�寃� 珥앺빀
	    int ccount = service.cartCount(userid);						//ccount : �옣諛붽뎄�땲�뿉 ���옣�맂 紐⑤뱺 �긽�뭹�쓽 媛��닔
	    m.addAttribute("ccount", ccount);
	    if (ccount == 0) {											//ccount媛� 0�씠硫� cprice 怨꾩궛�떆 �삤瑜섍� �굹�꽌 cprice媛믪쓣 0�쑝濡� 留뚮뱾�뼱以�
	        cprice = 0;
	    } else if (ccount > 0) {									
	        cprice = service.cartPrice(userid);
	    }
	    m.addAttribute("cprice", cprice);
	    
	    int count =m_service.count();

		if (count > 0) {

			int perPage = 3; // �븳 �럹�씠吏��뿉 蹂댁씪 湲��쓽 媛��닔
			int startRow = (page - 1) * perPage;
			List<ManagementDto> mainList = m_service.managementListall(startRow,userid);
			m.addAttribute("userid", userid);
			m.addAttribute("mainList", mainList);

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // �쟾泥� �럹�씠吏� �닔

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
	
	@GetMapping("/normal/search")// �긽�뭹紐� 寃��깋湲곕뒫, 諛쏆븘�삱嫄� �씠由꾩씠�옉 媛�寃⑸쭔�쑝濡쒕룄 �맖(pname, price)
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
		m.addAttribute("cprice", cprice);									//�옣諛붽뎄�땲 怨듯넻 �궗�빆
		m.addAttribute("pname", pname);										//pname : �긽�뭹紐�
		int p_val = 0;														//p_val : �긽�뭹 遺꾨쪟肄붾뱶
		List<String> nuserid = service.negativeUserid(userid);
		if(nuserid.isEmpty()) {
			nuserid.add("�벑濡앺븯吏� �븡�븯�뒿�땲�떎.");
		}
		int cproduct = service.countProduct(pname, p_val, nuserid);			//寃��깋寃곌낵�뿉 �빐�떦�븯�뒗 �긽�뭹�쓽 �닔
		m.addAttribute("cproduct", cproduct);

		if (cproduct > 0) {													//寃��깋 �럹�씠吏� �븯�떒�뿉 �몴�떆�븷 �럹�씠吏��닔 

			int perPage = 9; // �븳 �럹�씠吏��뿉 蹂댁씪 �긽�뭹�쓽 媛��닔


			int startRow = (page - 1) * perPage;
			
			List<Map<String,Object>> list = service.searchPname(pname, startRow, nuserid);			
			m.addAttribute("list", list);
			
			int pageNum = 5;//蹂댁뿬以� �럹�씠吏� 踰덊샇 媛��닔
			int totalPages = cproduct / perPage + (cproduct % perPage > 0 ? 1 : 0); //�쟾泥� �럹�씠吏� �닔
			
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
	
	@GetMapping("/normal/p_val")// �긽�뭹遺꾨쪟肄붾뱶 蹂꾨줈 寃��깋 湲곕뒫, 諛쏆븘�삱嫄� �씠由꾩씠�옉 媛�寃⑸쭔�쑝濡쒕룄 �맖(pname, price)
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
			nuserid.add("�벑濡앺븯吏� �븡�븯�뒿�땲�떎.");
		}
		int cproduct = service.countProduct(pname, p_val, nuserid);
		m.addAttribute("cproduct", cproduct);
		
		if (cproduct > 0) {
			int perPage = 9; // �븳 �럹�씠吏��뿉 蹂댁씪 湲��쓽 媛��닔
			int startRow = (page - 1) * perPage;
			
			List<Map<String,Object>> list = service.searchP_val(p_val, startRow, nuserid);
			m.addAttribute("list", list);
			
			int pageNum = 5;//蹂댁뿬以� �럹�씠吏� 踰덊샇 媛��닔
			int totalPages = cproduct / perPage + (cproduct % perPage > 0 ? 1 : 0); //�쟾泥� �럹�씠吏� �닔
			
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
	
	@GetMapping("/normal/details/{pno}") // �듅�젙�긽�뭹 �겢由��떆 洹� �긽�뭹 �긽�꽭�럹�씠吏�濡� �씠�룞
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
		m.addAttribute("cprice", cprice);							//怨듯넻遺�遺�
		
		Map<String,Object> product = service.detailProduct(pno);	//�빐�떦 �긽�뭹�쓽 �긽�뭹踰덊샇濡� �빐�떦 �긽�뭹 �젙蹂대�� 諛쏆븘�꽌 product�뿉 ���옣
		m.addAttribute("product", product);
		return "normal/shop-details";
	}
	
	@PostMapping("/normal/addcart") // �옣諛붽뎄�땲�뿉 �긽�뭹 �떞湲� 湲곕뒫
	public String addcart(Cart cart, int product_pno, String userid, int count) {
		service.addCart(cart, product_pno, userid, count);
		return "normal/shop-details";
	}
	
	@GetMapping("/normal/cart/{userid}") // �쑀���븘�씠�뵒濡� 洹� �쑀���쓽 移댄듃 紐⑸줉�쓣 媛��졇�삤�뒗 湲곕뒫
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
		
	@GetMapping("/normal/countchange") // �옣諛붽뎄�땲�뿉�꽌 -,+踰꾪듉 �겢由��떆 cart�뀒�씠釉붿뿉 �빐�떦�긽�뭹 媛��닔 蹂�寃� 湲곕뒫
	public String cc(@Param("count") int count,@Param("userid") String userid,@Param("product_pno") int product_pno) {
		service.countChange(count, userid, product_pno);
		return "normal/shoping-cart";
	}
	
	@GetMapping("/normal/checkout") // 寃곗젣�셿猷뚯떆 �빐�떦 �쑀���쓽 cart�뀒�씠釉붿뿉 紐⑤뱺 �젙蹂대�� 吏��슦�뒗 湲곕뒫
	public String co(@Param("userid") String userid) {
		service.checkOut(userid);
		return "normal/shoping-cart";
	}
	
	@GetMapping("/normal/delete") // �옣諛붽뎄�땲 X踰꾪듉 �겢由��떆 cart�뀒�씠釉붿뿉�꽌 �긽�뭹踰덊샇瑜� �넻�빐 �빐�떦 �쑀�� �옣諛붽뎄�땲�뿉 �긽�뭹�쓽 �젙蹂대�� 吏��슦�뒗 湲곕뒫
	public String dc(@Param("product_pno") int product_pno, @Param("userid") String userid) {
		service.deleteCart(product_pno, userid);
		return "normal/shoping-cart";
	}
	
	@PostMapping("/normal/addbuy") // 寃곗젣�셿猷뚯떆 援щℓ,�뙋留�,�옱怨�,�긽�뭹,�옣遺� �뀒�씠釉붿뿉 諛섏쁺�븯�뒗 湲곕뒫
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
        // �꽭�뀡�뿉�꽌 �궗�슜�옄 �젙蹂� �젣嫄�
        session.removeAttribute("userid");
        return "redirect:/login";
	}
	
	
}
