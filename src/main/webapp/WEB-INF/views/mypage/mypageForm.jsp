<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css" /> 
<c:set var="root" value="/"></c:set>
<div>
	<c:import url="mypage/mypageNav.jsp"></c:import>
	
	<div class="test" style="
    margin-top: 50px;
">
		<div class="test" >
			<c:choose>
				<c:when test="${category eq 'myinquiry' }">
					<c:import url="${root }myinquiry"></c:import>
				</c:when>
				<c:when test="${category eq 'myinquiryView' }">
					<c:import url="${root }myinquiryView"></c:import>
				</c:when>
				<c:when test="${category eq 'orderHistory' }">
					<c:import url="${root }orderHistory"></c:import>
				</c:when>
				<c:otherwise>
					<h3>안녕하세요. ${sessionScope.nickname }님</h3>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>