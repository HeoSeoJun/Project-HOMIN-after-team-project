<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rental.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css" />
<c:url var="root" value="/" />
<div class="rental-header">

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function basketProduct(no) {
		checkLogin();
		
		var d = {noTemp : no}
		$.ajax({
			url : "basketProduct",
			type : "POST",
			data : JSON.stringify(d),
			contentType : "application/json; charset=utf-8",
			dataType : 'json',
			success : function(result) {
				alert(result.msg);
			},
			error : function() {
				alert("장바구니 추가 오류");
			}
		})
	}
	
	function checkLogin() {
		var id = '${sessionScope.id}';
		if (id == "") {
			alert('먼저 로그인해주세요');
			location.href='${root}index?formpath=login';
		} else {
			return;
		}
		
	}
	
</script>

<style>
#product {
	float: left;
}
</style>

		<!-- 배너 -->
		<c:choose>

			<c:when test="${category eq 'dryer' }">
				<div class="top_img_banner">
					<img src="https://pubfiles.lghomin.com/files/images/00/035912ef3d3e4fac974b2aacf41e910e/4f0342ca0cdc424f9a454ce787af35d3.jpg">
				</div>
			</c:when>
			<c:when test="${category eq 'waterpurifier' }">
				<div class="top_img_banner">
					<img src="https://pubfiles.lghomin.com/files/images/00/6c15fe5489144368885504b7a9a672a8/6d4aa27735544d298ba165d506899a14.jpg">
				</div>
			</c:when>
			<c:when test="${category eq 'aircleaner' }">
				<div class="top_img_banner">
					<img src="https://pubfiles.lghomin.com/files/images/00/dd66c1517ebd4f2b909a99870f6f8ff4/08d07575b1a1413ba98fa691a984098c.jpg">
				</div>
			</c:when>
			<c:when test="${category eq 'washmachine' }">
				<div class="top_img_banner">
					<img src="https://pubfiles.lghomin.com/files/images/00/2ba228e1c37345f8b8824bef4ada2d97/d8cab035e69d4694831cda2911475795.jpg">
				</div>
			</c:when>
			<c:when test="${category eq 'microwave' }">
				<div class="top_img_banner">
					<img src="https://pubfiles.lghomin.com/files/images/00/48a73c48097541b78d8e5e48e0f95c49/46f36aaf44924daca8dda5109b74a544.jpg">
				</div>
			</c:when>
			<c:otherwise>
				<div class="top_img_banner">
					<img src="https://pubfiles.lghomin.com/files/images/00/c9198319b01f4ddab705b708de5eec54/ab23b92bdb1040b7a9dcbde96f3d4ff9.jpg">
				</div>
			</c:otherwise>
		
		</c:choose>
		
		<!-- 카테고리 -->
		
		<div class="lent_option-wrap" style="padding:0; display:none" >
		<!-- 카테고리 임시로 안보이게 해놓음 -->
		
			<div class="lent_option_box">
			
				<div><a href = "${root }index?formpath=rental&category=dryer"><img src = "${root }resources/image/1.png"></a></div>
				<div><p>건조기</p></div>
			</div>
			<div class="lent_option_box">
				<div><a href = "${root }index?formpath=rental&category=waterpurifier"><img src = "${root }resources/image/2.png"></a></div>
				<div><p>정수기</p></div>
			</div>
			<div class="lent_option_box">
				<div><a href = "${root }index?formpath=rental&category=aircleaner"><img src = "${root }resources/image/3.png"></a></div>
				<div><p>공기청정기</p></div>
			</div>
			<div class="lent_option_box">
				<div><a href = "${root }index?formpath=rental&category=washmachine"><img src = "${root }resources/image/4.png"></a></div>
				<div><p>식기세척기</p></div>
			</div>
			<div class="lent_option_box">
				<div><a href = "${root }index?formpath=rental&category=microwave"><img src = "${root }resources/image/5.png"></a></div>
				<div><p>전기레인지</p></div>
			</div>
			<div class="lent_option_box">
				<div><a href = "${root }index?formpath=rental&category=refrigerator"><img src = "${root }resources/image/6.png"></a></div>
				<div><p>얼음정수기냉장고</p></div>
			</div>
		
		</div>	
		



<c:choose>
	<c:when test="${category eq 'dryer' }">	
		<div class="rental-header-text">건조기</div>
	</c:when>
	<c:when test="${category eq 'waterpurifier' }">
		<div class="rental-header-text">정수기</div>
	</c:when>
	<c:when test="${category eq 'aircleaner' }">
		<div class="rental-header-text">공기청정기</div>
	</c:when>
	<c:when test="${category eq 'washmachine' }">
		<div class="rental-header-text">식기세척기</div>
	</c:when>
	<c:when test="${category eq 'microwave' }">
		<div class="rental-header-text">전기레인지</div>
	</c:when>
	<c:otherwise>
		<div class="rental-header-text">얼음정수기 냉장고</div>
	</c:otherwise>
</c:choose>
</div>

<%-- <c:import url="/${category }" /> --%>


<section class="container-home-section">
<c:forEach var="pr" items="${product }">
	<div  class="main-product-list" onclick="location.href='${root}index?formpath=product&category=${category }&prodNo=${pr.product_no }'">
		<div class="main-product-list-in">
			<ul>
				<li>
					<div class="main-product-text ">
						<div class="main-product-tex-in ">
						<img  class="main-product-tex-in-cart" src="${pageContext.request.contextPath}/resources/image/cart3.png"
						style="border: none;
							    right: 20px;
							    width: 30px;
							    height: 30px;
							    cursor: hand;
							    filter: alpha(opacity=1);
							    position: absolute;
							    bottom: 20px;
							    border-radius: none;
							    z-index: 100;"		 >
						<button name="test" type="button" onclick="basketProduct('${pr.product_no }' );"></button>
							<img src="${root }resources/image/${pr.classification }/${pr.product_filename}" >
						</div>
						<div>
							<div class="pro-category">${pr.product_no }</div>
							<div class="pro-name">${pr.product_name }</div>
							<div class="pro-price">
								<div>
									<span>월</span> <span>${pr.price }</span> <span>원</span>
								</div>
							</div>
						</div>
					</div>						
					
				</li>	
			</ul>
		</div>
	</div>
</c:forEach>
</section>

