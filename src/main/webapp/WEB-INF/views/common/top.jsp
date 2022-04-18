<%@ page contentType="text/html; charset=UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<!-- <meta -->
<!--   name="viewport" -->
<!--   content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" -->
<!-- /> -->
<c:url var="root" value="/" />
<link
  rel="stylesheet"
  type="text/css"
  href="${pageContext.request.contextPath}/resources/css/reset.css"
/>
<link
  rel="stylesheet"
  type="text/css"
  href="${pageContext.request.contextPath}/resources/css/board2.css"
/>
<link
  rel="stylesheet"
  type="text/css"
  href="${pageContext.request.contextPath}/resources/css/board.css"
/>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
  function loginForm() {
    alert("먼저 로그인해주세요");
    location.href = "${root}index?formpath=login";
  }

  

	$(document).ready(()=>{
		$('.info_list .sub_li').hide();

		$('.menu_li').mouseover(() => $('.sub_li').slideDown());
		$('.sub_li').mouseleave(()=> $('.sub_li').hide());
	});
	
</script>
<div id="wrap">
  <section class="info_section">
    <div>
      <ul class="info_list">
        <c:choose>
          <c:when test="${empty sessionScope.id }">
            <li>
              <a href="${root}index?formpath=login "> 로그인 </a>
            </li>
            <li>|</li>
            <li>
              <a href="${root}index?formpath=servicecenter&list=faq"
                >고객센터</a
              >
            </li>
           
          </c:when>
          <c:otherwise>
            <li>
              <a href="${root}logout ">로그아웃</a>
            </li>
            <li>|</li>
            <li>
              <a href="${root}index?formpath=servicecenter&list=faq"
                >고객센터</a
              >
            </li>
            <li>|</li>
            <c:if test="${sessionScope.id ne 'ADMIN@CARE.COM' }">
	            <li>
	              <a href="${root }index?formpath=mypage&category=mypageIndex">${sessionScope.nickname } 님
	                <img src="${pageContext.request.contextPath}/resources/image/account_circle.png"/>
	              </a>
	            </li>
	            <li>|</li>
	            <li>
	              <a href="${root }index?formpath=mypage&category=myBasket">장바구니
	                <img style="height:25px"
	                  src="${pageContext.request.contextPath}/resources/image/cart3.png"
	                />
	              </a>
	            </li>
            </c:if>
            <c:if test="${sessionScope.id eq 'ADMIN@CARE.COM' }">
            	<li>
<%-- 	            	<a href = "${root }index?formpath=mypage"> --%>
	            		<label class = "menu_li" style="font-weight: bold;">${sessionScope.nickname } 님</label>
	            		<img src="${pageContext.request.contextPath}/resources/image/account_circle.png"/>
<!-- 	            	</a> -->
	            	<ul class = "sub_li">
	            		<li><a href = "${root }index?formpath=memberManagement">회원 관리</a></li>
	            		<li><a href = "${root }index?formpath=productManagement&category=dryer">제품 관리</a></li>
	            		<li><a href="${root }index?formpath=inquiryList">문의 관리</a></li>
						<li><a href="${root }index?formpath=orderManagement">주문 관리</a></li>
	            	</ul>
            	</li>
            </c:if>
          </c:otherwise>
        </c:choose>
      </ul>
    </div>
  </section>

  <header class="header">
    <h1 class="logo">
      <a href="${root}index?formpath=home ">
        <img
          src="${pageContext.request.contextPath}/resources/image/logo2.png"
          style="height: 100px"
        />
      </a>
    </h1>
  </header>
</div>