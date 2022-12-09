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
	 	margin-top:50px; 
	 	max-width:1300px;
	}
	#orderStatus{
	 	padding:60px;
		background-color:#F5F5F5;
		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
		border-bottom-left-radius: 10px;
		border-bottom-right-radius: 10px;
		font-size:35px;
		text-align:center;
	}
	#orderStatus a{display:inline-block; padding:20px; text-decoration:none; color:black;}
	#orderStatus a:hover{font-weight:bold;}
	.orderStatusCount{color:#008cd4;}
	.orderDetail{
		margin:auto; 
	 	margin-top:50px; 
	 	max-width:1300px;
	 	height:330px;
	 	padding:20px;
	 	background-color:rgba(0, 140, 212, 0.2);
		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
		border-bottom-left-radius: 10px;
		border-bottom-right-radius: 10px;
	}
	.orderDetail table{
		width:1100px;
        flex-direction: row;
        justify-content: center;
	}
	.orderDetail td{padding:15px; word-break:break-all;}
	.line{border-left : thick solid gray; height : 140px;}
	
	.orderProductDetail{float:right; cursor:pointer;}
	.orderProductDetail:hover{text-decoration:underline; font-weight:bold;}
	.orderCancel{float:right}
	
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/top.jsp"/>
	</header>
	<section>
		<div id="orderStatus">
			<a href="#"><div class="orderStatusTitle">입금대기</div><div class="orderStatusCount">0</div></a>
			<span>></span>
			<a href="#"><div class="orderStatusTitle">결제완료</div><div class="orderStatusCount">0</div></a>
			<span>></span>
			<a href="#"><div class="orderStatusTitle">배송준비</div><div class="orderStatusCount">0</div></a>
			<span>></span>
			<a href="#"><div class="orderStatusTitle">배송중</div><div class="orderStatusCount">0</div></a>
			<span>></span>
			<a href="#"><div class="orderStatusTitle">배송완료</div><div class="orderStatusCount">0</div></a>
			<span>></span>
			<a href="#"><div class="orderStatusTitle">구매확정</div><div class="orderStatusCount">0</div></a>
		</div>
		<br><br>
		<hr width="1300px;" style="margin:auto"><br><br>
		<div id="selectDate" class="btn-group">
		  <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">기간</button>
		  <ul class="dropdown-menu">
		    <li><a class="dropdown-item" href="#">1개월</a></li>
		    <li><a class="dropdown-item" href="#">3개월</a></li>
		    <li><a class="dropdown-item" href="#">1년</a></li>
		    <li><a class="dropdown-item" href="#">전체</a></li>
		  </ul>
		</div>
		<div class="orderDetail">
			<span>주문번호 : 000-1111-123456</span>&nbsp;&nbsp;&nbsp;
			<span>주문일자 : 2022-02-12</span>
			<span class="orderProductDetail">상세보기</span><br><br>
			<div>
				<span class="badge text-bg-light" style="font-size:1em">입금대기</span><br>
			</div>
			<table>
				<tr>
					<td rowspan="2" width="200px;"><img src="${ contextPath }/resources/image/babychicken.png" width="160"></td>
					<td  height="50px;" width="450">다우니</td>
					<td rowspan="2" width="50px;"><div class="line"></div></td>
					<td colspan="2">옵션</td>
				</tr>
				<tr>
					<td>초고농축 어쩌구</td>
					<td colspan="2">가격</td>
				</tr>
			</table>
			<button type="button" class="btn btn-light orderCancel" data-bs-toggle="modal" data-bs-target="#orderCancelModal">
			  주문취소
			</button>	
		</div>
		<div class="orderDetail">
			<span>주문번호 : 000-1111-123456</span>&nbsp;&nbsp;&nbsp;
			<span>주문일자 : 2022-02-12</span>
			<span class="orderProductDetail">상세보기</span><br><br>
			<div>
				<span class="badge text-bg-light" style="font-size:1em">배송완료</span><br>
			</div>
			<table>
				<tr>
					<td rowspan="2" width="200px;"><img src="${ contextPath }/resources/image/babychicken.png" width="160"></td>
					<td  height="50px;" width="450">다우니</td>
					<td rowspan="2" width="50px;"><div class="line"></div></td>
					<td colspan="2">옵션</td>
				</tr>
				<tr>
					<td>초고농축 어쩌구</td>
					<td colspan="2">가격</td>
				</tr>
			</table>
			<button type="button" class="btn btn-light orderCancel" data-bs-toggle="modal" data-bs-target="#orderReviewModal">리뷰작성</button>
			<button type="button" class="btn btn-light orderCancel" data-bs-toggle="modal" data-bs-target="#orderCommitModal">구매확정</button>
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
	
	<!--  구매 확정 모달 -->
	<div class="modal" tabindex="-1" id="orderCommitModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">구매확정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>구매확정을 하시면 환불/반품이 불가합니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
					<button type="button" class="btn btn-light" style="background:#008cd4; color:white">구매확정</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 리뷰 작성 모달창 -->
	<div class="modal fade" id="orderReviewModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<form name="" id="" action="" method="post">
							<div class="modal-header">
								<h3 style="color:#008cd4">여러분의 리뷰를 작성해주세요</h3>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="mb-3">
  									<label for="formFile" class="form-label">제품의 사진을 올려주세요.</label>
  									<input class="form-control" type="file" id="formFile">
								</div>
								<div>
									<textarea class="form-control" placeholder="여러분의 리뷰를 작성해주세요." id="boardContent" name="boardContent" style="height: 300px; resize:none;"></textarea>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-light" data-bs-dismiss="modal">창 닫기</button>
								<button type="submit" class="btn btn-outline-light" style="background:#008cd4; color:white" id="reviewSubmit">리뷰 작성하기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
	<script>
		const orderProductDetail = document.getElementsByClassName("orderProductDetail");
		console.log(orderProductDetail);
		orderProductDetail[0].addEventListener('click',function(){
			location.href='${contextPath}/orderProductDetail.me';
		});
	
	</script>
</body>
</html>