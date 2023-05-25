package stock_m.dto;

import lombok.Data;

@Data
public class UserDto {

	
	/*
	 * Date : 2023.05.06 
	 * name : user 
	 * type : java 
	 * ver : 1.0 
	 * conect : UserDto
	 * content : �쑀�� DTO 
	 * writer : 怨좎긽�썝
	 * api : x
	 */
	 
	
	private String userid="admin";
	private String userpw;
	private String gender;
	private int age;
	private String username;
	private String role="admin";
	private String enable;
}
