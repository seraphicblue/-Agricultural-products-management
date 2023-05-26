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
            background-color: orange;
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

    <script>
        $(document).ready(function() {
            // 관리자가 작성한 제일 최신 게시물을 최상단으로 이동
            var adminPost = $("tr:has(i.icofont-notification):first");
            if (adminPost.length > 0) {
                // 관리자 게시물을 복사하여 최상단에 추가
                var adminPostClone = adminPost.clone();
                adminPostClone.insertBefore(adminPost.siblings(":first"));
            }
        });
    </script>
</head>
<body> 
<%-- <div type="hidden" value="${user}"> --%>
<div id="center">
    <a href="qnalist" style="color: black; text-decoration: none;">
        <h1>게시글 목록</h1>
    </a>
    <div align="right">
        <a href="/main">main</a>
        <a href="qnawrite">새글 등록</a>
        <a href="list">자유 게시판</a>
    </div>

    <c:if test="${count != 0 }">
        <table>
            <tr>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
           
<c:forEach items="${bList}" var="qnaboard">
    <tr>
        <c:choose>
            <c:when test="${qnaboard.role eq 'admin' }">
                <td>
                    <a href="qnacontent/${qnaboard.qnaboardid}">
                        <i class="icofont-notification"></i>
                        <c:out value="${qnaboard.subject}"/>
                        <span class="text-muted small"> </span></a>
                        <td>${qnaboard.userid}</td>
                        <td><fmt:formatDate value="${qnaboard.regdate}" dateStyle="short"/></td>
                            <td>${qnaboard.readcount}</td>
                   
                </td>
            </c:when>
            <c:otherwise>
                <c:choose>
                    <c:when test="${qnaboard.secret}">
                        <c:choose>
                            <c:when test="${user.role eq 'admin' or user.userid eq qnaboard.userid}">
                                <td>
                                    <a href="qnacontent/${qnaboard.qnaboardid}">
                                        <i class="icofont-lock"></i>
                                        <c:out value="${qnaboard.subject}"/>
                                        <span class="text-muted small"> </span>
                                    </a>
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td>
                                    <a href="#" onclick="showAlert();">
                                        <i class="icofont-lock"></i>
                                        비밀글입니다.
                                        <span class="text-muted small"> </span>
                                    </a>
                                </td>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <td>
                            <a href="qnacontent/${qnaboard.qnaboardid}">
                                <c:out value="${qnaboard.subject}"/>
                            </a>
                        </td>
                    </c:otherwise>
                </c:choose>
                <td>${qnaboard.userid}</td>
                <td><fmt:formatDate value="${qnaboard.regdate}" dateStyle="short"/></td>
                <td>${qnaboard.readcount}</td>
            </c:otherwise>
        </c:choose>
    </tr>
</c:forEach>

        </table>
        <div id="page">
            <c:if test="${begin > pageNum }">
                <a href="qnalist?p=${begin-1 }">[이전]</a>
            </c:if>
            <c:forEach begin="${begin }" end="${end}" var="i">
                <a href="qnalist?p=${i}">${i}</a>
            </c:forEach>
            <c:if test="${end < totalPages }">
                <a href="qnalist?p=${end+1}">[다음]</a>
            </c:if>
            <form action="qnalist" method="get">
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
