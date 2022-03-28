<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/faq.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />   

<div>
	<ul>
		<li class = "faq" onclick = "childText('1')">
			주문을 취소하고 싶어요.
			<div id = "child1" style="display: none;" class = "child">
				상품 배송이 시작되기 전이라면 마이페이지를 통해 주문을 취소할 수 있습니다.
				배송이 시작되었다면 상품을 받은 후 반품 신청을 해주셔야 합니다.
			</div>
		</li>
		<li class = "faq" onclick = "childText('2')">
			주문 취소 또는 반품 신청시 환불은 언제 되나요?
			<div id = "child2" style="display: none;" class = "child">
				신청일로부터 평일 기준 3~7일 이내 환불됩니다.
			</div>
		</li>
	</ul>
</div>