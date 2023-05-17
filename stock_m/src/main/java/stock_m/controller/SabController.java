/*
  	Date    : 2023.05.09
	name    : SabController
	type    : Service
	ver     : 1.3
	conect  : SabService
	content : 구매 판매에 대한 컨트롤러 클래스
	writer  : 김재영
	api     : 1e31b9ea-18a2-48b3-95f8-d46a3c883d39   ::농사로 api
*/

package stock_m.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;



import stock_m.dto.NameAndPrice_sabDto;
import stock_m.service.SabService;
import stock_m.service.StockService;



@Controller
public class SabController {
	
	@Autowired
	SabService sab_service;
	 
	@Autowired
	StockService stock_service;
	
	/*
	 * @GetMapping("event") public String event() { return "/event"; }
	 */
	
	@GetMapping("company/main")
	public String companyindex() {
		return "/company/index";
	}
	
	@GetMapping("normal/main")
	public String normalindex() {
		return "/normal/index";
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
		return count;
	}
	
	@GetMapping("/company/Vol/{sno}/{p_count}")
	@ResponseBody//view없이 바로 보냄
	public int snoSearch(Model m, @PathVariable int sno,@PathVariable int p_count) {
		String userid="testcompany1";
		int Vol=sab_service.selecVol(userid, sno);
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
		
		sab_service.updateAndInsert(sno,pname,price,p_count);
		
		return "company/index";
	}
	
}
