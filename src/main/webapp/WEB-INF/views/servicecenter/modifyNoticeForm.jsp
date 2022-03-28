<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/faq.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="inquiry_test">
		<div class="inquiry_test_head">
			<div>
				<h3>공지사항 등록</h3>
					
			</div>
		</div>
		<hr>
		<form action = "${root}noticeModifyProc?num=${dto.no}"  method="post" id = "f">
		<div>
			<div class="inquiry_test_type" >
				<div class="inquiry_test_type_p">
			
					<p>공지 분류</p>
				</div>
				<div>
				
					<select class="inquirytype_rightside" name = "division" >
					<c:choose>
						<c:when test="${dto.division eq 'system' }">
							<option value = "system" selected="selected">시스템</option>
							<option value = "event">이벤트</option>
							<option value = "product">상품</option>
							<option value = "service">서비스</option>
							<option value = "etc">기타</option>
						</c:when>
						<c:when test="${dto.division eq 'event' }">
							<option value = "system" >시스템</option>
							<option value = "event" selected="selected">이벤트</option>
							<option value = "product">상품</option>
							<option value = "service">서비스</option>
							<option value = "etc">기타</option>
						</c:when>
						<c:when test="${dto.division eq 'product' }">
							<option value = "system">시스템</option>
							<option value = "event">이벤트</option>
							<option value = "product" selected="selected">상품</option>
							<option value = "service">서비스</option>
							<option value = "etc">기타</option>
						</c:when>
						<c:when test="${dto.division eq 'service' }">
							<option value = "system">시스템</option>
							<option value = "event">이벤트</option>
							<option value = "product">상품</option>
							<option value = "service" selected="selected">서비스</option>
							<option value = "etc">기타</option>
						</c:when>
						<c:otherwise>
							<option value = "system">시스템</option>
							<option value = "event">이벤트</option>
							<option value = "product">상품</option>
							<option value = "service">서비스</option>
							<option value = "etc" selected="selected">기타</option>
						</c:otherwise>
					</c:choose>
					</select>
				</div>
			</div>
			<div class=" main_inquirytype_title" >
				<div class="inquiry_test_type_p" >
					<p>제목</p>
				</div>
				<div >
					<input class="inquirytype_title_textarea" type = "text" name = "title" id = "title" value = "${dto.title }" >
				</div>
			</div>
			<div style="display: flex; flex-direction: row; margin-top: 50px;">
				<div class="inquiry_test_type_p">
					<p>내용</p>
				</div>
				<div class="inquirytype_text">
					<textarea  class="inquirytype_text_textarea" name = "content" id = "content">${dto.content }</textarea>
				</div>
			</div>
		</div>
		<div class="cus_under_btn">
			<input class="cus_under_btn_input" type = "submit"value = "수정">
		</div>
		</form>
	</div>
</body>
</html>