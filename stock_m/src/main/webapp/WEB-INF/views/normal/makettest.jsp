<!-- 테스트용 지워도 됨 -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<b>${pname}</b>로 검색한 결과입니다.
<c:forEach items="${list}" var="p">
		${p.pno} / ${p.pname} / ${p.price} / ${p.p_count}<br>
</c:forEach>
</body>
</html>