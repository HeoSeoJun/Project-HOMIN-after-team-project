<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link
  rel="stylesheet"
  type="text/css"
  href="${pageContext.request.contextPath}/resources/css/reset.css"
/>
<c:if test="${not empty msg }">
	<script>
		alert('${msg}');
	</script>
</c:if>
<html>
<body>
	<div align="center">
		<table style="width: 1200px;">
			<tr><td><%@ include file="common/top.jsp" %></td></tr>
			<tr><td><c:import url="/${formpath }" /></td></tr>
			<tr><td><%@ include file="common/footer.jspf" %></td></tr>
		</table>
	</div>
</body>
</html>
