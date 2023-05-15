package stock_m.component;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;

import stock_m.dto.PriceDto;
import stock_m.dto.PriceLists;

@Component
public class KamisApiCaller {
	// Api url의 기본 값을 받아옵니다.

	public void DailyPriceByCategoryList() throws Exception {
        String API_URL = "http://www.garak.co.kr/publicdata/dataOpen.do?id=3436&passwd=rhksflgo12!&dataid=data4&pagesize=10&pageidx=1&portal.templet=false&p_ymd=20230515&p_jymd=20230508&d_cd=2&p_jjymd=20220515&p_pos_gubun=1&pum_nm=";

        URL url = new URL(API_URL);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) {
            if (conn.getResponseCode() == HttpURLConnection.HTTP_MOVED_TEMP || conn.getResponseCode() == HttpURLConnection.HTTP_MOVED_PERM) { // 추가
                String redirectUrl = conn.getHeaderField("Location"); // 추가
                URL newUrl = new URL(redirectUrl); // 추가
                conn = (HttpURLConnection) newUrl.openConnection(); // 추가
                conn.setRequestMethod("GET"); // 추가
            } else { // 추가
                throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode()); // 추가
            } // 추가
        }

        BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
        StringBuilder sb = new StringBuilder();
        String line;

        while ((line = br.readLine()) != null) {
            sb.append(line);
        }

        br.close();
        conn.disconnect();

        String xmlString = sb.toString();
        JSONObject jsonObject = XML.toJSONObject(xmlString);
        String jsonString = jsonObject.toString();
        System.out.println("Json String: " + jsonString);
    }
}