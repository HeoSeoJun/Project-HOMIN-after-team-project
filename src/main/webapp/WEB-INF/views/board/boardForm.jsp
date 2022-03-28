<%@ page contentType="text/html; charset=UTF-8"    %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/faq.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/review.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />   


<c:url var="root" value="/" />

<script>
	function boardDeleteCheck(no){
		if(confirm("정말 삭제하시겠습니까?") == true){
			location.href = '${root}deleteBoard?no='+no;
		}else{
			return;
		}
	}
</script>

<center>
<section class="content_section">



 	 <div class="board_wraps">  
 	 <div class="board_title">
        <strong>review</strong> 
        <hr style="width : 50px;">
        <p>상품 사용 후기입니다.</p>
      </div>
      <div class="board_list_wrap" style="width: 1200px;">
        <div class="board_list">
          <div class="top">
            <div class="num">구분</div>
            <div class="photo" >사진</div>
            <div class="title">제목</div>
            <div class="star">별점</div>
            <div class="writer">카테고리</div>
            <div class="date">작성일</div>
            <div class="count">조회</div>
            <c:if test="${sessionScope.id eq 'admin' }">
            	<div>삭제</div>
            </c:if>
          </div>
          
          
      	<c:forEach var="list" items="${boardList }">
          <div>
            <div class="num">${list.no }</div>
            <div class="photo"><img src = "${root }resources/image/${list.classification}/${list.product_img}" style="width: 150px; height: 150px;"></div>
            <c:choose>
			<c:when test="${list.fileName eq null || list.fileName eq ''}">
				<div id="${list.no }" class="title"><a href = 'viewProc?num=${list.no }'>${list.title }</a></div>
			</c:when>
			<c:otherwise>
				<div id="${list.no }" class="title"><a href = 'viewProc?num=${list.no }'>${list.title }  <img src = "${root }resources/image/img.png" style="width: 15px; height: 15px;"></a></div>
			</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${list.review_star eq 1 }">
					<div class="star"><img src = "${root }resources/image/ico_point1.png"></div>
				</c:when>
				<c:when test="${list.review_star eq 2 }">
					<div class="star"><img src = "${root }resources/image/ico_point2.png"></div>
				</c:when>
				<c:when test="${list.review_star eq 3 }">
					<div class="star"><img src = "${root }resources/image/ico_point3.png"></div>
				</c:when>
				<c:when test="${list.review_star eq 4 }">
					<div class="star"><img src = "${root }resources/image/ico_point4.png"></div>
				</c:when>
				<c:otherwise>
					<div class="star"><img src = "${root }resources/image/ico_point5.png"></div>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${list.classification eq 'dryer' }">
           			<div class="writer">건조기</div>
           		</c:when>
           		<c:when test="${list.classification eq 'aircleaner' }">
           			<div class="writer">공기청정기</div>
           		</c:when>
           		<c:when test="${list.classification eq 'refrigerator' }">
           			<div class="writer">얼음정수기/냉장고</div>
           		</c:when>
           		<c:when test="${list.classification eq 'washmachine' }">
           			<div class="writer">식기세척기</div>
           		</c:when>
           		<c:when test="${list.classification eq 'waterpurifier' }">
           			<div class="writer">정수기</div>
           		</c:when>
           		<c:when test="${list.classification eq 'microwave' }">
           			<div class="writer">전기레인지</div>
           		</c:when>
           		
            </c:choose>
            <div class="date">${list.writeTime }</div>
            <div class="count">${list.hit }</div>
            <c:if test="${sessionScope.id eq 'admin' }">
            	<input type = "button" value = "삭제" onclick = "boardDeleteCheck(${list.no})">
            </c:if>
          </div>
          </c:forEach>
     </div>
 </div>
     <!-- 페이징 부분  -->
	<div class="board_row">
		${page}
	</div>
	
	<div class="board_row_bottom">
			    
	    <!-- 검색 부분  -->
	    <form action="#" method="get">
		<table>
			<tr>
				<td>
					<select  class="review_underbar_1" name="select">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="id">작성자</option>
					</select>
					<input class="review_underbar_2" type=text name='search'/>
					<input class="review_underbar_3" type=submit name='searchBtn' value='검색' style="width: 80px; "/>
				</td>
			</tr>
		</table>
		</form>
		
	    
	</div>

</section>

</center>