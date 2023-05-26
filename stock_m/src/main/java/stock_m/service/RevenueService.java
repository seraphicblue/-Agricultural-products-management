	/*
	   Date    : 2023.05.15
	   name    : RevenueService
	   type    : Service
	   ver     : 1.1
	   connect  : RevenueController
	   content : 판매,구매내역 장부관리 서비스 클래스
	   writer  : 이이지
	   api     : x
	  */

package stock_m.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stock_m.dao.RevenueDao;
import stock_m.dto.BuyDto;
import stock_m.dto.RevenueDto;
import stock_m.dto.SellDto;
import stock_m.dto.StockDto;

@Service
public class RevenueService {
	@Autowired
	RevenueDao dao;
	
	public int checks(String userid) {
		return dao.checks(userid);
	}

		
		//public int checks() {
			//return dao.checks();}
		
		
		public int insert(SellDto dto) {
	           return dao.insert(dto);//dao에 추가
			}	
		public List<SellDto> selectOne(String userid) {
			return dao.selectOne(userid);
		}
		  
		 // public int updateRefOne(SellDto dto) { 
			//  return dao.updateRefOne(dto); }
		
		public int deletesell(int sno) {
			return dao.deletesell(sno);
		}
	    
		public int deleteRef(int bno) {
			return dao.deleteRef(bno);
		}
	    
		public List<RevenueDto> boardList(int start){
			Map<String,Object> m= new HashMap<String, Object>();
			m.put("start", start);
			m.put("count", 10);
			return dao.boardList(m);
		}
		public int count() {
			return dao.count();
		}
		public List<Map<String, Object>> sellList(String userid){
			
			return dao.sellList(userid);
		}
		
		
		public SellDto selectsell(int sno) {
			
			return dao.selectsell(sno);
		}
		public int updateRefOne(Map<String, Integer> snomap) {
			  return dao.updateRefOne(snomap);
			
		}
		
		
		
//		public int updateSell(int[] sno, int[] pno, int[] price) {
//			return dao.updateSell(sno, pno, price);
//			
//		}
		//구매
		
		
		public int rbuyinsert(BuyDto dto) {
			return dao.rbuyinsert(dto);
		}
		

		public List<Map<String, Object>> rbuyList(String userid){
			return dao.rbuyList(userid);
		}
		
		
		public int rbuyupdate(List<BuyDto> dto) {
			return dao.rbuyupdate(dto);
		}
		
		
		
		public int updatesell(List<SellDto> dto) {
			return dao.updatesell(dto);
			
		}
		
	    
		public int sellinsert(String userid, String pno, int price,int scount) {
	          Map<String, Object> m = new HashMap<>();
			
			m.put("userid", userid);
			m.put("pno",pno);
			m.put("price", price);
			m.put("scount", scount);
			return dao.sellinsert(m);
			
		}
		public int buyinsert(String userid, String pno, int price,int bcount) {
			  Map<String, Object> m = new HashMap<>();
				
				m.put("userid", userid);
				m.put("pno",pno);
				m.put("price", price);
				m.put("bcount", bcount);
				return dao.buyinsert(m);
			
		}
		public String selectpname(int pno) {
			return dao.selectpname(pno);
			
		}
		/*
		 * public String merge(List<SellDto>,List<BuyDto>) {
		 * 
		 * return dao. }
		 */
		public List<Map<String, Object>> totalList(String userid){
			return dao.totalList(userid);
		}
		public List<StockDto> searchrcontent(String search) {
			// TODO Auto-generated method stub
			return dao.searchrcontent(search);
		}
		
		//chart
		
		/*
		 * public String totalsell(String userid,String sdate) { return
		 * dao.totalsell(userid, sdate); }
		 */

		public List<Map<String, Object>> getFilteredData(String startDate, String endDate) {
			// TODO Auto-generated method stub
			return dao.getFilteredData(startDate, endDate);
		}


		public List<Map<String, Object>> getbuyData(String startDate, String endDate) {
			// TODO Auto-generated method stub
			return dao.getbuyData(startDate, endDate);
		}
		
		public List<Map<String, Object>>  gettotalData(String startDate, String endDate) {
			// TODO Auto-generated method stub
			return dao. gettotalData(startDate, endDate);
		}


		public List<Map<String, Object>> getmainbuydata(String userid) {
			
			return dao.getmainbuydata(userid);
		}


		public List<Map<String, Object>> getmainselldata(String userid) {
			
			return dao.getmainselldata( userid);
		}


	
		
	}



