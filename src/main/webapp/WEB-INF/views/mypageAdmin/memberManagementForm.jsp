<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<c:if test="${not empty msg }">
	<script>
		alert('${msg}');
// 		location.href='${root}index?formpath=rental&category=dryer'
	</script>
</c:if>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
'use strict';
	function selectNo(obj) {
		var no = $(obj).val();
		location.href='${root}index?formpath=memberManagement?no='+no;
	}
	
</script>
<style>
#center_mbManageForm {
	margin: 20 20 0 20;
	border: 1px solid gray;
	border-radius: 10px;
	padding: 20 0;
}

#table_mbManageForm {
	width: 700px;
}

#table_mbManageForm #title_table {
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 20px;
}

#table_mbManageForm #select_table {
	text-align: right;
}

#table_mbManageForm tr {
	line-height: 40px;
}

#table_mbManageForm th {
	font-size: 20px;
}

#table_mbManageForm td {
	text-align: center;
}

#paging_mbManageForm {
	margin-bottom: 10px;
}

#div_select_mbManageForm {
	width: 700px;
}

#div_select_mbManageForm select {
	width: 80px;
	height: 25px;
}

#div_select_mbManageForm #submit_ {
	width: 80px;
	height: 20px;
	border-radius: 5px;
	cursor: pointer;
}

</style>

<center id="center_mbManageForm">
	<div>
		<table id="table_mbManageForm">
			<caption id="title_table">HOM`IN 전체 회원</caption>
			<caption id="select_table">페이지 당
				<select id="noPerPage" name="noPerPage" onchange="selectNo(this);">
					<option value="">개수 선택</option>
					<option value="1">1개 씩</option>
					<option value="2">2개 씩</option>
					<option value="3">3개 씩</option>
					<option value="4">4개 씩</option>
					<option value="5">5개 씩</option>
				</select>
			</caption>
			<thead>
				<tr>
					<th>번 호</th><th>아이디</th><th>이 름</th><th>전화번호</th><th>이메일</th>
				</tr>
				<tr><td colspan="5"><hr></td></tr>
			</thead>
			<tbody>
				<c:forEach var="list" begin="${pageConf.startNum }" end="${pageConf.startNum+pageConf.numPerPage-1}" items="${member }" >
				<tr>
					<td>${list.no }</td>
					<td><a href = "${root }index?formpath=memberView&id=${list.id}">${list.id }</a></td>
					<td>${list.nickname }</td>
					<td>${list.phone }</td>
					<td>${list.email }</td>
				</tr>
				</c:forEach>
			</tbody>
			<tr><td colspan=5><hr/></td></tr>
		</table>
	</div>
	
	<div id="paging_mbManageForm">
		<c:if test="${pageConf.presentPage ne 1 }">
		<a href="${root }index?formpath=memberManagement?presentPage=${pageConf.presentPage-1 }">이전</a>
		</c:if>
		<c:forEach var="page" begin="1" end="${pageConf.totalPages }">
			<a href="${root }index?formpath=memberManagement?presentPage=${page }">${page }</a>
		</c:forEach>
		<c:if test="${pageConf.presentPage ne pageConf.totalPages }">
			<a href="${root }index?formpath=memberManagement?presentPage=${pageConf.presentPage+1 }">다음</a>
		</c:if>
	</div>
	
	<div id="div_select_mbManageForm">
		<form id="f" action="${root }index?formpath=memberManagement?mode=search" method="post">
			<select name="find">
				<option value="all">전 체</option>
				<option value="id">아이디</option>
				<option value="tel">전화번호</option>
			</select>
		<input id="text_" type=text name='search'/>
		<input id="submit_" type="submit" name='searchBtn' value='검 색'/>
	</form>
	</div>
	
</center>
	
