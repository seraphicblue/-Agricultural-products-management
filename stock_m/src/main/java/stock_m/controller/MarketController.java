package stock_m.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import stock_m.service.MarketService;

@Controller
public class MarketController {
	
	@Autowired
	MarketService service;
	
	@GetMapping("/market")
	public String mform() {
		return "normal/marketform";
	}
	
	@PostMapping("/market")
	public String sform(String pname, Model m) {
		m.addAttribute("pname", pname);
		List<Map<String,Object>> list = service.searchPname(pname);
		m.addAttribute("list", list);
		return "normal/shop-grid";
	}
}
