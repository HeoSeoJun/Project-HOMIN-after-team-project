<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/"></c:url>
<style>
#wrap_inquiry {
	padding-top: 20px;
}

#box_title_inquiry {
	width:600;
	margin-bottom: 30px;
}

#wrap_inquiry h3 {
	font-size: 40;
}

#wrap_inquiry p {
	margin-bottom: 15px;
}

#table_inquiry {
	padding-left: 400;
}

#table_inquiry table {
	width: 600;
}

#table_inquiry table thead {
	font-size: 20;
	line-height: 50px;
}

#table_inquiry table tbody tr {
	line-height: 30px;
}
</style>

<div id="wrap_inquiry">
	<c:choose>
		<c:when test="${myinquiry eq '[]' }">
			<script>
				alert('문의 내역이 없습니다.');
				location.href='${root }index?formpath=mypage&category=mypageIndex';
			</script>
		</c:when>
		<c:otherwise>
			<div id="box_title_inquiry">
				<h3>1:1 문의 목록</h3>
				<hr>
			</div>
			<p>HOM`IN 홈페이지에서 문의 정보를 확인할 수 있습니다.</p>
			<div id="table_inquiry">
				<c:forEach var="list" items="${myinquiry }">
					<table>
						<thead>
							<tr>
								<th>문의 제목</th><th>문의 날짜</th><th>답변상태</th>
							</tr>
							<tr><td colspan="3"><hr></td></tr>
						</thead>
						<tbody>
							<tr>
								<td><a href = "/homin/index?formpath=mypage&category=myinquiryView&no=${list.no }">${list.title }</a></td>
								<td>${list.writeDate }</td>
								<c:choose>
									<c:when test = "${list.state eq 'waiting'}">
										<td>답변 대기중</td>
									</c:when>
									<c:otherwise>
										<td>답변 완료</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</tbody>		
					</table>
				</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>
</div>
