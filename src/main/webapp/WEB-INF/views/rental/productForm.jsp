<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<c:url var="root" value="/" />

<link rel="stylesheet" href="${root }resources/swiper/swiper.min.css" />
<link
  rel="stylesheet"
  type="text/css"
  href="${pageContext.request.contextPath}/resources/css/rental.css"
/>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
  function basketProduct(no) {
    checkLogin();

    var d = { noTemp: no };
    $.ajax({
      url: "basketProduct",
      type: "POST",
      data: JSON.stringify(d),
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function (result) {
        alert(result.msg);
      },
      error: function () {
        alert("장바구니 추가 오류");
      },
    });
  }
  function checkLogin() {
    var id = "${sessionScope.id}";
    if (id == "") {
      alert("먼저 로그인해주세요");
      location.href = "${root}index?formpath=login";
    } else {
    	location.href='${root}index?formpath=productOrder&prodNo=${product.product_no }'
    }
  }
</script>

<style>
  .swiper-button-next {
    background: url(/godiva/img/common/next.png) no-repeat;
    background-size: 50% auto;
    background-position: center;
  }

  .swiper-button-prev {
    background: url(/godiva/img/common/prev.png) no-repeat;
  }

  .swiper-button-next::after,
  .swiper-button-prev::after {
    display: none;
  }
</style>

<div class="rental-detail-header">
  <ul>
    <li>
      <a href="${root}index?formpath=home ">홈</a>
    </li>
    <li class="rental-detail-headernext_btn">></li>
    <c:choose>
      <c:when test="${category eq 'dryer' }">
        <li>
          <a href="${root }index?formpath=rental&category=${category}"
            >건조기</a
          >
        </li>
      </c:when>
      <c:when test="${category eq 'waterpurifier' }">
        <li>
          <a href="${root }index?formpath=rental&category=${category}"
            >정수기</a
          >
        </li>
      </c:when>
      <c:when test="${category eq 'aircleaner' }">
        <li>
          <a href="${root }index?formpath=rental&category=${category}"
            >공기청정기</a
          >
        </li>
      </c:when>
      <c:when test="${category eq 'washmachine' }">
        <li>
          <a href="${root }index?formpath=rental&category=${category}"
            >식기세척기</a
          >
        </li>
      </c:when>
      <c:when test="${category eq 'microwave' }">
        <li>
          <a href="${root }index?formpath=rental&category=${category}"
            >전기레인지</a
          >
        </li>
      </c:when>
      <c:otherwise>
        <li class="rental-header-text">
          <a href="${root }index?formpath=rental&category=${category}"
            >얼음정수기 냉장고</a
          >
        </li>
      </c:otherwise>
    </c:choose>
    <li class="rental-detail-headernext_btn">></li>
    <li><a href="">현재 상품</a></li>
  </ul>
</div>

<section class="product_detailpg_wrap">
  <div class="product_selling">
    <div class="swiper-container">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <img
            src="${root }resources/image/${product.classification }/${product.product_filename}"
          />
        </div>
      </div>
    </div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
    <div class="swiper-pagination" style="width: 300px"></div>
    <script src="${root }resources/swiper/swiper.min.js"></script>
  </div>

  <div class="product_selling_text">
    <div class="product_selling_text_header">
      <p>${product.product_no }</p>
      <h2>
        <span>${product.product_name }</span>
      </h2>
    </div>
    <div class="product_selling_text_body">


      <div class="product_selling_text_comment">
        <div class="selling_text_comment_1">
          <div class="selling_text_comment_name">혜택</div>
          <div class="selling_text_comment_cm">
            822P 적립 (WELCOME 0.3% 적립)
          </div>
        </div>
        <div class="selling_text_comment_1">
          <div class="selling_text_comment_name">배송</div>

          <div class="selling_text_comment_cm">
            <div>무료배송</div>
            <div>화물택배</div>
            <div>제주도/도서산간 지역 50,000원</div>
          </div>
        </div>
        <div class="selling_text_comment_1">
          <div class="selling_text_comment_name">요금</div>
          <div class="selling_text_comment_cm">
            ${product.price }
          </div>
        </div>
      </div>
      <div class="product_selling_text_btn">
        <div class="product_selling_text_btn_a">
          <button
            class="product_selling_text_btn_bt1"
            id="check_module"
            type="button"
            onclick="checkLogin()"
          >
            이용 신청
          </button>
        </div>
        <div class="product_selling_text_btn_b">
          <button class="product_selling_text_btn_bt2" type="button" onclick="basketProduct('${product.product_no }');">
            장바구니 담기
          </button>
        </div>
      </div>
    </div>
  </div>
 
  </section>

  <div class="product_detailpg_contents">
    <ul>
      <li>상품정보</li>
      <!-- 	<li>리뷰</li> -->
      <!-- 	<li>배송환불</li> -->
    </ul>
  </div>
  <div class="detail_img_wrap">
	  <div class="detail_1">
	  <img  class="main-product-tex-in-cart" src="https://allcenter.speedgabia.com/homin/common/intro_homin_care.jpg">
	  </div>
	  <div class="detail_1">
	  <img  class="main-product-tex-in-cart" src="http://allcenter.speedgabia.com/homin/gift/gift_top.jpg">
	  </div>
	  <div class="detail_1">
	  <img  class="main-product-tex-in-cart" src="https://allcenter.speedgabia.com/homin/gift/online.jpg" alt="온라인 상품권 증정">
	  </div>
	  <div class="detail_1">
	  <img  class="main-product-tex-in-cart" src="https://allcenter.speedgabia.com/homin/common/card_top.jpg" alt="제휴카드">
	  </div>
	  <div class="detail_1">
	  <img  class="main-product-tex-in-cart" src="https://allcenter.speedgabia.com/homin/common/card.jpg" alt="카드">
	  </div>
	  <div class="detail_1">
	  <img  class="main-product-tex-in-cart" src="https://allcenter.speedgabia.com/homin/common/benefit.jpg" alt="케어솔루션 고객혜택">
	  </div>
	  
  </div>
  <script>
    var mySwiper = new Swiper(".swiper-container", {
      navigation: {
        prevEl: ".swiper-button-prev",
        nextEl: ".swiper-button-next",
      },
      /* autoplay : {
			delay : 2000,
			disableOnInteraction: false,
		}, */
      pagination: {
        el: ".swiper-pagination",
        type: "bullets",
        clickable: true,
      },
    });
  </script>
</section>
