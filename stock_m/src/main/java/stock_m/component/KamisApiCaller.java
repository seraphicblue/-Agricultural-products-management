package stock_m.component;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;

import stock_m.dto.PriceDto;
import stock_m.dto.PriceLists;

@Component
public class KamisApiCaller {
	// Api url의 기본 값을 받아옵니다.

	public int DailyPriceByCategoryList() throws Exception {
		String API_URL = "http://www.garak.co.kr/publicdata/dataOpen.do?id=3436&passwd=rhksflgo12!&dataid=data4&pagesize=10&pageidx=1&portal.templet=false";
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String formatedNow = now.format(formatter);
		LocalDate agoweek = now.minusWeeks(1);
		String agoweeks = agoweek.format(formatter);
		LocalDate agoyear = now.minusYears(1);
		String agoyears = agoyear.format(formatter);
		String Url = "&p_ymd=" + formatedNow + "&p_jymd=" + agoweeks + "&d_cd=2&p_jjymd=" + agoyears
				+ "&p_pos_gubun=1&pum_nm=";

		// URL 클래스는 문자열이 지정하는 자원 API_URL+Url에 대한 url객체를 생성해준다.
		URL url = new URL(API_URL + Url);
		// HttpURLConnection.openConnection은 실제 네트워크 연결을 설정하지 않고 URLConnection클래스의 인스턴스를
		// 반환합니다.
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setRequestMethod("GET");
		// getResponseCode은 서버에서 보낸 HTTP 상태코드를 반환하는데 HTTP_OK라는 값이 리턴되면 연결됨
		if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) {
			// HTTP_MOVED_TEMP나 HTTP_MOVED_PERM은 URL redirect에러로 reidrect에러가 발생하면 redirect
			// url을 추가하고 다시 connection을 실행함
			if (conn.getResponseCode() == HttpURLConnection.HTTP_MOVED_TEMP
					|| conn.getResponseCode() == HttpURLConnection.HTTP_MOVED_PERM) { // 추가
				String redirectUrl = conn.getHeaderField("Location");
				URL newUrl = new URL(redirectUrl);
				conn = (HttpURLConnection) newUrl.openConnection();
				conn.setRequestMethod("GET");
			} else {
				throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode()); // 추가
			}
		}
		// BufferReader와 InputStream을 이용해 api를 읽어옴
		BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
		StringBuilder sb = new StringBuilder();
		String line;

		while ((line = br.readLine()) != null) {
			sb.append(line);
		}
		// 연결 종료
		br.close();
		conn.disconnect();
		// 받아온 값들을 저장하고 json object로 변환
		String xmlString = sb.toString();
		JSONObject jsonObject = XML.toJSONObject(xmlString);
		String jsonString = jsonObject.toString();
		/* System.out.println("Json String: " + jsonString); */
		Gson gson = new Gson();
		PriceLists price = gson.fromJson(jsonString, PriceLists.class);
		int pageidx = price.getLists().getList_total_count() / 10  + ( price.getLists().getList_total_count() % 10  == 0 ? 0:1 );
		System.out.println(pageidx);

		return pageidx;

	}

	public PriceDto priceinfo(int i) throws Exception  {

		String API_URL1 ="http://www.garak.co.kr/publicdata/dataOpen.do?id=3436&passwd=rhksflgo12!&dataid=data4&pagesize=10&pageidx=";
		String API_URL2 = i+"&portal.templet=false";
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String formatedNow = now.format(formatter);
		LocalDate agoweek = now.minusWeeks(1);
		String agoweeks = agoweek.format(formatter);
		LocalDate agoyear = now.minusYears(1);
		String agoyears = agoyear.format(formatter);
		String Url = "&p_ymd=" + formatedNow + "&p_jymd=" + agoweeks + "&d_cd=2&p_jjymd=" + agoyears+ "&p_pos_gubun=1&pum_nm=";
		URL url2 = new URL(API_URL1+API_URL2+Url);
		  
		HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
		  
		conn2.setRequestMethod("GET"); //getResponseCode은 서버에서 보낸 HTTP 상태코드를 반환하는데HTTP_OK라는 값이 리턴되면 연결됨 
		if (conn2.getResponseCode() !=HttpURLConnection.HTTP_OK) { 
			//HTTP_MOVED_TEMP나 HTTP_MOVED_PERM은 URLredirect에러로 reidrect에러가 발생하면 redirect url을 추가하고 다시 connection을 실행함 
		if(conn2.getResponseCode() == HttpURLConnection.HTTP_MOVED_TEMP ||conn2.getResponseCode() == HttpURLConnection.HTTP_MOVED_PERM) { 
			// 추가 String
			String redirectUrl = conn2.getHeaderField("Location");
		  redirectUrl = conn2.getHeaderField("Location"); URL newUrl = new URL(redirectUrl); 
		  conn2 = (HttpURLConnection) newUrl.openConnection();
		  conn2.setRequestMethod("GET"); 
		  } else { 
			  throw new RuntimeException("Failed : HTTP error code : " + conn2.getResponseCode()); 
		  } 
		} 
		//BufferReader와 InputStream을 이용해 api를 읽어옴 
		BufferedReader br2 = new BufferedReader(new InputStreamReader((conn2.getInputStream())));
		StringBuilder sb2 = new StringBuilder(); String line2;
		  
		  while ((line2 = br2.readLine()) != null) { 
			  sb2.append(line2); 
			  } //연결 종료
		  br2.close(); 
		  conn2.disconnect();    
		  
		  //받아온 값들을 저장하고 json object로 변환 
		  String xmlString2 = sb2.toString(); 
		  JSONObject jsonObject2 =XML.toJSONObject(xmlString2);
		  String jsonString2 = jsonObject2.toString();
			/* System.out.println("Json String: " + jsonString2); */
		  Gson gson2 = new Gson();
		  PriceLists price2 = gson2.fromJson(jsonString2, PriceLists.class); 
		  PriceDto pricedto2 = price2.getLists().getList().get(1);
		  return pricedto2;
		 
	}
}