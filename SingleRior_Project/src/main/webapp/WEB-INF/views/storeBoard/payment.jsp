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
   .front{margin: 30px 180px;} 
	td{width:100px;}
	.price{text-align: right;} 
	#totalPrice{font-family: #008cd4 bold;} 
    .ordersheet{width:250px;}
	.space{width:450px;}
	.space2{width:100px;}
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
				 <form>
			     	<div class="blog-post">
			        <h5 class="blog-post-title mb-1">▶배송지 정보</h5>
			        <hr>
			          <table>
			       	<tr>
			       		<td>수령인</td>
			       		<td><input type="text" class="ordersheet" placeholder="받으시는 분 성함을 입력해주세요" required></td>			       		
			       	</tr>
			       	<tr>
			       		<td>휴대전화</td>
			       		<td><input type="text" class="ordersheet" placeholder="받으시는 분 휴대전화를 입력해주세요" required></td>
			       	</tr>
			       	<tr>
			       		<td>주소</td>
			       		<td><input type="text" class="ordersheet" placeholder="배송지를 입력해주세요" name="address" id="address_kakao" readonly></td>
			       	</tr>
			       	<tr>
			       		<td>상세주소</td>
			       		<td><input type="text" class="ordersheet" placeholder="배송지 상세주소를 입력해주세요" name="address_detail" id="address_kakao" required></td>
			       	</tr>
			       </table>
			        <br>
			        <select style="width:500px;height:25px">
			        	<option>배송시 요청사항을 선택해주세요</option>
			        	<option>배송전에 미리 연락주세요</option>
			        	<option>부재시 문앞에 놓아주세요</option>
			        	<option>부재시 경비실에 맡겨주세요</option>
			        	<option>부재시 전화나 문자 부탁드려요</option>
			        </select>
			       </div>
			       <br><br>
			       
			       <h5 class="blog-post-title mb-1">▶상품 정보</h5>
			       <table class="table">   
				   <tr height="15">
				    	<td scope="row" width="250" rowspan="2" class="bottomNone"><img src="${ contextPath }/resources/uploadFiles/${cr.imgRename }" width="100"></td>
				     	<td width="350">상품</td>
				      	<td width="350">옵션/수량</td>
				      	<td width="250">상품 금액</td>
				      	<td style="display:none" class="productNo">${cr.productNo }</td>
				   	</tr>
				   	<tr>
				     	<td class="bottomNone">
				      		<div> 상품명</div>
				      	</td>
				      	<td class="bottomNone">
							<div>옵션 : 옵션내용</div>
							<div>수량 : 1개</div>		      
				      	</td>
				      	<td class="bottomNone">
				      		<div><span class="price"><fmt:formatNumber value="" pattern="#,###"/></span>원</div>
				      	</td>
				   	</tr>
				</table>
			       
			     
				   <br><br>
				   <h5 class="blog-post-title mb-1">▶결제 수단</h5>
				   <hr>
				   <div class="container text-center">
					  <div class="row row-cols-auto">
					  	<table class="method">
					  		<tr>
					  			<td> <div class="col"><img src="https://cdn-icons-png.flaticon.com/512/3991/3991999.png" style="width:100px;height:100px;"></div></td>
					  			<td></td>
					  			<td> <div class="col"><img src="https://cdn-icons-png.flaticon.com/512/4614/4614153.png" style="width:100px;height:100px;"></div></td>
					  			<td></td>
					  			<td> <div class="col"><img src="https://cdn-icons-png.flaticon.com/512/506/506137.png" style="width:100px;height:100px;"></div></td>
					  		</tr>
					  		<tr>
					  			<td>카카오페이</td>
					  			<td></td>
					  			<td>카드결제</td>
					  			<td></td>
					  			<td>토스<td>
					  		</tr>
					  	</table>
					  </div>
					</div>
			      </form>
	            </div>
	     
	    <!-- 스크롤 옵션바 -->
	    <div class="col-md-4">
	      <div class="position-sticky" style="top: 15rem;">
	       <div class="p-4">
	         <div style="height: auto; width: 330px; border:1px solid gray; background-color:#DCDCDC; padding:7px 7px;">
	         	<form>
	         		<h3>결제금액</h3>
	         		 <table>
				   		<tr>
					   		<td>총 상품 금액</td>
					   		<td class="space2"></td>
					   		<td class="price">29,000원</td>
					   	</tr>
					   	<tr>
					   		<td>배송비</td>
					   		<td class="space2"></td>
					   		<td class="price">0원</td>
					   	</tr>
					   </table>
		         	</form>
		         <hr>
		         <h4>최종 결제 금액　<span style="color:#008cd4;">29,900 원</span></h4>
		         <hr>
		         <form>
			         <input type="checkbox" required> 아래 내용에 모두 동의합니다.(필수)<br>
			         <input type="checkbox" required> 개인정보 수집 이용 및 제 3자 제공 동의 (필수)
			         <br>
			         <button type="submit">결제하기</button>
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
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
}
	
</script>
</body>
</html>