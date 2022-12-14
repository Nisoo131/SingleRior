<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script> 
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<style>
	.front{margin: 10px 300px}
</style>
<body>
	<header class="sticky-top">
		<div>
			<jsp:include page="../storeBoard/navbar.jsp"/>
		</div>
	</header>
	
	<!-- 대분류/소분류 구분 -->
	${ slist }
	${ alist }
	이거 끝
	
 	<div class="front">
		<h5><b>전체 > 가구 > </b></h5>
			<h3><b>${ p.proSubCateCode } </b></h3>
		
		<div id="selectOption" dir="rtl">
			<select style="width:100px; height:30px;">
			  <option selected>인기순</option>
			  <option value="1">최신순</option>
			  <option value="2">낮은 가격순</option>
			  <option value="3">높은 가격순</option>
			</select>
		</div>
		<br>
	
	<!-- 카드 4x3-->
	
	  <div class="row">
	    <div class="col-3">
	     <a href="${ contextPath }/productDetail.st">
	      <div class="card">
	        <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/166632957544570272.jpg?gif=1&w=640&h=640&c=c&webp=1" class="card-img-top" alt="...">
	         <div class="card-body">
	          <h6 class="card-title">최고가구</h6>
	          <h5 class="card-text">푹신푹신 침대</h5>
	          <span style="width:20px">50%</span><span>　</span><span>29,900</span><br>
	          <span>★4.9</span>
	        </div>
	        </a>
	      </div>
	    </div>
	    <div class="col-3">
	    	 <div class="card">
	        <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/159185612857229438.jpg?gif=1&w=640&h=640&c=c&webp=1" class="card-img-top" alt="...">
	         <div class="card-body">
	          <h6 class="card-title">넘버원베드</h6>
	          <h5 class="card-text">솜사탕침대</h5>
	          <span style="width:20px">40%</span><span>　</span><span>69,000</span><br>
	          <span>★4.2</span>
	        </div>
	      </div>
	    </div>
	    <div class="col-3">
	    	 <div class="card">
	          <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/167030880120378156.jpg?gif=1&w=640&h=640&c=c&webp=1" class="card-img-top" alt="...">
	         <div class="card-body">
	          <h6 class="card-title">솜사탕</h6>
	          <h5 class="card-text">잠이솔솔 침대</h5>
	          <span style="width:20px">62%</span><span>　</span><span>69,900</span><br>
	          <span>★4.3</span>
	        </div>
	      </div>
	    </div>
	    <div class="col-3">
	    	 <div class="card">
	         <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/164689139714715370.jpg?gif=1&w=640&h=640&c=c&webp=1" class="card-img-top" alt="...">
	         <div class="card-body">
	          <h6 class="card-title">싱글침대최고</h6>
	          <h5 class="card-text">낭떨어지노노</h5>
	          <span style="width:20px">15%</span><span>　</span><span>19,900</span><br>
	          <span>★4.2</span>
	        </div>
	      </div>
	    </div>
	  </div>
  	  <br>
  
  	  <div class="row">
	    <div class="col-3">
	      <div class="card">
	        <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/166632957544570272.jpg?gif=1&w=640&h=640&c=c&webp=1" class="card-img-top" alt="...">
	         <div class="card-body">
	          <h6 class="card-title">최고가구</h6>
	          <h5 class="card-text">푹신푹신 침대</h5>
	          <span style="width:20px">50%</span><span>　</span><span>29,900</span><br>
	          <span>★4.9</span>
	        </div>
	      </div>
	    </div>
	    <div class="col-3">
	    	 <div class="card">
	        <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/159185612857229438.jpg?gif=1&w=640&h=640&c=c&webp=1" class="card-img-top" alt="...">
	         <div class="card-body">
	          <h6 class="card-title">넘버원베드</h6>
	          <h5 class="card-text">솜사탕침대</h5>
	          <span style="width:20px">40%</span><span>　</span><span>69,000</span><br>
	          <span>★4.2</span>
	        </div>
	      </div>
	    </div>
	    <div class="col-3">
	    	 <div class="card">
	          <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/167030880120378156.jpg?gif=1&w=640&h=640&c=c&webp=1" class="card-img-top" alt="...">
	         <div class="card-body">
	          <h6 class="card-title">솜사탕</h6>
	          <h5 class="card-text">잠이솔솔 침대</h5>
	          <span style="width:20px">62%</span><span>　</span><span>69,900</span><br>
	          <span>★4.3</span>
	        </div>
	      </div>
	    </div>
	    <div class="col-3">
	    	 <div class="card">
	         <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/164689139714715370.jpg?gif=1&w=640&h=640&c=c&webp=1" class="card-img-top" alt="...">
	         <div class="card-body">
	          <h6 class="card-title">싱글침대최고</h6>
	          <h5 class="card-text">낭떨어지노노</h5>
	          <span style="width:20px">15%</span><span>　</span><span>19,900</span><br>
	          <span>★4.2</span>
	        </div>
	      </div>
	    </div>
	  </div>
	  </body>
	   <br>
  
  	  <div class="row">
	    <div class="col-3">
	      <div class="card">
	        <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/166632957544570272.jpg?gif=1&w=640&h=640&c=c&webp=1" class="card-img-top" alt="...">
	         <div class="card-body">
	          <h6 class="card-title">최고가구</h6>
	          <h5 class="card-text">푹신푹신 침대</h5>
	          <span style="width:20px">50%</span><span>　</span><span>29,900</span><br>
	          <span>★4.9</span>
	        </div>
	      </div>
	    </div>
	    <div class="col-3">
	    	 <div class="card">
	        <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/159185612857229438.jpg?gif=1&w=640&h=640&c=c&webp=1" class="card-img-top" alt="...">
	         <div class="card-body">
	          <h6 class="card-title">넘버원베드</h6>
	          <h5 class="card-text">솜사탕침대</h5>
	          <span style="width:20px">40%</span><span>　</span><span>69,000</span><br>
	          <span>★4.2</span>
	        </div>
	      </div>
	    </div>
	    <div class="col-3">
	    	 <div class="card">
	          <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/167030880120378156.jpg?gif=1&w=640&h=640&c=c&webp=1" class="card-img-top" alt="...">
	         <div class="card-body">
	          <h6 class="card-title">솜사탕</h6>
	          <h5 class="card-text">잠이솔솔 침대</h5>
	          <span style="width:20px">62%</span><span>　</span><span>69,900</span><br>
	          <span>★4.3</span>
	        </div>
	      </div>
	    </div>
	    <div class="col-3">
	    	 <div class="card">
	         <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/164689139714715370.jpg?gif=1&w=640&h=640&c=c&webp=1" class="card-img-top" alt="...">
	         <div class="card-body">
	          <h6 class="card-title">싱글침대최고</h6>
	          <h5 class="card-text">낭떨어지노노</h5>
	          <span style="width:20px">15%</span><span>　</span><span>19,900</span><br>
	          <span>★4.2</span>
	        </div>
	      </div>
	    </div>
	  </div>
	 
	<!-- 페이징 처리 -->
 
	<footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>  	
	

</body>
</html>