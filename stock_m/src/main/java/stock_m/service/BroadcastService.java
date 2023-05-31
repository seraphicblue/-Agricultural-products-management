package stock_m.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stock_m.dao.BroadcastDao;
import stock_m.dto.Message;

@Service
public class BroadcastService {

	@Autowired
	BroadcastDao Broadcast_dao;

	public List<String> broadPriceCheck(int pno, int param) {
		List<String> userList = Broadcast_dao.broadPriceCheck(pno, param);
		return userList;
	}

	public int broadStock(int sno, String userid) {

		int useridTF = Broadcast_dao.broadStock(sno, userid);
		System.out.println("this is useridTF : " + useridTF);
		System.out.println("this is sno : " + sno);
		if (useridTF == 1) {
			System.out.println("/////////+++++++++++++++++++++" + sno);
			return sno;
		} else {
			System.out.println("/////////-------------------------" + sno);
			return 0;
		}

	}

	public void stockMessage(String sep, String userid, String content) {
		if (sep.equals("S")) {
			String sub = content.split("_")[0];
			int sno = Integer.parseInt(content.split("_")[1]);
			int param = Broadcast_dao.getParam(sno);
			int volume = Broadcast_dao.getVolume(sno);
			content = "현재 알림 수치는 " + param + "개 이고 현재 재고량은 " + volume + "개로 설정량의 "
					+ (Math.round(((double) volume / param) * 100) / 100.0) *100 + "% 입니다.";
			Broadcast_dao.insertMessage(userid, sub, content);
		} 
		else if (sep.equals("L")) {
			System.out.println("this is :::::::" + content);
			String sub = content.split("_")[0];
			int sno = Integer.parseInt(content.split("_")[1]);
			int param = sno;
			int volume = Integer.parseInt(content.split("_")[2]);
			content = "현재 알림 수치는 " + volume + "원 이고 현재 잔고는 " + param + "원 으로 설정량의 "
					+ (Math.round((param / (double) volume) * 100) / 100.0) * 100 + "% 입니다.";
			Broadcast_dao.insertMessage(userid, sub, content);
		}

	}

	public List<Message> messagepg(String userid) {

		if (Broadcast_dao.messageCount(userid) != 0) {
			List<Message> msgList = Broadcast_dao.messageList(userid);
			return msgList;
		} else {
			return null;
		}

	}

	public int countMsg(String userid) {
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

	public int palarmupdate(String userid, int pno, int param) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("pno", pno);
		map.put("param", param);
		return Broadcast_dao.palarmupdate(map);
	}
	
	

	public String showMsg(int mesno) {
		Broadcast_dao.turnMsg(mesno);
		return Broadcast_dao.showMsg(mesno);
	}

	public String broadlimit(String userid) {
		int profit = Broadcast_dao.getProfit(userid);
		String text = "";
		int limit = 0;
		if (Broadcast_dao.getlimitCount(userid) > 0) {
			limit = Broadcast_dao.broadlimit(userid);
		} else {
			limit = 0;
		}

		if (limit > profit) {
			text = profit + "_" + limit;
		} else {
			text = "none";
		}
		return text; 
	}
	
	
	public void insertAndUpdate(int limit,String userid) {
		int chk=Broadcast_dao.getlimitCount(userid);
		if(chk>0) {
			Broadcast_dao.updateLimit(userid,limit);
		}else {
			Broadcast_dao.insertLimit(userid,limit);
		}
	
	}
	
	public List<String> manageGet(String userid) {
		int chk = Broadcast_dao.manageCount(userid);
		if(chk>0) {
			List<String> mList = Broadcast_dao.manageGet(userid);
			return mList;
		}
		return null;
	}

	public void stockinsertAndUpdate(int stock_selec, int stock_param, String userid) {
		int chk=Broadcast_dao.salarmCount(userid, stock_selec);
		if(chk>0) {
			Broadcast_dao.saupdate(userid, stock_selec, stock_param);
		}else {
			Broadcast_dao.sainsert(userid, stock_selec, stock_param);
		}
	}
	

}
