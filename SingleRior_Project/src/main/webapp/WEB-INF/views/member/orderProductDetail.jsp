<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section{
		margin:auto;
		margin-top:70px;
		max-width:1500px;
	}
	#orderProduct{
		margin:auto; 
 		margin-top:50px; 
 		max-width:1500px;
 		padding:30px;
		background-color:#F5F5F5;
		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
		border-bottom-left-radius: 10px;
		border-bottom-right-radius: 10px;
	}
	.orderInfo h3,h5,h6{display:inline-block; padding:10px;}
	.orderInfo h3{color:#008cd4;}
	.orderInfo h5{color:gray; margin-top:3px;}
	.orderInfo p{float:right;}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/top.jsp"/>
	</header>
	<section>
		<h1 style="text-align:left">주문상세</h1><br><br>
		<div id="orderProduct">
			<span>주문번호 : 000-1111-123456</span>&nbsp;&nbsp;&nbsp;
			<span>주문일자 : 2022-02-12</span>
			<button type="button" class="btn btn-light" style="background:#008cd4; color:white; float:right" data-bs-toggle="modal" data-bs-target="#orderCancelModal">주문취소</button>
			<table class="table">
			    <tr>
			      <td scope="row" colspan="4"></td>
			    </tr>
			    <tr height="15">
			    	<td scope="row" width="250" rowspan="2"><img src="${ contextPath }/resources/image/babychicken.png" width="160"></td>
			     	<td>상품
			      	</td>
			      	<td>옵션	      
			      	</td>
			      	<td>상품 금액
			      	</td>
			   	</tr>
			   	<tr>
			     	<td>
			      		<div>병아리 인형</div>
			      	</td>
			      	<td>
						<div>색상 : 노란색</div>		      
			      	</td>
			      	<td>
			      		<div>12500원</div>
			      	</td>
			   	</tr>
			</table>
		</div><br><br>
		<div class="orderInfo address">
			<h3>배송지 정보</h3>
			<p><button type="button" class="btn btn-light" style="background:#008cd4; color:white;" data-bs-toggle="modal" data-bs-target="#orderAddressModal">배송지변경</button></p>
			<hr>
			<h5>받는 사람</h5>
			<p>김로즈</p>
			<br>
			<h5>연락처</h5>
			<p>010-1111-2222</p>
			<br>
			<h5>주소</h5>
			<p>서울특별시 강남구 역삼동</p>
			<br>
			<h5>배송 메모</h5>
			<p>부재시 현관앞에 놓아주세요</p>
		</div>
		<br><br>
		<div class="orderInfo pay">
			<h3>결제 정보</h3>
			<hr>
			<h5>결제 방법</h5><p>카드결제</p><br>
			<h5>상품 금액</h5><p>12,500원</p><br>
			<h5>배송비</h5><p>2,500원</p><br>
			<h5>사용 포인트</h5><p>0원</p><br>
			<h5>결제금액</h5><p>15,000원</p><br>
			<h5>결제방법</h5><p>카드결제</p><br>
			<h5>주문자</h5><p>김이현</p><br>
			<h5>연락처</h5><p>010-1111-2222</p><br>
			<h5>이메일</h5><p>rose@ro.se</p><br>
		</div>
		<br><br>
		<div class="orderInfo Account">
			<h3>가상계좌정보(무통장입금)</h3>
			<hr>
			<h5>은행명</h5><p>국민은행</p><br>
			<h5>계좌번호</h5><p>123-456789-153</p><br>
			<h5>예금주</h5><p>주식회사 씽씽마켓</p><br>
			<h5>입금금액</h5><p>12,500원</p><br>
			<h5>기간</h5><p>2022-11-08 23:59까지</p><br>
		</div>
	</section>
	<footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>
	
	
	<!-- 주문 취소 모달창 -->
	<div class="modal" tabindex="-1" id="orderCancelModal">
		<div class="modal-dialog modal-dialog-centered">
	    	<div class="modal-content">
	     		 <div class="modal-header">
	       		 <h5 class="modal-title">주문을 취소하시겠습니까?</h5>
	       		 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	    	  </div>
	    	  <div class="modal-body">
	      		  <p>배송중이거나 구매확정일 경우 관리자에 주문취소가 철회될 수 있습니다.</p>
	      		  <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
							<option selected>취소 이유 선택</option>
							<option value="단순변심">단순변심</option>
							<option value="배송지연">배송지연</option>
							<option value="품절">품절</option>
							<option value="재주문">재주문</option>
							<option value="주문실수">주문실수</option>
							<option value="서비스불만족">서비스 불만족</option>
							<option value="기타">기타</option>
						</select>
						<div class="mb-3">
							<textarea class="form-control" id="exampleFormControlTextarea1"
								rows="3" placeholder="기타를 선택하신 경우 입력해주세요." style="resize:none;"></textarea>
						</div>
	     	 </div>
			 <div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
				<button type="button" class="btn btn-light" style="background:#008cd4; color:white">주문취소</button>
	     	 </div>
	    </div>
	  </div>
	</div>
	
	<!-- 배송지 변경 모달창 -->
	<div class="modal" tabindex="-1" id="orderAddressModal">
		<div class="modal-dialog modal-dialog-centered">
	    	<div class="modal-content">
	     		 <div class="modal-header">
	       		 <h5 class="modal-title">배송지 변경</h5>
	       		 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	    	  </div>
	    	  <div class="modal-body">
	      		  <div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">받는 사람</label>
 				 		<input type="text" class="form-control" id="exampleFormControlInput1">
				  </div>
	      		   <div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">연락처</label>
 				 		<input type="text" class="form-control" id="exampleFormControlInput1">
				  </div>
	      		  <div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">주소</label>
 				 		<input type="text" class="form-control" id="exampleFormControlInput1">
				  </div>
	      		  <div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">배송메모</label>
 				 		<input type="text" class="form-control" id="exampleFormControlInput1">
				  </div>
	     	 </div>
			 <div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
				<button type="button" class="btn btn-light" style="background:#008cd4; color:white">배송지변경</button>
	     	 </div>
	    </div>
	  </div>
	</div>
	
</body>
</html>