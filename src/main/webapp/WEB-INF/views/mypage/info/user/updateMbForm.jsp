<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function check() {
		var p = document.getElementById('pw').value;
		var po = document.getElementById('pwOk').value;
		
		if (p == "" || p == null){
			alert('비밀번호를 입력해주세요');
			return;			
		}
		if (p != po){
			alert('비밀번호가 일치하지 않습니다');
			return;			
		}
		
		document.getElementById('f').submit();
	}

	function sendAuth() {
		var e = document.getElementById('email').value;
		if (e == "") {
			$('#msg').text('이메일을 입력하세요.');
			return;
		}
		var s = {
			email : e
		}
		$.ajax({
			url : "sendAuth",
			type : "POST",
			data : JSON.stringify(s),
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			success : function(result) {
				$('#msg').text(result.msg)
			},
			error : function() {
				$('#msg').text('인증번호 전송 Error')
			}
		})
	}
	
	function sendAuthConfirm() {
		var i = document.getElementById('inputAuthNum').value;
		if (i == "") {
			$('#msg').text('인증번호를 입력하세요.');
			return;
		}
		var s = {
			inputAuthNum : i
		}
		$.ajax({
			url : "authConfirm",
			type : "POST",
			data : JSON.stringify(s),
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			success : function(result) {
				$('#msg').text(result.msg)
			},
			error : function() {
				$('#msg').text('인증번호 확인 Error')
			}
		})
	}
</script>
<style>
#ct_updateForm {
	padding-top: 30px;
}

#ct_updateForm h1 {
	font-size: 30px;
	margin-bottom: 15px;
}

#ct_updateForm h3 {
	font-size: 18px;
	margin-bottom: 10px;
}

#ct_updateForm table th,td {
	line-height: 30px;
	vertical-align: middle;
	padding: 0 10 15 0;	
} 

#ct_updateForm table input {
	border-radius: 5px; 
}

.text_info {
	width: 200px;
	height: 25px;	
}

.btn_info {
	width: 100px;
	height: 25px;
	cursor: pointer;
}

.btn_bottom {
	width: 80px;
	height: 25px;
	cursor: pointer;
}


</style>

<center id="ct_updateForm">
		<h1>회원정보 수정</h1>
		<h3><font color="red" id="msg">${msg }</font></h3>
	
		<form action="updateUserInfoProc" id="f" method="post">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type=text  class="text_info" name='id' id="id" value="${userInfo.id }" readonly="readonly"/></td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td><input type="password" class="text_info" name='pw' id="pw" placeholder='pw 입력' /></td>
				</tr>
				<tr>
					<th>패스워드 확인</th>
					<td><input type="password" class="text_info" name='pwOk' id="pwOk" placeholder='pw 확인' /></td>
				</tr>
				<tr>
					<th>이름</th>
					<td colspan="3"><input class="text_info" type=text name='nickname' value="${userInfo.nickname }"/>
				</tr>
				<tr>
					<th>E-Mail</th>
					<td><input type=text class="text_info" name='email' id="email" value="${userInfo.email }" /></td>
					<td><input type="button" class="btn_info" value="인증번호 전송"	onclick="sendAuth()"></td>
				</tr>
				<tr>
					<th>인증번호</th>
					<td><input type=text class="text_info" name='authNum' id="inputAuthNum"	placeholder='인증번호 입력' /></td>
					<td><input type="button" class="btn_info" value="인증번호 확인"	onclick="sendAuthConfirm()"></td>
				</tr>
				<tr>
					<th>휴대폰번호</th>
					<td><input type=text class="text_info" name='phone' value="${userInfo.phone }"/>
				</tr>
				<tr>
					<td align='center'colspan=3>
						<input type="button" class="btn_bottom" value='수정' onclick="check()"/> 
						<input type="button" class="btn_bottom" value='취소' onclick="location.href='${root}index?formpath=mypage&category=mypageIndex';"/>
					</td>
				</tr>
			</table>
		</form>
</center>
