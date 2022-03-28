<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css" /> 
<c:url var="root" value="/" />
<c:if test="${not empty msg }">
	<script>alert('${msg}')</script>
</c:if>
<style>
table {
	width: 400; height: 200;
}
</style>
<div>
	<c:import url="mypage/mypageNav.jsp"></c:import>
		
	<div>
		<div>
			<h3>회원 목록</h3>
		</div>
		<section>
			<table>
				<thead>
					<tr>
						<td>번호</td><td>아이디</td><td>이름</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="mDto" items="${list }">
						<tr>
							<td>${mDto.no }</td>
							<td><a href="${root }index?formpath=info/mgus?no=${mDto.no }">${mDto.id }</a></td>
							<td>${mDto.nickname }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
	</div>
</div>
