<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rental.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css" />
</head>
<script>
	function deleteProduct(no){
		if(confirm("정말 삭제하시겠습니까?") == true){
			location.href = '${root}deleteProduct?no='+no;
		}else{
			return;
		}
	}
</script>
<body>
제품관리
<div>
	<span><input type = "button" value = "건조기" onclick = "location.href='${root }index?formpath=productManagement&category=dryer'"></span>
	<span><input type = "button" value = "정수기" onclick = "location.href='${root }index?formpath=productManagement&category=waterpurifier'"></span>
	<span><input type = "button" value = "공기청정기" onclick = "location.href='${root }index?formpath=productManagement&category=aircleaner'"></span>
	<span><input type = "button" value = "식기세척기" onclick = "location.href='${root }index?formpath=productManagement&category=washmachine'"></span>
	<span><input type = "button" value = "전기레인지" onclick = "location.href='${root }index?formpath=productManagement&category=microwave'"></span>
	<span><input type = "button" value = "얼음정수기냉장고" onclick = "location.href='${root }index?formpath=productManagement&category=refrigerator'"></span>
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
							<div>
								<span>월</span> <span>${pr.price }</span> <span>원</span>
								<input type = "button" onclick = "deleteProduct('${pr.product_no}')" value = "삭제">
							</div>
						</div>
					</div>
				</div>						
			</li>	
		</ul>
	</div>
</c:forEach>
</section>
</body>
</html>