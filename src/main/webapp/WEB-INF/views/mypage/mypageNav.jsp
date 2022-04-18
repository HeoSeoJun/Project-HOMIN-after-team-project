<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css" />  --%>
<c:url var="root" value="/" />
<style>
aside {
	float: left;
	margin-right: 100px;
	width: 200px;
	height: 600px;
	padding: 40px 25px 0px 25px;
	border-radius: 4px;
	border: 1px solid #dadce0;
	box-shadow: 0 2px 4px 0 rgb(63 71 77 / 6%);
}

aside h2 {
	font-size: 35;
	margin-bottom: 20px;
}

aside div,nav {
	margin-bottom: 30;
}

aside p {
	font-size: 20;
	font-weight: bold;
	margin-bottom: 10px;
}

aside ul li {
	margin-bottom: 10px;
}

#img_aside_mypage {
	text-align: center;
}
</style>

<aside id="aside_mypage">
	<div id="div_aside_mypage">
		<c:choose>
			<c:when test="${sessionScope.id eq 'ADMIN@CARE.COM'}">
				<div>
					<h2>관리자 페이지</h2>
					<p>${sessionScope.id }</p>
				</div>
			</c:when>
			<c:otherwise>
				<div>
					<h2>MY Page</h2>
					<p>${sessionScope.id} 님!</p>
					<p>환영합니다.</p>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div id="img_aside_mypage">
		<img src="${pageContext.request.contextPath}/resources/image/basket_my.png">	
	</div>
	
	<nav id="nav_aside_mypage" >
		<c:choose>
			<c:when test="${sessionScope.id eq 'ADMIN@CARE.COM'}">
				<p>관리자 메뉴</p>
				<ul>
					<li><a href="${root }index?formpath=info/manage">> 회원정보 관리</a></li>
					<li><a href="${root }index?formpath=info/addrList">> 주소지 관리</a></li>
					<li><a href="${root }index?formpath=mypage&category=myinquiry">> 문의 관리</a></li>
					<li><a href="${root }index?formpath=mypage&category=orderHistory">> 주문 관리</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<p>나의 정보 페이지</p>
				<ul>
<%-- 					<li><a href="/homin/mypage/info/mgmt?id=${sessionScope.id }">회원 정보 관리</a></li> --%>
					<li><a href="${root }index?formpath=mypage&category=mypageIndex">> 개인정보 관리</a></li>
					<li><a href="${root }index?formpath=mypage&category=myAddress">> 주소지 관리</a></li>
					<li><a href="${root }index?formpath=mypage&category=myinquiry">> 1:1 문의</a></li>
					<li><a href="${root }index?formpath=mypage&category=orderHistory">> 주문 내역</a></li>
					<li><a href="${root}index?formpath=mypage&category=myBasket">> 장바구니</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
	</nav>
</aside>