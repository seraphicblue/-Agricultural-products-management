package stock_m.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import stock_m.dto.UserDto;
import stock_m.service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	LoginService service;
	


	/*
	 * @GetMapping("company/main") public String companyindex() { return
	 * "company/index"; }
	 */
	
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
	
	
	@PostMapping("/login/insert*")
	public String insert(UserDto user) {
		service.insertUser(user);
		return "redirect:/login/login";
	}
	
	@GetMapping("/login/insertCompany")
	public String select() {
		return "login/insertCompany";
	}
	
	@GetMapping("/login/insertNormal")
	public String rselect() {
		return "login/insertNormal";
	}
	
	@GetMapping("/admin/test1")
	public String ins() {
		return "admin/test1";
	}
	
	@GetMapping("/login/idcheck")
	@ResponseBody  // JSON 형식으로 응답을 반환
	public Map<String, Integer> idcheck(String userid) {
	    int cid = service.checkId(userid);
	    Map<String, Integer> response = new HashMap<>();
	    response.put("cid", cid);
	    return response;
	}
}
