<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

 li a:hover { font-weight : bold; color:#008cd4;} 
input[type=checkbox] {

-ms-transform: scale(2); /* IE */

-moz-transform: scale(2); /* FF */

-webkit-transform: scale(2); /* Safari and Chrome */

-o-transform: scale(2); /* Opera */

padding: 10px;

}
	#navReview{
		margin:auto;
		margin-top:70px;
		max-width:470px;
		font-size:30px;
		cursor:pointer;
	}
	
	section{
		margin:auto;
		margin-top:70px;
		max-width:1500px;
	
	}
</style>
</head>
<body>
	<jsp:include page="../common/top.jsp"/>
	<br><br><br>
	<nav class="navbar navbar-expand-lg" id="navReview">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<ul class="nav justify-content-center">
						<li class="nav-item"><a style="color: black;"
							class="nav-link active" aria-current="page" href="#"><img
								style="width: 40px; height: 40px;"
								src="https://cdn-icons-png.flaticon.com/512/4803/4803672.png"><br>&nbsp;&nbsp;전체</a>
						</li>

						<li class="nav-item"><a style="color: black;"
							class="nav-link active" aria-current="page" href="#"><img
								style="width: 40px; height: 40px;"
								src="https://cdn-icons-png.flaticon.com/512/4803/4803788.png"><br>스토어</a>
						</li>
						<li class="nav-item"><a style="color: black;"
							class="nav-link active" aria-current="page" href="#">&nbsp;<img
								style="width: 40px; height: 40px;"
								src="https://cdn-icons-png.flaticon.com/512/4803/4803585.png"><br>싱글벙글
						</a></li>
						<li class="nav-item"><a style="color: black;"
							class="nav-link active" aria-current="page" href="#">&nbsp;<img
								style="width: 40px; height: 40px;"
								src="https://cdn-icons-png.flaticon.com/512/4803/4803729.png"><br>씽씽마켓
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<section>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="padding-top: 60px;  padding-bottom60px; padding-right: 150px;">
	  		<button id="deleteBtn" class="btn btn-primary me-md-2" type="button">삭제</button>
		</div>
		
		<div class="row row-cols-1 row-cols-md-4 g-4" style="margin-left: 150px; margin-right: 150px; ">
			<div class="col">
				<div class="card shadow-sm">
				<div style="padding-top: 10px; padding-left: 10px;" id="checkDiv">
				</div>
				<img class="bd-placeholder-img card-img-top" width="100%" height="225"  src="https://ifh.cc/g/yX3tCA.png">
					<div class="card-body">
						<p class="card-text">제목</p>
						<div class="d-flex justify-content-between align-items-center">
							<p class="card-text" style="width: 280px;">가격</p>
							<div class="btn-group">
							</div>
							<small class="text-muted"></small>
						</div>
					</div>
				</div>
			</div>
	
		</div>
	</section>
	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
	
	<script>
	window.onload=()=>{
		document.getElementById('deleteBtn').addEventListener('click',()=>{
			const checkDiv = document.getElementById('checkDiv');
			const deleteBtn = document.getElementById('deleteBtn');
			if(checkDiv.innerHTML==''){
				checkDiv.innerHTML = '<input type="checkbox" style="float: left;">';
				deleteBtn.innerHTML = '취소';
			}else{
				checkDiv.innerHTML = '';
				deleteBtn.innerHTML = '삭제';
			}
			
		});
		
	}
	
	

	
	
	</script>
	
</body>
</html>