package stock_m.dto;

import java.util.Date;

import lombok.Data;

@Data
public class StockDto {
	private String userid;
	private String s_content;
	private int s_val;
	private int s_volum;
	private Date s_date;
}
