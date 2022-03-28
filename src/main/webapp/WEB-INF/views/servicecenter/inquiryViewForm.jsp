<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<center>
	<form action="" method="post">
		<input type="hidden" name="no" value="${view.no }" />
		<table style="width: 650px;">
			<tr>
				<td style="width: 300px; height: 40px;" valign="middle"><h2>${view.title }</h2></td>
				<td style="width: 350px; height: 40px;" align="right"
					valign="bottom">${view.writeDate }</td>
			</tr>
			<tr>
				<td colspan=2><hr /></td>
			</tr>
			<tr>
				<td style="width: 300px; height: 40px;" valign="top">${view.id }</td>
			</tr>


			<c:forEach var="file" items="${fileName }">
				<tr>
					<td colspan=2 style="width: 650px; height: 300px" valign="top">
						<img src="/img/${file }" style="width: 500px; height: 500px;">
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan=2 valign="top"><pre>${view.content }</pre></td>
			</tr>
			<tr>
				<td colspan=2><hr /></td>
			</tr>
		</table>
	</form>
	<br><br>
	<form action = "${root }inquiryAnswerProc" method = "post">
		<input type = "hidden" name = "no" value = "${view.no }">
		<div>
			<div>
				<c:choose>
					<c:when test="${view.answer ne 'null'}">
						<textarea id="answer" name="answer" cols="50" rows="2" placeholder = "${view.answer }"></textarea>
					</c:when>
					<c:otherwise>
						<textarea id="answer" name="answer" cols="50" rows="2" placeholder = "답변 등록."></textarea>
					</c:otherwise>
				</c:choose>
				<input type="submit" value="답변 등록">
			</div>
		</div>
	</form>
</center>