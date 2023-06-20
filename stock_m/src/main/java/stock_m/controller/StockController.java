/*
   Date    : 2023.05.15
   name    : StockController
   type    : Controller
   ver     : 1.1
   connect  : stockmanage.jsp,search.jsp
   content : 재고관리 컨트롤러
   writer  : 이이지
   api     : x
  */
package stock_m.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpSession;
import stock_m.dto.AdminstockDto;
import stock_m.dto.StockDto;
import stock_m.service.RevenueService;
import stock_m.service.StockService;

@Controller
public class StockController {

	@Autowired
	StockService service;

	@Autowired
	RevenueService r_service;

	/*
	 * @GetMapping("/company/main") public String option(Model m) {
	 * 
	 * List<AdminstockDto> adminstockList = service.option();
	 * System.out.println(adminstockList);
	 * m.addAttribute("adminstockList",adminstockList); return "company/index"; }
	 */
	// main코드 수정 23.05.23

	@PostMapping("/company/checks")
	@ResponseBody
	public boolean checks(int s_price, String scontent, @RequestParam("s_volume") int s_volume, int s_val, int ano,
			HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		// 유저 아이디를 가져가 유저의 잔고를 확인 함
		int a = r_service.checks(userid);
		System.out.println(a);
		// 총 가격 정보와 유저의 잔고를 비교하여 실행
		if (a > s_price) {
			service.checki(s_price, scontent, s_volume, s_val, ano, userid);
			return true;
		} else {
			return false;
		}

	}

	@GetMapping("/company/sinsert")
	public String swrite(@Param("s_val") int s_val, @Param("userid") String userid, @Param("scontent") String scontent,
			@Param("s_volume") int s_volume) {
		userid = "1";
		service.sinsert(scontent, s_val, userid, s_volume);
		return "redirect:/company/stockmanage";
	}

	// @ModelAttribute("user") MemDto dto) {//1.세션서장값 dto 에넘겨줌 2. 파라미터값 저장(id는 그대로)
	// sesssion에 저장되 내용 바뀜=>db도업데이트 해줘야함
	// dto에 아이디값은 포함되지않았음

	@RequestMapping("company/stockmanage")
	public String slist(HttpSession session, @RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		String userid = (String) session.getAttribute("userid");
		System.out.println("is");
		// 글이 있는지 체크
		int count = service.count();// 글갯수
		System.out.println("par");
		if (count > 0) {
			System.out.println("am");
			int perPage = 10; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;// 0부터시작하기 때문에 1뺌

			List<StockDto> stockList = service.sList(userid);
			m.addAttribute("stockList", stockList);
			/*
			 * List<StockDto> boardList = service.sboardList(startRow);
			 * 
			 * m.addAttribute("stockList", stockList);
			 */

			int pageNum = 5;// 보여질 페이지 번호수
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수

			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			if (end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("begin", begin);
			m.addAttribute("end", end);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);

		}

		m.addAttribute("count", count);
		m.addAttribute("uid", userid);

		return "company/stockmanage";
	}

	@GetMapping("/company/sdelete")
	public String sdelete(@RequestParam int sno) {
		System.out.println(sno);
		service.sdelete(sno);
		System.out.println("this");
		return "/company/stockmanage";
	}

	@GetMapping("/company/scheckdelete")
	public String scheckdelete(@RequestParam(value = "selectedItems[]") int[] selectedItems) {
		for (int selectedItem : selectedItems) {
			int sno = selectedItem;
			System.out.println(sno);
			service.sdelete(sno);// 여기서 문제 발생
		}
		return "redirect:/company/stockmanage";
	}

	@GetMapping("company/search")
	public String searchscontent(HttpSession session, @RequestParam("search") String search, Model m) {
		String userid = (String) session.getAttribute("userid");
		System.out.println(search);

		// List<StockDto> stockList = service.sList(userid);

		List<StockDto> sList = service.searchscontent(search, userid);
		m.addAttribute("stockList", sList);
		m.addAttribute("search", search);
		m.addAttribute("uid", userid);
		System.out.println("검색 결과 " + sList);

		return "company/stockmanage";

	}

	@GetMapping("/company/ssupdate/{str}")
	@ResponseBody
	public String ssupdate(@PathVariable("str") String str) {
		System.out.println("------------this is update start------------");
		System.out.println(str);
		String snos = str.split("A")[0];
		String s_volumes = str.split("A")[1];
		int sno = Integer.parseInt(snos);
		int s_volume = Integer.parseInt(s_volumes);
		System.out.println(s_volume + "////////////" + sno);
		int a = service.supdate(s_volume, sno);
		return "ok";
	}

	private int parseInt(String snos) {
		// TODO Auto-generated method stub
		return 0;
	}

	@GetMapping("/company/stock")
	public String option(Model m) {

		List<AdminstockDto> adminstockList = service.option();
		System.out.println(adminstockList);
		m.addAttribute("adminstockList", adminstockList);
		return "company/stock";
	}

	/*
	 * @GetMapping("/company/inserts") public String
	 * inserts(@RequestParam("scontent") String scontent, @RequestParam("s_volume")
	 * int s_volume) { System.out.println(scontent); Date now = new Date();
	 * SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
	 * service.sinsert(scontent,s_volume,format.format(now)); return
	 * "redirect:/company/stock"; }
	 */
	// main코드 수정 23.05.23

	@GetMapping("company/cs")
	public String chartr(HttpSession session, Model m) {
		String userid = (String) session.getAttribute("userid");
		List<Map<String, Object>> stockList = service.getstockoption(userid);
		m.addAttribute("stockList", stockList);
		m.addAttribute("uid", userid);

		return "company/cs";
	}

	@GetMapping("company/getstock")
	@ResponseBody
	public String getstock(HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		List<Map<String, Object>> getstockList = service.getstockData(userid);
		Gson gson = new Gson();
		String stockList = gson.toJson(getstockList);
		System.out.println("stock" + stockList);
		return stockList;

	}

	@GetMapping("company/getStockInfos")
	@ResponseBody
	public ResponseEntity<String> getStockInfo(HttpSession session, @RequestParam("selectedsno") int selectedsno)
			throws JsonProcessingException {
		String userid = (String) session.getAttribute("userid");
		System.out.println(userid);
		System.out.println("getstockinfo 요청됨");
		int sno = selectedsno;
		List<Map<String, Object>> sellcountdate = service.getsellcount(userid, sno);
		List<Map<String, Object>> buycountdate = service.getbuycount(userid, sno);

		System.out.println("sellcountdate" + sellcountdate);
		System.out.println("buycountdate" + buycountdate);

		// json으로 직렬화
		ObjectMapper om = new ObjectMapper();

		// json문자열로 변환
		String sellcountdateJson = om.writeValueAsString(sellcountdate);
		String buycountdateJson = om.writeValueAsString(buycountdate);

		Map<String, String> responseData = new HashMap<>();
		responseData.put("sellcountdate", sellcountdateJson);
		responseData.put("buycountdate", buycountdateJson);

		String jsonResponse = om.writeValueAsString(responseData);

		return ResponseEntity.ok(jsonResponse);

	}

}
