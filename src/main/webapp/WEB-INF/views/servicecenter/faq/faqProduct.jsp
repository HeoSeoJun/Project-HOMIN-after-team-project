<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/faq.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />   

<div>
	<ul>
		<li class = "faq" onclick = "childText('1')">
			납부방법을 변경하고 싶어요.
			<div id = "child1" style="display: none;" class = "child">
				마이페이지에서 카드변경 가능합니다.
			</div>
		</li>
		<li class = "faq" onclick = "childText('2')">
			월 요금 자동이체 결제일은 언제인가요?
			<div id = "child2" style="display: none;" class = "child">
				신용카드, 체크카드 모두 최초 결제일은 10일입니다.첫 결제 후 15일, 20일, 25일 중 하나로 변경 할 수 있습니다.
			</div>
		</li>
	</ul>
</div>