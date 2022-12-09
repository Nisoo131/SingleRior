<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h3{display:inline-block;}
	#deleteMember{color:gray; display:block;text-align:right; text-decoration:none;}
	#deleteMember:hover{color:gray; text-decoration:underline;}
	
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/top.jsp"/>
	</header>
	<div class="container">
		<main>
			<div style="margin-left: 350px; margin-right: 350px;">
				<br><br><br>
				<h3>회원정보 수정</h3><a href="#" id="deleteMember" data-bs-toggle="modal" data-bs-target="#deleteModal">회원탈퇴</a><br><br>
				<form class="needs-validation" action="${ contextPath }/updateMember.me" method="POST">
					<div class="row g-3">
						<div class="col-12">
							<label for="id" class="form-label">아이디</label>
							<input type="text" class="form-control" id="memberId" name="memberId" readonly>
						</div>
						
						<div class="col-12">
							<label for="pwd" class="form-label">비밀번호</label>
							<input type="password" class="form-control" id="oldPwd" name="oldPwd" required>
							<label id="pwdCheckResult"></label>
						</div>
						
						<div class="col-12">
							<label for="pwdConfirm" class="form-label">새로운 비밀번호</label>
							<input type="password" class="form-control" id="newPwd">
						</div>
						
						<div class="col-12">
							<label for="name" class="form-label">이름</label>
							<input type="text" class="form-control" id="memberName" name="memberName" readonly>
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
						
						<button class="w-100 btn btn-light btn-lg" style="background:#008cd4; color:white">회원정보 수정</button>
					</div>
				</form>
			</div>
		</main>
	</div>
	
	
	<!--  회원 탈퇴 모달창 -->
	<div class="modal" tabindex="-1" id="deleteModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">회원 탈퇴</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>정말로 탈퇴하시겠습니까?<br>탈퇴 후 계정은 복구할 수 없습니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">창 닫기</button>
					<button type="button" class="btn btn-ligth" style="background:#008cd4; color:white">회원 탈퇴</button>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>
</body>
</html>