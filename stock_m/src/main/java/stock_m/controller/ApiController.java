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
    	String priceData = kamisApiCaller.getDailyPriceByCategoryList();
        JSONObject json = new JSONObject(priceData);
        JSONArray items = json.getJSONObject("document").getJSONObject("data").getJSONArray("item");
        System.out.println("여기는"+items);
        for (int i = 0; i < items.length(); i++) {
            JSONObject item = items.getJSONObject(i);
            String itemName = item.getString("item_name");
            String unit = item.getString("unit");
            String dpr1 = item.getString("dpr2");
            
            // 가격 정보를 문자열로 합칩니다.
            String prices = String.format("%s(%s): %s", 
                itemName, unit, dpr1);
            
            // JSP 모델에 가격 정보를 추가합니다.
            model.addAttribute("priceData", prices);
            System.out.println(prices);
        }
        
        return "company/price";
    }
}