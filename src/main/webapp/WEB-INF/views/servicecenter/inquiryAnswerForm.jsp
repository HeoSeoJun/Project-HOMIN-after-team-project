<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<c:if test = "${sessionScope.id ne 'admin' }">
	<script>
		alert('잘못된 접근입니다.');
		location.href = '${root}index?formpath=servicecenter&list=faq';
	</script>
</c:if>
<center>
	
<table style="width: 800px; ">
	<tr>
		<td style="width: 100px; height:20px;" align="center">no<hr/></td>
		<td style="width: 100px; height:20px;" align="center">문의 유형<hr/></td>
		<td style="width: 150px; height:150px;" align="center">제목<hr/></td>
		<td style="width: 80px; height:20px;" align="center">작성자<hr/></td>
		<td style="width: 100px; height:20px;" align="center">작성 시간<hr/></td>
		<td style="width: 80px; height:20px;" align="center">상태<hr/></td>
	</tr>
	<c:forEach var="list" items="${inquiryList }">
		<tr>
			<td style="width: 100px; height:40px;" align="center">${list.no }</td>
			<td style="width: 100px; height:40px;" align="center">${list.inquiryType }</td>
			<td><div id="${list.no }" class="title"><a href = '${root }index?formpath=servicecenter&list=inquiryViewProc&num=${list.no }'>${list.title }</a></div></td>
			<td style="width: 80px; height:40px;" align="center">${list.id }</td>
			<td style="width: 120px; height:40px;" align="center">${list.writeDate }</td>
			<td style="width: 120px; height:40px;" align="center">${list.state }</td>
		</tr>
	</c:forEach>
	<tr><td colspan=5><hr/></td></tr>
</table>
${page}
<form action="${root }index?formpath=servicecenter&list=inquiryAnswer" method="post">
	<table>
		<tr>
			<td>
			
				<select name="select">
					<option value="waiting">답변 대기중.</option>
					<option value="complete">답변 완료.</option>
				</select>
				<input type=submit name='searchBtn' value='검색' style="width: 80px; "/>
			</td>
		</tr>
	</table>
</form>
</center>