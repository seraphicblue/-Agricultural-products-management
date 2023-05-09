package stock_m.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BuyDto {
	private int sno; 
	private String userid;
	private int product_pno;
	private Date sdate;
	private int price;
}
