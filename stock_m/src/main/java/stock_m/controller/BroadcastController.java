package stock_m.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import stock_m.service.BroadcastService;

@Controller
public class BroadcastController {
	
	@Autowired
	BroadcastService broad_service;
	
	@GetMapping("/broadstock")
	@ResponseBody
	public String stockBroad(int sno, String userid) {
		String reuserid = broad_service.broadStock(sno,userid);
		return reuserid;
	}
}
