<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style>
	body {display: flex; align-items: center; padding-top: 40px; padding-bottom: 40px;}
</style>
</head>
<body class="bg-light">
	<div class="container">
		<main>
			<div class="py-5 text-center">
				<a href="${ contextPath }/home.do"><img class="d-block mx-auto mb-4" src="${ contextPath }/resources/image/SingleRior_logo.png" alt="" width="330"></a>
			</div>

			<div style="margin-left: 350px; margin-right: 350px;">
				<h3>회원가입</h3><br><br>
				<form class="needs-validation" action="${ contextPath }/insertMember.me" method="POST">
					<div class="row g-3">
						<div class="col-12">
							<label for="id" class="form-label">아이디</label>
							<input type="text" class="form-control" id="memberId" name="memberId" required>
							<label id="idCheckResult">영문, 숫자를 포함한 5~20자 이상의 아이디를 입력해주세요.</label>
						</div>
						
						<div class="col-12">
							<label for="pwd" class="form-label">비밀번호</label>
							<input type="password" class="form-control" id="memberPwd" name="memberPwd" required>
							<label id="pwdCheckResult">영문, 숫자, 특수기호를 포함한 8자 이상의 비밀번호를 입력해주세요.</label>
						</div>
						
						<div class="col-12">
							<label for="pwdConfirm" class="form-label">비밀번호 확인</label>
							<input type="password" class="form-control" id="pwdConfirm" required>
						</div>
						
						<div class="col-12">
							<label for="name" class="form-label">이름</label>
							<input type="text" class="form-control" id="memberName" name="memberName" required>
						</div>
						
						<div class="col-12">
							<label for="nickName" class="form-label">닉네임</label>
							<input type="text" class="form-control" id="nickName" name="nickName" required>
							<label id="nickNameCheckResult">영문, 숫자를 포함한 5~20자 이상의 닉네임를 입력해주세요.</label>
						</div>

						<div>이메일</div>
						<div class="input-group mb-3">
 							 <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
							 <button class="btn btn-outline-secondary" type="button" id="button-addon2">인증</button>
						</div>

						<div class="col-12">
							<label for="phone" class="form-label">핸드폰 번호 (-포함)</label>
							<input type="text" class="form-control" id="phone" name="phone">
						</div>
						
						<br><br><br><br><br>
						
						<button class="w-100 btn btn-light btn-lg" style="background:#008cd4; color:white">회원가입</button>
					</div>
				</form>
			</div>
		</main>
	</div>
</body>
</html>