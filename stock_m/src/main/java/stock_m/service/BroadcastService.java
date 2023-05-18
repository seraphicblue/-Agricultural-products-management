package stock_m.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stock_m.dao.BroadcastDao;


@Service
public class BroadcastService {
	
	@Autowired
	BroadcastDao Broadcast_dao;
	
	public List<String> broadPriceCheck(int pno, int param){
		
		List<String> userList =  Broadcast_dao.broadPriceCheck(pno,param);
		
		return userList;
	}
	
}
