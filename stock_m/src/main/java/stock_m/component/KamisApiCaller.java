package stock_m.component;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class KamisApiCaller {

    private static final String API_URL = "https://www.kamis.or.kr/service/price/xml.do?action=dailyPriceByCategoryList&p_product_cls_code=02&p_regday=2023-05-05&p_convert_kg_yn=Y&p_item_category_code=100&p_cert_id=3279&p_returntype=Json";
    private static final String API_KEY = "p_cert_key=1e31b9ea-18a2-48b3-95f8-d46a3c883d39";

    private RestTemplate restTemplate;

    public KamisApiCaller() {
        this.restTemplate = new RestTemplate();
    }

    public String getDailyPriceByCategoryList() {
        String url = String.format("%s&%s", API_URL,API_KEY);
        String str = restTemplate.getForObject(url, String.class);
        JSONObject json = XML.toJSONObject(str);
        String jsonStr = json.toString(4);
 
        return jsonStr;
    }
}