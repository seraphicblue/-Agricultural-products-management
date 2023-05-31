package stock_m.dto;

import lombok.Data;

@Data
public class Message {
	private int mesno;
	private String sub;
	private String content;
	private String userid;
	private boolean rcheck;  
}
