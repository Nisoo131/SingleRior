<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.form-findId {margin:auto; margin-top:200px; max-width: 500px; padding:50px;}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/top.jsp"/>
	</header>
	<main class="form-findId">
		<form action="${ contextPath }/login.me" method="post">
			<div>
				<div>이메일을 입력해주세요.</div><br>
				<input type="email" class="form-control" name="email" placeholder="singlerior@singlerior.com" style="height:50px;">
			</div>
			<br>
			<button class="w-100 btn btn-lg btn-light" type="submit" style="background:#008cd4; color:white">아이디 찾기</button><br><br>
		</form>
		<h6 style="text-align:center;">입력하신 이메일로 아이디를 보내드렸습니다.</h6>
		<br><br><br>
	</main>
	<footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>
</body>
</html>