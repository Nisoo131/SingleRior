<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    <style>
	.category{padding:20px 200px 20px 200px;}
	.wishlist {color: #008cd4;}
	.payment{background-color:#008cd4; color:white; }
	.inquiry{font-size:30px}
	#inquiryBtn{size: 100px; background-color:#008cd4;}
	.star{text-align:center; display:table; width:300px; height:100px; margin:0 auto;}
	.wishList {float:right;}
	.opsResultDiv {display:none;}
	.button_qty {
	  line-height: 50px;
	  text-align: center;
	  background: white;
	  border-radius: 12px;
	}
		.outer-div {
	  width : 300px;
	  height : 300px;
	  background-color : blue;
	}
	
	.opsResultDiv {
	  width : 330px;
	  height : 50px;
	  margin: auto;

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

    
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap" rel="stylesheet">
    <!-- Custom styles for this template -->
  </head>
  <body>
  
		<header class="sticky-top">
			<div>
				<jsp:include page="../storeBoard/navbar.jsp"/>
			</div>
		</header>
		<div class="category">
			<h5><b> 전체 > ${ pList[0].topCateName } > ${ pList[0].subCateName }</b></h5>
			<h2><b> ${ pList[0].subCateName } </b></h2> 
			<br>
		</div>
		 <%-- ${ pList }   --%>
		 <%--  ${ pList[0] }<br><br> --%>
	     <%-- 	 ${ pList[1] }
		 ${ pList[2] }  --%>
	<main class="container">
	   <div class="row mx-md-n5">
	 	 <div class="col px-md-5"><div class="p-3 border bg-light">
	 	 	<c:if test="${ fn:containsIgnoreCase( pList[0].imgServerName, 'jpg') or fn:containsIgnoreCase( pList[0].imgServerName, 'png') }">
	 	 		<img src="resources/uploadFiles/${ pList[0].imgServerName }" width="100%" height="100%">
			</c:if>
	 	 </div>
	 	</div> 
	
	<fmt:formatNumber type="number" maxFractionDigits="3" value="${ pList[0].price }" var="commaPrice" />
	<c:set var="discountPrice" value="${ pList[0].price-(pList[0].price*pList[0].discount/100)}"/>
	<fmt:formatNumber type="number" maxFractionDigits="3" value="${ pList[0].price-(pList[0].price*pList[0].discount/100)}" var="totalPrice" />
	  <div class="col px-md-5">
	  	<div class="p-3 border bg-light">
	  		<table>
	  			<tr>
	  				<td style="font-size:25px;">${ pList[0].brand }</td>
	  				<td width="250px"></td>
	  				<td>
		  				 <c:if test="${ empty loginUser }">
							<button type="button" class="btn btn-outline-danger wishListBtn" onclick="location.href='${contextPath}/loginView.me'">찜하기♥
						</button>
						</c:if>
						<c:if test="${ !empty loginUser and count == 0}">
							<button type="button" class="btn btn-outline-danger wishListBtn" id="wishListOn">찜하기♥</button>
						</c:if>
						<c:if test="${ !empty loginUser and count == 1}">
							<button type="button" class="btn btn-outline-danger active wishListBtn" id="wishListOff">찜하기♥</button>
						</c:if>
	  				</td>
	  				<td>
	  				<a href="#" id="sns_urlCoby" class="btn_share_sns" onclick="shareURL(); return false;">
	  					<button type="button" class="btn btn btn-primary active" id="shareURL">공유하기</button>
				     </a>
	  				</td>
	  			</tr>
	  		</table>　　　　　　　　　
		  <h2>${ pList[0].boardTitle }</h2>
		  <p><s>${ commaPrice } 원</s></p>
		  <h1><span>${ pList[0].discount }%</span>　<span style="color:#008cd4;">${ totalPrice } 원</span></h1>
		  <br><br>
		  <p>구매리뷰 (개수)</p>
		  <p>배송비 2,500원</p>
		  <hr>
  <!--  상품 옵션창  -->		
			 <label for ="options">옵션선택</label>
	           	 <select id="changeOpiton" class="form-select" onChange="selectChange(this.value);" aria-label="Default select example">
					<option class="opsBasic" selected >상품 옵션을 선택해주세요</option>
					 <c:forEach items="${ fn:split( pList[0].option, ',') }" var="p">
					  <option value="${ p }" class="option">${ p }</option>
					</c:forEach>
				 </select>
				 <br>	
				 <div class="opsResultDiv">
				 <table>
				 	<tr>
				 		<td><input type="text" id="inputOption"></td>
				 		<td width="10px"></td>
				 		<td>
				 		 	<span class="count-wrap _count">
							    <button type="button" class="minus_btn" >-</button>
							   	 <input type="text" class="quantity_input" value="0" id="qty" readonly style="width:50px;"/>
							    <button type="button" class="plus_btn" >+</button>
							</span>
				 		</td>
				 	</tr>
				 </table>
				
				    <fmt:parseNumber var="i" type="number" value="${ totalPrice }"/>
				   
	             </div>
			
			  <br>
			  <h2>총 <span id="changedQty">0</span>개　<span id="finalPrice2">${ totalPrice }</span>원</h2>
			  <div class="btn-group">
			  	<c:if test="${ empty loginUser }">
				  <button type="button" class="cart" style="width:200px;height:50px;font-size:20px;" onclick="location.href='${contextPath}/loginView.me'"> 장바구니 </button>
				</c:if>
				<c:if test="${ !empty loginUser }">
				  <button type="button" class="cart" style="width:200px;height:50px;font-size:20px;"> 장바구니 </button>
				</c:if>
				<c:if test="${ empty loginUser }">	
				  <button type="button" class="payment"  style="width:200px;height:50px;font-size:20px;" onclick="location.href='${contextPath}/loginView.me'">결제하기</button>
			    </c:if> 
			    <c:if test="${ !empty loginUser }">	
				  <button type="button" class="payment"  style="width:200px;height:50px;font-size:20px;" onclick="location.href='${ contextPath }/payment.st'">결제하기</button>
			    </c:if>
			  </div>
	  		</div>
	  	</div>
	  	
	<!-- 바로결제 주문시 전달 데이터-->
	 <form action="${ contextPath }/payment.st" method="post" class="order_form">
		<input type="hidden" name="productNo" value="${ pList[0].productNo }">
		<input type="hidden" name="productQty" value="">
		<input type="hidden" name="finalPrice" value="${ pList[0].price-(pList[0].price*pList[0].discount/100)}">
		<input type="hidden" name="productOption" value="">
		<input type="hidden" name="boardTitle" value="${ pList[0].boardTitle }">
		<input type="hidden" name="imgRename" value="${ pList[0].imgServerName }">
	</form> 
	  	
	<!--상세정보 네비바 -->
	 <div class="row mb-1">
	 </div>
	  <div class="row g-5">
	    <div class="col-md-8">
	      <h3 class="pb-4 mb-4 border-bottom">
	        <nav class="navbar navbar-expand-lg bg-light">
			  <div class="container-fluid">
			    <a class="navbar-brand" href="#productInfo">상품정보</a>
				    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
				      <span class="navbar-toggler-icon"></span>
				    </button>
			    
			    <a class="navbar-brand" href="#review">리뷰(100)</a>
				    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
				      <span class="navbar-toggler-icon"></span>
				    </button>
			    
			      <a class="navbar-brand" href="#inquiry">문의하기</a>
				    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
				      <span class="navbar-toggler-icon"></span>
				    </button>
			    
			      <a class="navbar-brand" href="#delivery">배송/환불</a>
				    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
				      <span class="navbar-toggler-icon"></span>
				    </button>
				  </div>
				 </nav>
				</h3>
	
	   <!-- 상품 설명 이미지 -->
	      <article class="blog-post" id="productInfo">
	        <h2 class="blog-post-title mb-1">상품정보</h2>
	        <p class="blog-post-meta"></p>	        	      
			   <img src="resources/uploadFiles/${ pList[1].imgServerName }" width="100%" height="100%">
			   <img src="resources/uploadFiles/${ pList[2].imgServerName }" width="100%" height="100%">			  
	   	 </article>
	   	 
	   	 <div id="review">
	      <hr>
	      <article class="blog-post" >
	        <h2 class="blog-post-title mb-1" >리뷰 (개수)</h2>
	        	<div class="star">
		        	<h2 style="color:#008cd4">★★★★☆</h2>
		        	<h2>4.0</h2>
		        </div>
	       </article>
	      </div>
	      
	       <hr>
	       
	   <!-- 문의하기 -->
	       <article class="blog-post" id="inquiry">
	        <div class="blog-post-title mb-1">
	        	<form>
		        	<table>
		        		<tr>
		        			<td class="inquiry">문의</td>
		        		
		        			<td colspan="3" width="650px"></td>
		        			<c:if test="${ empty loginUser  }">
							  	<td><button type="button" class="btn btn-primary" id="inquiryBtn1" onclick="location.href='${contextPath}/loginView.me'" >문의하기</button></td>
						  	</c:if>
						  	<c:if test="${ !empty loginUser }">
							  	<td><button type="button" class="btn btn-primary" id="inquiryBtn2" data-bs-toggle="modal" data-bs-target="#inquiryModal">문의하기</button></td>
						  	</c:if>
						  	
						  	<%-- <c:if test="${ !empty loginUser and piCount == 1 }">
							  	<td><button type="button" class="btn btn-primary" id="inquiryUpdate" data-bs-toggle="modal" data-bs-target="#updateModal">수정</button></td>
							  	<td><button type="button" class="btn btn-primary" id="inquiryDelete" data-bs-toggle="modal" data-bs-target="#deleteModal">삭제</button></td>
						  	</c:if> --%>
		        		</tr>
		        	</table>
	        	</form>
	 		</div>
	 		<%--  ${ iList } --%>
	 		<c:forEach items="${ iList }" var="i">
	 		<div style="border:black solid 1px; width:600px; padding:10px 10px; border-radius:10px;" id="delivery">
		        <p class="blog-post-meta">${i.inquiryTitle} | 
			        <c:if test="${ i.inquiryAnswer == null }">
			        	<span style="color:#008cd4;">답변대기</span>
			        </c:if>
			        <c:if test="${ i.inquiryAnswer != null }">
			        	<span style="color:#008cd4;">답변완료</span>
			        </c:if>
			        </p>
				<p> ${i.memberId} | ${i.inquiryDate}</p>
				<p><img src="https://cdn-icons-png.flaticon.com/512/8371/8371275.png" width="20px" height="20px"> ${ i.inquiryContent }</p>
				<p><img src="https://cdn-icons-png.flaticon.com/512/25/25628.png" width="20px" height="20px"> ${ i.inquiryAnswer }</p>
	    	</div>
	    	<br>
	    	</c:forEach>
	    	</article>
	    	<hr>
	    	
	   <!-- 배송/환불 -->
	       <article class="blog-post" id="delievery">
	        <h2 class="blog-post-title mb-1">배송/환불</h2>
	        <br>
	        <p class="blog-post-meta">▶배송</p>
			<table>
				<tr>
					<td width="150px">배송방법</td>
					<td>일반택배</td>
				</tr>
				<tr>
					<td>배송비</td>
					<td>2,500원</td>
				</tr>
				<tr>
					<td></td>
					<td>50,000원 이상 주문시 무료배송</td>
				</tr>
				<tr>
					<td>배송 불가 지역</td>
					<td>도서산간 지역 / 제주도</td>
				</tr>
			</table>
			<br><br>
			<p class="blog-post-meta">▶교환/환불</p>
			<table>
				<tr>
					<td width="150px">반품배송비</td>
					<td>50,000원</td>
				</tr>
				<tr>
					<td>교환배송비</td>
					<td>100,000원</td>
				</tr>
				<tr>
					<td>보내실 곳</td>
					<td>서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 2F, 3F</td>
				</tr>
			</table>
	    	</article>
	    </div>
	     
	    <!-- 스크롤 옵션바 -->
	    <div class="col-md-4">
	      <div class="position-sticky" style="top: 15rem;">
	        <div class="p-4">
	          <label for ="options">옵션선택</label>
	           	 <select id="changeOpiton" class="form-select" onChange="selectChange(this.value);" aria-label="Default select example">
					<option class="opsBasic" selected >상품 옵션을 선택해주세요</option>
					 <c:forEach items="${ fn:split( pList[0].option, ',') }" var="p">
					  <option value="${ p }" class="option">${ p }</option>
					</c:forEach>
				 </select>
				 <br>
				<!--  <div class="opsResultDiv1" style="border:1px solid black; width:450px; height:100px;"> -->
				<!--   	<input type="text" id="inputOption"><br> -->
				  	<span class="count-wrap _count">
						    <button type="button" class="minus_btn" style="height:35px;">-</button>
						   	 <input type="text" class="quantity_input" value="0" style="width:70px;height:30px" id="qty"/>
						    <button type="button" class="plus_btn" style="height:35px;">+</button>
					</span>
				    <fmt:parseNumber var="i" type="number" value="${ totalPrice }"/>
				   
				    <!-- <span id="finalPrice"></span>원 -->
	             </div>
			  <br><br>
			
			  <br>
			  <h2>총 <span id="changedQty1">0</span>개　<span id="finalPrice3">${ totalPrice }</span>원</h2>
				  <div class="btn-group">
					  <button type="button" class="cart" style="width:200px;height:50px;font-size:20px;">장바구니</button>
					  <button type="button" class="payment" style="width:200px;height:50px;font-size:20px;" onclick="location.href='${ contextPath }/payment.st'">결제하기</button>
				  </div>
	        </div>
	      </div>
	    </div>
	  </div>

	<!--문의하기 모달창 -->
	<div class="modal" tabindex="-1" id="inquiryModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">문의하기</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form action="${ contextPath }/productInquiry.st" method="post">
	       <input type="hidden" name="productNo" value="${ pList[0].productNo }">
		      <div class="modal-body">
		        <p>문의유형</p>
		        	<select class="form-select" aria-label="Default select example" name="inquiryTitle" id="inquiry_ops">
						  <option value="상품">상품</option>
						  <option value="배송">배송</option>
						  <option value="반품">반품</option>
						  <option value="교환">교환</option>
						  <option value="환불">환불</option>
						  <option value="기타">기타</option>
					</select>
				 	<br>
				<p>문의내용 <span id="counter">0</span>/300</p>
				<textarea cols="50" rows="3" id="textarea" name="inquiryContent"></textarea>
		      </div>
		      <div style="color:#008cd4;">
		      　문의 답변은 ‘My Page> 나의 문의' 또는 ‘상품 상세페이지’에서 확인 가능합니다.<br>
		      </div>
			  <div class="modal-footer">
			  	<button type="submit" class="btn btn-primary" id="inquiry_modal" >완료</button>
			  </div>
		   </form>
	      </div>
	  	</div>
	</div>
	
	
	<!-- 장바구니 모달창 -->	
	<div class="modal fade" tabindex="-1" role="dialog" id="cartModal">
		<div class="modal-dialog" role="document">
	    	<div class="modal-content rounded-3 shadow">
	      		<div class="modal-body p-4 text-center">
	        		<h3 class="mb-0">장바구니에 상품이 추가되었습니다. </h3>
	        		<p class="mb-0"></p>
	      		</div>
	      		<div class="modal-footer flex-nowrap p-0">
	      			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" data-bs-dismiss="modal">계속 쇼핑하기</button>
	        		<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" id="yes" onclick="location.href='${ contextPath }/myCart.me'">
	        			<strong>장바구니</strong>
	        		</button>
	      		</div>
	    	</div>
	  	</div>
	</div>
</main>

    <footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>

</body>
<script>    
    // select 옵션 선택시 div추가 + 수량 선택하기
     $(document).ready(function(){
    	$('#changeOpiton').change(function(){
    		var state = $('.option:selected').val();
    	    //console.log(state);
    		if (state != null ){
    			$('.opsResultDiv').show();
    		} else {
    			$('.opsResultDiv').hide();
    		} 
    	});
    }); 
     const selectChange = function(value){
			$('#inputOption').val(value);	
			
	}
	
 	// 제품 수량 & 금액 버튼 조작
 	 let quantity = $('.quantity_input').val();
     $('.plus_btn').on('click', function(){
     	$('.quantity_input').val(++quantity);
	     	var qtyPlus = $('.quantity_input').val();
	     	$('#changedQty').text(qtyPlus);
	     	$('#changedQty1').text(qtyPlus);
	   		//console.log(qtyPlus);
	     	var finalPrice = (qtyPlus * ${ i }).toLocaleString();
	     	$('#finalPrice').text(finalPrice);
	     	$('#finalPrice2').text(finalPrice);
	     	$('#finalPrice3').text(finalPrice);
     });
     $('.minus_btn').on('click',function(){
    	 if(quantity > 1){
    		 $('.quantity_input').val(--quantity);
    	      	const qtyMius = $('.quantity_input').val();
    	      	$('#changedQty').text(qtyMius);
    	      	$('#changedQty1').text(qtyMius);
    	      	//console.log(qtyMius);
    	      	var finalPrice = (qtyMius * ${i}).toLocaleString();;	      	
    	     	$('#finalPrice').text(finalPrice);
    	     	$('#finalPrice2').text(finalPrice);
    	     	$('#finalPrice3').text(finalPrice);
    	 }
      });

   // 장바구니 추가
    $('.cart').on('click', function(e){
       const quantity = $('.quantity_input').val();
       const productOption = $('#inputOption').val();
       //console.log(productOption);
       $.ajax({
    	   url: '${ contextPath }/cart.st',
    	   type : 'post',
    	   data : {memberId:'${loginUser.memberId}',
    		       productNo:'${ pList[0].productNo}', 
    		       quantity:quantity,
    		       productOption:productOption},
    	   success : function(result){
    		        alert('장바구니 추가 성공');
    	   },
    	   error : function(){
    		      alert('장바구니 추가 실패');   
    	   }
       }) 
    });
    
    // 찜하기
    window.onload =()=>{
    	$(".wishListBtn").click(function(){
				if($(this).attr("class") == "btn btn-outline-danger wishListBtn"){
			         $.ajax({
				            url: '${contextPath}/wishListOn.st',
				            data: {boardNo: ${ pList[0].boardNo }},
				            type: 'post',
				            success:(data)=>{
				            	console.log(data);
				            	var wishListCount = parseInt($('#wishListCount').html());
				            	alert("'My Page'에서 찜상품을 확인해주세요");
				          
				            },
				            error: (data)=>{
			    				console.log(data);
			    			}
				         });
					
			         $(this).attr("class","btn btn-outline-danger active wishListBtn");
			         
				} else if($(this).attr("class") == "btn btn-outline-danger active wishListBtn"){
			         $.ajax({
				            url: '${contextPath}/wishListOff.st',
				            data: {boardNo: ${ pList[0].boardNo }},
				            type: 'post',
				            success:(data)=>{
				            	console.log(data);
				            	alert("찜상품에서 삭제되었습니다.");
				            },
				            error: (data)=>{
			    				console.log(data);
			    			}
				         });
			         
			         $(this).attr("class","btn btn-outline-danger wishListBtn");
				}
			})
    }
    
	// 문의하기 글자수 제한
	$(function(){
			$('#textarea').keyup(function(e){
				const input = $(this).val();
				const inputLength = input.length;

				$('#counter').html('<b>' + inputLength + '<b>');
				
				if(inputLength > 300){
					$('#counter').css('color','red');
				} else{
					$('#counter').css('color','black');
				}
			
				const piece = input.substr(0, 300);
				$(this).val(piece);
			});
	});
	
    // 바로구매시 수량, 옵션 확정하기
	$('.payment').on('click', function(){
		let productQty = $('.quantity_input').val();
	    let productOps = $('.option:selected').val();
	 	/* console.log(productQty);  
	 	console.log(productOps); */
 		$('.order_form').find("input[name='productQty']").val(productQty);
 		$('.order_form').find("input[name='productOption']").val(productOps);	 	
    	$('.order_form').submit();   
	}); 

    // URL 공유하기
	function shareURL(){

        var url = ''; 
        var textarea = document.createElement("textarea");  
        
        document.body.appendChild(textarea); 
        url = window.document.location.href; 
        textarea.value = url; 
        textarea.select();
        document.execCommand("copy");   
        document.body.removeChild(textarea); 
        
        alert("URL이 복사되었습니다.") 
    }
</script>
</html>