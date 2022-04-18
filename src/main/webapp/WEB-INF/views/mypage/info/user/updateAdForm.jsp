<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function daumPost() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = '';
				
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
				
             	// 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
			}
		}).open();
	}
</script>
<style>
#div_updateAdForm {
	padding-top: 20px;
}

#div_AdForm {
	padding-top: 20px;
}

#hd_AdForm {
	width: 520px;
	margin-bottom: 30px;
}

#hd_AdForm h3 {
	font-size: 30px;
} 

#div_AdForm table th, td{
	vertical-align: middle;
	line-height: 40px;
	padding-right: 20px;
}

#div_AdForm table th {
	padding-left: 40px;
}

#div_AdForm table input {
	border-radius: 5px;
}

.txt_input {
	width: 400px;
}

.btn_search {
	width: 120px;
	height: 20px;
	cursor: pointer;
}

.btn_bottom {
	width: 80px;
	height: 25px;
	cursor: pointer;
}
</style>

<div id="div_updateAdForm">
	<c:import url="mypage/mypageNav.jsp"></c:import>
	
	<div id="div_AdForm">
		<div id="hd_AdForm">
			<h3>주소지 수정</h3>
			<hr>
		</div>
		<form action="updateAdProc" method="post">
			<table>
				<tr>
					<th>우편번호</th>
					<td><input class="txt_input" type=text name='zipcode' id="zipcode"	readonly="readonly" /></td>
					<td><input class="btn_search" type="button" value="우편번호 검색"		onclick="daumPost()"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input class="txt_input" type=text name='addr1' id="addr1" readonly="readonly"/></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td><input class="txt_input" type=text name='addr2' id="addr2"/></td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<input class="btn_bottom" type=submit	value='수정'/> 
						<input class="btn_bottom" type="button" value='취소' onclick="window.history.back();"/>
					</td>
				</tr>
			</table>
		</form>
		
	</div>
</div>