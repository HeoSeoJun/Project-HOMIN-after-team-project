<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css" /> 
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<c:if test="${not empty msg }">
	<script>
		alert('${msg}');
		location.href='${root}index?formpath=home';
	</script>
</c:if>
<script>
'use strict';
	var totalPrice = 0;
	function allCheck() {
		var len = document.getElementsByName("box");
		if(document.getElementById("all").checked==true){
	    	for(var i=0; i < len.length; i++) {
	    		len[i].checked=true;  
	    		totalPrice += Number(document.getElementById("pr"+i).value);
	    		document.getElementById('count').innerText = len.length;
	    		document.getElementById('price').innerText = totalPrice;
	    	}
	    }
		
		if (document.getElementById("all").checked==false){
	    	for(var i=0;i<len.length;i++) {
	   			len[i].checked=false; 
	   			totalPrice = 0;
	    		document.getElementById('price').innerText = 0;
	    		document.getElementById('count').innerText = 0;
	    	}
	    }		
	} // allCheck
	
	function getCheckedPrice(no){
		var len = document.getElementsByName("box");
        if (document.getElementsByName("box")[no].checked == true) {
        	totalPrice += Number(document.getElementById("pr"+no).value);
	    	document.getElementById('price').innerText = totalPrice;
        }else{
        	totalPrice -= Number(document.getElementById("pr"+no).value);
   	       	document.getElementById('price').innerText = totalPrice;		
        }
	} // getCheckedPrice
	
	function getCheckedCnt()  {
		  // 선택된 목록 가져오기
		  const query = 'input[name="box"]:checked';
		  const selectedElements = 
		      document.querySelectorAll(query);
		  // 선택된 목록의 갯수 세기
		  const selectedElementsCnt =
		        selectedElements.length;
		  // 출력
		  document.getElementById('count').innerText
		    = selectedElementsCnt;
	} // getCheckedCnt
	
	function sumCheck(no){
// 		var len = document.getElementsByName("box").length;
		if(document.getElementsByName("box")[no].checked == false){
			$("input:checkbox[id='all']").prop("checked", false);
		}
		
		getCheckedCnt();
		getCheckedPrice(no);
	} // sumCheck
	
	function check(){
		const query = 'input[name="box"]:checked';
		 const selectedElements = 
		     document.querySelectorAll(query);
		 const selectedElementsCnt =
		       selectedElements.length;
		 if(selectedElementsCnt == 0 || selectedElementsCnt == ''){
		  alert('하나 이상 선택해주세요.');
		 } else {
		  var arrPr = [];
		  var len = document.getElementsByName("box").length;
		  for(var i = 0; i < len; i ++){
			  if(document.getElementsByName("box")[i].checked == true){
				  arrPr.push(document.getElementsByName("box")[i].value);
			  }
		  }
		  location.href="${root}index?formpath=basketOrder&prNo="+arrPr;
		 }
	} // check
</script>

<style>
input{appearance:auto;}

#div_mybasket {
	padding-top: 20px;
}

#div_mybasket h3 {
	font-size: 40px;
	margin-bottom: 15px;
}

#div_mybasket table {
	width: 800px;
}

#div_mybasket table thead {
	line-height : 40px;
	font-size: 18px;
}

#div_mybasket table thead input {
	vertical-align: middle;
}

#div_mybasket table tbody {
	text-align: center;
}

#div_mybasket table td {
	vertical-align: middle;
}

#but_deleteBasket {
	width: 50px; height: 25px;
	border-radius: 5px;
}



.tr_totalCount {
	line-height: 40px;
}

#but_apply {
	width: 80px; height: 30;
	border-radius: 5px;
}
	
</style>
<div id="div_mybasket">

	<h3>장바구니</h3>
	<table>
		<thead>
			<tr>
				<td colspan="7" align="left"><input type ="checkbox" onclick = "allCheck()" id = "all">전체선택</td>
			</tr>
			<tr>
				<th>선택</th>
				<th>제품분류</th>
				<th>제품사진</th>
				<th>제품번호</th>
				<th>제품명</th>
				<th>가격</th>
				<th>삭제</th>
			</tr>
			<tr><td colspan="7"><hr></td></tr>
		</thead>
		
		<tbody id="tbody_basket">
			<c:set var="total" value="0"></c:set>
			<c:set var="prNo" value="0"></c:set>
			<c:forEach var="bDto" items="${basket }">
			<tr>
<%-- 				<td><input type = "checkbox" id = "pr${prNo }" name = "box"  onclick='sumCheck(${prNo})' value = "${bDto.price }"></td> --%>
				<td><input type = "checkbox" id = "pr${prNo }" name = "box"  onclick='sumCheck(${prNo})' value = "${bDto.price }"></td>
				<c:choose>
					<c:when test="${bDto.classification eq 'dryer' }">	
						<td>건조기</td>
					</c:when>
					<c:when test="${bDto.classification eq 'waterpurifier' }">
						<td>정수기</td>
					</c:when>
					<c:when test="${bDto.classification eq 'aircleaner' }">
						<td>공기청정기</td>
					</c:when>
					<c:when test="${bDto.classification eq 'washmachine' }">
						<td>식기세척기</td>
					</c:when>
					<c:when test="${bDto.classification eq 'microwave' }">
						<td>전기레인지</td>
					</c:when>
					<c:otherwise>
						<td>얼음정수기/냉장고</td>
					</c:otherwise>
				</c:choose>
				<td><img src = "${root }resources/image/${bDto.classification}/${bDto.product_img}" style="width: 80px"></td>
				<td>${bDto.product_no }</td>
				<td style="cursor: pointer;" onclick = "location.href='${root}index?formpath=product&category=${bDto.classification }&prodNo=${bDto.product_no }'"><strong>${bDto.product_name }</strong></td>
				<td>${bDto.price }</td>
<%-- 				<td>${bDto.price }</td> --%>
				<td><input id="but_deleteBasket" type="button" value="삭제" onclick="location.href='deleteBasket?no=${bDto.product_no}';"></td>
			</tr>
				<c:set var="total" value="${total + bDto.price }"></c:set>
				<c:set var="prNo" value="${prNo + 1 }"></c:set>
			</c:forEach>
				<tr>
					<td colspan="7"><hr></td>
				</tr>
				<tr class="tr_totalCount">
					<td colspan="5" align="right">총 개수 : </td><td align="right"><label id = "count">0</label></td><td align="right">개의 상품</td>
				</tr>
				<tr class="tr_totalCount">
<!-- 					<td colspan="5" align="right">총 금액 : </td><td align="right"><label id = "price" ></label></td><td align="center">원 / 월</td> -->
					<td colspan="5" align="right">총 금액 : </td><td align="right"><label id = "price" >0</label></td><td align="center">원 / 월</td>
				</tr>
				<tr><td colspan="7" align="right"><input id="but_apply" type="button" value="신청하기" onclick = "check()"></td></tr>
				
		</tbody>
	</table>
</div>