<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/faq.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />   
    
<div>
	<ul>
		<li class = "faq" onclick = "childText('1')">
			제품의 자세한 정보는 어떻게 알 수 있나요?
			<div id = "child1" style="display: none;" class = "child">
				각 제품의 상세 페이지에서 확인 가능합니다.
			</div>
		</li>
		<li class = "faq" onclick = "childText('2')">
			회원가입시 이미 가입된 이메일이라고 표시됩니다. 어떻게 해야하나요?
			<div id = "child2" style="display: none;" class = "child">
				test@test.test으로 문의 부탁드립니다.
			</div>
		</li>
		
	</ul>
</div>