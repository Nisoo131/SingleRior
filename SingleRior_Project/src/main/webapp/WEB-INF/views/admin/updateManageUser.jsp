<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    	 <style>
    	 
    	 #logo {
				display: flex;
				flex-direction: column;
				justify-content: center;
				align-items: center;
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
			
			#pInsert{
			
				display: flex;
				flex-direction: column;
				justify-content: center;
				align-items: center;
				margin-top:30px;	
			}
		
			tr td{
				margin-right:50px;
				margin-left:50px;
				
			}
			.btn{
			
				display: flex;
				flex-direction: row;
				justify-content: center;
				align-items: center;
				
			
			}
    	 
    	 
    	 
    	 </style>
    	 
    	 
    </head>
    <body>
    
	<jsp:include page="../common/adminTop.jsp"/>
	<jsp:include page="../common/adminLeft.jsp"/>
	
            
            <div class="container">
		<main>
			<div class="py-5 text-center">
			<img class="d-block mx-auto mb-4" src="${ contextPath }/resources/image/SingleRior_logo.png" alt="" width="330">
			</div>

			<div style="margin-left: 350px; margin-right: 350px;">
				<div style="text-align:center;"><h3>회원정보 수정</h3></div><br><br>
				<form class="needs-validation" action="${ contextPath }/editMember.adm" method="POST" onsubmit="return mySubmit()">
					<div class="row g-3">
						<div class="col-12">
							<label for="id" class="form-label">아이디</label>
							<input type="text" class="form-control" id="memberId" value="${m.memberId}" name="memberId" readonly>
							<span id="idCheckMsg"></span>
						</div>
						
						<div class="col-12">
							<label for="pwd" class="form-label">비밀번호</label>
							<input type="password" class="form-control" id="memberPwd" name="memberPwd" >
							<span id="pwdCheckMsg"></span>
						</div>
						
						<div class="col-12">
							<label for="pwdConfirm" class="form-label">비밀번호 확인</label>
							<input type="password" class="form-control" id="pwdConfirm" >
							<span id="pwdConfirmMsg"></span>
						</div>
						
						<div class="col-12">
							<label for="name" class="form-label">이름</label>
							<input type="text" class="form-control" id="memberName" name="memberName" value="${m.memberName}" required>
						</div>
						
						<div class="col-12">
							<label for="nickName" class="form-label">닉네임</label>
							<input type="text" class="form-control" id="nickName" name="nickName" value="${m.nickName }">
							<span id="nickNameCheckMsg"></span>
						</div>

							<label for="email" class="form-label">이메일</label>
						<div class="input-group mb-3">
 							 <input type="email" class="form-control" id="email" name="email" value=${m.email } aria-label="Recipient's username" aria-describedby="button-addon2" required>
						</div>
							 
						<div class="col-12">
							<label for="phone" class="form-label">핸드폰 번호 (-포함)</label>
							<input type="text" class="form-control" id="phone" name="phone" value="${m.phone }"required>
						</div>
						<div class="col-12">
							<label for="address" class="form-label">주소</label>
							<input type="text" class="form-control" id="address_kakao" name="address" value="${m.address}" required>
						</div>
						
						<br><br><br><br><br>
						
						<input type='submit' id="enrollBtn" class="w-100 btn btn-light btn-lg" style="background:#008cd4; color:white" value="회원 정보수정">
					</div>
				</form>
			</div>
			<br>
		</main>
	
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; SingleRior 2022</div>
                        </div>
                    </div>
                </footer>
            </div>
        <script>
	        let nickNameChecked = false;
	    	let passwordChecked = false;
	    	let passwordConfirmChecked = false;
	    	let emailChecked = false;
        
        
	    	$(function(){
	    		$('#memberPwd').on('focus', function(e){
	    			$('#pwdCheckMsg').html('영문, 숫자, 특수기호를 포함한 6자 이상의 비밀번호를 입력해주세요.');
	    			$('#pwdCheckMsg').css('color','black');
	    		});
	    		$('#memberPwd').on('focusout',function(){
	    			let memberPwd = $('#memberPwd').val();
//	    	 		console.log(memberPwd);
	    			const pwdReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}$/;
	    			if(!pwdReg.test(memberPwd)){
	    				$('#pwdCheckMsg').css('color','red');
	    				passwordChecked = false;
	    			}else{
	    				$('#pwdCheckMsg').html('');
	    				passwordChecked = true;
	    			}
	    		});
	    		
	    		$('#pwdConfirm').keyup(function(e) {
	    			if($('#memberPwd').val() != $('#pwdConfirm').val()) {
	    				$('#pwdConfirmMsg').html('비밀번호 불일치');
	    				$('#pwdConfirmMsg').css('color','red');
	    				passwordConfirmChecked = false;
	    			} else {
	    				$('#pwdConfirmMsg').html('비밀번호 일치');
	    				$('#pwdConfirmMsg').css('color','green');
	    				passwordConfirmChecked = true;
	    			}
	    		});
	    	});
	    	// 닉네임 중복확인
	    	$(function(){
	    		$('#nickName').on('focusout', function(e){
	    			let nickName = $('#nickName').val();
//	    	 		console.log(nickName);
	    			$.ajax({
	    				url : '${contextPath}/checkNickName.me',
	    				data : {nickName:nickName},
	    				success: (data) =>{
	    					console.log(data);
	    					if( data == 0 ) {
	    						$('#nickNameCheckMsg').html('멋진 닉네임네요!');
	    						$('#nickNameCheckMsg').css('color','green');
	    						nickNameChecked = true;
	    					} else {
	    						$('#nickNameCheckMsg').html('이미 사용중인 닉네임입니다.');
	    						$('#nickNameCheckMsg').css('color','red');
	    						nickNameChecked =  false;
	    					}
	    				},
	    				error:(data)=>{
	    					console.log(data);
	    				}
	    			});
	    		});
	    	});	
	    	// 이메일 중복확인
			$('#email').blur(function(e){
				const email = $('#email').val();
				console.log(email);
				$.ajax({
					type : 'post',
					url : '${contextPath}/checkEmailConfirm.me?email='+email,
					success: (data)=>{
						console.log(data);
						if(data == 0){
							$('#emailCheckBtn').attr('disabled', false);
							$('#emailCheckConfirmMsg').html("사용가능한 이메일입니다. 인증번호를 입력해주세요.");
							$('#emailCheckConfirmMsg').css('color','green');
							emailChecked = true;
						}else{
							$('#emailCheckBtn').attr("disabled", true);
							$('#emailCheckConfirmMsg').html("이미 사용중인 이메일입니다.");
							$('#emailCheckConfirmMsg').css('color','red');
							emailChecked = false;
//								e.preventDefault();
						}
					},
					error:(data)=>{
						console.log(data);
					}
				});
			});
			function mySubmit(){

				if(idChecked == false){
					$('#memberId').focus();
					return false;
				}
				if(nickNameChecked == false){
					$('#nickName').focus();
					return false;
				}
				if(passwordChecked == false){
					
					$('#memberPwd').focus();
					return false;
				}
				if(passwordConfirmChecked == false){
					$('#pwdConfirm').focus();
					return false;
				}
				if(emailChecked == false){
					$('#emailCheckInput').focus();
					return false;
				}
				
			}
	    	
        </script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		window.onload = function(){
		    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
		        //카카오 지도 발생
		        new daum.Postcode({
		            oncomplete: function(data) { //선택시 입력값 세팅
		            	console.log(data);
		                document.getElementById("address_kakao").value = data.address; // 주소 넣기
		                self.close();
	// 	                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
		            }
		        }).open();
		    });
		}
	</script>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src='${ pageContext.servletContext.contextPath }/resources/js/scripts.js'></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/assets/demo/chart-area-demo.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
