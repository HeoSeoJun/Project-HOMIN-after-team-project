<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/faq.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css" />   


        
        
        
<div class="board_table">
	<ul>
		<li class = "faq" onclick = "childText('1')" style="border-top : 0.1px solid #e2e8f0">
			회원가입은 어떻게 하나요?
			<div id = "child1" style="display: none;" class = "child">
				홈 화면에서 [로그인] -> [회원가입}에서 가입 가능합니다.
			</div>
		</li>
		<li class = "faq" onclick = "childText('2')">
			홈인 고객센터 및 파트너사로 전화를 하는 경우 요금은 유료인가요?
			<div id = "child2" style="display: none;" class = "child">
				사용하시는 휴대폰 요금제에 따라 통화 요금이 발생할 수 있습니다.일반 유선전화로 하실 경우에는 통화료가 부과됩니다.
			</div>
		</li>
		<li class = "faq" onclick = "childText('3')">
			회원가입을 하면 모든 서비스를 신청할 수 있나요?
			<div id = "child3" style="display: none;" class = "child">
				네. 모든 서비스를 신청할 수 있습니다.또한 고객님의 취향 또는 생활환경에 맞춰 상품을 추천해 드리는 고객 맞춤 서비스도 이용할 수 있습니다.
			</div>
		</li>
		<li class = "faq" onclick = "childText('4')">
			아이디와 비밀번호가 기억나지 않아요.
			<div id = "child4" style="display: none;" class = "child">
				이메일 인증을통해 찾을 수 있습니다.
			</div>
		</li>
		<li class = "faq" onclick = "childText('5')">
			회원탈퇴는 어떻게 하나요?
			<div id = "child5" style="display: none;" class = "child">
				마이페이지에서 가능합니다.
			</div>
		</li>
	</ul>
</div>

        <div class="content_row_3">
          <span class="list_prev_btn">문의사항 이전 버튼</span>
          <a href="#">1</a>
          <a href="#">2</a>
          <a href="#">3</a>
          <span class="list_next_btn">문의사항 다음 버튼</span>
        </div>

