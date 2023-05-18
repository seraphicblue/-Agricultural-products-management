package stock_m.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stock_m.dao.AdminstockDao;
import stock_m.dao.StockDao;
import stock_m.dto.AdminstockDto;

@Service
public class StockService {
	
	@Autowired
	StockDao dao;
	
	@Autowired
	AdminstockDao admindao;
	
	public List<AdminstockDto>option(){
		Map<String, Object> m =new HashMap<String, Object>();
		return admindao.option(m);
		
	}

	public void inserts(String scontent, int s_volume, String s_date) {
		dao.inserts(scontent,s_volume, s_date);
	}
}
