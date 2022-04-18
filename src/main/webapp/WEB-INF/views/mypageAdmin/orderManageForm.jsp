<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty orderList }">
	<script>
			alert('주문된 제품이 없습니다.');
			location.href='${root }index?formpath=memberManagement';
	</script>
</c:if>
<c:url var="root" value="/"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css" /> 
<script>
	function orderCancle(uid){
		 if (confirm("주문을 취소하시겠습니까?")){
			 $.ajax({
				url : "orderCancle",
				type : "POST",
				data : uid,
				success : function(){
					alert("주문 취소 완료");
					window.location.reload();
				},
				error : function(){
					alert("문제 발생");
				}
			 })
		 }
	}
</script>
<style>
#center_orderList {
	margin: 20 20 0 20;
	border: 1px solid gray;
	border-radius: 10px;
	padding: 20 0;
}

#table_orderList {
	width: 1100px;
	margin-bottom: 10px;
}

#table_orderList caption {
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 20px;
}

#table_orderList tr {
	line-height: 40px;
}

#table_orderList th {
	font-size: 20px;
}

#table_orderList td {
	text-align: center;
	vertical-align: middle;
}

.btn_orderList {
	width: 70px;
	height: 20px;
	border-radius: 5px;
	cursor: pointer;
}

#paging_orderManagement {
	margin-bottom: 10px;
}

#div_select_orderList {
	width: 1100px;
	text-align: right;
}

#div_select_orderList select {
	width: 80px;
	height: 25px;
}

#div_select_orderList input {
	width: 80px;
	height: 20px;
	border-radius: 5px;
	cursor: pointer;
}
</style>

<center id="center_orderList">
	<table id="table_orderList">
		<caption>주문 목록</caption>
		<thead>
			<tr>
				<th>주문번호<hr/></th>
				<th>상품명<hr/></th>
				<th>금 액<hr/></th>
				<th>아이디<hr/></th>
				<th>이 름<hr/></th>
				<th>이메일<hr/></th>
				<th>전화번호<hr/></th>
				<th>주문취소<hr/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="order" begin="${pageConf.startNum }" end="${pageConf.startNum+pageConf.numPerPage-1}" items="${orderList }">
			<tr>
				<td><a href = '${root }index?formpath=orderDetail&uid=${order.uid }'>${order.uid }</a></td>
				<td>${order.productName }</td>
				<td>${order.amount }원</td>
				<td>${order.buyer_id }</td>
				<td>${order.name }</td>
				<td>${order.email }</td>
				<td>${order.tell }</td>
				<td><input class="btn_orderList" type = "button" value = "주문 취소" onclick = "orderCancle('${order.uid}')"></td>
			</tr>
			</c:forEach>
		</tbody>
		<tr><td colspan=8><hr/></td></tr>
	</table>
	
	<div id="paging_orderManagement">
		<c:if test="${pageConf.presentPage ne 1 }">
		<a href="${root }index?formpath=orderManagement?presentPage=${pageConf.presentPage-1 }">이전</a>
		</c:if>
		<c:forEach var="page" begin="1" end="${pageConf.totalPages }">
			<a href="${root }index?formpath=orderManagement?presentPage=${page }">${page }</a>
		</c:forEach>
		<c:if test="${pageConf.presentPage ne pageConf.totalPages }">
			<a href="${root }index?formpath=orderManagement?presentPage=${pageConf.presentPage+1 }">다음</a>
		</c:if>
	</div>
	
	<div id="div_select_orderList">
		<form action="${root }index?formpath=orderManagement?mode=search" method="post">
			<select name="select">
				<option value="all">전 체</option>
				<option value="uid">주문번호</option>
				<option value="id">아이디</option>
				<option value="tell">전화번호</option>
			</select>
			<input id="text_" type=text name='search'/>
			<input type=submit name='searchBtn' value='검 색'/>
		</form>
	</div>	
</center>