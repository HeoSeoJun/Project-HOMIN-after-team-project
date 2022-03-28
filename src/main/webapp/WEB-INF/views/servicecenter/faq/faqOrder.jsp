<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/faq.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />   

<div>
	<ul>
		<li class = "faq" onclick = "childText('1')">
			주문 내역은 어떻게 확인할 수 있나요?
			<div id = "child1" style="display: none;" class = "child">
				우측 상단 마이페이지에서 확인 가능합니다.
			</div>
		</li>
		<li class = "faq" onclick = "childText('2')">
			결제 방법은 어떤 것이 있나요?
			<div id = "child2" style="display: none;" class = "child">
				신용카드 및 체크카드 사용 가능합니다.
			</div>
		</li>
	</ul>
</div>