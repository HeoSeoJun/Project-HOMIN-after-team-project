<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css" /> 
<c:set var="root" value="/"></c:set>
<table>
	<c:choose>
		<c:when test="${myinquiry eq '[]' }">
			문의 내역이 없습니다.
		</c:when>
	</c:choose>
	<c:forEach var="list" items="${myinquiry }">
		<tr>
			<td><a href = "/homin/index?formpath=mypage&category=myinquiryView&no=${list.no }">${list.title }</a></td>
			<td>${list.writeDate }</td>
			<c:choose>
				<c:when test = "${list.state eq 'waiting'}">
					<td>답변 대기중</td>
				</c:when>
				<c:otherwise>
					<td>답변 완료</td>
				</c:otherwise>
			</c:choose>
		</tr>
	</c:forEach>
</table>
