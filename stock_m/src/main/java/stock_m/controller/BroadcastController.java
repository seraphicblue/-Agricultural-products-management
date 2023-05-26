package stock_m.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;
import stock_m.dto.Message;
import stock_m.service.BroadcastService;

@Controller
public class BroadcastController {

	@Autowired
	BroadcastService broad_service;

	@GetMapping("/broadstock")
	@ResponseBody
	public int stockBroad(int sno, String userid) {
		int snocount = broad_service.broadStock(sno, userid);
		return snocount;
	}

	@GetMapping("/stockmessage")
	@ResponseBody
	public void stockBroad(String userid, String content) {
		broad_service.stockMessage(userid, content);
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
}
