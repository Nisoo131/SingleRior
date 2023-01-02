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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
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
			        <form action="${ contextPath }/orderResult.st" method="post" class="order_form">
			          <table>
					       	<tr>
					       		<td>수령인</td>
					       		<td><input type="text" class="ordersheet" name="recipient" placeholder="받으시는 분 성함을 입력해주세요" required ></td>			       		
					       	</tr>
					       	<tr>
					       		<td>휴대전화</td>
					       		<td><input type="text" class="ordersheet" name="recipient_phone" placeholder="받으시는 분 휴대전화를 입력해주세요" required></td>
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
			        <select name="deliveryMsg" style="width:500px; height:25px;" >
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
			       <form action="${ contextPath }/orderResult.st" method="post" class="order_form">
				       <table>
				       	<tr>
				       		<td>이름</td>
				       		<td><input type="text" id="b_name" name="memberName" value="${ member.memberName }"></td>			       		
				       	</tr>
				       	<tr>
				       		<td>이메일</td>
				       		<td><input type="email" id="b_email" name="email" value="${ member.email }"></td>
				       	</tr>
				       	<tr>
				       		<td>휴대전화</td>
				       		<td><input type="text" id="b_phone" name="buyer_phone" value="${ member.phone }"></td>
				       	</tr>
				       </table>
			       </form>
			       <br><br>
			  
				 
				    <%-- ${ member } --%>	
					<%--  ${ orderItem }  --%>
		        
				   <h5 class="blog-post-title mb-1">▶상품 정보</h5>
				   <hr>
				   <c:set var ="sum" value="0"/>  
				   <c:forEach items="${ orderItem }" var="o" varStatus="status">
				   ${ o.productNo }
 <!-- 상품정보 보내기 -->				   
				    <form action="${ contextPath }/orderResult.st" method="post" class="order_form">
				  	 <input type="hidden" name="productNo[]" value="${ o.productNo }">
				    </form> 
				   
				       <table class="table">   
					   <tr height="15">
					    	<td scope="row" width="250" rowspan="2" class="bottomNone"><img src="${ contextPath }/resources/uploadFiles/${o.imgRename }"1 width="100"></td>
					     	<td width="350">상품</td>
					      	<td width="350">옵션/수량</td>
					      	<td width="250">총 상품 금액</td>
					      	<td style="display:none" class="productNo"></td>
					   	</tr>
					   	<tr>
					     	<td class="bottomNone">
					      		<div id="product_name">${ o.boardTitle }</div>
					      	</td>
					      	<td class="bottomNone">
								<div>옵션 : ${ o.productOption } </div>
								<div>수량 : ${ o.productQty }</div>		      
					      	</td>
					      	<td class="bottomNone">
					     
							  <c:set var="discountPrice" value="${ o.productPrice-(o.productPrice*o.discount/100)}"/> 	
					        	 <div style="color:red;">
					        	   	<span>
					        	   		<fmt:formatNumber type="number" maxFractionDigits="3" value="${ discountPrice * o.productQty }" var="commaPrice" />
					        	 		${ commaPrice}
					        	 	</span>원 	
					      	    </div>
					      	    <c:set var="total" value="${ total + (discountPrice * o.productQty)}"/>
					      	    <form action="${ contextPath }/orderResult.st" method="post" class="order_form">
							  	 <input type="hidden" name="prices[]" value="${ discountPrice * o.productQty }">
							    </form>   
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
					   		
	    <!--  최종 금액  -->
					   		<td class="Price" id="changedPrice"> 
					           <%--  <c:out value="${ total }"/>  --%>
					            <fmt:formatNumber type="number" maxFractionDigits="3" value="${ total }" var="commatotal" />
					            ${ commatotal }원
					   		</td> 
					   	</tr>
					   	<tr>
					   		<td width="200px" >배송비</td>
					   		<td class="Price" id="deliveryPrice">0 원</td>
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
			         <button type="button" class="order_btn" id="order_btn">결제하기</button>
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
	    
    // 배송비 & 최종 금액 계산하기
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
      $('#finalPrice').text(finalPrice.toLocaleString()+"원");
    }
    
	// 주문서 공란 결제 못하게 막기
	 $("#order_btn").click(function(){
		   if($.trim($(".ordersheet").val())==''){
		     alert("주문서를 작성해주세요.");
		     return false;
		   } 
		    //$("#order_form").submit(); 
		 });  

    // 아임포트 API
     document.getElementById("order_btn").addEventListener("click", function(){
    	 
    	  var IMP = window.IMP;   // 생략 가능함
    	  IMP.init("imp24668238"); // 예: imp00000000 
    	  
    	  // 넘길 데이터 총 9개  
    	  // 배송지 입력정보
     	  var recipient = $('input[name=recipient]').val();
    	  var recipient_phone = $('input[name=recipient_phone]').val();
    	  var address = $('input[name=address]').val();
    	  var address_detail = $('input[name=address_detail]').val();
     	  var deliveryMsg = $('select[name=deliveryMsg] option:selected').text();
     	  
     	 // 구매자 기본정보
    	  var memberName = $('#b_name').val();
    	  var email = $('#b_email').val();
    	  var buyer_phone = $('#b_phone').val();
    	  

    	  // 구매 상품 정보
   		  var arr=[];
   		  $.each($("input[name='productNo[]']"),function(k,v){
   			    arr[arr.length] = $(v).val();
   			});
   		  //console.log(arr);
   		  
   		  // 상품단가*개수 = 주문상품별 가격
   		   var pricesArr=[];
   		  $.each($("input[name='prices[]']"),function(k,v){
   			pricesArr[pricesArr.length] = $(v).val();
   			});
   		  console.log(pricesArr);
    	    
    	  console.log(memberName);
    	  console.log(email);
    	  console.log(buyer_phone);
    	  console.log(deliveryMsg);
    	  console.log(recipient);
    	  console.log(recipient_phone); 
    	  console.log(address);
    	  console.log(address_detail);

    	  var amount = finalPrice;
    	  console.log(finalPrice);
    	  
    	  var allData ={"memberName":memberName,
    			         "email":email,
    			         "buyer_phone":buyer_phone,
    			         "recipient":recipient,
    			         "recipient_phone":recipient_phone,
    			         "address":address,
    			         "address_detail":address_detail,
    			         "deliveryMsg":deliveryMsg,
    			         "finalPrice":finalPrice,
    			         "arr":arr,
    			         "pricesArr":pricesArr};  
   	      IMP.request_pay({ 
   	          pg: "html5_inicis",
   	          pay_method: "card",
   	          merchant_uid: new Date().getTite,   // 주문번호
   	          name: "SingleRior_스토어",
   	          amount: 100, // 결제 테스트 이후 amount 수정 
   	       	  buyer_email: email,
 	          buyer_name: memberName,
 	          buyer_tel: buyer_phone,

   	      }, function (rsp) { // callback
   	          if (rsp.success) {
   	                    $.ajax({
			            	  url: "${contextPath}/orderResult.st", 
			            	  type: "post",
			            	  data: allData,
							  success: function(data){
			  		              location.href="${contextPath}/orderResult.st";}
		              })
   	              alert("결제성공");     
   	          } else {
   	        	 alert("결제를 실패하였습니다. 다시 시도해주세요");
   	          }
   	      }); 
     });
</script>
</body>
</html>	
