package stock_m.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public int broadStock(int sno, String userid) {

		int useridTF = Broadcast_dao.broadStock(sno,userid);
		System.out.println("this is useridTF : "+useridTF);
		System.out.println("this is sno : "+sno);
		if (useridTF == 1) {
			System.out.println("/////////+++++++++++++++++++++"+sno);
			return sno;
		}else{
			System.out.println("/////////-------------------------"+sno);
			return 0;
		}

	}
	
	public void stockMessage(String userid,String content) {
		Broadcast_dao.insertMessage(userid,content);
	}
	
	public int countMsg(String userid){
		return Broadcast_dao.countMsg(userid);
	}

	public int pacheck(String userid, int pno, int aprice) {
		int a =Broadcast_dao.pacheck(userid,pno);
		if(a >0) {
			return Broadcast_dao.paupdate(userid,pno,aprice);
		}else{
			return Broadcast_dao.painsert(userid,pno,aprice);
		}
	}

	public int palarmCount(String userid) {		
		return Broadcast_dao.palarmCount(userid);
	}

	public List<Map<String, Object>> paAll(String userid) {
		return Broadcast_dao.paAll(userid);
	}

	public int padelete(String userid, int pno) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("pno", pno);
		return Broadcast_dao.padelete(map);
	}

	public int palarmupdate(String userid, int pno, int br_param) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("pno", pno);
		map.put("br_param", br_param);
		return Broadcast_dao.palarmupdate(map);
	}
	
	
}
