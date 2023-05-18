package stock_m.dto;

import lombok.Data;
//management table 에서 받아올 정보의 객체(getter&setter)를 가짐
@Data
public class ManagementDto {
	private int mno;
	private String userid;
	private boolean m_val;
	private String m_content;
}
