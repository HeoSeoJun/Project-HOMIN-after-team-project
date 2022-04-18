<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/"/>
<c:if test="${not empty sessionScope.id }">
	<script>
		location.href='/homin/';
	</script>
</c:if>
<c:if test="${not empty msg }">
	<script>
		alert(${msg});
	</script>
</c:if>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function idPwCheck() {
		i = document.getElementById('id').value;
		p = document.getElementById('pw').value;
		
		if (i == ""){
			alert('아이디를 입력해주세요');
			document.getElementById('id').focus();
			return;			
		}
		if (p == ""){
			alert('비밀번호를 입력해주세요');
			document.getElementById('pw').focus();
			return;			
		}
		
		var inputI = {"id":i, "pw":p}
		$.ajax({
			url: "idPwCheck", type: "POST",
			data: JSON.stringify(inputI), // 문자열 데이터를 JSON 객체로 변환
			contentType: "application/json; charset=utf-8", // 보낼 데이터의 타입 설정
			dataType: "json", // 받을 데이터의 자료형을 설정
			
			success : function(result){
				$('#msg').text(result.msg);
				if (result.msg == "" || result.msg == null)
					document.getElementById('f').submit();
			},
			error : function(){
				alert('로그인 에러발생');
			}
		})
	}
</script>
<style>
#center_login {
	margin: 40 0;
}

#center_testAlert {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 40px;
}

#div_loginForm table {
/* 	height: 250px; */
/* 	align-items: center; */
/* 	padding-bottom: 20px; */
}

#div_loginForm td {
	padding-bottom: 15px;
}

#div_loginForm label {
	font-weight: bold;
}

.input_info {
	width: 350; height: 30; font-size: 15;
	border-radius: 5px;
}

#but_login {
	width: 150px; height:30px; font-size:15; cursor:pointer; border-radius:10px;
	background-color: black; color: white;
}

#but_kakaologin {
	width:180px;
}

</style>

<center id="center_login">
<div>
	<p id="center_testAlert">하나의 ID로 HOM`IN의 다양한 서비스를 이용해보세요.</p>
</div>

<div id="div_loginForm">
	<form action="${root }loginProc" id="f"  method="post">
		<table>
			<tr>
				<td><label class="form-sub">MY HOM`IN ID (이메일)</label></td>
			</tr>
			<tr>
				<td>
					<input class="input_info" type=text id="id" name='id' placeholder="MY HOM`IN ID (이메일)"/>
				</td>
			</tr>
			
			<tr>
				<td><label class="form-sub">비밀번호</label></td>
			</tr>
			<tr>
				<td>
					<input class="input_info" type=password id="pw" name='pw' placeholder="비밀번호"/>
				</td>
			</tr>
			<tr>
				<td style="padding-bottom: 0px;"><label id="msg" style="color:red;"></label></td>
			</tr>
			<tr>
				<td align='center'>
					<input id="but_login" type="button" value='로그인' onclick="idPwCheck()"/>
				</td>
			</tr>
			<!-- 카카오 로그인 API -->
			<c:set var="redirectUri" value="http://localhost:8085/homin/kakaoLogin"/>
			<c:set var="restKey" value="6b699a51ed025c4bd6a42e5026901e43"/>
			<tr>
				<td align="center">
					<a href="https://kauth.kakao.com/oauth/authorize?client_id=${restKey }&redirect_uri=${redirectUri }&response_type=code"> 
						<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" id="but_kakaologin"/>
					</a>
				</td>
			</tr>
			<tr>
				<td align="center"  style="padding-bottom: 0;">
					<a href="${root }index?formpath=memberForm">회원가입</a> |
					<a href="">아이디 찾기</a> |
					<a href="">비밀번호 찾기</a>
				</td>
			</tr>
		</table>
	</form>
</div>
</center>
