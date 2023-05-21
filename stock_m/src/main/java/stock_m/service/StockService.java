package stock_m.service;

import java.text.SimpleDateFormat;
import java.util.Date;
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

	/*
	 * public void inserts(String scontent, int s_volume, String s_date) {
	 * dao.inserts(scontent,s_volume, s_date); }
	 */

	public int checki(String scontent, int s_volume, int s_val) {
		int s = dao.checki(scontent);
		if(s>0) {
			 return dao.updates(scontent,s_volume,s_val);
		}else {
			Date now = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			return dao.inserts(scontent,s_volume,format.format(now), s_val);
		}
	}
}
