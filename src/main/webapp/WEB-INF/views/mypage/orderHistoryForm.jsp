<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css" /> 
<script>
	function orderCancle(uid){
		 if (confirm("정말 삭제하시겠습니까?") == true){
			 $.ajax({
				url : "cancle",
				data : uid,
				type : "POST",
				success : function(){
					alert("성공");
					window.location.reload();
				},
				error : function(){
					alert("문제")
				}
			 })
		 }
	}
</script>
	<c:choose>
		<c:when test="${myOrder eq '[]' }">
			구매한 제품이 없습니다.
		</c:when>
	</c:choose>
<c:forEach var="order" items="${myOrder }">
	<table onclick = "location.href='${root}index?formpath=product&category=${order.classification}&prodNo=${order.product_no}'">
		<tr>
			<th><img src = "${root }resources/image/${order.classification}/${order.productImg}" style="width:100px; height: 100px"></th>
			<td>주문번호:${order.uid }</td>
			<td>제품명:${order.productName }</td>
			<td>가격:${order.amount }원</td>
		</tr>
	</table>
	<input type = "button" value = "주문 취소" onclick = "orderCancle('${order.uid}')">
	<input type = "button" value = "후기 작성" onclick = "location.href = '${root }index?formpath=write&product_img=${order.productImg}&category=${order.classification }&order_no=${order.uid }'">
</c:forEach>