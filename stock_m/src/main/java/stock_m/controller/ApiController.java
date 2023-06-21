package stock_m.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import jakarta.servlet.http.HttpSession;
import stock_m.component.KamisApiCaller;
import stock_m.dto.AdminstockDto;
import stock_m.dto.PriceDto;
import stock_m.service.SabService;
import stock_m.service.StockService;

@Controller
public class ApiController {

	@Autowired
	private KamisApiCaller kamisApiCaller;
	
	@Autowired
	SabService service;
	
	@Autowired
	StockService stock_service;


	@GetMapping("admin/price")
	public String showPrice(Model model) throws Exception {
		// 현재 받아오는 api의 최대 size는 1page당 10개 입니다.
		// DailyPriceByCategoryList메서드를 실행시켜 당일 몇개의 데이터가 있는지 확인합니다.
		int a =kamisApiCaller.DailyPriceByCategoryList();
		  List<PriceDto> priceDataList = new ArrayList<>();
		  	
		    for (int i = a; 1 < i; i--) {
			    //중복성을 검사하여 같은 정보가 넘어올 경우 하나의 데이터만 가져옵니다.
		    	if(!kamisApiCaller.priceinfo(i).toString().equals(kamisApiCaller.priceinfo(i-1).toString())) {
		    		priceDataList.add(kamisApiCaller.priceinfo(i));
		    	}
		    }

		    model.addAttribute("priceDataList", priceDataList);
		    model.addAttribute("aValue", a);
		
		System.out.println("controller END");
		return "admin/price";
	}

	@PostMapping("company/inserta")
	@ResponseBody
	public int inserta(@RequestParam("a_content") String a_content, @RequestParam("a_val") int a_val, @RequestParam("a_volum") int a_volum) {	
		int a =service.inserta(a_content, a_val, a_volum);
		return a;
	}
	
	@GetMapping("admin/change")
	public String change(Model m, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		List<AdminstockDto> adminstockList = stock_service.option();
		m.addAttribute("adminstockList",adminstockList);
		m.addAttribute("uid", userid);
		return "admin/change";
	}
	
	@PostMapping("admin/updatep")
	@ResponseBody
	public int updatep(@RequestParam("ano") int ano, @RequestParam("price") int price) {
		int b = service.updatep(ano,price);
		return b;
	}

}
