/*
   Date    : 2023.05.06
   name    : management
   type    : java
   ver     : 1.0
   conect  : managementController
   content : 유의 업체 검색 결과 추가 및 삭제
   writer  : 고상원
   api     : x
  */

package stock_m.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import stock_m.dto.ManagementDto;
import stock_m.dto.UserDto;
import stock_m.service.ManagementService;

@Controller
@SessionAttributes("user")
public class ManagementController {
	@Autowired
	ManagementService service;

	@GetMapping("/company/test")
	public String test() {
		return "/company/test";
	}
	
	@GetMapping("/company/test2")
	public String test2() {
		return "/company/test2";
	}

	@RequestMapping("/company/search")
	public String list(@RequestParam(name = "page", defaultValue = "1") int page, Model m, String keyword) {

		// 글이 있는지 체크
		int count = service.countSearch(keyword);

		if (count > 0) {

			int perPage = 5; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;

			List<UserDto> UserList = service.UserList(startRow, keyword); // 유저DTO를 이용해 KEYWORD에 맞는 유저 정보를
																						// 리스트로 받아옴
			m.addAttribute("keyword", keyword);
			m.addAttribute("mList", UserList);

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

	@RequestMapping("/company/search2")
	public String list2(@RequestParam(name = "page", defaultValue = "1") int page, Model m, String keyword) {

		// 글이 있는지 체크
		int count = service.countSearch(keyword);

		if (count > 0) {

			int perPage = 5; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;

			List<ManagementDto> managementList = service.managementList(startRow, keyword); // 매니저DTO를 이용해 KEYWORD에 맞는 매니저 테이블 정보를 리스트로 받아옴
			m.addAttribute("keyword", keyword);
			m.addAttribute("dList", managementList);
			System.out.println(managementList);
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
		return "/company/search2";
	}
	
	@RequestMapping("/company/insert") 
	public String insert(@RequestParam("id") String id) {
		service.insert(id); 
		return "redirect:/comapny/test";
	 }
	
	@RequestMapping("/company/delete") 
	public String delete(@RequestParam("m_content") String m_content) {
		System.out.println(m_content);
		int mno= service.find(m_content);
		System.out.println(mno);
		service.delete(mno); 
		return "redirect:/comapny/test";
	 }
	 
}
