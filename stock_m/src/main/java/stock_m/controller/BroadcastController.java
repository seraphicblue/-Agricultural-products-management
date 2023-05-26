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
	public int stockBroad(int sno, String userid) {
		int snocount = broad_service.broadStock(sno,userid);
		return snocount;
	}
	
	
	@GetMapping("/stockmessage")
	@ResponseBody
	public void stockBroad(String userid, String content) {
		broad_service.stockMessage(userid,content);
	}
	
	@GetMapping("/countmessage")
	@ResponseBody
	public int countMessage(String userid) {
		return broad_service.countMsg(userid);
	}
}
