<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script> 
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
   .front{margin: 30px 180px;} 
	.Price{text-align: right;} 
	#totalPrice{font-family: #008cd4 bold;} 
    .ordersheet{width:250px;}
	.space{width:100px;}
	.method{margin-left:auto; margin-right:auto;}
	 button{background-color:#008cd4;
	  		 width: 290px;
	  		 height: 50px;
	  		 color: white;
	  		 font-size: 300px;
	  		 border: solid 2px gray;
 			 border-radius: 30px;	 
	  } 
	  
      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
</style>
 </head>
 	<header class="sticky-top">
		<div>
			<jsp:include page="../common/top.jsp"/>
		</div>
	</header>
	    
	 <div class="front">
	  <div class="row g-5">
	    <div class="col-md-8">
	        <nav class="navbar navbar-expand-lg "></nav>
		        <h2 class="blog-post-title mb-1 #008cd4">주문서</h2>
		        <br>
			     <div class="blog-post">
			        <h5 class="blog-post-title mb-1">▶배송지 정보</h5>
			        <hr>
			        <form action="${ contextPath }/ordersheet.st">
			          <table>
					       	<tr>
					       		<td>수령인</td>
					       		<td><input type="text" class="ordersheet" name="recipient" placeholder="받으시는 분 성함을 입력해주세요" required ></td>			       		
					       	</tr>
					       	<tr>
					       		<td>휴대전화</td>
					       		<td><input type="text" class="ordersheet" name="phone" placeholder="받으시는 분 휴대전화를 입력해주세요" required></td>
					       	</tr>
					       	<tr>
					       		<td>주소</td>
					       		<td><input type="text" class="ordersheet" name="address" placeholder="배송지를 입력해주세요" name="address" id="address_kakao" readonly></td>
					       	</tr>
					       	<tr>
					       		<td>상세주소</td>
					       		<td><input type="text" class="ordersheet" name="address_detail" placeholder="배송지 상세주소를 입력해주세요" id="address_kakao" required></td>
					       	</tr>
			        	</table>
			       	</form>
			       	
			        <br>
			        <select style="width:500px; height:25px;" onchange="this.form.submit()">
			        	<option>배송시 요청사항을 선택해주세요</option>
			        	<option>배송전에 미리 연락주세요</option>
			        	<option>부재시 문앞에 놓아주세요</option>
			        	<option>부재시 경비실에 맡겨주세요</option>
			        	<option>부재시 전화나 문자 부탁드려요</option>
			        </select>
			       </div>
			 
			       <br><br>
			       <h5 class="blog-post-title mb-1">▶주문자 정보</h5>
			       <hr>
			       <table>
			       	<tr>
			       		<td>이름</td>
			       		<td><input type="text" class="ordersheet" value="${ member.memberName }"></td>			       		
			       	</tr>
			       	<tr>
			       		<td>이메일</td>
			       		<td><input type="email" class="ordersheet" value="${ member.email }"></td>
			       	</tr>
			       	<tr>
			       		<td>휴대전화</td>
			       		<td><input type="text" class="ordersheet" value="${ member.phone }"></td>
			       	</tr>
			       </table>
			       <br><br>
			      
			  <%-- ${ orderList } --%>
			  <%-- ${ member } --%>

	  <!-- 주문정보 바로 보내기 -->			        
				   <h5 class="blog-post-title mb-1">▶상품 정보</h5>
				   <hr>
				   <c:if test="${ !empty orderList }">
				       <table class="table">   
					   <tr height="15">
					    	<td scope="row" width="250" rowspan="2" class="bottomNone"><img src="${ contextPath }/resources/uploadFiles/${orderList.imgRename }"1 width="100"></td>
					     	<td width="350">상품</td>
					      	<td width="350">옵션/수량</td>
					      	<td width="250">총 상품 금액</td>
					      	<td style="display:none" class="productNo"></td>
					   	</tr>
					   	<tr>
					     	<td class="bottomNone">
					      		<div>${ orderList.boardTitle }</div>
					      	</td>
					      	<td class="bottomNone">
								<div>옵션 : ${ orderList.productOption } </div>
								<div>수량 : ${ orderList.productQty }</div>		      
					      	</td>
					      	<td class="bottomNone">
				
					      	<fmt:formatNumber type="number" maxFractionDigits="3" value="${ orderList.finalPrice * orderList.productQty }" var="totalPrice" />
					      		<div><span class="price" style="color:red;">${ totalPrice } 원</span>
					      	    </div>
					      	</td>
					   	</tr>
					</table>
					</c:if>
					
					
					
	<!-- 장바구니 상품정보 -->
					<c:set var= "total" value= "0"/>
					<c:forEach items="${ cList }" var="c" varStatus="status">
				       <table class="table">   
					   <tr height="15">
					    	<td scope="row" width="250" rowspan="2" class="bottomNone"><img src="${ contextPath }/resources/uploadFiles/${orderList.imgRename }"1 width="100"></td>
					     	<td width="350">상품</td>
					      	<td width="350">옵션/수량</td>
					      	<td width="250">총 상품 금액</td>
					      	<td style="display:none" class="productNo"></td>
					   	</tr>
					   	<tr>
					     	<td class="bottomNone">
					      		<div>${ c.boardTitle }</div>
					      	</td>
					      	<td class="bottomNone">
								<div>옵션 : ${ c.productOption } </div>
								<div>수량 : ${ c.quantity }</div>		      
					      	</td>
					      		<td class="bottomNone">
				
							<c:set var="discountPrice" value="${ c.productPrice-(c.productPrice*c.productDiscount/100)}"/>
						
					      	<fmt:formatNumber type="number" maxFractionDigits="3" value="${ discountPrice * c.quantity }" var="totalPrice" />
					      		<div><span class="price" style="color:red;">${ totalPrice } 원</span>
					      	    </div>
					      	</td>
					   	</tr>
					</table>
					
					</c:forEach>
			        
			     
				   <br><br>
				   <h5 class="blog-post-title mb-1">▶결제 수단</h5>
				   <hr>
				   <div class="container text-center">
					  <div class="row row-cols-auto">
					  	<table class="method">
					  		<tr>
					  			<td> <div class="col"><img src="https://cdn-icons-png.flaticon.com/512/3991/3991999.png" style="width:100px;height:100px;"></div></td>
					  			<td class="space"></td>
					  			<td> <div class="col"><img src="https://cdn-icons-png.flaticon.com/512/4614/4614153.png" style="width:100px;height:100px;"></div></td>
					  			<td class="space"></td>
					  			<td> <div class="col"><img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fdathdj%2FbtqCpPA7Ejb%2FjLbp8B6QOqMTxQ6RmqdGL0%2Fimg.jpg" style="width:100px;height:100px;"></div></td>
					  		</tr>
					  		<tr>
					  			<td>카카오페이</td>
					  			<td class="space"></td>
					  			<td>카드결제</td>
					  			<td class="space"></td>
					  			<td>네이버페이<td>
					  		</tr>
					  	</table>
					  </div>
					</div>
	            </div>
	     
	    <!-- 결제창  -->
	    <div class="col-md-4">
	      <div class="position-sticky" style="top: 15rem;">
	       <div class="p-4">
	         <div style="height: auto; width: 330px; border:1px solid gray; background-color:#DCDCDC; padding:7px 7px;">
	         	<form>
	         		<h3>결제금액</h3>
	         		 <table>
				   		<tr>
					   		<td width="200px">총 상품 금액</td>
					   		<td class="Price" id="changedPrice">${ totalPrice }원</td>
					   	</tr>
					   	<tr>
					   		<td width="200px" >배송비</td>
					   		<td class="Price" id="deliveryPrice">0원</td>
					   	</tr>
					   </table>
		         	</form>
		         <hr>
		         <h4>최종 결제 금액　<span style="color:#008cd4;" id="finalPrice" ></span></h4>
		         <hr>
		         <form>
			         <input type="checkbox" required> 아래 내용에 모두 동의합니다.(필수)<br>
			         <input type="checkbox" required> 개인정보 수집 이용 및 제 3자 제공 동의 (필수)
			         <br>
			         <button type="button" class="order_btn" id="check_module">결제하기</button>
		         </form>
		         
		         </div>
		         </div>
			   </div>	
	    	 </div>
	   	  </div>
	    </div>
      
		
    <footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>
	


