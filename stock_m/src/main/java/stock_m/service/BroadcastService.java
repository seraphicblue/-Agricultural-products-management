package stock_m.service;

import java.util.List;

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

	public void stockMessage(String userid, String content) {
		String sub = content.split("_")[0];
		int sno = Integer.parseInt(content.split("_")[1]);
		int param = Broadcast_dao.getParam(sno);
		int volume =Broadcast_dao.getVolume(sno);
		content= "현재 알림 수치는 "+param + "개 이고 현재 재고량은 " +volume+"개로 설정량의 "+ Math.round(((double)volume/param)*100)/100.0+"% 입니다.";
		Broadcast_dao.insertMessage(userid, sub, content);
	}

	public int countMsg(String userid) {
		return Broadcast_dao.countMsg(userid);
	}

	public List<Message> messagepg(String userid) {

		if (Broadcast_dao.messageCount(userid) != 0) {
			List<Message> msgList = Broadcast_dao.messageList(userid);
			return msgList;
		} else {
			return null;
		}
	}
	
	public String showMsg(int mesno) {
		Broadcast_dao.turnMsg(mesno);
		return Broadcast_dao.showMsg(mesno);
	}


}
