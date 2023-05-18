/*
  	Date    : 2023.05.09
	name    : SabController
	type    : Service
	ver     : 1.3
	conect  : SabService
	content : 구매 판매에 대한 컨트롤러 클래스
	writer  : 김재영
	api     : 1e31b9ea-18a2-48b3-95f8-d46a3c883d39   ::농사로 api
*/

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
	public String companyindex() {
		return "/company/index";
	}

	@GetMapping("normal/main")
	public String normalindex() {
		return "/normal/index";
	}

	@GetMapping("/company/{sno}")
	@ResponseBody // view없이 바로 보냄
	public int snoCount(Model m, @PathVariable int sno) {
		String userid = "testcompany1";
		int count = sab_service.selecCount(userid, sno);
		return count;
	}

	@GetMapping("/company/Vol/{sno}/{p_count}")
	@ResponseBody // view없이 바로 보냄
	public int snoSearch(Model m, @PathVariable int sno, @PathVariable int p_count) {
		String userid = "testcompany1";
		int Vol = sab_service.selecVol(userid, sno);
		return Vol;
	}

	@GetMapping("/company/sell")
	public String sellForm(Model m) {
		List<NameAndPrice_sabDto> npList = sab_service.namePrice("test");
		m.addAttribute("npList", npList);
		m.addAttribute("userid", "testcompany1");
		return "company/sell";
	}

	@PostMapping("/company/sell")
	public String sellpost(int sno, String pname, int price, int p_count) {

		sab_service.updateAndInsert(sno, pname, price, p_count);

		return "company/index";
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
