<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<div>
	<c:import url="mypage/mypageNav.jsp"></c:import>
	
	<div>
		<h1>회원정보 수정</h1><br>
		<h3><font color="red" id="msg">${msg }</font></h3>
	
		<form action="mgmt/updateProc" id="f" method="post">
		<table>
			<tr>
				<td height=40 >아이디</td>
				<td><input type=text name='id' id="id" value="${userInfo.id }" readonly="readonly"/></td>
			</tr>
			<tr>
				<td height=40>패스워드</td>
				<td><input type="password" name='pw' id="pw" placeholder='pw 입력' /></td>
				<td>패스워드 확인</td>
				<td><input type="password" name='pwOk' id="pwOk" placeholder='pw 입력' /></td>
			</tr>
			<tr>
				<td width=120>이름</td>
				<td colspan="3"><input type=text name='nickname' value="${userInfo.nickname }"/>
			</tr>
			<tr>
				<td height=40>E-Mail</td>
				<td><input type=text name='email' id="email" value="${userInfo.email }" /></td>
				<td colspan="2"><input type="button" value="인증번호 전송"	onclick="sendAuth()"></td>
			</tr>
			<tr>
				<td>인증번호</td>
				<td><input type=text name='authNum' id="inputAuthNum"	placeholder='인증번호 입력' /></td>
				<td colspan="2"><input type="button" value="인증번호 확인"	onclick="sendAuthConfirm()"></td>
			</tr>
			<tr>
				<td>휴대폰번호</td>
				<td colspan='3'><input type=text name='phone' value="${userInfo.phone }"/>
			</tr>
			<tr>
				<td align='center' height=40 colspan=4>
					<input type="button" value='수정' style="width: 120px;" onclick="check()"/> 
					<input type=reset value='취소'	style="width: 120px;" />
				</td>
			</tr>
		</table>
	</form>
	</div>
</div>