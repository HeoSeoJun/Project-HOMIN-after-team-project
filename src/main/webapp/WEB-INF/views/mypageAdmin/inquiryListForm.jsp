<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<c:if test = "${sessionScope.id ne 'ADMIN@CARE.COM' }">
	<script>
		alert('잘못된 접근입니다.');
		location.href = '${root}index?formpath=home';
	</script>
</c:if>
<style>
#center_inquiryList {
	margin: 20 20 0 20;
	border: 1px solid gray;
	border-radius: 10px;
	padding: 20 0;
}

#table_inquiryList {
	width: 700px;
	margin-bottom: 10px;
}

#table_inquiryList caption {
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 20px;
}

#table_inquiryList tr {
	line-height: 40px;
}

#table_inquiryList th {
	font-size: 20px;
}

#table_inquiryList td {
	text-align: center;
}

#paging_inquiryList {
	margin-bottom: 10px;
}

#div_select_inquiryList {
	width: 700px;
	text-align: right;
}

#div_select_inquiryList select {
	width: 80px;
	height: 25px;
}

#div_select_inquiryList input {
	width: 80px;
	height: 20px;
	border-radius: 5px;
	cursor: pointer;
}

</style>

<center id="center_inquiryList">
	<table id="table_inquiryList">
		<caption>1:1 문의 목록</caption>
		<thead>
			<tr>
				<th>번 호<hr/></th>
				<th>문의유형<hr/></th>
				<th>제 목<hr/></th>
				<th>작성자<hr/></th>
				<th>작성일자<hr/></th>
				<th>답변상태<hr/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${inquiryList }">
			<tr>
				<td>${list.no }</td>
				<td>${list.inquiryType }</td>
				<td><div id="${list.no }" class="title"><a href = '${root }index?formpath=inquiryAnswerForm&num=${list.no }'>${list.title }</a></div></td>
				<td>${list.id }</td>
				<td>${list.writeDate }</td>
				<td>${list.state }</td>
			</tr>
			</c:forEach>
		</tbody>
		<tr><td colspan=6><hr/></td></tr>
	</table>
	
	<div id="paging_inquiryList">
		${page}
	</div>
	
	<form action="${root }index?formpath=inquiryList" method="post">
		<div id="div_select_inquiryList">
			<select name="select">
				<option value="all">전 체</option>
				<option value="waiting">답변 대기</option>
				<option value="complete">답변 완료</option>
			</select>
			<input type=submit name='searchBtn' value='검 색'/>
		</div>	
	</form>
</center>