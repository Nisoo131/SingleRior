<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#mainService{
	 	margin:auto; 
	 	margin-top:50px; 
	 	max-width:1000px;
	 	padding:40px;
		background-color:#F5F5F5;
		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
		border-bottom-left-radius: 10px;
		border-bottom-right-radius: 10px;
	}
	#mainService h2{
		float:right;
		color:#008cd4;
	}
	#mainService h4{
		color:gray;
	}
	
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/top.jsp"/>
	</header>
	<section>
		<div id="mainService">
			<h1 style="display:inline">고객센터&nbsp;&nbsp;<span>09:00~18:00</span></h1>
			<br><br><br>
			<h4>평일: 전체 문의 상담 가능</h4>
			<h4>주일/공휴일: 상담불가</h4>
			<h2><i class="bi bi-telephone-fill"></i>1600-0000</h2>
			<br>
		</div>
	</section>
	<footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>
</body>
</html>