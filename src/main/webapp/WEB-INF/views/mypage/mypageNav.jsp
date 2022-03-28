<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css" /> 
<c:url var="root" value="/" />
<style>
aside {
	float: left;
	
}
span {
	font-size: 18;
}
h2 {
	font-size: 28;
}
nav ul {
 	list-style: none;
}
p {
	font-size: 18; margin:0 0 10 0px;
}
</style>

<aside class="mypage_aside_wrap">
		<div style="margin-top:20px">
		<div>
			<span>MY PAGE</span>
			<h2>마이페이지</h2>
		</div>
		<div>
		<img src="${pageContext.request.contextPath}/resources/image/basket_my.png">	
		</div>
		
			
		</div>
		<nav class="mypage_aside_nav" >
			<br>
			<p>나의 정보 관리</p>
			<ul>
				<c:choose>
					<c:when test="${sessionScope.id eq 'ADMIN@CARE.COM'}">
						<li><a href="${root }index?formpath=info/manage">회원 정보 관리</a></li>
						<li><a href="${root }index?formpath=info/addrList">주소지 관리</a></li>
					</c:when>
					<c:otherwise>
<%-- 						<li><a href="/homin/mypage/info/mgmt?id=${sessionScope.id }">회원 정보 관리</a></li> --%>
						<li><a href="${root }index?formpath=info/mgmt?id=${sessionScope.id }">>회원 정보 관리</a></li>
						<li><a href="${root }index?formpath=info/addr?id=${sessionScope.id }">>주소지 관리</a></li>
					</c:otherwise>
				</c:choose>
				<li><a href="${root }index?formpath=mypage&category=myinquiry">>1:1 문의 내역</a></li>
				<li><a href="${root }index?formpath=mypage&category=orderHistory">>주문 내역</a></li>
				<li><a href="${root}index?formpath=basket">>장바구니</a></li>
			</ul>
		</nav>
</aside>