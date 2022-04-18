<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css" /> 
<script>
	function orderCancle(uid){
		 if (confirm("주문을 취소하시겠습니까?") == true){
			 $.ajax({
				url : "orderCancle",
				type : "POST",
				data : uid,
				success : function(){
					alert("주문을 취소하였습니다.");
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
#wrap_orderHistory {
	padding-top: 20px;
}

#box_title_orderHistory{
	width: 540;
	margin-bottom: 30px;
}

#box_title_orderHistory h3 {
	font-size: 40;
}

#table_orderHistory table {
	width: 780px;
	text-align: center;
}

#table_orderHistory table thead {
	line-height: 50px;
	font-size: 20;
}

#table_orderHistory table td {
	vertical-align: middle;
}

#table_orderHistory .btn_orderHistory {
	width: 80px;
	height: 25px;
	border-radius: 5px;
	background-color: black;
	color: white;
	cursor: pointer;
}

</style>

<c:choose>
	<c:when test="${myOrder eq '[]' }">
		<script>
			alert('구매한 제품이 없습니다.');
			location.href='${root }index?formpath=mypage&category=mypageIndex';
		</script>
		
	</c:when>
</c:choose>
<div id="wrap_orderHistory">
	<div id="box_title_orderHistory">
		<h3>주문 내역</h3>
		<hr>
	</div>
	
	<div id="table_orderHistory">
		<table>
		<thead>
			<tr>
				<th>제품 사진</th><th>주문 번호</th><th>제품명</th><th>가격</th><th>후기작성</th>
			</tr>
			<tr><td colspan="5"><hr></td></tr>
		</thead>
			<c:forEach var="order" items="${myOrder }">
				<tbody>
					<tr>
						<td><img src = "${root }resources/image/${order.classification}/${order.productImg}" style="height: 100px"></td>
						<td>${order.uid }</td>
						<td><span style="cursor: pointer;" onclick="location.href='${root}index?formpath=product&category=${order.classification}&prodNo=${order.product_no}'">${order.productName }</span></td>
						<td>${order.amount }원</td>
						<td>
<%-- 							<input class="btn_orderHistory" type = "button" value = "주문 취소" onclick = "orderCancle('${order.uid}')">						 --%>
							<input class="btn_orderHistory" type = "button" value = "후기 작성" onclick = "location.href = '${root }index?formpath=review&product_img=${order.productImg}&category=${order.classification }&order_no=${order.uid }'">
						</td>
					</tr>
					<tr><td colspan="5"><hr></td></tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
</div>