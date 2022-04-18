<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css" />
<c:url var="root" value="/" />
<c:if test="${not empty msg }">
	<script>alert('${msg}')</script>
</c:if>
<style>
#wrap_addr {
	padding-top: 20px;
}

#register_addr {
	margin-top: 20px;
}

#register_addr h3 {
	font-size: 30;
	margin-bottom: 20px;
}

#register_addr input {
	width: 120px;
	height: 30px;
	border-radius: 5px;
	background-color: black;
	color: white;
	cursor: pointer;
}

#box_title_addr {
	width: 520;
	margin-bottom: 30px;
}

#box_title_addr h3 {
	font-size: 30px;
}

#section_addr {
	padding-left: 400px;
}

#section_addr h4 {
/* 	font-size: 20; */
	margin-bottom: 20px;
}

#section_addr p {
	margin-bottom: 20px;
}

#div_table table {
	width: 600;
}

#div_table table tr {
	height: 40px;
}

#div_table table .btn_bottom_myAddress{
	width: 75; height: 30; font-size: 15; border-radius:10px;
	cursor: pointer;
}

#div_table .button:last-child {
	margin-left: 10;
}
</style>

<div id="wrap_addr">
	<c:choose>
		<c:when test="${postCode eq null }">
			<div id="register_addr">
				<h3>등록된 주소지가 없습니다.</h3>
				<div>
					<input type="button" value="주소 등록" onclick="location.href='${root}index?formpath=registerAdForm'">
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div id="info_addr">
				<div id="box_title_addr">
					<h3>주소지 정보</h3>
					<hr>
				</div>
				<section id="section_addr">
					<h4>HOM`IN 회원, 주소지 정보</h4>
					<p>HOM`IN 홈페이지에서 주소지 정보를 변경할 수 있습니다.</p>
					<div id="div_table">
						<table>
							<tr><th>아이디</th><td>${postCode.id }</td></tr>
							<tr><td colspan="2"><hr></td></tr>
							<tr><th>우편번호</th><td>${postCode.zipcode }</td></tr>
							<tr><td colspan="2"><hr></td></tr>
							<tr><th>주소</th><td>${postCode.addr1 }</td></tr>
							<tr><td colspan="2"><hr></td></tr>
							<tr><th>상세주소</th><td>${postCode.addr2 }</td></tr>
							<tr><td colspan="2"><hr></td></tr>
							<tr>
								<td colspan="2" align="right">
									<input class="btn_bottom_myAddress" type="button" value="수정" onclick="location.href='${root}index?formpath=updateAdForm'">
									<input class="btn_bottom_myAddress" type="button" value="주소삭제" onclick="location.href='${root}index?formpath=pwCheckForAddrDelete'">
								</td>
							</tr>
						</table>
					</div>
				</section>
			</div>
		</c:otherwise>
	</c:choose>	
</div>