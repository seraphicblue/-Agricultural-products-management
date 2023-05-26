/*
	   Date    : 2023.05.15
	   name    : StockService
	   type    : Service
	   ver     : 1.1
	   connect  : StockController
	   content : 재고관리 서비스 클래스
	   writer  : 이이지
	   api     : x
	  */
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

import stock_m.dto.StockDto;


@Service
public class StockService {
	
	@Autowired
	StockDao dao;
	
	@Autowired
	AdminstockDao admindao;
	
	@Autowired
	RevenueDao rdao;
	
	

	public List<AdminstockDto> option(){

		Map<String, Object> m =new HashMap<String, Object>();
		return admindao.option(m);
		
	}



	public int checki(int s_price, String scontent, int s_volume, int s_val, String userid) {
		System.out.println(userid);
		int s = dao.checki(scontent,userid);
		System.out.println(s);
		if(s>0) {
			Date now = new	 Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			rdao.insertb(s_val,userid,format.format(now),s_price,s_volume);
			rdao.updater(s_price,userid);
			 return dao.updates(scontent,s_volume,s_val,userid);
		}else {
			Date now = new	 Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			rdao.updater(s_price,userid);
			rdao.insertb(s_val,userid,format.format(now),s_price,s_volume);
			return dao.inserts(scontent,s_volume,format.format(now), s_val,userid);
		}
	}

	 
		
			public List<StockDto> sList(String userid){
				return dao.sList(userid);
			}
			
			
			/* public int supdate(List<StockDto> dto) {
				return dao.supdate(dto);
			}*/
			
			public int sdelete(int sno) {
				return dao.sdelete(sno);
				
			}
			public List<StockDto> searchscontent(String search, String userid){
               Map<String, Object> m = new HashMap<>();
				
				m.put("search", search);
			    m.put("userid",userid);
				
				
				return dao.searchscontent(m);
			}
			public int sinsert(String scontent, int s_val, String userid, int s_volume) {
				Map<String, Object> m = new HashMap<>();
				
				m.put("scontent", scontent);
				m.put("s_val", s_val);
				m.put("userid",userid);
				m.put("s_volume", s_volume);
				return dao.sinsert(m);
			}


			public int count() {
				// TODO Auto-generated method stub
				return dao.count();
			}


			/*public int stockupdate(List<StockDto> dto) {
			return dao.stockupdate(dto);			
			}*///main코드 수정 23.05.23


			/*public int stockupdate(int sno, int s_volume) {
	             Map<String, Object> m = new HashMap<>();
				
				m.put("sno", sno);
				m.put("s_volume", s_volume);
				return dao.stockupdate(m);
				
			}*///main코드 수정 23.05.23


			 
			


			public int supdate(int sno, int s_volume) {
				System.out.println("this is service : "+sno+" /// "+s_volume);
				return dao.supdate(sno,s_volume);
				
			}



			public List<Map<String, Object>> getstockData(String userid) {
				// TODO Auto-generated method stub
				return dao.getstockData(userid);
			}



			


			



			public List<Map<String, Object>> getstockoption(String userid) {
				
				return dao.getstockoption(userid);
			}





			public List<Map<String, Object>> getsellcount(String userid, int sno) {
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("userid", userid);
				m.put("sno", sno);
				return dao.getsellcount(m);
			}



			public List<Map<String, Object>> getbuycount(String userid, int sno) {
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("userid", userid);
				m.put("sno", sno);
				System.out.println(sno);
				return dao.getbuycount(m);
			}



			



		
		

		


	}


