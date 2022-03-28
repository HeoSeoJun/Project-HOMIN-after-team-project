<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<style>
	.receipt{margin: 0 auto; width: 100%; display: flex; flex-direction: row; justify-content: center;}
	.product_img{width: 300px; height: 500px;}
	.mainText,#count_time{font-size: 25px; margin-top: 20px; margin-bottom: 15px; margin-left: 300px;}
	.buy_info{margin-top: 60px;}
	td,th{padding-right: 10; padding-bottom: 35px;}
</style>
<script>
	function locationHome() {
		location.replace("${root}index?formpath=home");
	}
	cnt = 10;
	function countdown() {
		if (cnt == 0) {
			locationHome();
		} else {
			document.all.count_time.innerHTML = cnt + "초후에 메인페이지로 이동합니다.";
			setTimeout("countdown()", 1000);
			cnt--;
		}
	}
</script>
<div class = "mainText"><strong>이용해 주셔서 감사합니다.</strong></div>
<div id = "count_time"></div>
<div class = "receipt">
	<div class = "product_img"><img class = "product_img" src = "${root }resources/image/${classification}/${productImg}"></div>
	<div class = "buy_info">
		<table>
			<tr>
				<th>주문번호</th><td>${orderHistory.uid }</td>
			</tr>
			<tr>
				<th>상품명</th><td>${orderHistory.productName }</td>
			</tr>
			<tr>
				<th>가격</th><td>${orderHistory.amount }</td>
			</tr>
			<tr>
				<th>주문자</th><td>${orderHistory.name }</td>
			</tr>
			<tr>
				<th>배송지</th><td>${orderHistory.addr }</td>
			</tr>
			<tr>
				<th>연락처</th><td>${orderHistory.tell }</td>
			</tr>
		</table>
	</div>
</div>
<script>countdown();</script>
