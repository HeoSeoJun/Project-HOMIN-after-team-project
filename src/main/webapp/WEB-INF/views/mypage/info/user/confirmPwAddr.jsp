<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="/"></c:set>
<style>
div#wrapper {
	width: 800;
	margin: 0 auto;
}
</style>
<c:if test="${empty sessionScope.id }">
	<script>
		location.href='/homin/';
	</script>
</c:if>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function pwCheck() {
		i = document.getElementById('id').value;
		p = document.getElementById('pw').value;
		
		if (p == ""){
			alert('비밀번호를 입력해주세요');
			return;			
		}
		
		var inputI = {"id":i, "pw":p}
		$.ajax({
			url: "pwCheckProc", type: "POST",
			data: JSON.stringify(inputI), // 문자열 데이터를 JSON 객체로 변환
			contentType: "application/json; charset=utf-8", // 보낼 데이터의 타입 설정
			dataType: "json", // 받을 데이터의 자료형을 설정
			
			success : function(result){
				$('#msg').text(result.msg);
				if (result.msg == "" || result.msg == null)
					document.getElementById('f').submit();
			},
			error : function(){
				alert('회원탈퇴 에러발생');
			}
		})
	}
</script>

<center>
<div>
	<c:import url="mypage/mypageNav.jsp"></c:import>
	<div>
	   	<h3>비밀번호 확인</h3>
	    <p>개인 정보를 안전하게 보호하기 위해 비밀번호를 한번 더 입력해 주세요.</p>
		<form action="addr/deleteProc" id="f" method="post">
			<table>
				<tr>
					<td><label>MY LG ID (이메일)</label></td>
				</tr>
				<tr>
					<td><input style="width: 350" type=text id="id" name='id' value="${sessionScope.id }" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>비밀번호</td>
				</tr>
				<tr>
					<td><input style="width: 350" type=password id="pw" name='pw' placeholder="비밀번호"/></td>
				</tr>
				<tr>
					<td><label id="msg" style="color:red;"></label></td>
				</tr>
				<tr>
					<td colspan=2 align='center'>
						<input type="button" value='확인' style="width: 86px;" onclick="pwCheck()"/>
					</td>
				</tr>
			</table>
		</form>
	            
	</div>
</div>
</center>
