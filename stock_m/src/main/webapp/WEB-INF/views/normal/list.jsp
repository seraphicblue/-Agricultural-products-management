<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <!--  bList begin end count pageNum totalPages -->
    <title>글 목록</title>
    <style>
        #center {
            width: 700px;
            margin-left: auto;
            margin-right: auto;
        }

        table {
            border: 1px solid black;
            width: 700px;
            border-collapse: collapse;
        }

        th {
            border: 1px solid black;
            background-color: #7fad39;
            width: 150px;
        }

        td {
            border: 1px solid black;
        }

        a {
            margin: 10px auto;
        }

        #page {
            text-align: center;
        }
    </style>
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <!-- jQuery UI 라이브러리 추가 -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>

    <!-- 달력을 한글로 표시하기 위한 설정 -->
    <script>
        $.datepicker.setDefaults($.datepicker.regional['ko']);
    </script>

    <script lang="javaScript">
        function check_onclick() {
            if (document.getElementById("keyword1").value == null || document.getElementById("keyword1").value == '') {
                alert("검색어를 입력하세요.");
                return false;
            }
        }

        function showAlert() {
            alert('비밀글입니다.');
        }
    </script>
</head>
<body>
<div id="center">
    <a href="list" style="color: black; text-decoration: none;">
        <h1>게시글 목록</h1>
    </a>
    <div align="right">
        <a href="market">main</a>
        <a href="write">새글 등록</a>
        <a href="qnalist">Q&A 게시판</a>
    </div>

    <c:if test="${count != 0 }">
        <table>
            <tr>
                <th style="">제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
	<c:forEach items="${bList}" var="board">
    	<tr>
        	<c:choose>
            	<c:when test="${board.secret}">
                	<c:if test="${user.role eq 'admin' or user.userid eq board.userid}">
                    	<td>
                        	<a href="content/${board.boardno}">
                            	<i class="icofont-lock"></i>
                            	<c:out value="${board.subject}"/>
                            	<span class="text-muted small"> </span>
                       	 </a>
                    	</td>
               	 	</c:if>
               	 	<c:if test="${user.role ne 'admin' and user.userid ne board.userid}">
                    	<td>
                        	<a href="#" onclick="showAlert();">
                            	<i class="icofont-lock"></i>
                            	비밀글입니다.
                            	<span class="text-muted small"> </span>
                        	</a>
                    	</td>
                	</c:if>
            	</c:when>
            	<c:otherwise>
                <td>
                    <a href="content/${board.boardno}">
                        <c:out value="${board.subject}"/>
                    </a>
                </td>
            </c:otherwise>
        </c:choose>
        <td>${board.userid}</td>
        <td><fmt:formatDate value="${board.regdate}" dateStyle="short"/></td>
        <td>${board.readcount}</td>
    </tr>
</c:forEach>
        </table>
        <div id="page">
            <c:if test="${begin > pageNum }">
                <a href="list?p=${begin-1 }">[이전]</a>
            </c:if>
            <c:forEach begin="${begin }" end="${end}" var="i">
                <a href="list?p=${i}">${i}</a>
            </c:forEach>
            <c:if test="${end < totalPages }">
                <a href="list?p=${end+1}">[다음]</a>
            </c:if>
            <form action="list" method="get">
                <select name="field">
                    <option value="content">내용</option>
                    <option value="subject">제목</option>
                    <option value="content_subject">제목+내용</option>
                    <option value="regdate">날짜</option>
                </select>
                <input type="text" id="keyword1" name="keyword" placeholder="검색어를 입력하세요">
                <input type="submit" id="submit" value="검색" onclick="return check_onclick();"><br>

                <input type="date" name="startDate" placeholder="시작 날짜">
                ~
                <input type="date" name="endDate" placeholder="종료 날짜">
            </form>
        </div>
    </c:if>
    <c:if test="${count eq 0 && bList eq null }">
        아직 입력한 글이 없습니다.
    </c:if>
</div>
</body>
</html>