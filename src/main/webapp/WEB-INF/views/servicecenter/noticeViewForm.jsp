<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/view.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />

<script>
	function deleteCheck(){
		if(confirm("정말 삭제하시겠습니까?") == true){
			location.href = '${root}deleteNotice?no=${dto.no}';
		}else{
			return;
		}
	}
</script>

<section class="content_section">
 	
 


 <div class="board_wrap">
        <div class="board_title">
        <strong>NOTICE</strong> 
        <hr style="width : 50px;">
        <p>공지사항을 전달드립니다.</p>
     	 </div>
      
      
        <div class="board_view_wrap">
        
            <div class="board_view">
            
            <div class="board_view_sub">
            
                <div class="notice_title">
                	<div class="notice_title_header">
                	<c:choose>
						<c:when test="${dto.division eq 'system' }">
							<div>시스템</div>
						</c:when>
						<c:when test="${dto.division eq 'product' }">
							<div>상품</div>
						</c:when>
						<c:when test="${dto.division eq 'event' }">
							<div>이벤트</div>
						</c:when>
						<c:when test="${dto.division eq 'etc' }">
							<div>기타</div>
						</c:when>
						<c:when test="${dto.division eq 'service' }">
							<div>서비스</div>
						</c:when>
					</c:choose>
                	</div>
                </div>
                
                
                <div class="info">
                
                    <dl>
                        
                        <dd>${dto.title }</dd>
                    </dl>
                    
                    <dl>
                        <dt>작성일</dt>
                        <dd>${dto.writedate }</dd>
                    </dl>
                   
                </div>
            </div>
            
            <!-- 이미지 사진  -->
            
            <c:forEach var="file" items="${fileName }"> 
				<div> 
				<img src = "/img/${file }" style="width: 500px; height: 500px;"> 
				</div>
 			</c:forEach>
            
            <!-- 글자  -->    
                <div class="cont">
                    ${dto.content }
                </div>
                
  
            </div>
            
         
            
          
            
            <div class="bt_wrap">
			<div>
			<input type=button style="width: 60px; " value='목록' onclick="location.href='${root}index?formpath=servicecenter&list=notice'"/>
			<c:if test="${sessionScope.id eq 'admin' }">
	            <button onclick = "location.href='${root}index?formpath=servicecenter&list=modifyNotice&no=${dto.no }'">수정</button>
				<button onclick = "deleteCheck()">삭제</button>
			</c:if>
            </div>
        </div>
    </div>
</div>    

</section>