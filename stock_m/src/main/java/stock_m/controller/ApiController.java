package stock_m.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import stock_m.component.KamisApiCaller;
import stock_m.dto.PriceDto;

@Controller
public class ApiController {

	@Autowired
	private KamisApiCaller kamisApiCaller;

	@GetMapping("company/price")
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
		return "company/price";
	}

}