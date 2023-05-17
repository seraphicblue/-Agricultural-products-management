package stock_m.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import stock_m.dto.UserDto;
import stock_m.service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	LoginService service;
	
	/*
	 * @GetMapping("/") public String index() { System.out.println("index 요청입니다.");
	 * return "index"; }
	 */

	@GetMapping("/member")
	public void forMember() {
		System.out.println("Member 요청입니다.");
	}

	@GetMapping("/manager")
	public void forManager() {
		System.out.println("Manager 요청입니다.");
	}

	@GetMapping("/admin")
	public void forAdmin() {
		System.out.println("Admin 요청입니다.");
	}
	
	@GetMapping("/login/login")
	public void login() {
	}
	
	@GetMapping("/login/loginSuccess")
	public void loginSuccess() {
	}
	
	@GetMapping("/login/accessDenied")
	public void accessDenied() {		
	}
	
	@GetMapping("/login/insert")
	public void insert() {}
	
	
	@PostMapping("/login/insert")
	public String insert(UserDto user) {
		service.insertUser(user);
				
		return "redirect:/login/login";
	}
	
	@GetMapping("/admin/test1")
	public String ins() {
		return "admin/test1";
	}
}
