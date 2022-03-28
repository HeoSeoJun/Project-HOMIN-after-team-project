<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<script src="https://code.jquery.com/jquery-latest.js"></script>

<style>
	input{appearance:auto;}
	.info_name{padding-top: 20px; padding-bottom: 20px;}
	.all_check{border: 1px solid #BDBDBD; border-radius: 5px; margin-bottom: 35px; width: 100%; height: 50px; line-height:50px;}
	.terms_{padding-bottom: 15px;}
	.m_btn{float: right;}
	.agr{background:purple; clear:both; margin: 30px auto; border:0; border-radius: 150px; width: 300px; height: 65px; color: white;}
	#modal1,#modal2,#modal3{background-color:transparent; border: 0;}
	#modal1,#modal2,#modal3:hover {cursor: pointer;}
	.agr:disabled {background:#8C8C8C;}
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
		}
	    function check(){
	    	if(document.getElementById("box1").checked == false || document.getElementById("box2").checked == false ||document.getElementById("box3").checked == false){
	    		$("input:checkbox[id='all']").prop("checked", false);
	    		document.getElementById("btn").disabled = true;
	    	}else{
	    		$("input:checkbox[id='all']").prop("checked", true);
	    		document.getElementById("btn").disabled = false;
	    	}
	    		
	    }
    </script>
<div>
	<div class = "info">
		<div>
			<h1>고객정보</h1>
		</div>
		<div class = "info_name">
			<span>이름</span>&nbsp<span>${memberInfo.nickname }</span>
		</div>
		<div>
			<span>휴대폰번호</span>&nbsp<span>${memberInfo.phone }</span>
		</div>
	</div>
	<br><br>
	<div class = "terms">
		<div>
			<h1>약관동의</h1>
			<br>
			<hr/>
		</div>
		<br>
		<div class = "all_check">
			<input type = "checkbox" id = "all" onclick = "allCheck()">전체 동의
		</div>
		<div>
			<div class = "terms_">
				<input type = "checkbox" name = "box" id = "box1" onclick = "check()">
				<label for="box1" class="check-label"></label>
				<span>[LG전자] 개인정보 수집 및 이용 동의 (필수)</span><button id = "modal1" class = "m_btn"><span>약관보기</span></button>
			</div>
			<div class = "terms_">
				<input type = "checkbox" name = "box" id = "box2" onclick = "check()"><span>[LG전자] 개인정보 제 3자 제공 동의 (필수)</span><button id = "modal2" class = "m_btn"><span>약관보기</span></button>
			</div>
			<div class = "terms_">
				<input type = "checkbox" name = "box" id = "box3" onclick = "check()"><span>[홈인] 개인정보 제 3자 제공 동의 (필수)</span><button id = "modal3" class = "m_btn"><span>약관보기</span></button>
			</div>
			<div style="display: flex; margin-top: 50px;">
				<input type = button id = "btn" class = "agr" value = "동의" onclick = "location.href='${root}index?formpath=order&prodNo=${productInfo.product_no }'" disabled="disabled">
			</div>
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
 
 
 	<!-- 이용약관 1 -->
    <div id="myModal1" class="modal">
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">[LG전자] 개인정보 수집 및 이용 동의 (필수)</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">
                수집항목 계약자 및 인수자(설치처)의 성명/연락처(휴대폰, 자택)/주소, 계약자 자동승인 요청 시 결제정보(카드/계좌번호,
				카드/은행명, 카드 유효기간), 고객 본인 확인정보(CI, DI, 주민번호대체 Key값, 생년월일, 성별, 통신사)
				수집/이용목적 서비스 계약 체결 및 유지를 위한 신용도판단, 본인확인, 상품배송/설치, 유지보수, 상담운영,
				자동납부/요금정산, 이용 정보 분석에 활용(서비스 제공, 서비스 품질 개선, 신규 서비스 개발 및 고객 지향적 서비스/제품
				등의 정보 제공을 위한 서비스 이용에 대한 통계적 분석) LG전자가 수집한 개인정보는 개인을 식별할 수 없는 통계자료로
				만들어 이용성향 분석을 위해 활용될 수 있습니다. LG전자는 이용 정보 분석 결과에 따른 서비스/제품/정보 추천 등의
				광고성 정보 및 이벤트 정보 등의 전달을 위해 필요한 개인정보(이름, 연락처, 주소 등)에 대해서는 별도로 각 해당 활동이
				발생하는 시점에 수집 항목, 목적, 보유기간을 선택사항으로 고지하고 별도 동의를 받습니다. 본인은 동의를 거부할 수
				있습니다. 다만, 개인정보 수집 및 이용에 동의하셔야 본 서비스 이용이 가능합니다. 홈인은 주식회사 LG전자로부터 개인정보
				처리 동의 수령/관리 업무를 위탁 받아 처리합니다.</span></p>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" id = "close1">
                <span class="pop_bt" style="font-size: 13pt;">닫기</span>
            </div>
      </div>
    </div>
    <!-- 이용약관 2 -->
    <div id="myModal2" class="modal">
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">[LG전자] 개인정보 제3자 제공 동의 (필수)</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">
                개인정보를 제공받는 자: ㈜LG유플러스 개인정보를 제공받는 자의 개인정보 이용 목적: 서비스 계약 체결 및 유지를 위한 신용도 판단,
				본인확인, 상품배송/설치, 유지보수, 상담운영, 자동납부, 계약내역 조회, 서비스 이력 조회, 온라인 스케줄링 등록/변경
				서비스 제공 제공하는 개인정보의 항목: 본인 및 인수자(설치처)의 성명/연락처(휴대폰, 자택)/주소, 본인 자동승인 요청
				시 결제정보(카드/계좌번호, 카드/은행명, 카드 유효기간), 본인 확인정보(CI, DI, 주민번호대체 Key값, 생년월일,
				성별, 통신사), 계약 이력, 서비스 이력, 방문 이력, 상담 이력 등 개인정보를 제공받는 자의 개인정보 보유 및
				이용기간: LG유플러스는 케어솔루션 및 케어십 계약일 또는 최초 서비스 접수일부터 케어솔루션 및 케어십 서비스 해지 또는
				계약종료일 또는 정보활용 동의 철회 요청시까지 보관, 활용하며 개인정보 삭제 요구 시 지체 없이 삭제합니다. 다만,
				수집목적 또는 제공받은 목적이 달성된 이후에도 아래에서 정한 경우에는 개인정보를 보존할 수 있습니다. - 상법 등 법령의
				규정에 의하여 보존할 필요성이 있는 경우 - 계약 또는 청약철회 등에 관한 기록: 5년 - 대금결제 및 재화 등의 공급에
				관한 기록: 5년 - 소비자 불만 또는 분쟁처리에 관한 기록: 3년 - 납세 증거에 관한 기록: 5년 - 정당한 절차에
				따라 보유기간을 미리 고객에게 고지하거나 명시한 경우 - 개별적으로 고객의 동의를 받은 경우 본인은 동의를 거부할 수
				있습니다. 다만, 개인정보 제3자 제공에 동의하셔야 본 서비스 이용이 가능합니다. 홈인은 주식회사 LG전자로부터 개인정보
				처리 동의 수령/관리 업무를 위탁 받아 처리합니다.</span></p>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" id = "close2">
                <span class="pop_bt" style="font-size: 13pt;">닫기</span>
            </div>
      </div>
    </div>
    <!-- 이용약관 3 -->
    <div id="myModal3" class="modal">
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">[홈인] 개인정보 제3자 제공 동의 (필수)</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">
                개인정보를 제공받는 자: LG전자㈜ 개인정보를 제공받는 자의 개인정보 이용 목적: 서비스 계약 체결 및 유지를 위한 신용도 판단,
				본인확인, 상품배송/설치, 유지보수, 상담운영, 자동납부, 계약내역 조회, 서비스 이력 조회, 온라인 스케줄링 등록/변경
				서비스 제공 제공하는 개인정보의 항목: 본인 및 인수자(설치처)의 성명/연락처(휴대폰, 자택)/주소, 본인 자동승인 요청
				시 결제정보(카드/계좌번호, 카드/은행명, 카드 유효기간), 본인 확인정보(CI, DI, 주민번호대체 Key값, 생년월일,
				성별, 통신사), 계약 이력, 서비스 이력, 방문 이력, 상담 이력 등 개인정보를 제공받는 자의 개인정보 보유 및
				이용기간: LG전자는 케어솔루션 및 케어십 계약일 또는 최초 서비스 접수일부터 케어솔루션 및 케어십 서비스 해지 또는
				계약종료일 또는 정보활용 동의 철회 요청시까지 보관, 활용하며 개인정보 삭제 요구 시 지체 없이 삭제합니다. 다만,
				수집목적 또는 제공받은 목적이 달성된 이후에도 아래에서 정한 경우에는 개인정보를 보존할 수 있습니다. - 상법 등 법령의
				규정에 의하여 보존할 필요성이 있는 경우 - 계약 또는 청약철회 등에 관한 기록: 5년 - 대금결제 및 재화 등의 공급에
				관한 기록: 5년 - 소비자 불만 또는 분쟁처리에 관한 기록: 3년 - 납세 증거에 관한 기록: 5년 - 정당한 절차에
				따라 보유기간을 미리 고객에게 고지하거나 명시한 경우 - 개별적으로 고객의 동의를 받은 경우 본인은 동의를 거부할 수
				있습니다. 다만, 개인정보 제3자 제공에 동의하셔야 본 서비스 이용이 가능합니다.</span></p>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" id = "close3">
                <span class="pop_bt" style="font-size: 13pt;">닫기</span>
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


