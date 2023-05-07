package stock_m.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import stock_m.dto.ManagementDto;
import stock_m.service.ManagementService;

@Controller
public class ManagementController {
	@Autowired
	ManagementService service;

	@GetMapping("/company/test")
	public String test(){
		return "/company/test";
	}
	
	
	@RequestMapping("/company/search")
	public String list(@RequestParam(name = "keyword", defaultValue = "1") int page, Model m, String keyword) {

		// 글이 있는지 체크
		int count = service.countSearch(keyword);
		System.out.println("아아");
		if (count > 0) {
			
			int perPage = 10; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;

			List<ManagementDto> managementList = service.managementList(startRow);

			m.addAttribute("mList", managementList);

			int pageNum = 5;
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
		return "/company/search1";
	}
}
