package stock_m.dto;

import lombok.Data;

@Data
public class Cart {
	private int cartno;
	private String userid;
	private int product_pno;
	private int count;
	private int price;
	private String name;
}
