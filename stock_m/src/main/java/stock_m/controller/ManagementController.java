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

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import stock_m.dto.ManagementDto;
import stock_m.dto.UserDto;
import stock_m.service.ManagementService;

@Controller
@SessionAttributes("user")
public class ManagementController {
	@Autowired
	ManagementService service;
	
	@GetMapping("/normal/management2")
	public String main2(@RequestParam(name = "page", defaultValue = "1") int page, Model m,HttpSession session) {
	//업체 리스트 받아오기 controller들
	//main1 ,main2, countSearch
	//위 컨트롤러들은 매핑된 경로로 요청이 들어오면 실행 됩니다.
		String userid = (String) session.getAttribute("userid"); 
		// 글이 있는지 체크하기위해 service에 count메서드를 실행
		int count =service.count();
		System.out.println(count);

		if (count > 0) {

			int perPage = 5; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;
			//출력될 글의 수에 맞게 maList를 추가
			List<ManagementDto> maList = service.maList(startRow,userid);
			m.addAttribute("userid",userid);
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
		//실행이 완료되면 normal/management2 페이지로 
		return "normal/notice";
	}

	/*
	 * @GetMapping("/normal/test") public String insertmain(@RequestParam(name =
	 * "page", defaultValue = "1") int page, Model m) {
	 * 
	 * // 글이 있는지 체크 int count = service.count1(); System.out.println(count);
	 * 
	 * if (count > 0) {
	 * 
	 * int perPage = 5; // 한 페이지에 보일 글의 갯수 int startRow = (page - 1) * perPage;
	 * 
	 * List<UserDto> UList = service.UList(startRow); System.out.println(UList);
	 * m.addAttribute("UList", UList);
	 * 
	 * int pageNum = 5; int totalPages = count / perPage + (count % perPage > 0 ? 1
	 * : 0); // 전체 페이지 수
	 * 
	 * int begin = (page - 1) / pageNum * pageNum + 1; int end = begin + pageNum -
	 * 1; if (end > totalPages) { end = totalPages; } m.addAttribute("begin",
	 * begin); m.addAttribute("end", end); m.addAttribute("pageNum", pageNum);
	 * m.addAttribute("totalPages", totalPages);
	 * 
	 * }
	 * 
	 * m.addAttribute("count", count); return "normal/test"; }
	 */
	
	@GetMapping("/normal/interest")
	public String main1(@RequestParam(name = "page", defaultValue = "1") int page, Model m,HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		// 글이 있는지 체크
		int count =service.count();
		System.out.println(count);

		if (count > 0) {

			int perPage = 5; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;

			List<ManagementDto> mainList = service.mainList(startRow,userid);
			m.addAttribute("userid", userid);
			System.out.println(mainList);
			m.addAttribute("mainList", mainList);

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
		return "normal/interest";
	}

	@RequestMapping("/normal/search")
	public String search1(@RequestParam(name = "page", defaultValue = "1") int page, Model m, String keyword) {

		// 글이 있는지 체크 해당요청에서는 keyword를 글이 있는지를 
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
		
		return "normal/usersearch";
	}

	@RequestMapping("/normal/listall")
	public String list2(@RequestParam(name = "page", defaultValue = "1") int page, Model m, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		// 글이 있는지 체크
		int count =service.count();
		if (count > 0) {

			int perPage = 5; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;

			List<ManagementDto> managementListall = service.managementListall(startRow, userid); // 매니저DTO를 이용해 KEYWORD에 맞는 매니저 테이블 정보를 리스트로 받아옴
			m.addAttribute("userid",userid);
			m.addAttribute("dList", managementListall);
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
		return "normal/listall";
	}
	
	@RequestMapping("/normal/listallsearch")
	public String searchall(@RequestParam(name = "page", defaultValue = "1") int page, Model m, String keyword, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		// 글이 있는지 체크
		int count = service.countSearch(keyword);

		if (count > 0) {

			int perPage = 5; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;

			List<ManagementDto> managementList = service.managementList(startRow, keyword, userid); // 매니저DTO를 이용해 KEYWORD에 맞는 매니저 테이블 정보를 리스트로 받아옴
			m.addAttribute("keyword", keyword);
			m.addAttribute("userid",userid);
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
		return "normal/managementsearch";
	}
	
	@RequestMapping("/normal/insert") 
	public String insert(@RequestParam("id") String username, HttpSession session) {
		//요청 파라미터 값 id를 받아오고 service에 넘겨줌
		String userid = (String) session.getAttribute("userid"); 
		service.insert(userid,username); 
		//redirec:/+url를 사용해서 현재 페이지를 다시 요청
		return "redirect:/normal/interest";
	 }
	
	@RequestMapping("/normal/insert2") 
	public String insert2(@RequestParam("id") String id, HttpSession session) {
		String userid = (String) session.getAttribute("userid"); 
		service.insert2(userid,id); 
		return "redirect:/normal/management1";
	 }
	
	@RequestMapping("/normal/delete") 
	public String delete(@RequestParam("m_content") String m_content,HttpSession session, HttpServletRequest request) {
		String userid = (String) session.getAttribute("userid");  
		System.out.println(userid);
		int mno= service.find(m_content, userid);
		//HttpServletRequest을 이용해 현재 페이지의 접속 경로를 받아 저장
		String url = request.getHeader("Referer");
		service.delete(mno); 
		return "redirect:"+url;
	 }
	
	@PostMapping("/normal/check")
	@ResponseBody
	public boolean check(String username) {
		int count =service.check(username);
		if(count == 0) {
			//ajax에서 result타입을 boolean type으로 받기 때문에 필요한 boolean 타입을 return
			return true;
		}else {
			return false;
		}
	}	

	@GetMapping("/normal/update")
	public String update(@RequestParam("m_content") String m_content,HttpSession session, HttpServletRequest request) {
		String userid = (String) session.getAttribute("userid");
		service.update(m_content,userid);
		String url = request.getHeader("Referer");
		return "redirect:"+url;
	}
	
	@GetMapping("/normal/update2")
	public String update2(@RequestParam("m_content") String m_content,HttpSession session, HttpServletRequest request) {
		String userid = (String) session.getAttribute("userid");
		service.update2(m_content, userid);
		String url = request.getHeader("Referer");
		return "redirect:"+url;
	}
	
	@PostMapping("/normal/check2")
	@ResponseBody
	public boolean check2(String m_content, HttpSession session) {
		String userid = (String) session.getAttribute("userid"); 
		System.out.println(m_content);
		boolean m_val =service.check2(m_content, userid);
		System.out.println(m_val);
		return m_val;
	}
	
	
	@PostMapping("/normal/switch")
	@ResponseBody
	public boolean switch1(String m_content) {
		boolean user_aram = service.switch1(m_content);
		return user_aram;
	}
}
