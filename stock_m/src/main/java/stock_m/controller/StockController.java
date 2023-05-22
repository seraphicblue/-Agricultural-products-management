package stock_m.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;
import stock_m.dto.AdminstockDto;
import stock_m.service.RevenueService;
import stock_m.service.StockService;

@Controller
public class StockController {

	@Autowired
	StockService service;
	
	@Autowired
	RevenueService r_service;
	
	@GetMapping("/company/stock")
	public String option(Model m) {
		
		List<AdminstockDto> adminstockList = service.option();
		System.out.println(adminstockList);
		m.addAttribute("adminstockList",adminstockList);
		return "company/stock";
	}
	
	@PostMapping("/company/checks")
	@ResponseBody
	public boolean checks(int s_price, String scontent, @RequestParam("s_volume") int s_volume, int s_val ,HttpSession session) {
		String userid = (String) session.getAttribute("userid"); 
		int a = r_service.checks(userid);
		System.out.println(a);
		if(a> s_price) {
			service.checki(s_price,scontent, s_volume, s_val,userid);
			return true;
		}else {
			return false;
		}
		
	}
	
	/*
	 * @GetMapping("/company/inserts") public String
	 * inserts(@RequestParam("scontent") String scontent, @RequestParam("s_volume")
	 * int s_volume) { System.out.println(scontent); Date now = new Date();
	 * SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
	 * service.inserts(scontent,s_volume,format.format(now)); return
	 * "redirect:/company/stock"; }
	 */
}
