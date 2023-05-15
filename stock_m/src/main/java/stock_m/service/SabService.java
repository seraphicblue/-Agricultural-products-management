/*
  	Date    : 2023.05.06
	name    : SabService
	type    : Service
	ver     : 1.0
	conect  : SabController
	content : 구매 판매에 대한 서비스 클래스
	writer  : 김재영
	api     : x
*/
package stock_m.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stock_m.dao.NameAndPrice_sabDao;
import stock_m.dao.ProductDao;
import stock_m.dao.StockDao;
import stock_m.dto.NameAndPrice_sabDto;

@Service
public class SabService {
	
	@Autowired
	NameAndPrice_sabDao sab_dao;
	
	@Autowired
	StockDao stock_dao;
	
	@Autowired
	ProductDao product_dao;
	
	public List<NameAndPrice_sabDto> namePrice(String userid) {
		userid="testcompany1";
		return sab_dao.namePrice(userid);
		
	}
	
	public int selecSval(int sno) {
		return stock_dao.selecSval(sno);
	}
	
	public int selecSvol(int sno) {
		return stock_dao.selecSvol(sno);
	}
	
	public int selecCount(String userid, int sno) {
		return product_dao.selecCount(userid, sno);
	}
	
	public int selecVol(String userid, int sno) {
		return product_dao.selecVol(userid, sno);
	}

	
	public void updateAndInsert(int sno, String pname, int price, int p_count) {
		int p_val= stock_dao.selecSval(sno);
		String userid="testcompany1";
		int count=product_dao.selecCount(userid, sno);
		
		if(count==0) {
			product_dao.insertproduct(sno,pname,price,p_val,p_count,userid);
		}
		else if(count==1) {
			int Vol=product_dao.selecVol(userid, sno);
			p_count = Vol+p_count;
			product_dao.updateproduct(price,p_count, userid, sno);
		}
	}

	
}
