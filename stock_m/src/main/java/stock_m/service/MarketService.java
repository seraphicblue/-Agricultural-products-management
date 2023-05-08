package stock_m.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stock_m.dao.ProductDao;

@Service
public class MarketService {
	
	@Autowired
	ProductDao dao;
	
	public List<Map<String,Object>> searchPname(String pname){
		return dao.searchPname(pname);
	}
	
}
