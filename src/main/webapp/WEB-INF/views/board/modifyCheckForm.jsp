<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<c:if test="${msg ne null }">
	<script>alert('${msg}');</script>
</c:if>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		$("#submitCheck").click(function() {
			var pw = $('#pw').val();
			var pwOk = $('#pwOk').val();
			
			if(pw == ''){
				$('#pw').focus();
				return;
			}
			if(pwOk == ''){
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
<center>
<form action="boardModify" method="post" id = "f">
<input type="hidden" name="no" value="${no }" />
<table>
	<tr>
		<td>패스워드 </td>
		<td><input type=password name='pw' id = "pw" placeholder='PW 입력'/></td>
	</tr>
	<tr>
		<td>패스워드 확인</td>
		<td><input type=password name='pwOk'  id = "pwOk" placeholder='PW 입력'/></td>
	</tr>
	<tr>
		<td colspan=2 align='center'>
			<input type=button value='확인' style="width: 86px; " id = "submitCheck"/>
			<input type=reset value='취소' onclick = "javascript:history.back()" style="width: 86px; "/> 
		</td>
	</tr>
</table>
</form>
</center>