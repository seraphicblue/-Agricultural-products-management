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

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stock_m.dao.AdminstockDao;
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

	@Autowired
	AdminstockDao admin_dao;

	public List<NameAndPrice_sabDto> namePrice(String userid) {

		return sab_dao.namePrice(userid);

	}

	public int selecSval(int sno) {
		return stock_dao.selecSval(sno);
	}

	public int selecSvol(int sno) {
		return stock_dao.selecSvol(sno);
	}

	public int selecCount(int sno) {
		return product_dao.selecCount(sno);
	}

	public int selecVol(int sno) {
		return product_dao.selecVol(sno);
	}

	
	

	
	public int broadprice(int sno) {

		return product_dao.broadprice(sno);
	}

	public void updateAndInsert(int sno, String pname, int price, int p_count) {

		int p_val= stock_dao.selecSval(sno);
		
		int count=product_dao.selecCount(sno);
		
		if(count==0) {
			product_dao.insertproduct(sno,pname,price,p_val,p_count);
		}
		else if(count==1) {
			int Vol=product_dao.selecVol(sno);
			p_count = Vol+p_count;
			product_dao.updateproduct(price,p_count, sno);

		

		}
	}

	public int inserta(@Param("a_content") String a_content, @Param("a_val") int a_val, @Param("a_volum") int a_volum) {
		int a =admin_dao.admincheck(a_content,a_val);
		System.out.println(a);
		if(a ==0) {
			admin_dao.inserta(a_content, a_val, a_volum);
			return 1;
		}else {
			admin_dao.updatea(a_content, a_val, a_volum);
			return 1;
		}
	}

}
