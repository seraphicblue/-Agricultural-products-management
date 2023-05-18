package stock_m.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stock_m.dao.RevenueDao;

@Service
public class RevenueService {
	@Autowired
	RevenueDao dao;
	
	public int checks() {
		return dao.checks();
	}

}
