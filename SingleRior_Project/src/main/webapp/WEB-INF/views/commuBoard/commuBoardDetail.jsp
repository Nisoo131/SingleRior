<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	@font-face {
	    font-family: 'BMJUA';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	* {
		font-family: 'BMJUA';
	}
	.dropdown:hover{cursor: pointer;}
</style>
</head>
<body>
	<header class="sticky-top">
		<div>
			<jsp:include page="../common/top.jsp"/>
		</div>
		
		<div class="py-1 border-bottom fs-5" style="background-color: #008cd4; text-align: center;">
			<ul class="nav me-auto justify-content-center">
		        <li class="nav-item"><a href="${ contextPath }/commuTipList.co" class="nav-link px-5 mx-2" style="color: white;">생활팁</a></li>
		        <li class="nav-item"><a href="${ contextPath }/commuReviewList.co" class="nav-link px-5 mx-2" style="color: white;">후기</a></li>
		        <li class="nav-item"><a href="${ contextPath }/commuFreeList.co" class="nav-link px-5 mx-2" style="color: white;">자유</a></li>
		    </ul>
		</div>
	</header>
	
	<main>
		<div class="container">
			<div class="col-md-1" style="text-align: center; padding-top: 100px;">
				<div class="row g-0 border rounded overflow-hidden flex-md-row shadow-sm h-md-250 position-relative mt-2 mb-4">
					<div class="col py-2 d-flex flex-column position-static">
						<table>
							<tr>
								<td><a href="javascript:history.back();" class="nav-link link-dark"><img src="https://www.flaticon.com/svg/vstatic/svg/3916/3916912.svg?token=exp=1670460369~hmac=675d0b7c5b02f035ed8a059ae5814294" width="15" height="15"> 목록 보기</a></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="col-12 border rounded overflow-hidden">
				<!-- 헤더 -->
				<div style="font-size: 20px; padding-top: 30px; padding-left: 50px;">
					<span>자유</span>
				</div>
				<table>
					<tr>
						<td class="fs-3 px-5 py-3" width="1100">배가 너무 아픈데 주변에 약국이 다 문을 닫았어요..ㅜㅜ</td>
						<td width="20"><img src="https://cdn-icons.flaticon.com/svg/3916/3916586.svg?token=exp=1670462433~hmac=154ca1ce619f5c92644b4e20378081cd" width="20" height="20"></td>
						<td class="fs-5" style="text-align: center;" width="60">0</td>
						<td width="20"><img src="https://cdn-icons.flaticon.com/svg/3916/3916603.svg?token=exp=1670462662~hmac=f05590d1f51351a3e5542f67adfcb754" width="20" height="20"></td>
						<td class="fs-5" style="text-align: center;" width="60">0</td>
					</tr>
				</table>
				<table>
					<tr>
						<td class="px-5" width="150">건강최고</td>
						<td width="180">22.12.08 &nbsp;&nbsp;&nbsp; 09:00</td>
						<td width="40">조회</td>
						<td>0</td>
					</tr>
				</table>
				
				<div style="border-bottom: 1px solid #DCDCDC; padding-top: 10px;"></div>
				
				<!-- 본문 -->
				<div class="p-5" style="font-size: 20px; height: 600px;">
					<span>
						혹시 XX역 주변에 약국 연 곳 아시는 분 있을까요....<br>
						혼자서 도저히 병원까지는 못 갈 것 같아요 ㅠㅠ<br>
						지금 당장 부를 사람도 없고,,<br>
					</span>
				</div>
				<div class="col-md-1" style="text-align: center; padding-top: 30px; padding-left: 50px; width: 170px;">
					<div class="row g-0 flex-md-row shadow-sm h-md-250 position-relative mt-2 mb-4">
						<button type="button" class="btn btn-outline-dark" data-bs-toggle="button">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-emoji-smile" viewBox="0 0 16 16">
								<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
								<path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
							</svg>
							공감하기
						</button>
					</div>
				</div>
				
				<div style="border-bottom: 1px solid #DCDCDC; padding-top: 10px;"></div>
				
				<!-- 댓글 -->
				<div class="px-5">
					<div class="input-group" style="padding-top: 50px;">
						<textarea class="form-control" rows="3" id="replyContent" style="resize: none;" placeholder="댓글을 작성해주세요."></textarea>
						<button class="btn btn-outline-primary btn-lg" id="replySubmit" type="button" style="width: 100px;">등록</button>
					</div>
					<div class="justify-content-center" style="padding-bottom: 50px; padding-right: 100px; color: #A9A9A9; text-align: right; font-size: 20px;">
						<span>0 / 600</span>
						<img class="m-3" src="https://cdn-icons.flaticon.com/svg/3917/3917606.svg?token=exp=1670471019~hmac=4f53bb92f7e43f4146c6da299ae3cc7e" width="20" height="20">
					</div>
				</div>
				
				
				<div class="px-5" style="padding-bottom: 50px;">
					<table>
						<tr>
							<td style="text-align: center;" width="40"><img src="https://cdn-icons.flaticon.com/svg/3917/3917711.svg?token=exp=1670467359~hmac=b45251c2afca4a6751ba3fed9124eb31" width="20" height="20"></td>
							<td class="px-4">건강최고</td>
							<td class="px-4">22.12.08 &nbsp;&nbsp;&nbsp; 09:00</td>
							<td width="850"></td>
							<td>
								<div class="dropdown">
									<img class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" src="https://cdn-icons.flaticon.com/svg/3917/3917158.svg?token=exp=1670467948~hmac=2f18f7118b556af438bb1d4438649f4a" width="20" height="20">
									<ul class="dropdown-menu" style="text-align: center;">
										<li><a class="dropdown-item" href="#">수정</a></li>
										<li><a class="dropdown-item" href="#">삭제</a></li>
										<li><a class="dropdown-item" href="#">신고</a></li>
									</ul>
								</div>
							</td>
						</tr>
					</table>
					<table style="font-size: 20px;">
						<tr>
							<td class="px-5 py-3">헉 괜찮으세요..? XX역 근처에는 YY약국이 지금 운영중인 것 같아요. 제가 좀 전에 지나가면서 봤거든요.</td>
						</tr>
					</table>
				</div>
				
				<div style="border-bottom: 1px solid #DCDCDC; padding-top: 10px;"></div>
				
				<!-- 이동 -->
				<div class="row px-5 py-4">
					<div class="col-md-1" style="text-align: center; width: 150px;">
						<button class="w-100 btn btn-outline-dark btn-lg" type="button" id="preForm">이전글</button>
					</div>
					<div class="col-md-1" style="text-align: center; width: 150px;">
						<button class="w-100 btn btn-outline-dark btn-lg" type="button" id="nextForm">다음글</button>
					</div>
					
					<div class="col-md-10" style="width: 600px;"></div>
					
					<div class="col-md-1" style="text-align: center; width: 100px;">
						<button class="w-100 btn btn-outline-primary btn-lg" type="button" id="updateForm">수정</button>
					</div>
					<div class="col-md-1" style="text-align: center; width: 100px;">
						<button class="w-100 btn btn-outline-secondary btn-lg" type="button" id="deleteModal">삭제</button>
					</div>
					<div class="col-md-1" style="text-align: center; width: 100px;">
						<button class="w-100 btn btn-outline-danger btn-lg" type="button" id="reportForm">신고</button>
					</div>
				</div>
			</div>
		</div>
	</main>
	
	<div class="modal fade" tabindex="-1" role="dialog" id="modalChoice">
			<div class="modal-dialog" role="document">
	    		<div class="modal-content rounded-3 shadow">
	      			<div class="modal-body p-4 text-center">
	        			<h3 class="mb-0">정말로 삭제하시겠습니까?</h3>
	        			<p class="mb-0">삭제 후 게시글은 복구할 수 없습니다.</p>
	      			</div>
	      			<div class="modal-footer flex-nowrap p-0">
	        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" id="delete">
	        				<strong>네</strong>
	        			</button>
	        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">아니오</button>
	      			</div>
	    		</div>
	  		</div>
		</div>
	
	<footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>
	
	<script>
		window.onload = () => {
			const deleteModal = document.getElementById('deleteModal');
			if(deleteModal != null){
				deleteModal.addEventListener('click', ()=>{
					$('#modalChoice').modal('show');
				});
			}
		}
	</script>
</body>
</html>