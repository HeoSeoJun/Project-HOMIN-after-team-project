<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<script src="https://code.jquery.com/jquery-latest.js"></script>

<style>
	input{appearance:auto;}
	#div_basketOrderForm {
		padding: 20;
	}
	
	#div_basketOrderForm h1 {
		font-size: 25px;	
	}
	
	.info { margin-bottom: 20px;}
	
	.info_title {
		width: 100px;
		margin-bottom: 20px;
	}
		
	.info_name tr {
		height: 40px;
	}
	
	.info_name th {
		padding-right: 15px;
	}
	
	#div_terms_ {
		margin-bottom: 20px;
	}
	.all_check{border: 1px solid #BDBDBD; border-radius: 5px; margin-bottom: 20px; width: 100%; height: 50px; line-height:50px;}
	.terms_{padding-bottom: 15px;}
	.m_btn{float: right;}
	.agr{background:black; clear:both; margin: 30px auto; border:0; border-radius: 150px; width: 300px; height: 65px; color: white; cursor: pointer;}
	#modal1,#modal2,#modal3{background-color:transparent; border: 0;}
	#modal1,#modal2,#modal3:hover {cursor: pointer;}
	.agr:disabled {background:#8C8C8C; cursor: default;}
	#all,#box1,#box2,#box3{vertical-align: -1px;margin-right: 5px; margin-left: 10px;}
	.agr{clear:both; margin: 0px auto; border-radius: 150px; width: 300px; height: 65px;}
</style>
    <script>
	    function allCheck() {
			var len = document.getElementsByName("box");
			if(document.getElementById("all").checked==true){  
				document.getElementById("btn").disabled = false;
		      	for(var i=0;i<len.length;i++) 
		       	len[i].checked=true;  
		   	}
			if(document.getElementById("all").checked==false){
				document.getElementById("btn").disabled = true;
		     	for(var i=0;i<len.length;i++) 
		    	len[i].checked=false;  
		   }
		} // allCheck
	    
		function check(){
	    	if(document.getElementById("box1").checked == false || document.getElementById("box2").checked == false ||document.getElementById("box3").checked == false){
	    		$("input:checkbox[id='all']").prop("checked", false);
	    		document.getElementById("btn").disabled = true;
	    	}else{
	    		$("input:checkbox[id='all']").prop("checked", true);
	    		document.getElementById("btn").disabled = false;
	    	}
	    } // check
	    
	    function basketOrderProc() {
	    	var temp_prNo = document.getElementById('temp_prNo').value;
// 			console.log(`temp_fruits: ${temp_fruits}`);
			var prNo = JSON.stringify(temp_prNo);
// 			console.log(`fruits: ${fruits}`);
			document.getElementById('prNo').value=prNo;
			document.getElementById('f').submit();
	    	
// 	    	location.href='${root}index?formpath=basketOrderProc';
	    }
	    
    </script>
<div id="div_basketOrderForm">
	<div class = "info">
		<div class="info_title">
			<h1>????????????</h1>
			<hr>
		</div>
		<div class = "info_name">
			<table>
				<tr>
					<th>??????</th><td>${memberInfo.nickname }</td>
				</tr>
				<tr>
					<th>???????????????</th><td>${memberInfo.phone }</td>
				</tr>
			</table>
		</div>
		<div>
			<form action="basketOrderProc" method="post" id="f">
				<input type="hidden" id="temp_prNo" name="temp_prNo" value="${prNo }" />
				<input type="hidden" id="prNo" name="prNo"/>
			</form>
		</div>
		<hr>
	</div>
	<div class = "terms">
		<div class="info_title">
			<h1>????????????</h1>
			<hr>
		</div>
		<div class = "all_check">
			<input type = "checkbox" id = "all" onclick = "allCheck()">?????? ??????
		</div>
		<div id="div_terms_">
			<div class = "terms_">
				<input type = "checkbox" name = "box" id = "box1" onclick = "check()">
				<label for="box1" class="check-label"></label>
				<span>[LG??????] ???????????? ?????? ??? ?????? ?????? (??????)</span><button id = "modal1" class = "m_btn"><span>????????????</span></button>
			</div>
			<div class = "terms_">
				<input type = "checkbox" name = "box" id = "box2" onclick = "check()"><span>[LG??????] ???????????? ??? 3??? ?????? ?????? (??????)</span><button id = "modal2" class = "m_btn"><span>????????????</span></button>
			</div>
			<div class = "terms_">
				<input type = "checkbox" name = "box" id = "box3" onclick = "check()"><span>[??????] ???????????? ??? 3??? ?????? ?????? (??????)</span><button id = "modal3" class = "m_btn"><span>????????????</span></button>
			</div>
		</div>
		<div style="display: flex;">
			<input type = button id = "btn" class = "agr" value = "??????" onclick = "basketOrderProc()" disabled="disabled">
		</div>
	</div>
</div>


    <style>
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
        }
    
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 30%;                         
        }
	</style>
 
 
 	<!-- ???????????? 1 -->
    <div id="myModal1" class="modal">
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">[LG??????] ???????????? ?????? ??? ?????? ?????? (??????)</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">
                ???????????? ????????? ??? ?????????(?????????)??? ??????/?????????(?????????, ??????)/??????, ????????? ???????????? ?????? ??? ????????????(??????/????????????,
				??????/?????????, ?????? ????????????), ?????? ?????? ????????????(CI, DI, ?????????????????? Key???, ????????????, ??????, ?????????)
				??????/???????????? ????????? ?????? ?????? ??? ????????? ?????? ???????????????, ????????????, ????????????/??????, ????????????, ????????????,
				????????????/????????????, ?????? ?????? ????????? ??????(????????? ??????, ????????? ?????? ??????, ?????? ????????? ?????? ??? ?????? ????????? ?????????/??????
				?????? ?????? ????????? ?????? ????????? ????????? ?????? ????????? ??????) LG????????? ????????? ??????????????? ????????? ????????? ??? ?????? ???????????????
				????????? ???????????? ????????? ?????? ????????? ??? ????????????. LG????????? ?????? ?????? ?????? ????????? ?????? ?????????/??????/?????? ?????? ??????
				????????? ?????? ??? ????????? ?????? ?????? ????????? ?????? ????????? ????????????(??????, ?????????, ?????? ???)??? ???????????? ????????? ??? ?????? ?????????
				???????????? ????????? ?????? ??????, ??????, ??????????????? ?????????????????? ???????????? ?????? ????????? ????????????. ????????? ????????? ????????? ???
				????????????. ??????, ???????????? ?????? ??? ????????? ??????????????? ??? ????????? ????????? ???????????????. ????????? ???????????? LG??????????????? ????????????
				?????? ?????? ??????/?????? ????????? ?????? ?????? ???????????????.</span></p>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" id = "close1">
                <span class="pop_bt" style="font-size: 13pt;">??????</span>
            </div>
      </div>
    </div>
    <!-- ???????????? 2 -->
    <div id="myModal2" class="modal">
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">[LG??????] ???????????? ???3??? ?????? ?????? (??????)</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">
                ??????????????? ???????????? ???: ???LG???????????? ??????????????? ???????????? ?????? ???????????? ?????? ??????: ????????? ?????? ?????? ??? ????????? ?????? ????????? ??????,
				????????????, ????????????/??????, ????????????, ????????????, ????????????, ???????????? ??????, ????????? ?????? ??????, ????????? ???????????? ??????/??????
				????????? ?????? ???????????? ??????????????? ??????: ?????? ??? ?????????(?????????)??? ??????/?????????(?????????, ??????)/??????, ?????? ???????????? ??????
				??? ????????????(??????/????????????, ??????/?????????, ?????? ????????????), ?????? ????????????(CI, DI, ?????????????????? Key???, ????????????,
				??????, ?????????), ?????? ??????, ????????? ??????, ?????? ??????, ?????? ?????? ??? ??????????????? ???????????? ?????? ???????????? ?????? ???
				????????????: LG??????????????? ??????????????? ??? ????????? ????????? ?????? ?????? ????????? ??????????????? ??????????????? ??? ????????? ????????? ?????? ??????
				??????????????? ?????? ???????????? ?????? ?????? ??????????????? ??????, ???????????? ???????????? ?????? ?????? ??? ?????? ?????? ???????????????. ??????,
				???????????? ?????? ???????????? ????????? ????????? ???????????? ???????????? ?????? ???????????? ??????????????? ????????? ??? ????????????. - ?????? ??? ?????????
				????????? ????????? ????????? ???????????? ?????? ?????? - ?????? ?????? ???????????? ?????? ?????? ??????: 5??? - ???????????? ??? ?????? ?????? ?????????
				?????? ??????: 5??? - ????????? ?????? ?????? ??????????????? ?????? ??????: 3??? - ?????? ????????? ?????? ??????: 5??? - ????????? ?????????
				?????? ??????????????? ?????? ???????????? ??????????????? ????????? ?????? - ??????????????? ????????? ????????? ?????? ?????? ????????? ????????? ????????? ???
				????????????. ??????, ???????????? ???3??? ????????? ??????????????? ??? ????????? ????????? ???????????????. ????????? ???????????? LG??????????????? ????????????
				?????? ?????? ??????/?????? ????????? ?????? ?????? ???????????????.</span></p>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" id = "close2">
                <span class="pop_bt" style="font-size: 13pt;">??????</span>
            </div>
      </div>
    </div>
    <!-- ???????????? 3 -->
    <div id="myModal3" class="modal">
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">[??????] ???????????? ???3??? ?????? ?????? (??????)</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">
                ??????????????? ???????????? ???: LG????????? ??????????????? ???????????? ?????? ???????????? ?????? ??????: ????????? ?????? ?????? ??? ????????? ?????? ????????? ??????,
				????????????, ????????????/??????, ????????????, ????????????, ????????????, ???????????? ??????, ????????? ?????? ??????, ????????? ???????????? ??????/??????
				????????? ?????? ???????????? ??????????????? ??????: ?????? ??? ?????????(?????????)??? ??????/?????????(?????????, ??????)/??????, ?????? ???????????? ??????
				??? ????????????(??????/????????????, ??????/?????????, ?????? ????????????), ?????? ????????????(CI, DI, ?????????????????? Key???, ????????????,
				??????, ?????????), ?????? ??????, ????????? ??????, ?????? ??????, ?????? ?????? ??? ??????????????? ???????????? ?????? ???????????? ?????? ???
				????????????: LG????????? ??????????????? ??? ????????? ????????? ?????? ?????? ????????? ??????????????? ??????????????? ??? ????????? ????????? ?????? ??????
				??????????????? ?????? ???????????? ?????? ?????? ??????????????? ??????, ???????????? ???????????? ?????? ?????? ??? ?????? ?????? ???????????????. ??????,
				???????????? ?????? ???????????? ????????? ????????? ???????????? ???????????? ?????? ???????????? ??????????????? ????????? ??? ????????????. - ?????? ??? ?????????
				????????? ????????? ????????? ???????????? ?????? ?????? - ?????? ?????? ???????????? ?????? ?????? ??????: 5??? - ???????????? ??? ?????? ?????? ?????????
				?????? ??????: 5??? - ????????? ?????? ?????? ??????????????? ?????? ??????: 3??? - ?????? ????????? ?????? ??????: 5??? - ????????? ?????????
				?????? ??????????????? ?????? ???????????? ??????????????? ????????? ?????? - ??????????????? ????????? ????????? ?????? ?????? ????????? ????????? ????????? ???
				????????????. ??????, ???????????? ???3??? ????????? ??????????????? ??? ????????? ????????? ???????????????.</span></p>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" id = "close3">
                <span class="pop_bt" style="font-size: 13pt;">??????</span>
            </div>
      </div>
    </div>
    
    <script type="text/javascript">
        jQuery(document).ready(function() {
        	$("#modal1").click(function() {
        		$('#myModal1').show();
        	});
        	$("#modal2").click(function() {
        		$('#myModal2').show();
        	});
        	$("#modal3").click(function() {
        		$('#myModal3').show();
        	});
        	$("#close1").click(function() {
        		$('#myModal1').hide();
        	});
        	$("#close2").click(function() {
        		$('#myModal2').hide();
        	});
        	$("#close3").click(function() {
        		$('#myModal3').hide();
        	});
        });
     </script>


