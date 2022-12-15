<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    <style>
	button {font-size: 20px; padding: 10px 10px; border-radius: 15px;}
	.category{padding:20px 200px 20px 200px;}
	.wishlist {color: #008cd4;}
	.payment{background-color:#008cd4; color:white; }
	.inquiry{font-size:30px}
	#inquiryBtn{size: 100px; background-color:#008cd4;}
	.star{text-align:center; display:table; width:300px; height:100px; margin:0 auto;}
		
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
	  
	 	${ list }<br><br>
	 	<br>
	 	${ list[0].imgRename }
	 	${ list[1].imgRename }
	 	<br>
	      ${ pList }
	   <c:forEach items="${ pList }" var="p">
	   
	   	  
		<div class="category">
			<h5><b> 전체 > 가구 > 침대</b></h5> 
			<br>
		</div>
		
	<main class="container">
	   <div class="row mx-md-n5">
	 	 <div class="col px-md-5"><div class="p-3 border bg-light">
	 	 	<c:if test="${ fn:containsIgnoreCase([list[0].imgRename], 'jpg') or fn:containsIgnoreCase([list[0].imgRename], 'png') }">
	 	 		<img src="resources/uploadFiles/${ list[0].imgRename }" width="100%" height="100%">
			</c:if>
	 	 </div>
	 	</div>
		 	
	<fmt:formatNumber type="number" maxFractionDigits="3" value="${p.price}" var="commaPrice" />
	<c:set var="discountPrice" value="${ s.price-(s.price*s.discount/100)}"/>
	<fmt:formatNumber type="number" maxFractionDigits="3" value="${ p.price-(p.price*p.discount/100)}" var="totalPrice" />
	  <div class="col px-md-5">
	  	<div class="p-3 border bg-light">
		  <h5>${ p.brand }</h5>
		  <h2>${ p.boardTitle }</h2>
		  <p><s>${ commaPrice } 원</s></p>
		  <h1><span>${ p.discount }%</span>　<span style="color:#008cd4;">${ totalPrice } 원</span></h1>
		  <br><br>
		  <p>구매리뷰 (개수)</p>
		  <p>배송비 무료</p>
		  <hr>
		 	<p>옵션선택</p>
			  <select class="form-select" aria-label="Default select example">
				  <option selected>사이즈</option>
				  <option value="1">01.MS(멀티싱글)</option>
				  <option value="2">02.SS(슈퍼싱글)</option>
				  <option value="3">03.Q(퀸)</option>
			  </select>
			  <select class="form-select" aria-label="Default select example">
				  <option selected>색상</option>
				  <option value="1">WHITE</option>
				  <option value="2">BLACK</option>
				  <option value="3">GRAY</option>
			  </select>
			  <select class="form-select" aria-label="Default select example">
				  <option selected>[추가옵션]</option>
				  <option value="1">정리끈1[SET]    4000원</option>
			  </select>
			  <hr>
			  <h2>총 1개 ${ totalPrice}원</h2>
			  <div class="btn-group">
				  <button type="button" class="wishlist" style="width:200px;height:50px;font-size:20px;"> 장바구니 </button>
				  <button type="button" class="payment"  style="width:200px;height:50px;font-size:20px;" onclick="location.href='${ contextPath }/payment.st'">결제하기</button>
			  </div>
		
	  		</div>
	  	</div>
	  	</c:forEach>
	 
	  
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
			   <img src="resources/uploadFiles/${ list[1].imgRename }" width="100%" height="100%">
			      
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
		        			<td><button type="button" class="btn btn-primary" id="inquiryBtn">문의하기</button></td>
		        		</tr>
		        	</table>
	        	</form>
	 		</div>
	 		<div style="border:black solid 1px; width:600px; padding:10px 10px; border-radius:10px;" id="delivery">
		        <p class="blog-post-meta">배송 | <span style="color:#008cd4;">답변완료</span></p>
				<p>강건강 | 2022-12-12</p>
				<p><img src="https://cdn-icons-png.flaticon.com/512/8371/8371275.png" width="20px" height="20px"> 언제 배송되나요?</p>
				<p><img src="https://cdn-icons-png.flaticon.com/512/25/25628.png" width="20px" height="20px"> 고객님 늦어서 죄송합니다. 오늘 발송예정입니다.</p>
	    	</div>
	    	<p> 페이징처리</p>
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
					<td>무료배송</td>
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
					<td>80,000원</td>
				</tr>
				<tr>
					<td>교환배송비</td>
					<td>180,000원</td>
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
	          <h4>옵션선택</h4>
	           	 <select class="form-select" aria-label="Default select example">
						  <option selected>사이즈</option>
						  <option value="1">01.MS(멀티싱글)</option>
						  <option value="2">02.SS(슈퍼싱글)</option>
						  <option value="3">03.Q(퀸)</option>
				 </select>
	             <select class="form-select" aria-label="Default select example">
						  <option selected>색상</option>
						  <option value="1">WHITE</option>
						  <option value="2">BLACK</option>
						  <option value="3">GRAY</option>
				</select>
				<select class="form-select" aria-label="Default select example">
						  <option selected>[추가옵션]</option>
						  <option value="1">정리끈1[SET]    4000원</option>
				</select>
	            <hr>        
	            <br><br><br><br><br><br>
	          	<h4>총 1개 29,900원</h4>
				  <div class="btn-group">
					  <button type="button" class="wishlist" style="width:200px;height:50px;font-size:20px;">장바구니</button>
					  <button type="button" class="payment" style="width:200px;height:50px;font-size:20px;" onclick="location.href='${ contextPath }/payment.st'">결제하기</button>
				  </div>
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
		        <h5 class="modal-title">문의하기<img src="" ></h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <p>문의유형</p>
		        	<select class="form-select" aria-label="Default select example" id="inquiry_ops">
						  <option value="1">상품</option>
						  <option value="2">배송</option>
						  <option value="3">반품</option>
						  <option value="4">교환</option>
						  <option value="5">환불</option>
						  <option value="6">기타</option>
					  </select>
				  <br>
				  <p>문의내용 <span id="counter">0</span>/300</p>
				  <textarea cols="54" rows="3"></textarea>
		      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-primary" id="inquiry_modal">완료</button>
			      </div>
		    </div>
		  </div>
		</div>
	
	
	
    <footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>
	

<script>
	window.onload=()=>{
		document.getElementById('inquiryBtn').addEventListener('click', ()=>{
			$('#inquiryModal').modal('show');
		});
		
	}
	
	// 문의하기 모달창 글자수 제한
	$(function(){
			$('#inquiryContent').keyup(function(e){
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
	
	
	
		// 문의하기 데이터 Ajax 통해 전달하기
		document.getElementById('inquiry_modal').addEventListener('click',()=>{
			  $(document).ready(function(){
			    	const optionChoice = $('#inquiry_ops option:selected').text();
			    	const textarea = $('textarea').val();
			    	console.log(optionChoice);
			    	console.log(textarea);
			    	
			    	$.ajax({
			    		url:'',
			    		data: {optionChoice:optionChoice,
			    				textarea:textarea}, // 공간명, 데이터명 동일
			    		success: function(data){
			    			console.log('서버 전송 성공 시 호출');
			    		},
			    		error: function(data){
			    			console.log('서버 전공 실패 시 호출');
			    		}
			    	});
				});	
			});
  

	
</script>
</body>
</html>