<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />
<c:if test="${not empty msg }">
	<script>alert('${msg}')</script>
</c:if>
<style>
#wrap_addr {
	padding-top: 20px;
}

#box_title_addr {
	width: 570;
	margin-bottom: 30px;
}

#wrap_addr h3 {
	font-size: 40;
	
}

#register_addr h3{
	margin-bottom: 20px;
}

#info_addr h4 {
	font-size: 20;
	margin-bottom: 20px;
}

#info_addr p {
	margin-bottom: 15px;
} 

#info_addr table {
	width: 500; height: 300;
}

#info_addr .button{
	width: 75; height: 30; font-size: 15; border-radius:10px;
}

#info_addr .button:last-child {
	margin-left: 10;
}
</style>

<div id="wrap_addr">
	<c:choose>
		<c:when test="${postCode eq null }">
			<div id="register_addr">
				<h3>주소지 등록하기</h3>
				<div>
					<input type="button" value="주소 등록" onclick="location.href='${root}index?formpath=addr/registerAdForm'">
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div id="info_addr">
				<div id="box_title_addr">
					<h3>주소지 정보</h3>
					<hr>
				</div>
				<section>
					<h4>HOM`IN 회원, 주소지 정보</h4>
					<p>HOM`IN 홈페이지에서 주소지 정보를 변경할 수 있습니다.</p>
					<div>
						<table>
							<tr><th>아이디</th><td>${postCode.id }</td></tr>
							<tr><th>우편번호</th><td>${postCode.zipcode }</td></tr>
							<tr><th>주소</th><td>${postCode.addr1 }</td></tr>
							<tr><th>상세주소</th><td>${postCode.addr2 }</td></tr>
							<tr>
								<td colspan="2" align="right">
									<input class="button" type="button" value="수정" onclick="location.href='${root}index?formpath=addr/updateAdForm'">
									<input class="button" type="button" value="주소삭제" onclick="location.href='${root}index?formpath=addr/confirmPw'">
								</td>
							</tr>
						</table>
					</div>
				</section>
			</div>
		</c:otherwise>
	</c:choose>	
</div>