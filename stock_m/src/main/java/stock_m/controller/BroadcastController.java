package stock_m.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;


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
	
	@GetMapping("/broadstock")
	@ResponseBody
	public int stockBroad(int sno, String userid) {
		int snocount = broad_service.broadStock(sno,userid);
		return snocount;
	}
	
	
	@GetMapping("/stockmessage")
	@ResponseBody

	public void stockBroad(String sep, String userid, String content) {
		System.out.println("constroller");
		broad_service.stockMessage(sep,userid, content);

	}
	
	@GetMapping("/countmessage")
	@ResponseBody
	public int countMessage(String userid) {
		return broad_service.countMsg(userid);
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
