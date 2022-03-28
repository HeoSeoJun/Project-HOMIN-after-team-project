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

<div>
	<c:import url="mypage/mypageNav.jsp"></c:import>
	
	<div>
		<h3>주소지 등록</h3>
		<form action="registerAddrProc" method="post">
			<table>
				<tr>
					<td align='right'>우편번호</td>
					<td><input type=text name='zipcode' id="zipcode"	readonly="readonly" /></td>
					<td colspan="2"><input type="button" value="우편번호 검색"		onclick="daumPost()"></td>
				</tr>
				<tr>
					<td align='right'>주소</td>
					<td colspan="3"><input type=text name='addr1' id="addr1" readonly="readonly" style="width: 475px;" /></td>
				</tr>
				<tr>
					<td align='right'>상세주소</td>
					<td colspan="3"><input type=text name='addr2' id="addr2" style="width: 475px;" /></td>
				</tr>
				<tr>
					<td align='center' height=40 colspan=4>
					<input type=submit		value='등록' style="width: 120px;" /> 
					<input type=reset value='취소'	style="width: 120px;" /></td>
				</tr>
			</table>
		</form>
		
	</div>
</div>