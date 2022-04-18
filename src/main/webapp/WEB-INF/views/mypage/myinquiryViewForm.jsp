<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="/"></c:set>
<script>
	function deleteInquiry() {
		if(confirm("정말 삭제하시겠습니까?") == true){
			location.href='/homin/deleteInquiry?inquiryNo=${inquiryView.no}';
		}else{
			return false;
		}
	}
</script>
<style>
.inquiry_test {
	width: 1100px;
	padding-top: 20;
}
.inquiry_test h3 {
	font-size: 35;
	margin-bottom: 40px;
}

.inquiry_row {
	margin-bottom: 30px;
}

.inquiry_subject {
	float: left; margin-right: 100px;
	font-weight: bold;
}

#box_btn_inquiry .cus_under_btn	{
	width: 75; height: 30; font-size: 15; border-radius:10px; cursor: pointer;
}

#box_btn_inquiry .cus_under_btn:last-child {
	margin-left: 10;
}

</style>

<div class="inquiry_test">
	<h3>1:1 문의</h3>
	
	<div class="inquiry_row">
		<div class="inquiry_subject">
			<p>문의 유형</p>
		</div>
		<div>
			<c:choose>
				<c:when test="${inquiryView.inquiryType eq 'member' }">
					<div>회원</div>
				</c:when>
				<c:when test="${inquiryView.inquiryType eq 'order' }">
					<div>주문/신청</div>
				</c:when>
				<c:when test="${inquiryView.inquiryType eq 'product' }">
					<div>상품</div>
				</c:when>
				<c:when test="${inquiryView.inquiryType eq 'delivery' }">
					<div>배송</div>
				</c:when>
				<c:when test="${inquiryView.inquiryType eq 'exchange' }">
					<div>교환/환불/반품</div>
				</c:when>
				<c:when test="${inquiryView.inquiryType eq 'etc' }">
					<div>기타</div>
				</c:when>
			</c:choose>
		</div>
		<hr>
	</div>
	
	<div class="inquiry_row">
		<div class="inquiry_subject">
			<p>문의 제목</p>
		</div>
		<div>
			${inquiryView.title }
		</div>
		<hr>
	</div>
	
	<div class="inquiry_row">
		<div class="inquiry_subject">
			<p>문의 내용</p>
		</div>
		<div class="inquirytype_text">
			${inquiryView.content }
		</div>
		<hr>
	</div>
	
	<div class="inquiry_row">
		<div class="inquiry_subject">
			<p>첨부 사진</p>
		</div>
		<div class=" main_inquirytype_photo">
			<c:forEach var="img" items="${inquiryImg }">
				<div>
					<img src = "/img/${img }" style="width: 100px; height: 100px;">
				</div>
			</c:forEach>
		</div>
		<hr>
	</div>
		
	<div class="inquiry_row">
		<div class="inquiry_subject">
			<p>답변 상태</p>
		</div>
		<div class="cus_under_box">
			<c:choose>
				<c:when test="${inquiryView.answer eq 'null' }">
					<p>답변 대기중 입니다.</p>
				</c:when>
				<c:otherwise>
					<p>${inquiryView.answer }</p>
				</c:otherwise>
			</c:choose>
		</div>
		<hr>
	</div>
	
	<div id="box_btn_inquiry" align="right">
		<input class="cus_under_btn" type = "button" value="삭 제" onclick = "deleteInquiry();">
		<input class="cus_under_btn" type="button" id="writeBtn" value="목 록" onclick="window.history.back();">
	</div>
</div>