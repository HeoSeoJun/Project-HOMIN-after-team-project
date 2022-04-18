<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>
<script>
	function deleteMember(){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href = '${root}deleteMemberByAdmin?id=${member.id}';
		}else{
			return;
		}
	}
	function modifyMember(){
		if(confirm("회원 정보를 수정하시겠습니까?")){
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
	
<style>
#center_mbViewForm {
	margin: 20 20 0 20;
	border: 1px solid gray;
	border-radius: 10px;
	padding: 20 0;
}

#table_mbViewForm {
/* 	width: 400px; */
}

#table_mbViewForm caption {
	font-size: 30px;
	margin-bottom: 20px;
}

#table_mbViewForm tr {
	line-height: 40px;
}

#table_mbViewForm th {
	font-size: 20px;
	padding-right: 10px;
}

#table_mbViewForm td {
	vertical-align: middle; 
}

.td_mbViewForm {
	padding-bottom: 10px;
}

.txt_input_mbViewForm {
	width: 200px;
	height: 30px;
	border-radius: 5px;
}

.btn_input_mbViewForm {
	padding-left: 10px;
}

.btn_bottom_mbViewForm {
	width: 80px;
	height: 25px;
	border-radius: 5px;
	cursor: pointer;
}

#btn_post_mbViewForm {
	border-radius: 5px;
	cursor: pointer;
}
</style>
	
<center id="center_mbViewForm">
	<div>
		<form id = "f" action = "modifyMemberByAdmin" method="post">
		<table id="table_mbViewForm">
			<caption>HOM`IN 회원 정보 관리</caption>
				<tr>
					<th>아이디</th>
					<td><input class="txt_input_mbViewForm" type = "text" value = "${member.id}" name = "id" readonly></td>
				</tr>
				<tr><td class="td_mbViewForm" colspan="3"><hr></td></tr>
				<tr>
					<th>비밀번호 변경</th><td><input class="txt_input_mbViewForm" type = "password" value = "${member.pw}" name = "pw" ></td>
				</tr>
				<tr><td class="td_mbViewForm" colspan="3"><hr></td></tr>
				<tr>
					<th>이 름</th><td><input class="txt_input_mbViewForm" type = "text" value = "${member.nickname } "name = "nickname"></td>
				</tr>
				<tr><td class="td_mbViewForm" colspan="3"><hr></td></tr>
				<tr>
					<th>전화번호</th><td><input class="txt_input_mbViewForm" type = "text" value = "${member.phone } "name = "phone"></td>
				</tr>
				<tr><td class="td_mbViewForm" colspan="3"><hr></td></tr>
				<tr>
					<th>이메일</th><td><input class="txt_input_mbViewForm" type = "text" value = "${member.email } "name = "email"></td>
				</tr>
				<tr><td class="td_mbViewForm" colspan="3"><hr></td></tr>
				<tr>
					<th>우편번호</th>
					<td><input class="txt_input_mbViewForm" type = "text" value = "${addr.zipcode }" name = "zipcode"  id = "zipcode" readonly></td>
					<td class="btn_input_mbViewForm" ><input id="btn_post_mbViewForm" type="button" style="height:30px;" value="우편번호 검색" onclick="daumPost()"></td>
				</tr>
				<tr><td class="td_mbViewForm" colspan="3"><hr></td></tr>
				<tr>
					<th>주 소</th><td><input class="txt_input_mbViewForm" type = "text" value = "${addr.addr1 }" name = "addr1" id = "addr1" readonly></td>
				</tr>
				<tr><td class="td_mbViewForm" colspan="3"><hr></td></tr>
				<tr>
					<th>상세주소</th><td><input class="txt_input_mbViewForm" type = "text" value = "${addr.addr2 }" name = "addr2" id = "addr2"></td>
				</tr>
				<tr><td class="td_mbViewForm" colspan="3"><hr></td></tr>
				<tr>
					<td colspan="3" align="center">
						<input class="btn_bottom_mbViewForm" type = "button" value = "수정" onclick = "modifyMember()">
						<input class="btn_bottom_mbViewForm" type = "button" value = "삭제" onclick = "deleteMember()">
						<input class="btn_bottom_mbViewForm" type = "button" value = "이전" onclick = "window.history.back()">
					</td>
				</tr>
		</table>
		</form>
	</div>
</center>