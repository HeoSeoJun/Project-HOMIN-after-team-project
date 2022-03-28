<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css" /> 
<script>
	function deleteChk() {
		var dt = confirm('${allDto.id } 의 주소지를 정말 삭제하겠습니까?');
		if (dt == true)
			location.href='addr/deleteAddr?id=${allDto.id }';
		else
			return;
	}
</script>
<c:if test="${not empty msg }">
	<script>
		alert("${msg }");
	</script>
</c:if>
<style>
table {
/* 	width: 400; height: 200; */
}
</style>
<div style="
    margin-top: 50px;
">
	<c:import url="mypage/mypageNav.jsp"></c:import>
		
	<divstyle="
   >
		<div>
			<h3>주소지 목록</h3>
		</div>
		<section>
			<form action="" id="f" method="post">
				<table>
					<thead>
						<tr>
							<td>아이디</td><td>우편번호</td><td>주소</td><td>상세주소</td><td>수정</td><td>삭제</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="pDto" items="${list }">
							<tr>
								<td>${pDto.id }</td>
								<td>${pDto.zipcode }</td>
								<td>${pDto.addr1 }</td>
								<td>${pDto.addr2 }</td>
								<td><input type="button" value="수정"></td>
								<td><input type="button" value="삭제" onclick="deleteChk()"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</section>
	</div>
</div>
