package stock_m.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stock_m.dao.StockDao;

@Service
public class StockService {
	@Autowired
	StockDao stock_dao;
	
}
