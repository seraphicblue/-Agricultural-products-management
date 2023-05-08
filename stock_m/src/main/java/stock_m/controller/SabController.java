/*
  	Date    : 2023.05.06
	name    : SabService
	type    : Service
	ver     : 1.0
	conect  : SabController
	content : 구매 판매에 대한 서비스 클래스
	writer  : 김재영
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import stock_m.dto.NameAndPrice_sabDto;
import stock_m.service.SabService;
import stock_m.service.StockService;



@Controller
public class SabController {
	
	@Autowired
	SabService sab_service;
	 
	@Autowired
	StockService stock_service;
	
	
	
	@GetMapping("company/main")
	public String companyindex() {
		return "company/index";
	}
	
	@GetMapping("normal/main")
	public String normalindex() {
		return "normal/index";
	}
	
	@GetMapping("/company/buy")
	public String buyForm() {
		return "company/buy";
	}
	
	/*
	 * @GetMapping("/company/{sno}")
	 * 
	 * @ResponseBody//view없이 바로 보냄 public String snoSearch(Model m, @PathVariable
	 * int sno) { int s_volume=sab_service.; Gson gson = new Gson(); String
	 * elist=gson.toJson(); return elist; }
	 */
	
	@GetMapping("/company/sell")
	public String sellForm(Model m) {
		List<NameAndPrice_sabDto>npList = sab_service.namePrice("test");
		m.addAttribute("npList",npList);
		m.addAttribute("userid","testcompany1");
		return "company/sell";
	}
	
	@PostMapping("/company/sell")
	public String sellpost(int sno, String pname, int price, int p_count) {
		int p_val= sab_service.selecSval(sno);
		String userid="testcompany1";
		sab_service.insertproduct(sno,pname,price,p_val,p_count,userid);
		return "company/sell";
	}
	
}
