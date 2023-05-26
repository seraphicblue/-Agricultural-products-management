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

import stock_m.component.KamisApiCaller;
import stock_m.dto.PriceDto;
import stock_m.service.SabService;

@Controller
public class ApiController {

	@Autowired
	private KamisApiCaller kamisApiCaller;
	
	@Autowired
	SabService service;

	@GetMapping("admin/price")
	public String showPrice(Model model) throws Exception {
		
		int a =kamisApiCaller.DailyPriceByCategoryList();
		  List<PriceDto> priceDataList = new ArrayList<>();
		  	
		    for (int i = a; 1 < i; i--) {
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

}