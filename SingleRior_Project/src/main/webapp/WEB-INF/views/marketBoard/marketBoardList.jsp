<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<body>
	<header class="sticky-top">
		<div>
			<jsp:include page="../common/top.jsp"/>
		</div>
	</header>
	<ul class="nav justify-content-center">
	  <li class="nav-item">
	    <a class="nav-link active" aria-current="page" href="#">같이사요</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#">팝니다</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#">삽니다</a>
	  </li>
	  
	</ul>
	
	  		<div id="today_special_price" class="carousel carousel-dark slide" data-bs-ride="true">
			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="10000">
					<div class="album py-3">
			  			<div class="container">
			  				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3 p-2 px-4">
			  					<div class="col">
			  						<div class="card shadow-sm">
			  							<img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/166322024968332260.jpg?gif=1&w=850&h=850&c=c&webp=1" style="width: 100%; height: 225px;">
				  						<div class="card-body">
				  							<span class="today-special-price-headerBrand">STORE_NAME</span>
				  							<span class="today-special-price-headerName">PRODUCT_NAME</span>
				  							<span class="today-special-price-itemPrice">
				  								<span class="item-sale">N</span>
				  								<span class="percentage">% &nbsp;</span>
				  								<span class="item-price">PRICE 원</span>
				  							</span>
				  							<div class="today-special-price-review">
				  								<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" style="margin-bottom: 3px;" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
				  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
												</svg>
				  								<span class="item-star-review">4.8</span>
				  								<span class="item-review-count">리뷰 500</span>
				  							</div>
				  						</div>
			  						</div>
			  					</div>
			  					
			  					<div class="col">
			  						<div class="card shadow-sm">
			  							<img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/166676292964747563.jpg?gif=1&w=850&h=850&c=c&webp=1" style="width: 100%; height: 225px;">
				  						<div class="card-body">
				  							<span class="today-special-price-headerBrand">STORE_NAME</span>
				  							<span class="today-special-price-headerName">PRODUCT_NAME</span>
				  							<span class="today-special-price-itemPrice">
				  								<span class="item-sale">N</span>
				  								<span class="percentage">% &nbsp;</span>
				  								<span class="item-price">PRICE 원</span>
				  							</span>
				  							<div class="today-special-price-review">
				  								<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" style="margin-bottom: 3px;" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
				  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
												</svg>
				  								<span class="item-star-review">4.8</span>
				  								<span class="item-review-count">리뷰 500</span>
				  							</div>
				  						</div>
			  						</div>
			  					</div>
			  					
			  					<div class="col">
			  						<div class="card shadow-sm">
			  							<img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/1597126332_101422_1.jpg?gif=1&w=850&h=850&c=c&webp=1" style="width: 100%; height: 225px;">
				  						<div class="card-body">
				  							<span class="today-special-price-headerBrand">STORE_NAME</span>
				  							<span class="today-special-price-headerName">PRODUCT_NAME</span>
				  							<span class="today-special-price-itemPrice">
				  								<span class="item-sale">N</span>
				  								<span class="percentage">% &nbsp;</span>
				  								<span class="item-price">PRICE 원</span>
				  							</span>
				  							<div class="today-special-price-review">
				  								<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" style="margin-bottom: 3px;" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
				  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
												</svg>
				  								<span class="item-star-review">4.8</span>
				  								<span class="item-review-count">리뷰 500</span>
				  							</div>
				  						</div>
			  						</div>
			  					</div>
			  					
			  					<div class="col">
			  						<div class="card shadow-sm">
			  							<img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/165388926207842431.jpg?gif=1&w=850&h=850&c=c&webp=1" style="width: 100%; height: 225px;">
				  						<div class="card-body">
				  							<span class="today-special-price-headerBrand">STORE_NAME</span>
				  							<span class="today-special-price-headerName">PRODUCT_NAME</span>
				  							<span class="today-special-price-itemPrice">
				  								<span class="item-sale">N</span>
				  								<span class="percentage">% &nbsp;</span>
				  								<span class="item-price">PRICE 원</span>
				  							</span>
				  							<div class="today-special-price-review">
				  								<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" style="margin-bottom: 3px;" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
				  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
												</svg>
				  								<span class="item-star-review">4.8</span>
				  								<span class="item-review-count">리뷰 500</span>
				  							</div>
				  						</div>
			  						</div>
			  					</div>
			  					
			  					
			  				</div>
			  			</div>
			  		</div>
				</div>
				
				<div class="carousel-item">
					<div class="album py-3">
			  			<div class="container">
			  				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3 p-2 px-4">
			  					<div class="col">
			  						<div class="card shadow-sm">
			  							<img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/160437064464898594.jpg?gif=1&w=850&h=850&c=c&webp=1" style="width: 100%; height: 225px;">
				  						<div class="card-body">
				  							<span class="today-special-price-headerBrand">STORE_NAME</span>
				  							<span class="today-special-price-headerName">PRODUCT_NAME</span>
				  							<span class="today-special-price-itemPrice">
				  								<span class="item-sale">N</span>
				  								<span class="percentage">% &nbsp;</span>
				  								<span class="item-price">PRICE 원</span>
				  							</span>
				  							<div class="today-special-price-review">
				  								<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" style="margin-bottom: 3px;" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
				  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
												</svg>
				  								<span class="item-star-review">4.8</span>
				  								<span class="item-review-count">리뷰 500</span>
				  							</div>
				  						</div>
			  						</div>
			  					</div>
			  					
			  					<div class="col">
			  						<div class="card shadow-sm">
			  							<img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/166322596412626914.jpg?gif=1&w=850&h=850&c=c&webp=1" style="width: 100%; height: 225px;">
				  						<div class="card-body">
				  							<span class="today-special-price-headerBrand">STORE_NAME</span>
				  							<span class="today-special-price-headerName">PRODUCT_NAME</span>
				  							<span class="today-special-price-itemPrice">
				  								<span class="item-sale">N</span>
				  								<span class="percentage">% &nbsp;</span>
				  								<span class="item-price">PRICE 원</span>
				  							</span>
				  							<div class="today-special-price-review">
				  								<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" style="margin-bottom: 3px;" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
				  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
												</svg>
				  								<span class="item-star-review">4.8</span>
				  								<span class="item-review-count">리뷰 500</span>
				  							</div>
				  						</div>
			  						</div>
			  					</div>
			  					
			  					<div class="col">
			  						<div class="card shadow-sm">
			  							<img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/159410984312758507.jpg?gif=1&w=850&h=850&c=c&webp=1" style="width: 100%; height: 225px;">
				  						<div class="card-body">
				  							<span class="today-special-price-headerBrand">STORE_NAME</span>
				  							<span class="today-special-price-headerName">PRODUCT_NAME</span>
				  							<span class="today-special-price-itemPrice">
				  								<span class="item-sale">N</span>
				  								<span class="percentage">% &nbsp;</span>
				  								<span class="item-price">PRICE 원</span>
				  							</span>
				  							<div class="today-special-price-review">
				  								<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" style="margin-bottom: 3px;" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
				  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
												</svg>
				  								<span class="item-star-review">4.8</span>
				  								<span class="item-review-count">리뷰 500</span>
				  							</div>
				  						</div>
			  						</div>
			  					</div>
			  					
			  					<div class="col">
			  						<div class="card shadow-sm">
			  							<img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/165336176691872944.jpg?gif=1&w=850&h=850&c=c&webp=1" style="width: 100%; height: 225px;">
				  						<div class="card-body">
				  							<span class="today-special-price-headerBrand">STORE_NAME</span>
				  							<span class="today-special-price-headerName">PRODUCT_NAME</span>
				  							<span class="today-special-price-itemPrice">
				  								<span class="item-sale">N</span>
				  								<span class="percentage">% &nbsp;</span>
				  								<span class="item-price">PRICE 원</span>
				  							</span>
				  							<div class="today-special-price-review">
				  								<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" style="margin-bottom: 3px;" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
				  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
												</svg>
				  								<span class="item-star-review">4.8</span>
				  								<span class="item-review-count">리뷰 500</span>
				  							</div>
				  						</div>
			  						</div>
			  					</div>
			  				</div>
			  			</div>
			  		</div>
				</div>
			</div>
			
			<button class="carousel-control-prev" type="button" data-bs-target="#today_special_price" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#today_special_price" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		
		
</body>
</html>