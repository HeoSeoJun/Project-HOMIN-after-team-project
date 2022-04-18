<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />
<c:if test="${not empty msg }">
	<script>alert('${msg}')</script>
</c:if>
<style>
#div_mgmt {
	padding-top: 20px;
}

#box_title_mgmt {
	width:531;
	margin-bottom: 20px;
}

#div_mgmt h3 {
	font-size: 40;
}

#div_mgmt section h4 {
	font-size: 20;
	margin-bottom: 10px;
}

#div_mgmt section div {
	margin-bottom: 20px;
}

#div_mgmt section table {
	width: 600; height: 200;
}

#div_mgmt #msg_delete p {
	margin-bottom: 5;
}

#div_mgmt .button{
	width: 75; height: 30; font-size: 15; border-radius:10px;
	background-color: black; color: white; cursor: pointer;
}
</style>

<div id="div_mgmt">
	<div id="box_title_mgmt">
		<h3>회원 정보</h3>
		<hr>
	</div>
	<section>
		<h4>HOM`IN 회원 정보</h4>
		<div>
			<p>HOM`IN 홈페이지에서 회원 정보를 변경할 수 있습니다.</p>
		</div>
		<div>
			<table>
				<tr>
					<th>아이디</th><td>${allDto.id }</td>
				</tr>
				<tr><td colspan="2"><hr></td></tr>
				<tr>
					<th>비밀번호</th><td>******</td>
				</tr>
				<tr><td colspan="2"><hr></td></tr>
				<tr>
					<th>이름</th><td>${allDto.nickname }</td>
				</tr>
				<tr><td colspan="2"><hr></td></tr>
				<tr>
					<th>휴대폰번호</th><td>${allDto.phone }</td>
				</tr>
				<tr><td colspan="2"><hr></td></tr>
				<tr>
					<th>이메일</th><td>${allDto.email }</td>
				</tr>
				<tr><td colspan="2"><hr></td></tr>
				<tr>
					<td colspan="2">
						<input class="button" type="button"
								value="수정" onclick="location.href='${root}index?formpath=pwCheckForUpdate'">
<!-- 								value="수정" onclick="pwCheckForm()"> -->
					</td>
				</tr>
			</table>
		</div>
		
		<div id="msg_delete">
			<p>회원 탈퇴는 본인 확인 절차 후, 진행됩니다.</p>
			<p>회원 탈퇴 후에도 MY LG ID 회원은 유지되며, 계속 이용할 수 있습니다.</p>
			<p>회원 탈퇴 시, 홈인에서 받은 각종 할인 쿠폰 및 이벤트 혜택 등은 자동으로 소멸합니다.</p>
			<p>다음에서 회원 탈퇴 처리는 유보될 수 있습니다.</p>
			<p>1. 회원이 상품 주문 또는, 서비스를 신청 중인 경우.</p>
			<p>- 회원이 직접 주문/신청 내역을 전부 삭제할 때까지, 탈퇴 처리는 유보될 수 있습니다.</p>
			<p>2. 제휴사가 서비스를 진행 예정 또는, 진행 중인 경우.</p>
			<p>- 회원과 제휴사 간에 진행 취소가 결정될 때까지, 탈퇴 처리는 유보될 수 있습니다.</p>
		</div>
			
		<div>
			<input class="button" type="button" 
							value="회원탈퇴" onclick="location.href='${root}index?formpath=pwCheckForDelete'">
		</div>
	</section>
</div>
