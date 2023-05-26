<%@page import="bit.com.a.util.BbsArrow"%>
<%@page import="bit.com.a.dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
List<BbsDto> list = (List<BbsDto>)request.getAttribute("bbslist");
for(BbsDto bbs : list){
	System.out.println(bbs.toString());
}
--%>

<%--
String search = (String)request.getAttribute("search");
--%>

<script type="text/javascript">
<%-- var search = "<%=search %>"; --%>
var <%-- --%>
var search = ${search}
var choice = ${choice};

$(document).ready(function () {
	if(search != ""){
		$("#_choice").val( choice );
		
		document.getElementById("_search").value = search;
	}	
});
</script>


<jsp:useBean id="uc" class="bit.com.a.util.BbsArrow"/>
<%-- UtilClass uc = new UtilClas(); --%>

<!-- 검색 -->
<div class="box_border" style="margin-top: 5px;margin-bottom: 10px">

<table style="margin-left: auto;margin-right: auto; margin-top: 3px; margin-bottom: 3px">
<tr>
	<td>검색</td>
	<td style="padding-left: 5px">
		<select id="_choice" name="choice">
			<option value="" selected="selected">선택</option>
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="writer">작성자</option>
		</select>	
	</td>
	<td style="padding-left: 5px">
		<input type="text" id="_search" name="search">
	</td>
	<td style="padding-left: 5px">
		<span class="button blue">
			<button type="button" id="btnSearch">검색</button>
		</span>
	</td>
</tr>
</table>
</div>

<table class="list_table" style="width: 85%" id="_list_table">
<colgroup>
	<col style="width: 70px">
	<col style="width: auto;">
	<col style="width: 80px">
	<col style="width: 100px">
</colgroup>

<tr>
	<th>번호</th><th>제목</th><th>조회수</th><th>작성자</th>
</tr>

<c:if test="${empty bbslist}">
<tr>
	<td colspan="3">작성된 글이 없습니다</td>
</tr>
</c:if>

<%--
for(int i = 0;i < bbslist.size(); i++){
	BbsDto bbs = bbslist.get(i);
}
--%>

<c:forEach items="${bbslist}" var="bbs" varStatus="i">

<jsp:setProperty property="depth" name="uc" value="${bbs.depth}"/>

<tr>
	<td>${i.count}</td>
	<td style="text-align: left;">
		
		<c:if test="${bbs.del == 0}">		
			<jsp:getProperty property="arrow" name="uc"/>	<!-- arrow이미지 -->		
			<a href="bbsdetail.do?seq=${bbs.seq}">
				${bbs.title}
			</a>
		</c:if>
		<c:if test="${bbs.del == 1}">
			<font color="red">***이 글은 관리자에 의해서 삭제되었습니다***</font>
		</c:if>
		
	</td>
	<td>${bbs.readcount}</td>
	<td>${bbs.id}</td>
</tr>
</c:forEach>
</table>

<br><br>

<!-- pagination -->
<div class="container">
    <nav aria-label="Page navigation">
        <ul class="pagination" id="pagination" style="justify-content:center;"></ul>
    </nav>
</div>

<br>

<script>
let totalCount = ${totalCount};	// 서버로부터 총글의 수를 취득
// alert(count);
let nowPage = ${pageNumber};	// 서버로부터 현재 페이지를 취득
// alert(pageNum);

let pageSize = 10;

let _totalPages = totalCount / pageSize;
if(totalCount % pageSize > 0){
	_totalPages++;
}

//$("#pagination").twbsPagination('destroy');	// 페이지 갱신 : 페이징을 갱신해 줘야 번호가 재설정된다.

$("#pagination").twbsPagination({
	startPage: nowPage,
	totalPages: _totalPages,
	visiblePages: 10,
	first:'<span sria-hidden="true">«</span>',
	prev:"이전",
	next:"다음",
	last:'<span sria-hidden="true">»</span>',
	initiateStartPageClick:false,		// onPageClick 자동 실행되지 않도록 한다
	onPageClick:function(event, page){
		location.href = "bbslist.do?search=" + $("#_search").val() + "&choice=" + $("#_choice").val() + "&pageNumber=" + (page - 1);	
	}
});	


$("#btnSearch").click(function () {
	location.href = "bbslist.do?search=" + $("#_search").val() + "&choice=" + $("#_choice").val();	
});
</script>