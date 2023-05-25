package stock_m.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;


import jakarta.servlet.http.HttpSession;
import stock_m.dto.AdminstockDto;
import stock_m.dto.BroadcastPriceDto;
import stock_m.dto.NameAndPrice_sabDto;
import stock_m.service.BroadcastService;
import stock_m.service.SabService;
import stock_m.service.StockService;

@Controller

public class SabController {

	@Autowired
	SabService sab_service;

	@Autowired
	StockService stock_service;

	@Autowired
	BroadcastService broad_service;

	@GetMapping("event2")
	public String event() {
		return "test";
	}

	@GetMapping("company/main")
	public String companyindex(Model m, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		List<AdminstockDto> adminstockList = stock_service.option();
		System.out.println(adminstockList);
		m.addAttribute("adminstockList",adminstockList);
		List<NameAndPrice_sabDto> npList = sab_service.namePrice(userid);
		m.addAttribute("npList", npList);
		m.addAttribute("uid", userid);
		return "company/index";
	}


	@GetMapping("normal/main")
	public String normalindex() {
		return "/normal/index";
	}

	@GetMapping("/company/{sno}")
	@ResponseBody // view없이 바로 보냄
	public int snoCount(Model m, @PathVariable int sno) {
		int count = sab_service.selecCount(sno);
		return count;
	}

	@GetMapping("/company/Vol/{sno}/{p_count}")
	@ResponseBody // view없이 바로 보냄
	public int snoSearch(Model m, @PathVariable int sno, @PathVariable int p_count) {
		int Vol = sab_service.selecVol(sno);
		return Vol;
	}
	
    @GetMapping("/company/buy")
    public String buy(Model model) {    	
        return "company/buy";
    }

	@GetMapping("/company/sell")
	public String sellForm(Model m, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		List<NameAndPrice_sabDto> npList = sab_service.namePrice(userid);
		m.addAttribute("npList", npList);
		m.addAttribute("uid", userid);
		return "company/sell";
	}

	@PostMapping("/company/sell")
	public void sellpost(int sno, String pname, int price, int p_count) {

		sab_service.updateAndInsert(sno, pname, price, p_count);
		/*
		 * return "company/index";
		 */
	}
	
	@GetMapping("/broadprice")
	@ResponseBody
	public String broadprice(int sno,String userid) {
		
		String bno = String.valueOf(sab_service.broadprice(userid,sno));
		
		return bno;
	}
	
	
	@GetMapping("/broadCprice")
	@ResponseBody
	public String broadCprice(Model m, int pno, int param) {
		List<String>userList = broad_service. broadPriceCheck(pno, param);
		Gson gson = new Gson();
		String ulist=gson.toJson(userList);		
		return ulist;
	}

}
