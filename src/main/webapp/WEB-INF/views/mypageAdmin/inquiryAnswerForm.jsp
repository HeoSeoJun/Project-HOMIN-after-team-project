<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<style>
#center_inquiryAnswer {
	margin: 20 20 0 20;
	border: 1px solid gray;
	border-radius: 10px;
	padding: 20 0;
}

#table_inquiryAnswer {
	width: 500px;
	margin-bottom: 10px;
}

#table_inquiryAnswer caption {
	font-size: 30px;
	margin-bottom: 20px;
}

#table_inquiryAnswer tr {
	line-height: 40px;
}

#table_inquiryAnswer td {
	text-align: center;
}

#tr_content {
	line-height: 150px;
}

#td_img {
	padding-bottom: 20px;
}

.class_img {
	height: 100px;
}

#answer_inquiryAnswer {
	width: 500px;
	margin-bottom: 15px;
}

#answer_inquiryAnswer textarea {
	width: 400px;
	resize: none;
}

.btn_bottom_inquiryAnswer {
	width: 80px;
	height: 30px;
	border-radius: 5px;
	cursor: pointer;
}

#div_backBtn {
	width: 500px;
}

</style>

<center id="center_inquiryAnswer">
	<table id="table_inquiryAnswer">
		<caption>1:1문의 내용 및 답변 등록</caption>
		<tr>
			<th>제 목</th><td>${view.title }</td>
		</tr>
		<tr>
			<td colspan=2><hr/></td>
		</tr>
		<tr>
			<th>문의자</th>
			<td>${view.id }</td>
		</tr>
		<tr>
			<td colspan=2><hr/></td>
		</tr>
		<tr>
			<th>문의날짜</th>
			<td>${view.writeDate }</td>
		</tr>
		<tr>
			<td colspan=2><hr/></td>
		</tr>
		<tr>
			<th colspan=2>문의내용 및 첨부사진</th>
		</tr>
		<tr>
			<td colspan=2><hr/></td>
		</tr>
		<tr>
			<td colspan=2><pre id="tr_content">${view.content }</pre></td>
		</tr>
		<tr>
			<td id="td_img" colspan=2>
				<c:forEach var="file" items="${fileName }">
					<img class="class_img"src="/img/${file }">
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td colspan=2><hr /></td>
		</tr>
	</table>
		
	<div id="answer_inquiryAnswer">
		<form action = "inquiryAnswerProc" method = "post">
		<input type = "hidden" name = "no" value = "${view.no }">
			<c:choose>
				<c:when test="${view.answer ne 'null' }">
					<textarea id="answer" name="answer" placeholder = "${view.answer }"></textarea>
				</c:when>
				<c:otherwise>
					<textarea id="answer" name="answer" placeholder = "답변 등록."></textarea>
				</c:otherwise>
			</c:choose>
			<input class="btn_bottom_inquiryAnswer" type="submit" value="답변 등록">
		</form>
	</div>
	
	<div id="div_backBtn">
		<input class="btn_bottom_inquiryAnswer" type="button" value="목 록" onclick="window.history.back();">
	</div>
</center>