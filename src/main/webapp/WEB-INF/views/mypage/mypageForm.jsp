<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />    --%>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css" />  --%>
<c:set var="root" value="/"></c:set>
<style>
#wrap_mypage {
	margin-top: 20px;
}
</style>	
<div id="wrap_mypage">
	<div>
		<c:import url="mypage/mypageNav.jsp"></c:import>
	</div>
	
	<div>
		<c:choose>
			<c:when test="${category eq 'myAddress' }">
				<c:import url="${root }myAddress"></c:import>
			</c:when>
			<c:when test="${category eq 'myinquiry' }">
				<c:import url="${root }myinquiry"></c:import>
			</c:when>
			<c:when test="${category eq 'myinquiryView' }">
				<c:import url="${root }myinquiryView"></c:import>
			</c:when>
			<c:when test="${category eq 'orderHistory' }">
				<c:import url="${root }orderHistory"></c:import>
			</c:when>
			<c:when test="${category eq 'myBasket' }">
				<c:import url="${root }myBasket"></c:import>
			</c:when>
			<c:when test="${category eq 'myBasket' }">
				<c:import url="${root }myBasket"></c:import>
			</c:when>
			<c:when test="${category eq 'pwCheckForm' }">
				<c:import url="${root }pwCheckForm"></c:import>
			</c:when>
			<c:otherwise>
				<c:import url="${root }mypageIndex"></c:import>
			</c:otherwise>
		</c:choose>
	</div>
</div>
