<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/"></c:url>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>
<script>
	function ajaxIsExist() {
		var i = document.getElementById('id').value;
		var d = {
			id : i
		}
		$.ajax({
			url : "isExistId",
			type : "POST",
			data : JSON.stringify(d), //문자열을 json타입으로 변환
			contentType : "application/json; charset=utf-8", //보낼 데이터 유형
			dataType : 'json', //return 타입 json으로 지정
			success : function(result) {
				$('#msg').text(result.msg)
			},
			error : function() {
				alert("문제 발생")
			}
		})
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
	
	function daumPost() {
		new daum.Postcode({
			onComplete : function(data) {
				var addr = "";
				if (data.userSelectedType === "R") {//도로명 주소일 경우( R )
					addr = data.roadAddress;
				} else {//지번일 경우( J )
					addr = data.jibunAddress;
				}
				document.getElementById("zipcode").value = data.zonecode;
				document.getElementById("addr1").value = addr;
				document.getElementById("addr2").focus();
			}
		}).open();
	}
</script>
<style>
#ct_mbForm {
	padding: 30 10 10 10px;
}

#div_title_mbForm {
	width: 130px;
	margin-bottom: 15px;
}

#div_title_mbForm h3 {
	font-size: 30px;
}

#div_subtitle_mbForm {
	width: 350px;
	padding: 10px 5px;
	border: double red;
	margin-bottom: 10px;
}

#div_subtitle_mbForm :first-child {
	margin-bottom: 10px;
}

#table_mbForm tr {
	line-height: 40px;
}

#table_mbForm th, td {
	vertical-align: middle;
	padding-right: 20px;
}

#table_mbForm tr :last-child {
	padding-right: 0;
}

#table_mbForm input {
	border-radius: 5px;
	height: 25px;
}

#table_mbForm .text_input {
	width: 200px;
}

#table_mbForm .btn_input {
	background-color: black;
	color: white;
	width: 100px;
	cursor: pointer;
}

#td_bottomBtn {
	padding: 20 0 0 0;
}

</style>

<center id="ct_mbForm">
	<div id="div_title_mbForm">
		<h3>회원가입</h3>
		<hr>
	</div>
	<div id="div_subtitle_mbForm">
		<p>HOM`IN 회원 가입을 위해 정보를 입력해주세요.</p>
		<p>모두 필수 항목 입니다.</p>
	</div>
	<h3>
		<font color="red" id="msg">${msg }</font>
	</h3>
	<div>
		<form action="memberProc" method="post">
			<table id="table_mbForm">
				<tr>
					<th>아이디</th>
					<td><input class="text_input" type=text name='id' id="id" placeholder='이메일주소를 입력해주세요'
								required data-valid="false" /></td>
					<td><input class="btn_input" type="button" value="중복 확인" onclick="ajaxIsExist()"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input class="text_input" type=text name='nickname' /></td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td><input class="text_input" type="password" name='pw' placeholder='pw 입력' /></td>
				</tr>
				<tr>
					<th>패스워드 확인</th>
					<td><input class="text_input" type="password" name='pwOk' placeholder='pw 입력' /></td>
				</tr>
				<tr>
					<th>E-Mail</th>
					<td><input class="text_input" type=text name='email' id="email" placeholder='E-Mail 입력' /></td>
					<td><input class="btn_input" type="button" value="인증번호 전송"	onclick="sendAuth()"></td>
				</tr>
				<tr>
					<th>인증번호</th>
					<td><input class="text_input" type=text name='authNum' id="inputAuthNum" placeholder='인증번호 입력' /></td>
					<td><input class="btn_input" type="button" value="인증번호 확인"	onclick="sendAuthConfirm()"></td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td><input class="text_input" type=text name='zipcode' id="zipcode" readonly="readonly" /></td>
					<td><input class="btn_input" type="button" value="우편번호 검색" onclick="daumPost()"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input class="text_input" type=text name='addr1' id="addr1" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td><input class="text_input" type=text name='addr2' id="addr2" /></td>
				</tr>
				<tr>
					<th>휴대폰번호</th>
					<td><input class="text_input" type=text name='phone' placeholder='-는 생략하고 입력' /></td>
				</tr>
				<tr>
					<td id="td_bottomBtn" colspan="3" align="center">
						<input class="btn_input" type=submit	value='가입하기' />
						<input class="btn_input" type="button"	value='취소' onclick="location.href='${root}index?formpath=login'" />						
					</td>
				</tr>
			</table>
		</form>
	</div>
</center>
