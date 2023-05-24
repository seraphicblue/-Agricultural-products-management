package stock_m.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stock_m.dao.BroadcastDao;

@Service
public class BroadcastService {

	@Autowired
	BroadcastDao Broadcast_dao;

	public List<String> broadPriceCheck(int pno, int param) {
		List<String> userList = Broadcast_dao.broadPriceCheck(pno, param);
		return userList;
	}

	public String broadStock(int sno, String userid) {

		int useridTF = Broadcast_dao.broadStock(sno,userid);
		System.out.println("this is"+useridTF);
		if (useridTF == 1) {
			return userid;
		}else{
			return "none";
		}

	}
}
