<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@font-face {
	    font-family: 'BMJUA';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	* {
		font-family: 'BMJUA';
	}
	.css-title{
		display: inline-block;
		color: rgb(47, 52, 56);
		letter-spacing: -0.3px;
		white-space: nowrap;
		text-overflow: ellipsis;
		font-size: 30px;
		line-height: 28px;
		margin-top: 20px;
	}
	.today-special-price-headerBrand{display: block; font-size: 11px; color: #828c94;}
	.today-special-price-headerName{
		margin-top: 5px;
		font-size: 13px;
		font-weight: 400;
		line-height: 17px;
		max-height: 34px;
	}
	.today-special-price-itemPrice{
		display: flex;
		align-items: center;
		flex-wrap: wrap;
		font-size: 17px;
		line-height: 23px;
		font-weight: 700;
	}
	.item-star-review{margin-right: 2px; color: #424242; font-weight: 700;}
	.item-review-count{margin-top: 5px; font-size: 13px; color: #9e9e9e; line-height: 16px; font-weight: 700;}
	.ssingssing-itemPrice{
		display: flex;
		align-items: center;
		flex-wrap: wrap;
		font-size: 17px;
		line-height: 23px;
		font-weight: 700;
	}
	.css-small-title{margin: 10px; font-size: 20px;}
</style>
</head>
<body>
	<header class="sticky-top">
		<div>
			<jsp:include page="common/top.jsp"/>
		</div>
	</header>
	
	<main>
		<!-- 배너 -->
		<div id="myCarousel" class="carousel carousel-dark slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<a href="#"><img src="https://i.pinimg.com/originals/26/63/5b/26635bf988317b546ce1ef99f79d4f91.jpg" style="width: 100%; height: 300px;"></a>
				</div>
				
				<div class="carousel-item">
					<img src="https://m.ramerit.co.kr/web/upload/NNEditor/20220812/16dcbcc9d1f3b3dfe0bf82969055c86a.jpg" style="width: 100%; height: 300px;">
				</div>
				
				<div class="carousel-item">
					<img src="https://openimage.interpark.com/milti/displayclassBanner/001812/01/20220715090841.jpg" style="width: 100%; height: 300px;">
				</div>
			</div>
			
			<button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
  		
  		<br><br>
  		
  		<!-- 오늘의 특가 상품 -->
  		<div class="container d-flex flex-wrap css-title">
  			<div>
  				<p class="px-4">오늘의 특가 상품
  			</div>
  		</div>
  		
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
		
		<br><br>
  		
  		<!-- 씽씽마켓 -->
  		<div class="container d-flex flex-wrap css-title">
  			<div>
  				<p class="px-4">씽씽마켓
  			</div>
  		</div>
  		
  		<div id="ssingssing" class="carousel carousel-dark slide" data-bs-ride="true">
			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="10000">
					<div class="album">
			  			<div class="container mt-4 mb-4">
			  				<div class="row px-4">
			  					<div class="col-md-6">
			  						<div class="row g-0 border rounded overflow-hidden flex-md-row shadow-sm h-md-250 position-relative">
			  							<div class="col p-4 d-flex flex-column position-static">
			  								<h3 class="mb-0">미니 가습기 판매해요</h3>
			  								<div class="mt-2 mb-2">
			  									<span class="ssingssing-itemPrice">20,000원</span>
			  								</div>
			  								<p class="card-text mb-auto">사용감 없습니다. 비염 있으신 분들 이거 유용하게 쓰실 듯요.</p>
			  							</div>
			  							<div class="col-auto d-none d-lg-block">
			  								<img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/sub_images/157187790541792168.jpg?gif=1&w=850&h=850&c=c&webp=1" style="width: 100%; height: 250px;">
			  							</div>
			  						</div>
			  					</div>
			  					
			  					<div class="col-md-6">
			  						<div class="row g-0 border rounded overflow-hidden flex-md-row shadow-sm h-md-250 position-relative">
			  							<div class="col p-4 d-flex flex-column position-static">
			  								<h3 class="mb-0">1+1으로 산 멀티탭 나누실 분</h3>
			  								<div class="mt-2 mb-2">
			  									<span class="ssingssing-itemPrice">9,100원</span>
			  								</div>
			  								<p class="card-text mb-auto">18,200원에 2개가 왔는데 저는 하나면 되거든요.. 필요하신분 저랑 나눠가져요</p>
			  							</div>
			  							<div class="col-auto d-none d-lg-block">
			  								<img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/163514478998058807.jpg?gif=1&w=850&h=850&c=c&webp=1" style="width: 100%; height: 250px;">
			  							</div>
			  						</div>
			  					</div>
			  				</div>
			  			</div>
			  		</div>
				</div>
				
				<div class="carousel-item">
					<div class="album">
			  			<div class="container mt-4 mb-4">
			  				<div class="row px-4">
			  					<div class="col-md-6">
			  						<div class="row g-0 border rounded overflow-hidden flex-md-row shadow-sm h-md-250 position-relative">
			  							<div class="col p-4 d-flex flex-column position-static">
			  								<h3 class="mb-0">미니 가습기 판매해요</h3>
			  								<div class="mt-2 mb-2">
			  									<span class="ssingssing-itemPrice">20,000원</span>
			  								</div>
			  								<p class="card-text mb-auto">사용감 없습니다</p>
			  							</div>
			  							<div class="col-auto d-none d-lg-block">
			  								<img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/sub_images/157187790541792168.jpg?gif=1&w=850&h=850&c=c&webp=1" style="width: 100%; height: 250px;">
			  							</div>
			  						</div>
			  					</div>
			  					
			  					<div class="col-md-6">
			  						<div class="row g-0 border rounded overflow-hidden flex-md-row shadow-sm h-md-250 position-relative">
			  							<div class="col p-4 d-flex flex-column position-static">
			  								<h3 class="mb-0">1+1으로 산 멀티탭 나누실 분</h3>
			  								<div class="mt-2 mb-2">
			  									<span class="ssingssing-itemPrice">9,100원</span>
			  								</div>
			  								<p class="card-text mb-auto">18,200원에 2개가 왔는데 저는 하나면 되거든요.. 필요하신분 저랑 나눠가져요</p>
			  							</div>
			  							<div class="col-auto d-none d-lg-block">
			  								<img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/163514478998058807.jpg?gif=1&w=850&h=850&c=c&webp=1" style="width: 100%; height: 250px;">
			  							</div>
			  						</div>
			  					</div>
			  				</div>
			  			</div>
			  		</div>
				</div>
			</div>
			
			<button class="carousel-control-prev" type="button" data-bs-target="#ssingssing" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#ssingssing" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		
		<br><br>
		
		<!-- 싱글벙글 -->
  		<div class="container d-flex flex-wrap css-title">
  			<div>
  				<p class="px-4">싱글벙글
  			</div>
  		</div>
  		
  		<div class="container">
  			<div class="row px-4 mt-4">
			  	<div class="col-md-6">
			  		<span class="css-small-title">- HOT 인기글</span>
			  		<div class="row g-0 border rounded overflow-hidden flex-md-row shadow-sm h-md-250 position-relative mt-2 mb-4">
			  			<div class="col-auto d-none d-lg-block">
			  				<img src="https://recipe1.ezmember.co.kr/cache/recipe/2019/04/01/f8b3042c80a214dd7cc60fa2027cdc9d1.jpg" style="width: 250px; height: 250px;">
			  			</div>
			  			<div class="col p-4 d-flex flex-column position-static">
			  				<h4 class="mb-0">오일파스타 요리법!</h4>
			  				<div class="mb-1 text-muted">Nov 11</div>
			  				<p class="card-text mb-auto">혼자 만들어 드실 때 적당한 양조절 팁도 있어요 :)</p>
			  			</div>
			  		</div>
			  	</div>
			  	
			  	
			  	<div class="col-md-6">
			  		<span class="css-small-title"></span>
			  		<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative mt-2 mb-4">
			  			<div class="col-auto d-none d-lg-block">
			  				<img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/166536749705064483.jpg?gif=1&w=850&h=850&c=c&webp=1" style="width: 250px; height: 250px;">
				  		</div>
			  			<div class="col p-4 d-flex flex-column position-static">
			  				<h4 class="mb-0">여러분 과탄산소다가 여기저기 쓸 곳 많은 거 알고계시나요...?</h4>
			  				<div class="mb-1 text-muted">Nov 11</div>
			  				<p class="card-text mb-auto">제가 유용하게 사용한 방법들 알려드립니다!!</p>
			  			</div>
			  		</div>
			  	</div>
			</div>
  		</div>
	</main>
	
	<footer>
		<jsp:include page="common/footer.jsp"/>
	</footer>
</body>
</html>