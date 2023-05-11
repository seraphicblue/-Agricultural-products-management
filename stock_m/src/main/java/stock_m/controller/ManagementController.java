/*
   Date    : 2023.05.11
   name    : management
   type    : java
   ver     : 1.1
   conect  : managementController
   content : 회사 유의 업체 구분 변경
   writer  : 고상원
   api     : x
  */

package stock_m.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String insertmain(@RequestParam(name = "page", defaultValue = "1") int page, Model m) {

		// 글이 있는지 체크
		int count =service.count1();
		System.out.println(count);

		if (count > 0) {

			int perPage = 5; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;

			List<UserDto> UList = service.UList(startRow); 
			System.out.println(UList);
			m.addAttribute("UList", UList);
			
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
		return "company/test";
	}
	
	@GetMapping("/company/test2")
	public String deletemain(@RequestParam(name = "page", defaultValue = "1") int page, Model m) {

		// 글이 있는지 체크
		int count =service.count();
		System.out.println(count);

		if (count > 0) {

			int perPage = 5; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;

			List<ManagementDto> maList = service.maList(startRow); 
			System.out.println(maList);
			m.addAttribute("maList", maList);
			
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
		return "company/test2";
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
		
		return "company/search1";
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
		return "company/search2";
	}
	
	@RequestMapping("/company/insert") 
	public String insert(@RequestParam("id") String id) {
		service.insert(id); 
		return "redirect:/company/test2";
	 }
	
	@RequestMapping("/company/delete") 
	public String delete(@RequestParam("m_content") String m_content) {
		System.out.println(m_content);
		int mno= service.find(m_content);
		System.out.println(mno);
		service.delete(mno); 
		return "redirect:/company/test2";
	 }
	
	@PostMapping("/company/check")
	@ResponseBody
	public boolean check(String username) {
		int count =service.check(username);
		if(count == 0) {
			return true;
		}else {
			return false;
		}
	}	

	@GetMapping("/company/update")
	public String update(@RequestParam("m_content") String m_content) {
		service.update(m_content);
		return "redirect:/company/test2";
	}
	
	@GetMapping("/company/update2")
	public String update2(@RequestParam("m_content") String m_content) {
		service.update2(m_content);
		return "redirect:/company/test2";
	}
	
	@PostMapping("/company/check2")
	@ResponseBody
	public int check2(String m_content) {
		int m_val =service.check2(m_content);
		System.out.println(m_val);
		return m_val;
	}
}
