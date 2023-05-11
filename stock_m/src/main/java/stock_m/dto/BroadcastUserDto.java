package stock_m.dto;

import lombok.Data;

@Data
public class BroadcastUserDto {
	private String userid;
	private String com_selec;
	private String user_selec;
	private String user_price;
	private boolean user_aram;
}
