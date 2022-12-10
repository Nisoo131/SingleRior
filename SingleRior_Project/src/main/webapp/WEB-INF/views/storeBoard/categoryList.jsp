<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body>
	<header class="sticky-top">
		<div>
			<jsp:include page="../storeBoard/navbar.jsp"/>
		</div>
	</header>
	
	<!-- 대분류/소분류에 따라 구분 -->
	<div style="padding:20px 120px 10px 120px;">
		<h5><b>전체 > 가구 > 침대/매트릭스</b></h5>
			<h3><b>침대/매트릭스</b></h3>
			
		<div id="selectOption" dir="rtl" border-radius ="50px";>
			<select style="width:100px; height:30px; class="form-select" aria-label="Default select example">
			  <option selected>인기순</option>
			  <option value="1">최신순</option>
			  <option value="2">낮은 가격순</option>
			  <option value="3">높은 가격순</option>
			</select>
		</div>
	</div>
	
	<!-- 카드 4x3--> 
    <div class="container">
	      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
	        <div class="col">
	          <div class="card shadow-sm" >
	          <a href="${ contextPath }/productDetail.st">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	            <div class="card-body">
	              <p class="card-text">
	              	<span class="brand">최고가구</span><br>
	              	<span class="product">침대최고</span><br>
	              	<span class="sale">N</span><span class="percent">% </span><span class="price">PRICE</span><span class="won"> 원</span><br>
					<span class="item-star-review">★4.8</span>
					<span class="item-review-count">리뷰 500</span>
					</p>
					<div class="d-flex justify-content-between align-items-center">                
	              	</div>
	              	</a>
	            </div>
	          </div>
	        </div>
        
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	              <p class="card-text">
	              	<span class="brand">최고가구</span><br>
	              	<span class="product">침대최고</span><br>
	              	<span class="sale">N</span><span class="percent">% </span><span class="price">PRICE</span><span class="won"> 원</span><br>
					<span class="item-star-review">★4.8</span>
					<span class="item-review-count">리뷰 500</span>
	          	  </p>
	              <div class="d-flex justify-content-between align-items-center">                
	              </div>
	            </div>
	          </div>
	        </div>
	        
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	              <p class="card-text">
	              	<span class="brand">최고가구</span><br>
	              	<span class="product">침대최고</span><br>
	              	<span class="sale">N</span><span class="percent">% </span><span class="price">PRICE</span><span class="won"> 원</span><br>
					<span class="item-star-review">★4.8</span>
					<span class="item-review-count">리뷰 500</span>
	              </p>
	              <div class="d-flex justify-content-between align-items-center">
	               </div>
	            </div>
	          </div>
	        </div>
	
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	            <div class="card-body">
	              <p class="card-text">
	              <span class="brand">최고가구</span><br>
	              	<span class="product">침대최고</span><br>
	              	<span class="sale">N</span><span class="percent">% </span><span class="price">PRICE</span><span class="won"> 원</span><br>
					<span class="item-star-review">★4.8</span>
					<span class="item-review-count">리뷰 500</span>
	          	  </p>
	              <div class="d-flex justify-content-between align-items-center">                
	              </div>
	            </div>
	          </div>
	        </div>
	        
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	              <p class="card-text">
	              	<span class="brand">최고가구</span><br>
	              	<span class="product">침대최고</span><br>
	              	<span class="sale">N</span><span class="percent">% </span><span class="price">PRICE</span><span class="won"> 원</span><br>
					<span class="item-star-review">★4.8</span>
					<span class="item-review-count">리뷰 500</span>
	          	  </p>
	              <div class="d-flex justify-content-between align-items-center">                
	              </div>
	            </div>
	          </div>
	        </div>
	        
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	            <div class="card-body">
	              <p class="card-text">
	              <span class="brand">최고가구</span><br>
	              	<span class="product">침대최고</span><br>
	              	<span class="sale">N</span><span class="percent">% </span><span class="price">PRICE</span><span class="won"> 원</span><br>
					<span class="item-star-review">★4.8</span>
					<span class="item-review-count">리뷰 500</span>
	          	  </p>
	              <div class="d-flex justify-content-between align-items-center">                
	              </div>
	            </div>
	          </div>
	        </div>
	
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	            <div class="card-body">
	              <p class="card-text">
	              <span class="brand">최고가구</span><br>
	              	<span class="product">침대최고</span><br>
	              	<span class="sale">N</span><span class="percent">% </span><span class="price">PRICE</span><span class="won"> 원</span><br>
					<span class="item-star-review">4.8</span>
					<span class="item-review-count">리뷰 500</span>
	          	  </p>
	              <div class="d-flex justify-content-between align-items-center">                
	              </div>
	            </div>
	          </div>
	        </div>
	        
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	            <div class="card-body">
	              <p class="card-text">
	              <span class="brand">최고가구</span><br>
	              	<span class="product">침대최고</span><br>
	              	<span class="sale">N</span><span class="percent">% </span><span class="price">PRICE</span><span class="won"> 원</span><br>
					<span class="item-star-review">★4.8</span>
					<span class="item-review-count">리뷰 500</span>
	          	  </p>
	              <div class="d-flex justify-content-between align-items-center">                
	              </div>
	            </div>
	          </div>
	        </div>
	        
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	            <div class="card-body">
	              <p class="card-text">
	              <span class="brand">최고가구</span><br>
	              	<span class="product">침대최고</span><br>
	              	<span class="sale">N</span><span class="percent">% </span><span class="price">PRICE</span><span class="won"> 원</span><br>
					<span class="item-star-review">★4.8</span>
					<span class="item-review-count">리뷰 500</span>
	          	  </p>
	              <div class="d-flex justify-content-between align-items-center">                
	              </div>
	            </div>
	          </div>
	        </div>
	        
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	            <div class="card-body">
	              <p class="card-text">
	              <span class="brand">최고가구</span><br>
	              	<span class="product">침대최고</span><br>
	              	<span class="sale">N</span><span class="percent">% </span><span class="price">PRICE</span><span class="won"> 원</span><br>
					<span class="item-star-review">★4.8</span>
					<span class="item-review-count">리뷰 500</span>
	          	  </p>
	              <div class="d-flex justify-content-between align-items-center">                
	              </div>
	            </div>
	          </div>
	        </div>
	        
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	            <div class="card-body">
	              <p class="card-text">
	              <span class="brand">최고가구</span><br>
	              	<span class="product">침대최고</span><br>
	              	<span class="sale">N</span><span class="percent">% </span><span class="price">PRICE</span><span class="won"> 원</span><br>
					<span class="item-star-review">★4.8</span>
					<span class="item-review-count">리뷰 500</span>
	          	  </p>
	              <div class="d-flex justify-content-between align-items-center">                
	              </div>
	            </div>
	          </div>
	        </div>
	        
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	            <div class="card-body">
	              <p class="card-text">
	              <span class="brand">최고가구</span><br>
	              	<span class="product">침대최고</span><br>
	              	<span class="sale">N</span><span class="percent">% </span><span class="price">PRICE</span><span class="won"> 원</span><br>
					<span class="item-star-review">★4.8</span>
					<span class="item-review-count">리뷰 500</span>
	          	  </p>
	              <div class="d-flex justify-content-between align-items-center">                
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  
	  <footer>
		<jsp:include page="../common/footer.jsp"/>
	 </footer>  	
</body>
</html>