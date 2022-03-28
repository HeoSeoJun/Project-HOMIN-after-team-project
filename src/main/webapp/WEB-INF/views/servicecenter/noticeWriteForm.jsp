<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/faq.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />
</head>
<body>
	<div class="inquiry_test">
		<div class="inquiry_test_head">
			<div>
				<h3>공지사항 등록</h3>
					
			</div>
		</div>
		<hr>
		<form action = "${root}noticeWriteProc" method="post" id = "f">
		<div>
			<div class="inquiry_test_type" >
				<div class="inquiry_test_type_p">
			
					<p>공지 분류</p>
				</div>
				<div>
				
					<select class="inquirytype_rightside" name = "division" >
						<option value = "system">시스템</option>
						<option value = "event">이벤트</option>
						<option value = "product">상품</option>
						<option value = "service">서비스</option>
						<option value = "etc">기타</option>
					</select>
				</div>
			</div>
			<div class=" main_inquirytype_title" >
				<div class="inquiry_test_type_p" >
					<p>제목</p>
				</div>
				<div >
					<input class="inquirytype_title_textarea" type = "text" name = "title" id = "title" placeholder = "제목 입력" >
				</div>
			</div>
			<div style="display: flex; flex-direction: row; margin-top: 50px;">
				<div class="inquiry_test_type_p">
					<p>내용</p>
				</div>
				<div class="inquirytype_text">
					<textarea  class="inquirytype_text_textarea" name = "content" id = "content" placeholder = "내용 입력"></textarea>
				</div>
			</div>
		</div>
		<div class="cus_under_btn">
			<input class="cus_under_btn_input" type = "submit"value = "등록">
		</div>
		</form>
	</div>
</body>
</html>