package stock_m.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stock_m.dao.AdminstockDao;
import stock_m.dao.RevenueDao;
import stock_m.dao.StockDao;
import stock_m.dto.AdminstockDto;
import stock_m.dto.BuyDto;

@Service
public class StockService {
	
	@Autowired
	StockDao dao;
	
	@Autowired
	AdminstockDao admindao;
	
	@Autowired
	RevenueDao rdao;
	
	
	
	public List<AdminstockDto>option(){
		Map<String, Object> m =new HashMap<String, Object>();
		return admindao.option(m);
		
	}

	/*
	 * public void inserts(String scontent, int s_volume, String s_date) {
	 * dao.inserts(scontent,s_volume, s_date); }
	 */

	public int checki(int s_price, String scontent, int s_volume, int s_val, String userid) {
		System.out.println(userid);
		int s = dao.checki(scontent,userid);
		System.out.println(s);
		if(s>0) {
			Date now = new	 Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			rdao.insertb(s_val,userid,format.format(now),s_price);
			rdao.updater(s_price,userid);
			 return dao.updates(scontent,s_volume,s_val,userid);
		}else {
			Date now = new	 Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			rdao.updater(s_price,userid);
			rdao.insertb(s_val,userid,format.format(now),s_price);
			return dao.inserts(scontent,s_volume,format.format(now), s_val,userid);
		}
	}
}
