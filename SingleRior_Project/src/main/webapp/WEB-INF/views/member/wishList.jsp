<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

 .nav-link:hover { font-weight : bold; color:#008cd4;} 

	#navReview{
		margin:auto;
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
					<span class="nav-link active" aria-current="page" style="color:#008cd4">전체</span> 
					<span class="nav-link">스토어</span>
					<span class="nav-link">싱글벙글</span>
					<span class="nav-link">씽씽마켓</span>
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