<script>
	window.onload = function(){
	    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면 카카오 주소 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	                document.getElementById("address_kakao").value = data.address; // 주소 넣기
	                document.querySelector("input[name=address_detail]").focus(); // 상세입력 포커싱
	            }
	        }).open();
	    });
	    
	    // (바로구매) 최종 금액 계산하기
	    const price1 = $("#changedPrice").text();
	    const price2 = price1.replace(",", "");
	    const totalPrice = parseInt(price2); 
	    //console.log(typeof totalPrice);
	    
	    if(totalPrice > 50000){
	    	var deliveryFee = 0;	 
	    	 $('#deliveryPrice').text(deliveryFee.toLocaleString()+"원");
	    } else { 
	    	var deliveryFee = 2500;
	    	 $('#deliveryPrice').text(deliveryFee.toLocaleString()+"원");
	    }
		  finalPrice = deliveryFee + totalPrice
	      // console.log(finalPrice); 
	      $('#finalPrice').text(finalPrice.toLocaleString()+"원");
	    }
	
	 </script>
	 <script>
	// 아임포트 API 결제하기
	    $(".order_btn").click(function () {
	    	  var IMP = window.IMP; // 생략가능
	    	  IMP.init('imp24668238'); 	// <-- 싱글리어 식별코드 삽입
       
        IMP.request_pay({
        	   pg: "html5_inicis",
               pay_method: "card",
               merchant_uid: 'SingleRior_'+new Date().getTime(),
               name: "${ orderList.boardTitle }",
               amount: finalPrice,
               buyer_email: "${ member.email }",
               buyer_name: "${ member.memberName }",
               buyer_tel: "${ member.phone }",
               buyer_addr: "",
               buyer_postcode: ""
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                alert(msg);
            } else {
                var msg = '결제에 실패하였습니다.';
                alert(msg);
            }

        });
    });


</script>
</body>
</html>