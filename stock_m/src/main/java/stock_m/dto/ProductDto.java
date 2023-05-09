package stock_m.dto;

import lombok.Data;

@Data
public class ProductDto {
	private int pno;
	private int sno;
	private String pname;
	private int price;
	private int p_val;
	private int p_count;
	private String userid;
}
