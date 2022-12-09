<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
li a:hover {
	font-size: 20px;
}

@font-face {
	font-family: 'BMJUA';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'BMJUA';
}

li a:hover {
	font-size: 20px;
}
</style>
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<body>
	<header class="sticky-top">
		<div>
			<jsp:include page="../common/top.jsp" />
		</div>
	</header>
	<div style="background: #008cd4">
		<ul class="nav justify-content-center">
			<li class="nav-item"><a style="color: white;"
				class="nav-link active" aria-current="page" href="#">같이사요</a></li>
			<li class="nav-item"><a style="color: white;"
				class="nav-link active" href="#">팝니다</a></li>
			<li class="nav-item"><a style="color: white;"
				class="nav-link active" href="#">삽니다</a></li>
		</ul>
	</div>
	<div id="today_special_price" class="carousel carousel-dark slide"
		data-bs-ride="true">
		<div class="carousel-inner">
			<div class="carousel-item active" data-bs-interval="10000">
				<div class="album py-3">
					<div class="container">
						<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3 p-2 px-4">
							
							<div class="col">
								<div class="carouselCardFir shadow-sm">
									<img class="bd-placeholder-img card-img-top" width="100%" height="225"  src="https://ifh.cc/g/yX3tCA.png">
									<div class="card-body">
										<p class="card-text">우리집고양이 구경</p>
										<div class="d-flex justify-content-between align-items-center">
											<p class="card-text" style="width: 280px;">3000원</p>
											<div class="btn-group">
												<span><img src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png"style="width: 30px; height: 30px;">2<img src="https://cdn-icons-png.flaticon.com/512/2589/2589054.png" style="width: 30px; height: 30px; display: none;"></span>
										  &nbsp;<img src="https://cdn-icons-png.flaticon.com/512/7789/7789458.png" style="width: 30px; height: 30px;">4
											</div>
											<small class="text-muted"></small>
										</div>
									</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
			
<!-- 첫번째 슬라이드  끝-->

			<div class="carousel-item">
				<div class="album py-3">
					<div class="container">
						<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3 p-2 px-4">
							<div class="col">
								<div class="carouselCardSec shadow-sm">
									<img class="bd-placeholder-img card-img-top" width="100%" height="225"  src="https://ifh.cc/g/yX3tCA.png">
									<div class="card-body">
										<p class="card-text">우리집고양이 구경</p>
										<div class="d-flex justify-content-between align-items-center">
											<p class="card-text" style="width: 280px;">3000원</p>
											<div class="btn-group">
												<img src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png"style="width: 30px; height: 30px;">2<img src="https://cdn-icons-png.flaticon.com/512/2589/2589054.png" style="width: 30px; height: 30px; display: none;">
										  &nbsp;<img src="https://cdn-icons-png.flaticon.com/512/7789/7789458.png" style="width: 30px; height: 30px;">4
											</div>
											<small class="text-muted"></small>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
<!-- 슬라이드 버튼 -->
		<button class="carousel-control-prev" type="button" data-bs-target="#today_special_price" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#today_special_price" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
		</button>
	</div>
	
<!-- 두번쨰 슬라이드 끝-->
	<br>
	<br>
	<!-- 글작성 버튼 -->
	<div style="padding-left: 170px;">
	<button type="button" class="btn btn-outline-secondary" style="width: 100px;">글쓰기</button>
	</div>
	<br>
	
	<!-- 정렬 -->
	<div class="col-md-2" style="width: 350px; float: right;">
    	<div class="row g-0 border rounded overflow-hidden flex-md-row shadow-sm h-md-250 position-relative mt-2 mb-4">
       		<div class="col py-2 d-flex flex-column position-static px-3">
         		<table class="">
             		<tr style="text-align: center;">
                 		<td width="70px;">
                   			<img src="https://cdn-icons.flaticon.com/svg/3917/3917749.svg?token=exp=1670486670~hmac=84a197fe65626dbb13e5a5c6963c214d" style="margin-right: 5px;" width="16" height="16">최신순
             			</td>
              			<td width="120px;">
             				<img src="https://cdn-icons.flaticon.com/svg/3917/3917749.svg?token=exp=1670486670~hmac=84a197fe65626dbb13e5a5c6963c214d" style="margin-right: 5px;" width="16" height="16">하트 많은 순
          				</td>
              			<td>
               				<img src="https://cdn-icons.flaticon.com/svg/3917/3917749.svg?token=exp=1670486670~hmac=84a197fe65626dbb13e5a5c6963c214d" style="margin-right: 5px;" width="16" height="16">댓글 많은 순
                		</td>
            		</tr>
           		</table>
       		</div>
     	</div>
     </div>

<!-- 글 리스트 -->	
	<div class="row row-cols-1 row-cols-md-5 g-4" style="margin: 150px;">
		<div class="col">
			<div class="card shadow-sm">
			<img class="bd-placeholder-img card-img-top" width="100%" height="225"  src="https://ifh.cc/g/yX3tCA.png">
				<div class="card-body">
					<p class="card-text">우리집고양이 구경</p>
					<div class="d-flex justify-content-between align-items-center">
						<p class="card-text" style="width: 280px;">3000원</p>
						<div class="btn-group">
							<img src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png" style="width: 30px; height: 30px;">2&nbsp;&nbsp;
							<img src="https://cdn-icons-png.flaticon.com/512/2589/2589054.png" style="width: 30px; height: 30px; display: none;">&nbsp;
							<img src="https://cdn-icons-png.flaticon.com/512/7789/7789458.png" style="width: 30px; height: 30px;">4
						</div>
						<small class="text-muted"></small>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
</body>
<script>

	window.onload = () => {
		
		//첫번째 슬라이드 상세페이지
		const fiRcards = document.getElementsByClassName('carouselCardFir');
		for(const card of fiRcards){
			const wish = this.querySelector('span')
				wish.addEventListener('click', function() {
				location.href='${contextPath}/marketBoardLike.ma?bId=' + bId;
			});
			card.addEventListener('click', function() {
				location.href='${contextPath}/marketBoardDetail.ma?bId=' + bId;
			});
		}
		//두번째 슬라이드 상세페이지
		const seCcards = document.getElementsByClassName('carouselCardSec');
		for(const card of seCcards){
			
			
			card.addEventListener('click', function() {
				location.href='${contextPath}/marketBoardDetail.ma?bId=' + bId;
			});
		}
		//게시글 상세페이지
		const cards = document.getElementsByClassName('cards');
		for(const card of cards){
			card.addEventListener('click', function() {
				location.href='${contextPath}/marketBoardDetail.ma?bId=' + bId;
			});
		}
	}

</script>
</html>