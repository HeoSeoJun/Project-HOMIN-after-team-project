<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
회원 관리 폼
<c:if test="${not empty msg }">
	<script>
		alert('${msg}');
		location.href='${root}index?formpath=rental&category=dryer'
	</script>
</c:if>
<c:forEach var="list" items="${member }">
<div>
	<span>번호 ${list.no }</span>
	<span><a href = "${root }index?formpath=memberView&id=${list.id}">Id ${list.id }</a></span>
	<span>nick ${list.nickname }</span>
	<span>phone ${list.phone }</span>
	<span>email ${list.email }</span>
</div>

</c:forEach>
</body>
</html>