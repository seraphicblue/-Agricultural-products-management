package stock_m.dto;

import java.util.Date;

import lombok.Data;

@Data
public class StockDto {
	private int sno;
	private int s_val;
	private String uaerid;
	private String scontent;
	private int s_volume;
	private Date s_date;
}
