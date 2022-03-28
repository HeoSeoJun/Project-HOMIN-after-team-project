<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${not empty msg }">
	<script>
		alert('${msg}');
	</script>
</c:if>
<html>
<body>
<div align="center">
	<table style="width:800px;">
		<tr>
			<td style="height:100px;"><%@ include file="common/top.jsp" %></td>
		</tr>
		<tr>
			<td style="height:400px;"><c:import url="/${formpath }" /> </td>
		</tr>
		<tr>
			<td style="height:50px;"><%@ include file="common/footer.jspf" %></td>
		</tr>
	</table>
	</div>
</body>
</html>
