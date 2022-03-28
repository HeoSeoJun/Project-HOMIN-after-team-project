<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<style>
	.mainText{font-size: 40px; margin-bottom: 30px; margin-top: 15px;}
	.itemImg{width: 300px; height: 300px;}
	.item_area{display: flex; flex-direction: row;}
	.orderItem{width: 800px; margin: 0 auto; border: 1px solid #EAEAEA; border-radius: 15px; margin-top: 15px;}
	.order_Btn{width: 100%; margin: 50px auto; display: flex; justify-content: space-around; 
				background:purple;  border:0; font-size:25px;
				border-radius: 150px; width: 300px; height: 65px; color: white;}
	.item_info{margin-top: 20px;}
	.item_price{color: #D9418C;}
	.item_no, .item_name, .item_price{margin-bottom: 15px;}
</style>
<div class = "mainText">가입 예정 상품</div>
<hr/>
<div class = "orderItem">
	<div class = "item_area">
		<div class = "itemImg">
			<img class = "itemImg" src = "${root }resources/image/${productInfo.classification }/${productInfo.product_filename}">
		</div>
		<div class = "item_info">
			<div class = "item_no">${productInfo.product_no }</div>
			<div class = "item_name"><strong>${productInfo.product_name }</strong></div>
			<div class = "item_price"><strong>${productInfo.price }원</strong></div>
		</div>
	</div>
</div>
	<div>
		<input type = "button" class = "order_Btn" onclick = "iamport()" value = "신청하기">
	</div>

<script>
function iamport(){
	//가맹점 식별코드
	IMP.init('imp15192515');
	IMP.request_pay({
	    pg : 'inicis',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '${productInfo.product_name }' , 		// 결제창에서 보여질 이름
	    amount : 100, 									// 실제 결제되는 가격
	    buyer_email : '${memberInfo.email}',			// 구매자 이메일
	    buyer_name : '${memberInfo.nickname}',			// 구매자 이름
	    buyer_tel : '${memberInfo.phone}',				// 구매자 번호
	    buyer_addr : '${memberPostcode.addr1}',			// 구매자 주소
	    buyer_postcode : '${memberPostcode.zipcode}'	// 구매자 우편번호
	}, function(rsp) {		// 콜백
		console.log(rsp);
		// 결제검증
		$.ajax({
        	type : "POST",
        	url : "${root}check/" + rsp.imp_uid 
        }).done(function(data) {
        	console.log(data);
        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
        	if(rsp.paid_amount == data.response.amount){
        		var d = {
        	    		uid : data.response.impUid,
        	    		buyerpostcode : data.response.buyerPostcode,
        	    		buyername : data.response.buyerName,
        	    		email : data.response.buyerEmail,
        	    		addr : data.response.buyerAddr,
        	    		tell : data.response.buyerTel,
        	    		amount : data.response.amount,
        	    		name : data.response.name
        	   		}
	        	$.ajax({
	            	url : "orderDB?prNo=${productInfo.product_no}",
	        		type : "POST",
	    			contentType : "application/json; charset=utf-8",
	            	data : JSON.stringify(d),
	            	success : function(){
	        			location.href = "${root}index?formpath=orderfinish&no="+data.response.impUid+"&prodNo=${productInfo.product_no}";
					},
					error : function(){
						alert("문제")
					}
	        	});
        	} else {
        		alert("결제 실패");
        	}
        });
	});
}
</script>