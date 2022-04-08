<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <c:if test="${empty sessionScope.id }">
	<script>location.href='index?formpath=login'</script>
</c:if> --%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<c:url var="root" value="/" />

<script>
	$(function(){
		$("#submitCheck").click(function() {
			var pw = $('#pw').val();
			var pwOk = $('#pwOk').val();
			
			if(pw == ''){
				alert('패스워드를 입력하세요');
				$('#pw').focus();
				return;
			}
			if(pwOk == ''){
				alert('패스워드 확인을 입력하세요');
				$('#pwOk').focus();
				return;
			}
			if(pw != pwOk){
				alert('입력하신 정보가 일치하지 않습니다.');
				$('#pw').val('');
				$('#pwOk').val('');
				return;
			}
			$('#f').submit();
		});
	});
</script>
<style>
#center_checkForm {
	padding: 50px 0;
}

#center_checkForm p {
	font-size: 20px;
	margin-bottom: 30px;
}

#center_checkForm p span {
	color: red;
	font-weight: bold;
}

#center_checkForm table {
	width: 400px;
}

#center_checkForm table tr {
	line-height: 40px;
}

#center_checkForm table th,td {
	vertical-align: middle;
}

#center_checkForm table .btn {
	width: 80px;
	height: 30px;
	margin-top: 10px;
	border-radius: 5px;
	background-color: black;
	color: white;
}



</style>
<center id="center_checkForm">

	<p>- 후기 <span>삭제</span>을 위한 비밀번호 확인 -</p>
	
	<div>
		<form action="boardDeleteProc" method="post" id = "f">
			<input type="hidden" name="no" value="${no }" />
			
			<table>
				<tr>
					<th>패스워드 </th>
					<td><input type=password name='pw' id = "pw" placeholder='패스워드 입력'/></td>
				</tr>
				<tr>
					<th>패스워드 확인</th>
					<td><input type=password name='pwOk'  id = "pwOk" placeholder='패스워드 확인'/></td>
				</tr>
				<tr>
					<td colspan=2 align='center'>
						<input class="btn" type=button value='확인' id = "submitCheck"/>
						<input class="btn" type=reset value='취소' onclick = "javascript:history.back()"/> 
					</td>
				</tr>
			</table>
		</form>
	</div>
</center>