package stock_m.controller;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import stock_m.component.KamisApiCaller;

@Controller
public class ApiController {

    @Autowired
    private KamisApiCaller kamisApiCaller;

    @GetMapping("company/price")
    public String showPrice(Model model) {
        JSONObject json = kamisApiCaller.getDailyPriceByCategoryList();
        JSONArray items = json.getJSONObject("document").getJSONObject("data").getJSONArray("item");
		/*
		 * JSONArray arr = new JSONArray(); for (int i = 0; i < items.length(); i++) {
		 * JSONObject item = items.getJSONObject(i); String itemName =
		 * item.getString("item_name"); String unit = item.getString("unit"); String
		 * dpr1 = item.getString("dpr3");
		 * 
		 * 
		 * 
		 * // 가격 정보를 문자열로 합칩니다. String prices = String.format("%s(%s): %s", itemName,
		 * unit, dpr1); System.out.println("this is data : " + prices); arr.put(prices);
		 * 
		 * // JSP 모델에 가격 정보를 추가합니다. //System.out.println("저기는 : "+prices); }
		 */
        model.addAttribute("priceData", items);
        System.out.println("controller END");
        return "company/price";
    }
}