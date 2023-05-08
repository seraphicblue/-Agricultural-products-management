/*
  	Date    : 2023.05.08
	name    : SabController
	type    : Service
	ver     : 1.2
	conect  : SabService
	content : 구매 판매에 대한 컨트롤러 클래스
	writer  : 김재영
	api     : 1e31b9ea-18a2-48b3-95f8-d46a3c883d39   ::농사로 api
*/

package stock_m.controller;

import java.net.URI;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriComponentsBuilder;


import com.google.gson.Gson;

import stock_m.dto.NameAndPrice_sabDto;
import stock_m.service.SabService;
import stock_m.service.StockService;



@Controller
public class SabController {
	
	@Autowired
	SabService sab_service;
	 
	@Autowired
	StockService stock_service;
	
	
	
	@GetMapping("company/main")
	public String companyindex() {
		return "company/index";
	}
	
	@GetMapping("normal/main")
	public String normalindex() {
		return "normal/index";
	}
	
	/*
	 * @GetMapping("/company/buy") public String buyForm(Model model) {
	 * 
	 * URI uri = UriComponentsBuilder .fromUriString("http://www.kobis.or.kr")
	 * .path(
	 * "/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json")
	 * .queryParam("key","f5eef3421c602c6cb7ea224104795888")
	 * .queryParam("targetDt","20230418") .encode() .build() .toUri();
	 * 
	 * MovieList list =restTemplate.getForObject(uri, MovieList.class);
	 * model.addAttribute("boxOfficeList", list); return "movie/boxOffice";
	 * 
	 * 
	 * return "company/buy"; }
	 */
	
	@GetMapping("/company/{sno}")
	@ResponseBody//view없이 바로 보냄
	public int snoCount(Model m, @PathVariable int sno) {
		String userid="testcompany1";
		int count=sab_service.selecCount(userid, sno);	
		System.out.println(count);
		return count;
	}
	
	@GetMapping("/company/Vol/{sno}")
	@ResponseBody//view없이 바로 보냄
	public int snoSearch(Model m, @PathVariable int sno) {
		String userid="testcompany1";
		int Vol=sab_service.selecVol(userid, sno);
		System.out.println("여기는"+Vol);
		return Vol;
	}
	
	@GetMapping("/company/sell")
	public String sellForm(Model m) {
		List<NameAndPrice_sabDto>npList = sab_service.namePrice("test");
		m.addAttribute("npList",npList);
		m.addAttribute("userid","testcompany1");
		return "company/sell";
	}
	
	@PostMapping("/company/sell")
	public String sellpost(int sno, String pname, int price, int p_count) {
		int p_val= sab_service.selecSval(sno);
		String userid="testcompany1";
		sab_service.insertproduct(sno,pname,price,p_val,p_count,userid);
		return "company/sell";
	}
	
}
