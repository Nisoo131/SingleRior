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
<style>
</style>
</head>
<body>
	<header class="sticky-top">
		<div>
			<jsp:include page="../storeBoard/navbar.jsp"/>
		</div>
	</header>

	<!-- 배너 -->        
		<div id="myCarousel" class="carousel carousel-dark slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/store/banners/store_home_banners/167031531985949408.png?gif=1&w=2560&q=100" style="width: 70%; height: 350px;">
				</div>
				<div class="carousel-item">
					<img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/store/banners/store_home_banners/166996569838218514.jpg?gif=1&w=2560&q=100" style="width: 70%; height: 350px;">
				</div>
				
				<div class="carousel-item">
					<img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/store/banners/store_home_banners/166996595039903800.png?gif=1&w=2560&q=100" style="width: 70%; height: 350px;">
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

	<!-- 카드 카테고리 -->
	<div id="card" style="z-index:10">
		<div class="b-example-divider"></div>
		
		  <div class="container px-4 py-5" id="custom-cards">
		    <h2 class="pb-2 border-bottom">카테고리</h2>
		
		    <div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
		      <div class="col">
		        <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg" style="background-image: url('https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/164274787851855426.jpg?gif=1&w=640&h=640&c=c&webp=1');">
		          <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
		            <h3 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">가구</h3>
		          </div>
		        </div>
		      </div>
		
		      <div class="col">
		        <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg" style="background-image: url('https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/166331034231700593.jpg?gif=1&w=640&h=640&c=c&webp=1');">
		          <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
		            <h3 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">페브릭</h3>
		            <ul class="d-flex list-unstyled mt-auto">
		            </ul>
		          </div>
		        </div>
		      </div>
		
		      <div class="col">
		        <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg" style="background-image: url('https://cdn.ggumim.co.kr/cache/furniture/600/20211130171519S0Fch44mwj.jpg');">
		          <div class="d-flex flex-column h-100 p-5 pb-3 text-shadow-1">
		            <h3 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">인테리어 소품</h3>
		            <ul class="d-flex list-unstyled mt-auto">
		            </ul>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		  
		  
		  <div class="b-example-divider"></div>
		
		  <div class="container px-4 py-5" id="custom-cards">
		    <h2 class="pb-2 border-bottom"></h2>
		
		    <div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
		      <div class="col">
		        <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg" style="background-image: url('https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/162752789399376857.jpg?gif=1&w=640&h=640&c=c&webp=1');">
		          <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
		            <h3 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">주방용품</h3>
		            <ul class="d-flex list-unstyled mt-auto">
		            </ul>
		          </div>
		        </div>
		      </div>
		
		      <div class="col">
		        <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg" style="background-image: url('https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/166928404484534220.jpg?gif=1&w=640&h=640&c=c&webp=1');">
		          <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
		            <h3 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">가전제품</h3>
		            <ul class="d-flex list-unstyled mt-auto">
		            </ul>
		          </div>
		        </div>
		      </div>
		
		      <div class="col">
		        <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg" style="background-image: url('https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/160697946906302636.jpg?gif=1&w=640&h=640&c=c&webp=1');">
		          <div class="d-flex flex-column h-100 p-5 pb-3 text-shadow-1">
		            <h3 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">소형가전</h3>
		            <ul class="d-flex list-unstyled mt-auto">
		            </ul>
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
	$('nav li').hover(
	  function() {
	      $('ul', this).stop().slideDown(200);
	      $('ul', this).css('background','transparent');
	  },
	    function() {
	    $('ul', this).stop().slideUp(200);
	  }
	);
	</script>
</body>
</html>