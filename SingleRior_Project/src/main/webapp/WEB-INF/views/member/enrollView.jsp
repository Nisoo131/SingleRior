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
							<span id="idCheckMsg"></span>
						</div>
						
						<div class="col-12">
							<label for="pwd" class="form-label">비밀번호</label>
							<input type="password" class="form-control" id="memberPwd" name="memberPwd" required>
							<span id="pwdCheckMsg"></span>
						</div>
						
						<div class="col-12">
							<label for="pwdConfirm" class="form-label">비밀번호 확인</label>
							<input type="password" class="form-control" id="pwdConfirm" required>
							<span id="pwdConfirmMsg"></span>
						</div>
						
						<div class="col-12">
							<label for="name" class="form-label">이름</label>
							<input type="text" class="form-control" id="memberName" name="memberName" required>
						</div>
						
						<div class="col-12">
							<label for="nickName" class="form-label">닉네임</label>
							<input type="text" class="form-control" id="nickName" name="nickName" required>
							<span id="nickNameCheckMsg"></span>
						</div>

						<div>이메일</div>
						<div class="input-group mb-3">
 							 <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
							 <button class="btn btn-outline-secondary" type="button" id="emailCheckBtn">인증</button>
						</div>
						<div class="mail-check-box">
							<input class="form-control mail-check-input" id="emailCheckInput" disabled="disabled" placeholder="인증번호 6자리를 입력해주세요!"  maxlength="6">
							<span id="emailCheckMsg"></span>
						</div>
						<div class="col-12">
							<label for="phone" class="form-label">핸드폰 번호 (-포함)</label>
							<input type="text" class="form-control" id="phone" name="phone">
						</div>
						<div class="col-12">
							<label for="address" class="form-label">주소</label>
							<input type="text" class="form-control" id="address" name="address">
						</div>
						
						<br><br><br><br><br>
						
						<button id="enrollBtn" class="w-100 btn btn-light btn-lg" style="background:#008cd4; color:white">회원가입</button>
					</div>
				</form>
			</div>
		</main>
	</div>
	
	<script>
	
		
		// 아이디
		$(function(){
			$('#memberId').on('focus', function(){
				$('#idCheckMsg').html('영문, 숫자를 포함한 6~20자 이상의 아이디를 입력해주세요.');
				$('#idCheckMsg').css('color','black');
				
			});
			
			$('#memberId').on('focusout',function(){
				let memberId = $('#memberId').val();
//	 			console.log(memberId);
				const idReg = /^[a-zA-Z]{1}[a-zA-Z0-9]{5,19}$/;
				if(!idReg.test(memberId)){
					$('#idCheckMsg').css('color','red');
					return false;
				}else{
					$.ajax({
						url : '${contextPath}/checkId.me',
						data : {memberId:memberId},
						success: (data) =>{
							console.log(data);
							if( data == 0 ) {
								$('#idCheckMsg').html('멋진 아이디네요!');
								$('#idCheckMsg').css('color','green');
							} else {
								$('#idCheckMsg').html('이미 사용중이거나 탈퇴한 아이디입니다.');
								$('#idCheckMsg').css('color','red');
								return false;
							}
						},
						error : (data)=>{
							console.log(data);
						}
					});
				}
			});
		});
		

		// 비밀번호
		$(function(){
			$('#memberPwd').on('focus', function(){
				$('#pwdCheckMsg').html('영문, 숫자, 특수기호를 포함한 6자 이상의 비밀번호를 입력해주세요.');
				$('#pwdCheckMsg').css('color','black');
			});
			$('#memberPwd').on('focusout',function(){
				let memberPwd = $('#memberPwd').val();
//	 			console.log(memberPwd);
				const pwdReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}$/;
				if(!pwdReg.test(memberPwd)){
					$('#pwdCheckMsg').css('color','red');
				}else{
					$('#pwdCheckMsg').html('');
				}
			});
			
			$('#pwdConfirm').keyup(function() {
				if($('#memberPwd').val() != $('#pwdConfirm').val()) {
					$('#pwdConfirmMsg').html('비밀번호 불일치');
					$('#pwdConfirmMsg').css('color','red');
					return false;
				} else {
					$('#pwdConfirmMsg').html('비밀번호 일치');
					$('#pwdConfirmMsg').css('color','green');
				}
			});
		});
		
		// 닉네임 중복확인
		$(function(){
			$('#nickName').on('focusout', function(){
				let nickName = $('#nickName').val();
//	 			console.log(nickName);
				$.ajax({
					url : '${contextPath}/checkNickName.me',
					data : {nickName:nickName},
					success: (data) =>{
						console.log(data);
						if( data == 0 ) {
							$('#nickNameCheckMsg').html('멋진 닉네임네요!');
							$('#nickNameCheckMsg').css('color','green');
						} else {
							$('#nickNameCheckMsg').html('이미 사용중인 닉네임입니다.');
							$('#nickNameCheckMsg').css('color','red');
							return false;
						}
					},
					error:(data)=>{
						console.log(data);
					}
				});
				
			});
		});
		
			// 이메일 인증
			let code = '';
			$('#emailCheckBtn').click(function(){
				const email = $('#email').val();
				console.log(email);
				const emailCheckInput = $('#emailCheckInput');
				
				$.ajax({
					type : 'post',
					url : '${contextPath}/checkMail.me?email='+email,
					success: (data)=>{
						console.log(data);
						$('#emailCodeSend').Text = '인증번호 발송'
						emailCheckInput.attr('disabled',false);
						code = data;
					},
					error:(data)=>{
						console.log(data);
					}
				});
			});
			
			$('#emailCheckInput').blur(function(){
				const inputCode = $(this).val();
				console.log(code);
				if(inputCode === code){
					$('#emailCheckMsg').html('인증번호가 일치합니다.');
					$('#emailCheckMsg').css('color','green');
				}else{
					$('#emailCheckMsg').html('인증번호가 일치하지 않습니다. 다시 확인해주세요');
					$('#emailCheckMsg').css('color','red');
					return false;
				}
			});

	
	
		
		
		
		
	</script>
</body>
</html>