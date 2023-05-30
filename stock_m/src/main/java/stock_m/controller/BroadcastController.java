package stock_m.controller;


import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Param;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import stock_m.service.BroadcastService;
import stock_m.service.MarketService;


import jakarta.servlet.http.HttpSession;
import stock_m.dto.Message;
import stock_m.dto.NameAndPrice_sabDto;

import stock_m.service.BroadcastService;
import stock_m.service.SabService;


@Controller
public class BroadcastController {
	
	@Autowired
	SabService sab_service;


	@Autowired
	BroadcastService broad_service;
	
	@Autowired
	MarketService marketservice;
	
	@GetMapping("/broadstock")
	@ResponseBody
	public int stockBroad(int sno, String userid) {
		int snocount = broad_service.broadStock(sno,userid);
		return snocount;
	}
	
	
	@GetMapping("/stockmessage")
	@ResponseBody

	public void stockBroad(String sep, String userid, String content) {
		
		broad_service.stockMessage(sep,userid, content);

	}
	
	@GetMapping("/countmessage")
	@ResponseBody
	public int countMessage(String userid) {
		return broad_service.countMsg(userid);
	}

	
	@GetMapping("/normal/palarmsearch")// 상품명 검색기능, 받아올건 이름이랑 가격만으로도 됨(pname, price)
	public String psform(@Param("pname")String pname, Model m, HttpSession session, @RequestParam(name = "p", defaultValue = "1") int page) {		
		String userid = (String) session.getAttribute("userid");
		
		int cprice =0;
		int ccount = marketservice.cartCount(userid);
		m.addAttribute("ccount", ccount);
		if(ccount == 0) {
			cprice = 0;
		}
		else if(ccount > 0) {
			cprice = marketservice.cartPrice(userid);
		}				
		m.addAttribute("cprice", cprice);									//장바구니 공통 사항
		m.addAttribute("pname", pname);										//pname : 상품명
		int p_val = 0;														//p_val : 상품 분류코드
		List<String> nuserid = marketservice.negativeUserid(userid);
		
		if(nuserid.isEmpty()) {
			nuserid.add("등록하지 않았습니다.");
		}
		int cproduct = marketservice.countProduct(pname, p_val, nuserid);	//검색결과에 해당하는 상품의 수
		m.addAttribute("cproduct", cproduct);

		if (cproduct > 0) {													//검색 페이지 하단에 표시할 페이지수 

			int perPage = 30; // 한 페이지에 보일 상품의 갯수


			int startRow = (page - 1) * perPage;
			
			List<Map<String,Object>> palist = marketservice.palarmSearch(pname, startRow, nuserid);			
			m.addAttribute("palist", palist);
			
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
		
		return "normal/palarmsearch";
	}
	
	@PostMapping("/normal/palarm")
	@ResponseBody
	public int pAlarmcheck(HttpSession session,@RequestParam("pno") int pno,@RequestParam("aprice") int aprice) {
		String userid = (String) session.getAttribute("userid");
		return broad_service.pacheck(userid,pno,aprice);
	}
	
	@RequestMapping("/normal/padelete")
	public String padelete(@RequestParam("pno") int pno, HttpSession session, HttpServletRequest request) {
		String userid = (String) session.getAttribute("userid");
		// HttpServletRequest을 이용해 현재 페이지의 접속 경로를 받아 저장
		String url = request.getHeader("Referer");
		broad_service.padelete(userid, pno);
		return "redirect:" + url;
	}
	
	@RequestMapping("/normal/paupdate")
	public String palarmupdate(@RequestParam("pno") int pno, @RequestParam("br_param") int br_param, HttpSession session, HttpServletRequest request) {
		String userid = (String) session.getAttribute("userid");
		// HttpServletRequest을 이용해 현재 페이지의 접속 경로를 받아 저장
		String url = request.getHeader("Referer");
		broad_service.palarmupdate(userid, pno, br_param);
		return "redirect:" + url;
	}



	@GetMapping("company/message")
	public String Messagepage(HttpSession session, Model m) {
		String userid = (String) session.getAttribute("userid");
		List<Message> pagelist = broad_service.messagepg(userid);
		if (pagelist != null) {
			m.addAttribute("page", pagelist);
		}
		return "company/message";
	}
	
	@GetMapping("/showmessage")
	@ResponseBody
	public String showMessage(int mesno) {
		return broad_service.showMsg(mesno);
	}
	
	
	@GetMapping("/broadLimit")
	@ResponseBody
	public String limit(String userid) {
		return broad_service.broadlimit(userid);
	}
	
	@GetMapping("company/broadSelecStock")
	public String broadSelM(HttpSession session, Model m) {
		String userid = (String) session.getAttribute("userid");
		List<NameAndPrice_sabDto> npList = sab_service.namePrice(userid);
		m.addAttribute("npList", npList);
		m.addAttribute("uid", userid);
		
		
		return "company/broadSelecStock";
	}
	
	@GetMapping("company/broadSelecLimit")
	public String broadSelL(HttpSession session, Model m) {
		String userid = (String) session.getAttribute("userid");
		List<NameAndPrice_sabDto> npList = sab_service.namePrice(userid);
		m.addAttribute("npList", npList);
		m.addAttribute("uid", userid);
		
		
		return "company/broadSelecLimit";
	}
	
	@GetMapping("company/broadSelecPrice")
	public String broadSelP(HttpSession session, Model m) {
		String userid = (String) session.getAttribute("userid");
		List<NameAndPrice_sabDto> npList = sab_service.namePrice(userid);
		m.addAttribute("npList", npList);
		m.addAttribute("uid", userid);
		
		return "company/broadSelecPrice";
	}
	

}
