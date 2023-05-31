package stock_m.dto;

import lombok.Data;

@Data
public class StockDto {
	private int sno;
	private String userid;
	private String scontent;
	private int s_val;
	private int s_volume;
	private String s_date;
}
