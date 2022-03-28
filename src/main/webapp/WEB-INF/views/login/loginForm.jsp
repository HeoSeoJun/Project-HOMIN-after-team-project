<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/"/>
<c:if test="${not empty sessionScope.id }">
	<script>
		location.href='/homin/';
	</script>
</c:if>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function idPwCheck() {
		i = document.getElementById('id').value;
		p = document.getElementById('pw').value;
		
		if (i == ""){
			alert('아이디를 입력해주세요');
			return;			
		}
		if (p == ""){
			alert('비밀번호를 입력해주세요');
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

<center style="margin: 50 0px;">
<div style="margin: 10 0px;">
    	<h1>
    		<img style="width: 150" src="https://static.mylgid.com/userweb/1.0.32/images/logo.svg" alt="MY LG ID" />
    	</h1>
    	<br>
	    <p id="testAlert">하나의 ID로 LG의 다양한 서비스를 이용해보세요.</p>
        <p>홈인 서비스는 MY LG ID로 이용하실 수 있습니다.</p>
        
</div>
<form action="${root }loginProc" id="f"  method="post">
	<table>
		<tr>
			<td><label class="form-title"><br>MY LG ID (이메일)</label></td>
		</tr>
		<tr>
			<td><input style="width: 350; height: 30; font-size: 15;" type=text id="id" name='id' placeholder="MY LG ID (이메일)"/></td>
		</tr>
		
		<tr>
			<td><br>비밀번호</td>
		</tr>
		<tr>
			<td><input style="width: 350; height: 30; font-size: 15; " type=password id="pw" name='pw' placeholder="비밀번호"/></td>
		</tr>
		<tr>
			<td><label id="msg" style="color:red;"></label></td>
		</tr>
		<tr>
		
			<td colspan=2 align='center'><br>
				<input type="button" value='로그인' style="color:#FFFFFF; background-color:#B71256; 
						font-size:15; width: 150px; height: 30px; border-radius: 10px; " onclick="idPwCheck()"/>
				
			</td>
		</tr>
		<c:set var="redirectUri" value="http://localhost:8085/homin/kakaoLogin"/>
		<c:set var="restKey" value="6b699a51ed025c4bd6a42e5026901e43"/>
		<tr>
			<td colspan="2" align="center"><br>
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=${restKey }&redirect_uri=${redirectUri }&response_type=code"> 
					<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="180"/>
				</a>
			</td>
		</tr>
		<tr>
			<td colspan=2 align='center'><br>
				<a href="${root }member">회원가입</a> |
				<a href="${root}/member">회원가입</a> |
				<a href="">아이디 찾기</a> |
				<a href="">비밀번호 찾기</a>
			</td>
		</tr>
	</table>
</form>
</h3>
</center>
