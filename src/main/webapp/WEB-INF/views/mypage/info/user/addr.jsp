<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	<c:choose>
		<c:when test="${postCode eq null }">
			<div>
				<div>
					<h3>주소지 등록하기</h3>
					<input type="button" value="주소 등록" onclick="location.href='${root}index?formpath=addr/registerAdForm'">
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div>
				<div>
					<h3>주소지 관리</h3>
				</div>
				<section>
					<table>
						<tr><td>아이디</td><td>${postCode.id }</td></tr>
						<tr><td>우편번호</td><td>${postCode.zipcode }</td></tr>
						<tr><td>주소</td><td>${postCode.addr1 }</td></tr>
						<tr><td>상세주소</td><td>${postCode.addr2 }</td></tr>
						<tr>
							<td colspan="2" align="right">
								<input type="button" value="수정" onclick="location.href='${root}index?formpath=addr/updateAdForm'">
								<input type="button" value="주소삭제" onclick="location.href='${root}index?formpath=addr/confirmPw'">
							</td>
						</tr>
					</table>
				</section>
			</div>
		</c:otherwise>
	</c:choose>	
</div>