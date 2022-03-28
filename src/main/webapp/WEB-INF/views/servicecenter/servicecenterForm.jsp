<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />
<title>Insert title here</title>

	
</head>
<script>
	function childText(num) {
		var text = document.getElementById("child"+num);
        text.style.display = (text.style.display != 'none') ? "none" : "block";
	}
</script>
<body>
	<section class="sub_header_section" style="margin-top: 20px;">
        <h2>고객센터</h2>
		<br><br>
		<div class="sub_header_section_article">
			<article class="sub_header_section_article_contact">
				<address style="line-height: 57px;">
					운영시간 : 평일 08:00 ~ 19:00 (주말 &amp; 공휴일 제외)
					<br>
					점심시간 : 12:00 ~ 13:00
					<br>
					이메일 : 
					<a href="contact/new##" style="text-decoration : underline;">이메일 문의하기</a>
					
					<br>
					전화 :
					<a href="tel:1670-0876" style="text-decoration: underline; color: rgb(73, 10, 133);">1544-0099</a>
				</address>

			</article>
			<article class="sub_header_section_article_faq">
				<ul class="sub_header_section_faq_list">
					<li>
						<a class="sub_header_section_faq_item" href = '${root}index?formpath=servicecenter&list=faq'  >FAQ</a>
					</li>
					<c:choose>
						<c:when test="${sessionScope.id eq 'admin' }">
							<li>
								<a class="sub_header_section_faq_item" href='${root}index?formpath=servicecenter&list=inquiryAnswer'>1:1 문의</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a class="sub_header_section_faq_item" href='${root}index?formpath=servicecenter&list=inquiry'>1:1 문의</a>
							</li>
						</c:otherwise>
					</c:choose>
					<li>
						<a class="sub_header_section_faq_item" href='${root}index?formpath=servicecenter&list=notice'>공지사항</a>
					</li>
					<li>
						<a class="sub_header_section_faq_item" href="${root}boardProc">후기 게시판</a>
					</li>
				</ul>
			</article>
		</div>
       
      </section>
	<div class = "wrap">
		
		<div class = "under_wrap">
			<c:choose>
				<c:when test="${list eq 'inquiry' || list eq 'inquiryAnswer' || list eq 'inquiryViewProc'}">
					<h1 class="servicecenter_main_title">1:1문의</h1>
				</c:when>
				<c:when test="${list eq 'notice' || list eq 'noticeView' || list eq 'noticeWrite' || list eq 'modifyNotice'}">
					<h1 class="servicecenter_main_title"style="display:none">공지사항</h1>
				</c:when>
				<c:otherwise>
				
					<h1 class="servicecenter_main_title">FAQ</h1>
					<div class="content_row_1">
					<div class = "faq_button">
						<button class = "bt" onclick = "location.href = '${root}index?formpath=servicecenter&list=faq'">회원</button>
						<button class = "bt" onclick = "location.href = '${root}index?formpath=servicecenter&list=faqOrder'">주문/신청</button>
						<button class = "bt" onclick = "location.href = '${root}index?formpath=servicecenter&list=faqProduct'">상품</button>
						<button class = "bt" onclick = "location.href = '${root}index?formpath=servicecenter&list=faqDelivery'">배송</button>
						<button class = "bt" onclick = "location.href = '${root}index?formpath=servicecenter&list=faqExchange'">교환/환불/반품</button>
						<button class = "bt" onclick = "location.href = '${root}index?formpath=servicecenter&list=faqEtc'">기타</button>
					</div>
				</c:otherwise>
			</c:choose>
			
			<c:import url="/${list }" />
		</div>
	</div>
</body>
</html>