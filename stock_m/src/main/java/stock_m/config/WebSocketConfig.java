package stock_m.config;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import jakarta.servlet.http.HttpServletRequest;

@Configuration
@EnableWebSocket


public class WebSocketConfig implements WebSocketConfigurer {
	
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(new SocketHandler(), "/websocket")
		.setAllowedOrigins("*")
		.addInterceptors(new HttpSessionHandshakeInterceptor());
	}

	private static class SocketHandler extends TextWebSocketHandler {
		
		private final List<WebSocketSession> sessions = new CopyOnWriteArrayList<>();
		HashMap<String, String> socketMap = new LinkedHashMap<>();
		Set<String> keySet = socketMap.keySet();
					
		
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			
			sessions.add(session);
			String userId = (String) session.getAttributes().get("userid");

			if (!socketMap.containsKey(userId)) {
				socketMap.put(userId, session.getId());
			} 

			if ((socketMap.get(userId) == "-")) {
				socketMap.put(userId, session.getId());
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
			String userId = (String) session.getAttributes().get("userid");
			System.out.println("remove : " + session.getId());
			
			socketMap.remove(userId);
			
			sessions.remove(session);

		}

		@Override
		public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

			String payload = message.getPayload();
			System.out.println(payload);
			
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
				String[] tokens = payload.split("_", 4);
				String useridToken = tokens[1]; 
				String target = tokens[2];
				String name = tokens[3];
				
				System.out.println("this is payload : " + payload);
				System.out.println("this is uidToken : " + useridToken);
				System.out.println("this is target : " + target);
				System.out.println("this is name : " + name);

				for (WebSocketSession webSocketSession : sessions) {
					for (String key : socketMap.keySet()) {
						
						String str = socketMap.get(key);

						if (webSocketSession.getId().equals(str) && key.equals(useridToken)) {

							webSocketSession.sendMessage(new TextMessage(name));
							System.out.println(webSocketSession.getId());
							System.out.println("Sent message to user " + useridToken + ": " + target+name);
							break;
						}
					} // inner_for_end
				} // outer_for_end
			} // if /stock
			
			
		}//text_send
		
		
	}// handler
	
	private class HttpSessionHandshakeInterceptor implements HandshakeInterceptor {
		@Override
		public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response,
				WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
			if (request instanceof ServletServerHttpRequest) {
				ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
				HttpServletRequest httpServletRequest = servletRequest.getServletRequest();

				// HttpSession으로부터 userid 값을 가져와 WebSocketSession의 attributes에 추가합니다.
				String userId = (String) httpServletRequest.getSession().getAttribute("userid");
				attributes.put("userid", userId);
			}
			return true;
		}

		@Override
		public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response,
				WebSocketHandler wsHandler, Exception exception) {
			// Handshake 이후의 로직이 필요하지 않을 경우, 비워둡니다.
		}
	}
	
}
