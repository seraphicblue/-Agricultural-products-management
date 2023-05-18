package stock_m.config;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(new SocketHandler(), "/websocket").setAllowedOrigins("*");
	}

	private static class SocketHandler extends TextWebSocketHandler {
		String userid = "testuser1";

		private final List<WebSocketSession> sessions = new CopyOnWriteArrayList<>();
		HashMap<String, String> socketMap = new LinkedHashMap<>();
		Set<String> keySet = socketMap.keySet();

		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			sessions.add(session);
			if (!socketMap.containsKey("testuser1")) {
				socketMap.put("testuser1", session.getId());
			} else if (!socketMap.containsKey("testuser2")) {
				socketMap.put("testuser2", session.getId());
			} else if (!socketMap.containsKey("testuser3")) {
				socketMap.put("testuser3", session.getId());
			}

			if ((socketMap.get("testuser1") == "-")) {
				socketMap.put("testuser1", session.getId());
			} else if (socketMap.get("testuser2") == "-") {
				socketMap.put("testuser2", session.getId());
			} else if (socketMap.get("testuser3") == "-") {
				socketMap.put("testuser3", session.getId());
			}

			System.out.println("conn   : " + session.getId());
			// 소켓 정보와 사용자 유저아이디 연결 출력
			keySet = socketMap.keySet();
			for (String key : keySet) {
				System.out.println(socketMap);
				System.out.println(key + " : " + socketMap.get(key));
			}

		}

		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			System.out.println("remove : " + session.getId());
			if((socketMap.get("testuser1") != "-")) {
				socketMap.put("testuser1", "-");
			}else if((socketMap.get("testuser2") != "-")) {
				socketMap.put("testuser2", "-");
			}else if((socketMap.get("testuser3") != "-")) {
				socketMap.put("testuser3", "-");
			}
			
			sessions.remove(session);

		}

		@Override
		public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

			String payload = message.getPayload();
			boolean flag = false;

			
			if (payload.startsWith("/price")) {
				String[] tokens = payload.split("_", 3);
				String useridToken = tokens[1];
				
				String target = tokens[2];
				System.out.println("this is" + payload);

				for (WebSocketSession webSocketSession : sessions) {
					for (String key : socketMap.keySet()) {
						
						System.out.println("--------------------------------");
						System.out.println("key : "+key);
						System.out.println("target : "+target);
						System.out.println(key.equals(target));
						System.out.println("--------------------------------");
						String str = socketMap.get(key);

						if (webSocketSession.getId().equals(str) && key.equals(target)) {

							webSocketSession.sendMessage(new TextMessage(target));
							System.out.println(webSocketSession.getId());
							System.out.println("Sent message to user " + useridToken + ": " + target);
							break;
						}
					} // inner_for_end
				} // outer_for_end
			} // if /price
			
			if (payload.startsWith("/stock")) {
				String[] tokens = payload.split("_", 3);
				String useridToken = tokens[1];
				String target = tokens[2]; //리턴값으로 알림할 대상 정+보 저장
				System.out.println("this is" + payload);

				for (WebSocketSession webSocketSession : sessions) {
					for (String key : socketMap.keySet()) {
						
						String str = socketMap.get(key);

						if (webSocketSession.getId().equals(str) && key.equals(target)) {

							webSocketSession.sendMessage(new TextMessage(target));
							System.out.println(webSocketSession.getId());
							System.out.println("Sent message to user " + useridToken + ": " + target);
							break;
						}
					} // inner_for_end
				} // outer_for_end
			} // if /price
			
			
		}//text_send
	}// handler
}