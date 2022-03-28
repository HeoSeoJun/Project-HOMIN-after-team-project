<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function deleteMember(){
		if(confirm("정말 삭제하시겠습니까?") == true){
			location.href = '${root}deleteMember?id=${member.id}';
		}else{
			return;
		}
	}
	function modifyMember(){
		if(confirm("회원 정보를 수정하시겠습니까?") == true){
			document.getElementById("f").submit();
			
		}else{
			return;
		}
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
</head>
<body>
	<form id = "f" action = "modifyMember" method="post">
		<div>아이디 : <input type = "text" value = "${member.id}" name = "id" readonly></div>
		<div>비밀번호 재설정 : <input type = "text" value = "${member.pw}" name = "pw" ></div>
		<div>이름 : <input type = "text" value = "${member.nickname } "name = "nickname"></div>
		<div>전화번호 : <input type = "text" value = "${member.phone } "name = "phone"></div>
		<div>이메일 : <input type = "text" value = "${member.email } "name = "email"></div>
		<div>우편번호 : <input type = "text" value = "${addr.zipcode }" name = "zipcode"  id = "zipcode" readonly><input type="button" style="height:30px;" value="우편번호 검색"		onclick="daumPost()"></div>
		<div>주소 : <input type = "text" value = "${addr.addr1 }" name = "addr1" id = "addr1" readonly></div>
		<div>상세주소 : <input type = "text" value = "${addr.addr2 }" name = "addr2" id = "addr2"></div>
	<div><input type = "button" value = "수정" onclick = "modifyMember()">
	<input type = "button" value = "삭제" onclick = "deleteMember()"></div>
	</form>
</body>
</html>