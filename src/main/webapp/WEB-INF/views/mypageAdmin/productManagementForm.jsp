<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<c:if test = "${sessionScope.id ne 'ADMIN@CARE.COM' }">
	<script>
		alert('잘못된 접근입니다.');
		location.href = '${root}index?formpath=home';
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rental.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css" />
<script>
	function deleteProduct(no){
		if(confirm("정말 삭제하시겠습니까?") == true){
			location.href = '${root}deleteProduct?no='+no;
		}else{
			return;
		}
	}
</script>
<style type="text/css">
#wrap_pdManage {
	margin-top: 20px;
	border: 1px solid gray;
	border-radius: 10px;
	padding: 20 10;
}

#div_title_pdManage {
	margin: 0 0 20 20;
	width: 145px;
}

#div_title_pdManage h1 {
	font-size: 30px;
}

#div_category {
	text-align: center;
}

#div_category input {
	width: 120px;
	height: 30px;
	border-radius: 10px;
	cursor: pointer;
	background-color: transparent;
	margin-right: 10px;
}

#div_category :last-child {
	margin-right: 0;
}

#bottom_pdManage{
	text-align: right;
}

#btnDelete_pdManage {
	width: 60px;
	height: 25px;
	color: red;
	font-weight:bold;
	border-radius: 10px;
	cursor: pointer;
	background-color: transparent;
	margin-left: 120px;
}
</style>


</head>
<div id="wrap_pdManage">
<div id="div_title_pdManage">
	<h1>제품 관리</h1>
	<hr>
</div>

<div id="div_category">
	<input type = "button" value = "건조기" onclick = "location.href='${root }index?formpath=productManagement&category=dryer'">
	<input type = "button" value = "정수기" onclick = "location.href='${root }index?formpath=productManagement&category=waterpurifier'">
	<input type = "button" value = "공기청정기" onclick = "location.href='${root }index?formpath=productManagement&category=aircleaner'">
	<input type = "button" value = "식기세척기" onclick = "location.href='${root }index?formpath=productManagement&category=washmachine'">
	<input type = "button" value = "전기레인지" onclick = "location.href='${root }index?formpath=productManagement&category=microwave'">
	<input type = "button" value = "얼음정수기냉장고" onclick = "location.href='${root }index?formpath=productManagement&category=refrigerator'">
</div>
<%-- <c:import url="/${category }" /> --%>
<section class="container-home-section">
<c:forEach var="pr" items="${product }">
	<div class="main-product-list-in">
		<ul>
			<li>
				<div class="main-product-text ">
					<div class="main-product-tex-in ">
						<img src="${root }resources/image/${pr.classification }/${pr.product_filename}" >
					</div>
					<div>
						<div class="pro-category">${pr.product_no }</div>
						<div class="pro-name">${pr.product_name }</div>
						<div class="pro-price">
							<div id="bottom_pdManage">
								<span>월</span> <span>${pr.price }</span> <span>원</span>
								<input id="btnDelete_pdManage" type = "button" onclick = "deleteProduct('${pr.product_no}')" value = "삭제">
							</div>
						</div>
					</div>
				</div>						
			</li>	
		</ul>
	</div>
</c:forEach>
</section>
</div>
</html>