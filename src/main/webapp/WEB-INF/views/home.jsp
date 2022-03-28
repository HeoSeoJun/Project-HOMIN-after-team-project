<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<head>
<link rel="stylesheet" href="${root }resources/swiper/swiper.min.css">  
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />
<style>
	.swiper-pagination-bullet {
		width: 12px;
		height: 12px;
		background: transparent;
		border: 1px solid #00a9b4;
		opacity: 1;
		margin-top: 15px;
		margin-left: 10px;
	}
	
	.swiper-pagination-bullet-active {
		width: 40px;
		transition: width .5s;
		border-radius: 5px;
		background: #00a9b4;
		border: 1px solid transparent;
	}
</style>
</head>
<body>
	<div style="margin-top: 50px;">
		<div style="width: 1200px; margin: 0 50px;">
			<div class="swiper-container" style="width: 98%;">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img src="${root }resources/image/test1.jpg" style="width: 100%;">
					</div>
					<div class="swiper-slide">
						<img src="${root }resources/image/test2.jpg" style="width: 100%;">
					</div>
					<div class="swiper-slide">
						<img src="${root }resources/image/test3.jpg" style="width: 100%;">
					</div>
				</div>
			</div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
			<div class="swiper-pagination" style="width: 1200px;"></div>
			<script src="${root }resources/swiper/swiper.min.js"></script>
		</div>
		<br><br>
		
		<!--  -->
		<div class="lent_option-wrap">
		
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
		
		<section class="container-home-section" >
			<div class="main-product-title"><strong>조회수 Top4</strong></div>
			<div class="main-product-list">
			<c:forEach var="to" items="${top }">
				<div class="main-product-list-in">
					<ul>
						<li>
							<div class="main-product-text " onclick = "location.href='${root}/index?formpath=product&category=${to.classification }&prodNo=${to.product_no }'">
								<div class="main-product-tex-in ">
									<img src = "${root }resources/image/${to.classification}/${to.product_filename}"></div>
									<c:choose>
										<c:when test="${to.classification eq 'aircleaner'}">
											<div class="pro-category" >공기청정기</div>
										</c:when>
										<c:when test="${to.classification eq 'dryer'}">
											<div class="pro-category" >건조기</div>
										</c:when>
										<c:when test="${to.classification eq 'microwave'}">
											<div class="pro-category" >전기레인지</div>
										</c:when>
										<c:when test="${to.classification eq 'refrigerator'}">
											<div class="pro-category" >얼음정수기/냉장고</div>
										</c:when>
										<c:when test="${to.classification eq 'washmachine'}">
											<div class="pro-category" >식기세척기</div>
										</c:when>
										<c:when test="${to.classification eq 'waterpurifier'}">
											<div class="pro-category" >정수기</div>
										</c:when>
									</c:choose>
									<div class="pro-name">${to.product_name }</div>
									<div class="pro-price">${to.price }</div>
							</div>
						</li>
					</ul>
				</div>
			</c:forEach>
			</div>
		</section>
		
		<section class="container-home-section" >
			<div class="main-product-title"><strong>판매 Top4</strong></div>
			<div class="main-product-list">
			<c:forEach var="oc" items="${orderCount }">
				<div class="main-product-list-in">
					<ul>
						<li>
							<div class="main-product-text " onclick = "location.href='${root}/index?formpath=product&category=${oc.classification }&prodNo=${oc.product_no }'">
								<div class="main-product-tex-in ">
									<img src = "${root }resources/image/${oc.classification}/${oc.product_filename}"></div>
									<c:choose>
										<c:when test="${oc.classification eq 'aircleaner'}">
											<div class="pro-category" >공기청정기</div>
										</c:when>
										<c:when test="${oc.classification eq 'dryer'}">
											<div class="pro-category" >건조기</div>
										</c:when>
										<c:when test="${oc.classification eq 'microwave'}">
											<div class="pro-category" >전기레인지</div>
										</c:when>
										<c:when test="${oc.classification eq 'refrigerator'}">
											<div class="pro-category" >얼음정수기/냉장고</div>
										</c:when>
										<c:when test="${oc.classification eq 'washmachine'}">
											<div class="pro-category" >식기세척기</div>
										</c:when>
										<c:when test="${oc.classification eq 'waterpurifier'}">
											<div class="pro-category" >정수기</div>
										</c:when>
									</c:choose>
									<div class="pro-name">${oc.product_name }</div>
									<div class="pro-price">${oc.price }</div>
							</div>
						</li>
					</ul>
				</div>
			</c:forEach>
			</div>
			
			
		</section>
		
</div>		
</body>

<script>
	var mySwiper = new Swiper('.swiper-container', {
		navigation : {
			prevEl : '.swiper-button-prev',
			nextEl : '.swiper-button-next',
		},
		autoplay : {
			delay : 2000,
			disableOnInteraction: false,
		},
		pagination : {
			el : '.swiper-pagination',
			type : 'bullets',
			clickable : true,
		},
	});
</script>