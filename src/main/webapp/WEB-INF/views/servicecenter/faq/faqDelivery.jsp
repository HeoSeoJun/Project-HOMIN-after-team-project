<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/faq.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />   
    
<div>
	<ul>
		<li class = "faq" onclick = "childText('1')">
			배송비는 얼마인가요?
			<div id = "child1" style="display: none;" class = "child">
				1만원 이상 구매 시 무료입니다.
			</div>
		</li>
		<li class = "faq" onclick = "childText('2')">
			배송은 얼마나 걸리나요?
			<div id = "child2" style="display: none;" class = "child">
				택배사 휴무일과 공휴일 제외하고 2~5일 정도 소요됩니다.
			</div>
		</li>
	</ul>
</div>