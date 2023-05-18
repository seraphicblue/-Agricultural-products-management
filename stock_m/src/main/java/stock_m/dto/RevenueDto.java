package stock_m.dto;

import lombok.Data;

@Data
public class RevenueDto {
	private int limit;
	private int bsum;
	private int ssum;
	private int profit;
	private double margin;
}
