<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" /> --%>
<c:set var="root" value="/"></c:set>
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
			url: "pwCheckProc",
			type: "POST",
			data: JSON.stringify(inputI), // 문자열 데이터를 JSON 문자열로 변환
			contentType: "application/json; charset=utf-8", // 보낼 데이터의 타입 설정
			
			dataType: "json", // 받을 데이터의 자료형을 설정
			success : function(result){
				$('#msg').text(result.msg);
				if (result.msg == "" || result.msg == null)
					document.getElementById('f').submit();
			},
			error : function(){
				alert('회원정보 처리에러');
			}
		})
	}
</script>
<style>
#center_confirmPw {
	padding: 50 0; 
}

#center_confirmPw h3 {
	font-size: 30px;
	margin-bottom: 30px;
}

#center_confirmPw p {
	font-weight: bold;
	margin-bottom: 20px;
}

#tb_pwCheck th, td {
	line-height: 50px;
	vertical-align: middle;
}

#tb_pwCheck th {
	padding-right: 30px;
}

#tb_pwCheck input {
	border-radius: 5px;
}

.btn_pwCheck {
	width: 80px;
	height: 30px;
	background-color: black;
	color: white;
	cursor: pointer;
}

/* #center_confirmPw th, td { */
/* 	line-height: 50px; */
/* 	vertical-align: middle; */
	
/* } */

/* #center_confirmPw th { */
/* 	padding-right: 20px; */
/* } */

/* #center_confirmPw .input_ { */
/* 	width: 200px; */
/* 	height: 30px; */
/* 	border-radius: 5px; */
/* } */

/* #center_confirmPw .btn_ { */
/* 	width: 80px; */
/* 	height: 30px; */
/* 	border-radius: 5px; */
/* } */

</style>

<center id="center_confirmPw">
   	<h3>비밀번호 확인</h3>
    <p>개인 정보를 안전하게 보호하기 위해 비밀번호를 한번 더 입력해 주세요.</p>
	<div id="div_pwCheck">
		<form action="updateUserInfoForm" id="f" method="post">
			<table id="tb_pwCheck">
				<tr>
					<th>HOM`IN ID (이메일)</th>
					<td><input class="input_" type=text id="id" name='id' value="${sessionScope.id }" readonly="readonly"/></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input class="input_" type=password id="pw" name='pw' placeholder="비밀번호"/></td>
				</tr>
				<tr>
					<td colspan="2" align='center'><label id="msg" style="color:red;"></label></td>
				</tr>
				<tr>
					<td colspan=2 align='center'>
						<input class="btn_pwCheck" type="button" value='확인' onclick="pwCheck()"/>
						<input class="btn_pwCheck" type="button" value="취소" onclick="window.history.back();">
					</td>
				</tr>
			</table>
		</form>
	</div>
</center>
