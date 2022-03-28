<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/faq.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/view.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />


<c:url var="root" value="/" />

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>




<script type="text/javascript">
	$(document).ready(function (e){
    	$("input[type='file']").change(function(e){
			$('#preview').empty();
			var files = e.target.files;
      		var arr = Array.prototype.slice.call(files);
     		for(var i=0;i<files.length;i++){
       			if(!checkExtension(files[i].name,files[i].size)){
          			return false;
        		}
			}
      preview(arr);
    });
    function checkExtension(fileName,fileSize){
    	var regex = new RegExp("(.*?)\.(jpg|png|img)$");
    	var maxSize = 52428800;
    	if(fileSize >= maxSize){
    		alert('파일 사이즈 초과');
    		$("input[type='file']").val("");
    		return false;
    	}
      
      if(!(regex.test(fileName))){
    	  alert('사진만 등록 가능합니다.');
    	  $("input[type='file']").val("");
    	  return false;
    }
      return true;
    }
    
    function preview(arr){
    	arr.forEach(function(f){
    		var fileName = f.name;
    		if(fileName.length > 10){
    			fileName = fileName.substring(0,7)+"...";
    		}
        var str = '<div style="display: inline-flex; padding: 10px;"><li>';
        str += '<span>'+fileName+'</span><br>';
        if(f.type.match('image.*')){
        	var reader = new FileReader();
        	reader.onload = function (e) {
            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
            str += '</li></div>';
            $(str).appendTo('#preview');
        }
        	reader.readAsDataURL(f);
        }else{
			str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
         	$(str).appendTo('#preview');
        }
      });
    	}
	});
	
	function rmv(i) {
		document.getElementById('img'+i).remove();
	 }
	
	$( document ).ready(function() {
		$(".star_rating a").click(function() {
			$(this).parent().children("a").removeClass("on");
			$(this).addClass("on").prevAll("a").addClass("on");
			var starRate = $(this).attr('id');
			$("#review_star").val(starRate);
			     return false;
			});
		});

</script>

<center>
<section class="write_wrap">
	<form action="${root }boardModifyProc" method="post" enctype="multipart/form-data">
	<input type="hidden" name="no" value="${view.no }"/>
	
	<div class="write_wrap_bottom" >
		
		<div class="write_wrap_bottom_ch1">
			<div class="write_wrap_bottom_ch1_top">
				<div>
					<img src="${pageContext.request.contextPath}/resources/image/board_write.png">
				</div>
				<div class="write_wrap_bottom_ch1_text">
					후기게시판 글 작성 가이드 
				</div>
			</div>
			<div class="write_wrap_bottom_ch1_bottom" style= "overflow:hidden;" >
				<div class="open_expanded"  role="region">
					<ul class="open_expand_text">
						<li>- 참고가 되는 사진을 같이 공유해주시면 더 좋은 답변을 얻을 수 있습니다.</li>
						<li>- 비슷한 어려움을 겪는 유저를 위해 답변자에게 포인트를 지급하며, 답변이 달린 질문글은 삭제할 수 없습니다.</li>
						<li>- 인테리어와 관련 없는 질문은 숨김 및 삭제될 수 있습니다.</li>
						<li>- 상품/배송 등 쇼핑 관련 문의는 불가능합니다.</li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="star_score">
			<div class="star_score_inside">
	
				<div>
				  	<div class="star_rating">
				     	<a href="#" class="on" id="1">★</a>
						<a href="#" class="on" id="2">★</a>
						<a href="#" class="on" id="3">★</a>
						<a href="#" class="om" id="4">★</a>
						<a href="#" class="om" id="5">★</a>
				   		<input type="hidden" id="review_star" name="review_star" value="3">
					</div>
				</div>
			</div>
		</div>
		
		<div class="editor-title-input">
			<div >
				<input  type=text name='title' id = "title"  value="${view.title }"/> 
				<div id="test_cnt" class="editor-title-input__limit">0/30</div>
				<div class="editor__title-error">	
					<span style="display: none;" id = "msg1">필수 사항입니다.</span>
				</div>
			</div>
		</div>
		<script>
		$(document).ready(function() {
		    $('#title').on('keyup', function() {
		        $('#test_cnt').html("("+$(this).val().length+" / 30)");
		 
		        if($(this).val().length > 100) {
		            $(this).val($(this).val().substring(0, 100));
		            $('#test_cnt').html("(100 / 100)");
		        }
		    });
		});
		</script>
		
		<div class="write_wrap_bottom_ch2">
			<div>
				<textarea name="content" id = "content" style="width: 650px; height: 300px" >${view.content }</textarea>
			<div class="editor__title-error">	
				<span style="display: none;" id = "msg2">필수 사항입니다.</span>
			</div>
			</div>
		</div>
		
		<div class="write_wrap_bottom_ch3">	
			<!-- 사진 미리보기 -->
			<div>
				<div class="preview_wrap">
					<div id="preview"></div>
				</div>
			</div>
			
			<div class="write_button_wrap">
				<div>
					<div class="write_filebtn">
					파일선택
						<input type="file" name="uploadFile" id="uploadFile" multiple> 
					</div>
				</div>
				<c:forEach var="file" items="${fileName }" varStatus="status">
					<div id = "img${status.index}">
						<div  style = "width: 150px; height: 150px;">
							<input type = "hidden" name = "img" value = "${file }">
							<div ><img src = "/img/${file }"style="width: 100px; height: 100px;"></div><input type = "button" onclick = "rmv(${status.index})" value = "x">
						</div>
					</div>
				</c:forEach>
				
				<div>
					<div>
						<input type=submit value='수정' />
						<input type=button value='취소' onclick = "location.href='${root}boardProc'" />	 
					</div>
				</div>
			</div>
			
		</div>	


	</div>
	</form> 
</section>
</center>