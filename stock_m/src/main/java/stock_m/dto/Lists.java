package stock_m.dto;

import java.util.List;

import lombok.Data;

@Data
public class Lists {

	int list_total_count;
	
	List<PriceDto> list;
	
}
