<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />

  

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/faq.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" /> 
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

	// 문서가 준비되면 매개변수로 넣은 콜백 함수를 실행하라는 의미.
	$(document).ready(function (e){
    	$("input[type='file']").change(function(e){

     	 	//div 내용 비워주기
			$('#preview').empty();

			var files = e.target.files;
      		var arr = Array.prototype.slice.call(files);
      
      		//업로드 가능 파일인지 체크
     		for(var i=0;i<files.length;i++){
       		if(!checkExtension(files[i].name,files[i].size)){
          	return false;
        	}
		}
      preview(arr);
    });//file change
    
    function checkExtension(fileName,fileSize){

      var regex = new RegExp("(.*?)\.(jpg|png|img)$");
      var maxSize = 52428800;  //50MB
      
      if(fileSize >= maxSize){
        alert('파일 사이즈 초과');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      
      if(! (regex.test(fileName))){
        alert('사진만 등록 가능합니다.');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      return true;
    }
    
    function preview(arr){
      arr.forEach(function(f){
        
        //파일명이 길면 파일명...으로 처리
        var fileName = f.name;
        if(fileName.length > 10){
          fileName = fileName.substring(0,7)+"...";
        }
        
        //div에 이미지 추가
        var str = '<div style="display: inline-flex; padding: 10px;"><li>';
        str += '<span>'+fileName+'</span><br>';
        
        //이미지 파일 미리보기
        if(f.type.match('image.*')){
          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
            str += '</li></div>';
            $(str).appendTo('#preview');
          } 
          reader.readAsDataURL(f);
        }else{
			str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
         	$(str).appendTo('#preview');
        }
      });//arr.forEach
    	}
	});
	
	$(function(){
	      $('#writeBtn').click(function(){
	    	var loginCheck = '${sessionScope.id}';
	  		if(loginCheck == ''){
	  			alert('로그인 후 이용가능합니다.');
	  			location.href = '${root}index?formpath=home';
	  			return;
	  		}
	    	 
	    	  
	         var title = $('#title').val();
	         if(title == ''){
	             $('#msg1').css('display', 'block');
	             $('#title').focus();
	             return;
	         }
	         var content = $('#content').val();
	         if(content == ''){
	             $('#msg2').css('display', 'block');
	             $('#content').focus();
	             return
	         }
	         $('#f').submit();
	      })
	      $("#title").blur(function() {
	         var title = $('#title').val();
	         if (title != '') {
	            $('#msg1').css('display', 'none');
	         }
	      });
	      $("#content").blur(function() {
	         var content = $('#content').val();
	         if (content != '') {
	            $('#msg2').css('display', 'none');
	         }
	      });
	   });
	
</script>

</head>
<body>
	<div class="inquiry_test">
		<div class="inquiry_test_head">
			<div>
				<h3>문의 내용 작성</h3>
					
			</div>
			<div>
				<h6>*필수 입력 항목</h6>
			</div>
		</div>
		<hr>
		
		<div class="inquiry_test_warnning">
			<p>※ 아직 주문하지 않은 상품 문의는 상품 상세페이지 하단 [상품 문의하기] 버튼을 눌러 문의해 주세요</p>
		</div>
		<form action = "${root}inquiryProc" method="post" enctype="multipart/form-data" id = "f">
		<div>
			<div class="inquiry_test_type" >
				<div class="inquiry_test_type_p">
			
					<p>문의 유형</p>
				</div>
				<div>
				
					<select class="inquirytype_rightside" name = "inquiryType" >
						<option value = "member">회원</option>
						<option value = "order">주문/신청</option>
						<option value = "product">상품</option>
						<option value = "delivery">배송</option>
						<option value = "exchange">교환/환불/반품</option>
						<option value = "etc">기타</option>
					</select>
				</div>
			</div>
			<div class=" main_inquirytype_title" >
				<div class="inquiry_test_type_p" >
					<p>문의 제목</p>
				</div>
				<div >
					<input class="inquirytype_title_textarea" type = "text" name = "title" id = "title" placeholder = "문의 제목 입력" >
				</div>
				<div id = "msg1" style = "display: none;">필수 사항입니다.</div>
			</div>
			<div style="display: flex; flex-direction: row; margin-top: 50px;">
				<div class="inquiry_test_type_p">
					<p>문의 내용</p>
				</div>
				<div class="inquirytype_text">
					<textarea  class="inquirytype_text_textarea" name = "content" id = "content" placeholder = "문의 내용 입력(주민번호,계좌번호 등 개인정보가 포함된 내용은 입력을 금합니다.)"></textarea>
				</div>
				<div id = "msg2" style = "display: none;">필수 사항입니다.</div>
			</div>
			
			<div class=" main_inquirytype_photo" >
				<div class="inquiry_test_type_p" >
					<p>사진 첨부</p>
				</div>
				<div >
					<input  class="inquirytype_photo_input" type="file" name="uploadFile" id="uploadFile" multiple>
				</div>
				<div id="preview"></div>
			</div>
			<div class="cus_under_box">
				<p>문의 내용과 관련된 사진이 있다면 첨부해 주세요.</p>
				<p>10MB 미만의 이미지 파일 최대 5개, 100MB 30초 미만의 동영상 파일 최대 1개까지 등록할 수 있습니다.</p>
				<p>문의하신 내용에 대한 답변은 홈인 → [마이] → [1:1 문의 내역]에서 확인할 수 있습니다.</p>
			</div>
		</div>
		<div class="cus_under_btn">
			<input class="cus_under_btn_input" type = "button"  id = "writeBtn" value = "등록">
		</div>
		</form>
	</div>
</body>
</html>