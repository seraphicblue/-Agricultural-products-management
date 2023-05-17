package stock_m.dto;

import lombok.Data;

@Data
public class UserDto {

	
	private String userid;
	private String userpw;
	private String gender;
	private int age;
	private String username;
	private LoginRole role;
	private String enabled;

}
