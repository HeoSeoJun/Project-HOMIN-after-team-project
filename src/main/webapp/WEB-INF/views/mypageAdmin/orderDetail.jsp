<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/"></c:url>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>
<script>
	function orderCancle(uid){
		 if (confirm("주문을 취소하시겠습니까?")){
			 $.ajax({
				url : "orderCancle",
				type : "POST",
				data : uid,
				success : function(){
					alert("주문 취소 완료");
					location.href='${root}index?formpath=orderManagement';
				},
				error : function(){
					alert("문제 발생");
				}
			 })
		 }
	}
	function modifyOrder(){
		if(confirm("주문 정보를 수정하시겠습니까?")){
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
#center_orderDetail {
	margin: 20 20 0 20;
	border: 1px solid gray;
	border-radius: 10px;
	padding: 20 0;
}

#table_orderDetail {
/* 	width: 400px; */
}

#table_orderDetail caption {
	font-size: 30px;
	margin-bottom: 20px;
}

#table_orderDetail tr {
	line-height: 40px;
}

#table_orderDetail th {
	font-size: 20px;
	padding-right: 10px;
}

#table_orderDetail td {
	vertical-align: middle; 
}

.td_orderDetail {
	padding-bottom: 10px;
}

.txt_input_orderDetail {
	width: 200px;
	height: 30px;
	border-radius: 5px;
}

.btn_input_orderDetail {
	padding-left: 10px;
}

.btn_bottom_orderDetail {
	width: 80px;
	height: 25px;
	border-radius: 5px;
	cursor: pointer;
}

#btn_post_orderDetail {
	border-radius: 5px;
	cursor: pointer;
}
</style>

<center id="center_orderDetail">
	<div>
		<form id = "f" action = "modifyOrderByAdmin" method="post">
		<table id="table_orderDetail">
			<caption>주문 상세 내역</caption>
				<tr>
					<th>주문번호</th>
					<td><input class="txt_input_orderDetail" type = "text" value = "${order.uid}" name = "uid" readonly></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input class="txt_input_orderDetail" type = "text" value = "${order.buyer_id}" name = "buyer_id" readonly></td>
				</tr>
				<tr><td class="td_orderDetail" colspan="3"><hr></td></tr>
				<tr>
					<th>주문자</th><td><input class="txt_input_orderDetail" type = "text" value = "${order.name } "name = "name" readonly></td>
				</tr>
				<tr><td class="td_orderDetail" colspan="3"><hr></td></tr>
				<tr>
					<th>전화번호</th><td><input class="txt_input_orderDetail" type = "text" value = "${order.tell } "name = "tell"></td>
				</tr>
				<tr><td class="td_orderDetail" colspan="3"><hr></td></tr>
				<tr>
					<th>이메일</th><td><input class="txt_input_orderDetail" type = "text" value = "${order.email } "name = "email"></td>
				</tr>
				<tr><td class="td_orderDetail" colspan="3"><hr></td></tr>
				<tr>
					<th>우편번호</th>
					<td><input class="txt_input_orderDetail" type = "text" value = "${order.postcode }" name = "zipcode"  id = "zipcode" readonly></td>
					<td class="btn_input_orderDetail" ><input id="btn_post_orderDetail" type="button" style="height:30px;" value="우편번호 검색" onclick="daumPost()"></td>
				</tr>
				<tr><td class="td_orderDetail" colspan="3"><hr></td></tr>
				<tr>
					<th>배송지</th><td><input class="txt_input_orderDetail" type = "text" value = "${order.addr }" name = "addr1" id = "addr1" readonly></td>
				</tr>
				<tr><td class="td_orderDetail" colspan="3"><hr></td></tr>
				<tr>
					<th>상세주소</th><td><input class="txt_input_orderDetail" type = "text" name = "addr2" id = "addr2"></td>
				</tr>
				<tr><td class="td_orderDetail" colspan="3"><hr></td></tr>
				<tr>
					<td colspan="3" align="center">
						<input class="btn_bottom_orderDetail" type = "button" value = "수정" onclick = "modifyOrder()">
						<input class="btn_bottom_orderDetail" type = "button" value = "주문취소" onclick = "orderCancle('${order.uid}')">
						<input class="btn_bottom_orderDetail" type = "button" value = "이전" onclick = "window.history.back()">
					</td>
				</tr>
		</table>
		</form>
	</div>
</center>