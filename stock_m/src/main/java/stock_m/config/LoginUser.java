package stock_m.config;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import stock_m.dto.UserDto;

public class LoginUser extends User{
	private static final long serialVersionUID = 1L;
	
	private UserDto users;
	
	public LoginUser(UserDto users) {
	    super(users.getUserid(), users.getUserpw(), AuthorityUtils.createAuthorityList(users.getRole().toString()));
	    this.users = users;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public UserDto getUsers() {
		return users;
	}
}