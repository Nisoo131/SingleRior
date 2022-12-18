<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		        <li class="nav-item"><a href="${ contextPath }/marketBoardList.co" class="nav-link px-5 mx-2" style="color: white;">같이사요</a></li>
		        <li class="nav-item"><a href="${ contextPath }/commuReviewList.co" class="nav-link px-5 mx-2" style="color: white;">팝니다</a></li>
		        <li class="nav-item"><a href="${ contextPath }/commuFreeList.co" class="nav-link px-5 mx-2" style="color: white;">삽니다</a></li>
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
				<form class="needs-validation" method="POST" id="detailForm">
					<!-- 헤더 -->
					<div style="font-size: 20px; padding-top: 30px; padding-left: 50px;">
						<span>
							<c:if test="${ mkBoard.marketType == 1 }">[같이사요]</c:if>
							<c:if test="${ mkBoard.marketType == 2 }">[팝니다]</c:if>
							<c:if test="${ mkBoard.marketType == 3 }">[삽니다]</c:if>
						</span>
						<input type="hidden" value="${ mkBoard.boardNo }" name="boardNo">
						<input type="hidden" value="${ page }" name="page">
					</div>
					<table>
						<tr>
							<td class="fs-3 px-5 py-3" width="1100">${ mkBoard.boardTitle }</td>
							<td width="20"><img src="https://cdn-icons.flaticon.com/svg/3916/3916586.svg?token=exp=1670462433~hmac=154ca1ce619f5c92644b4e20378081cd" width="20" height="20"></td>
							<td class="fs-5" style="text-align: center;" width="60">${ mkBoard.like }</td>
							<td width="20"><img src="https://cdn-icons.flaticon.com/svg/3916/3916603.svg?token=exp=1670462662~hmac=f05590d1f51351a3e5542f67adfcb754" width="20" height="20"></td>
							<td class="fs-5" style="text-align: center;" width="60">0</td>
						</tr>
					</table>
					<span class="px-5" width="200">${ mkBoard.createDate }</span>
					<span style="float: right; padding-right: 12px;">조회수 ${ mkBoard.count }</span>
					
					<div style="border-bottom: 1px solid #DCDCDC; padding-top: 10px;"></div>
					
					<!-- 본문 -->
					<div class="p-5" style="font-size: 20px;">
						<span>${ mkBoard.boardContent }</span>
					</div>
					
					<div class="row justify-content-center">
						<div class="col-md-8">
							<div class="row">
								<c:forEach items="${mkAList }" var="mkA">
								<a href="resources/uploadFiles/${ mkA.imgRename}" data-toggle="lightbox" class="col-sm-4">
									<img src="resources/uploadFiles/${ mkA.imgRename}" class="img-fluid rounded" style="width: 250px; height: 250px; ">
								</a>
								</c:forEach>
							</div>
						</div>
					</div>
														
			  		<div class="col-md-1" style="text-align: center; padding-top: 30px; padding-left: 50px; width: 170px;">
						<div class="row g-0 flex-md-row shadow-sm h-md-250 position-relative mt-2 mb-4" id='likeDiv'>
								<c:if test="${wishList==null }">
								<button class="btn btn-lg mb-0" id="likeBtn" ><img style="width: 35px; height: 35px;" src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png">좋아요</button>
								</c:if>
								<c:if test="${wishList!=null }">
								<button class="btn btn-lg mb-0 " id="likeCancleBtn" ><img style="width: 35px; height: 35px;" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">취소</button>
								</c:if>
								
						</div>
					</div>
				<div style="padding-top: 10px; "></div>
					<!-- 프로필 -->
						<div class="col-12" style="background: #D9E5FF; border-radius:2em; padding: 20px; " >
							<table style="width: 100%">
								<tr>
									<td rowspan="2" style="width: 80px;"><img src="https://cdn-icons-png.flaticon.com/512/789/789473.png" style="width: 60px; height: 60px;"></td>
									<td style="align-content: "><span style="font-size: 25px;">병아리</span></td>
									<td><img  id="reportBtn" src="https://cdn-icons-png.flaticon.com/512/4898/4898673.png" style="width: 50px; height: 50px; float: right;"></td>
								</tr>
								<tr>
									<td><span>수원시 장안구 이목동</span></td>
									<td style="float: right; margin-right: 12px;"><span>신고</span></td>
								</tr>
							</table>
						</div>
					
					<div style=" padding-top: 10px;"></div>
					
					<!-- 댓글작성 -->
					<div class="px-5">
						<div class="input-group" style="padding-top: 50px;" >
							<textarea class="form-control" rows="3" id="replyContent" style="resize: none;" placeholder="댓글을 작성해주세요."></textarea>
							<c:if test="${ !empty loginUser }">
								<button class="btn btn-outline-primary btn-lg" id="replySubmit"  style="width: 100px;">등록</button>
							</c:if>
						</div>
						<div class="justify-content-center" style="padding-bottom: 50px; padding-right: 100px; color: #A9A9A9; text-align: right; font-size: 20px;">
							<span>0 / 600</span>
							<label for="replySecret">비밀댓글</label>
							<input type="checkbox" id="replySecret" value="N">
						</div>
					</div>
					
					<!-- 댓글 -->
						<div class="px-5 " id="replyDiv">
						<c:forEach items="${mkRList }" var="r">
							<table class="table ">
								<tr>
									<td style="text-align: center;" width="40"><img src="https://cdn-icons.flaticon.com/svg/3917/3917711.svg?token=exp=1670467359~hmac=b45251c2afca4a6751ba3fed9124eb31" width="20" height="20"></td>
									<td class="px-4">${r.nickName}</td>
									<td class="px-4">${r.replyModifyDate}</td>
									<td width="850px;"></td>
									<td>
										<div class="dropdown">
											<img class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" src="https://cdn-icons.flaticon.com/svg/3917/3917158.svg?token=exp=1670467948~hmac=2f18f7118b556af438bb1d4438649f4a" width="20" height="20">
											<ul class="dropdown-menu" style="text-align: center;">
												<c:if test="${ loginUser.memberId eq r.memberId }">
													<li><a class="dropdown-item reReplyBtn" >댓글달기</a></li>
													<li><a class="dropdown-item updateReBtn">수정</a></li>
													<li><a class="dropdown-item deleteReBtn">삭제</a><input type="hidden" id="replyNo" value="${ r.replyNo }"></li>
													
												</c:if>
												<c:if test="${ !(loginUser.memberId eq r.memberId) }">
													<li><a class="dropdown-item" >답글달기</a></li>
													<li><a class="dropdown-item" >신고</a></li>
												</c:if>
											</ul>
										</div>
									</td>
								</tr>
								<tr style="font-size: 20px;">
									<td class="px-5 py-3 " colspan="5">
										<div class="input-group replyContentArea" >
											<textarea readonly style="width: 1000px; border: none; resize: none;"  id="replyContent">${r.replyContent }</textarea>
										</div>
									</td>
								</tr>
							</table>
							</c:forEach>
						</div>
						
						
						<!-- 대댓글 -->
						<div class="px-5" style="padding-bottom: 50px; margin-left: 60px;" id="reReplyDiv">
							<c:forEach items="${mkRRList }" var="rr">
							<table class="table">
								<tr>
									<td style="text-align: center;" width="40"><img src="https://cdn-icons-png.flaticon.com/512/9058/9058850.png" width="20" height="20">
									<td style="text-align: center;" width="40"><img src="https://cdn-icons.flaticon.com/svg/3917/3917711.svg?token=exp=1670467359~hmac=b45251c2afca4a6751ba3fed9124eb31" width="20" height="20"></td>
									<td class="px-4">${rr.nickName}</td>
									<td class="px-4">${rr.reReplyModifyDate}</td>
									<td width="750"></td>
									<td>
										<div class="dropdown">
											<img class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" src="https://cdn-icons.flaticon.com/svg/3917/3917158.svg?token=exp=1670467948~hmac=2f18f7118b556af438bb1d4438649f4a" width="20" height="20">
											<ul class="dropdown-menu" style="text-align: center;">
												<c:if test="${ loginUser.memberId eq rr.memberId }">
													<li><a class="dropdown-item" >수정</a></li>
													<li><a class="dropdown-item" >삭제</a></li>
												</c:if>
												<c:if test="${ !(loginUser.memberId eq rr.memberId) }">
													<li><a class="dropdown-item" >신고</a></li>
												</c:if>
											</ul>
										</div>
									</td>
								</tr>
								<tr style="font-size: 20px;">
									<td class="px-5 py-3" colspan="6">${rr.reReplyContent}</td>
								</tr>
							</table>
							</c:forEach>
						</div>
					
					
					<div style="border-bottom: 1px solid #DCDCDC; padding-top: 10px;"></div>
					
					<!-- 이동 -->
					<div class="row px-5 py-4">
						<div class="col-md-1" style="text-align: center; width: 150px;">
							<button class="w-100 btn btn-outline-dark btn-lg" type="button" id="preForm" onclick="location.href='${contextPath}/marketBoardDetail.ma?bNo=${mkBoard.boardNo-1 }&boardWriter=${mkBoard.writer }'">이전글</button>
						</div>
						<div class="col-md-1" style="text-align: center; width: 150px;">
							<button class="w-100 btn btn-outline-dark btn-lg" type="button" id="nextForm" onclick="location.href='${contextPath}/marketBoardDetail.ma?bNo=${mkBoard.boardNo+1 }&boardWriter=${mkBoard.writer }'">다음글</button>
						</div>
						
						<div class="col-md-10" style="width: 700px;"></div>
						
						<c:if test="${ !(loginUser.memberId eq r.memberId) }">
						<div class="col-md-1" style="text-align: center; width: 100px;">
							<button class="w-100 btn btn-outline-primary btn-lg" type="button"  onclick="location.href='${contextPath}/mkBoardUpdateView.ma?bNo=${mkBoard.boardNo}'">수정</button>
						</div>
						<div class="col-md-1" style="text-align: center; width: 100px;">
							<button class="w-100 btn btn-outline-danger btn-lg" type="button" id="deleteBtn">삭제</button>
						</div>
						</c:if>
					</div>
				</form>
			</div>
		</div>
		<footer>
			<jsp:include page="../common/footer.jsp"/>
		</footer>	
	</main>
	
	<!-- 삭제모달 -->

	<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel"><img src="https://cdn-icons-png.flaticon.com/512/3720/3720719.png" style="width: 30px; height: 30px;">&nbsp;DELETE BOARD </h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	       	정말 삭제하시겠습니까?
	       	<br>
	       	삭제한 게시글은 복구할 수 없습니다.
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/marketBoardDelete.ma?bNo=${ mkBoard.boardNo }'">삭제하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 신고모달 -->
	
	<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel"><img src="https://cdn-icons-png.flaticon.com/512/2689/2689919.png" style="width: 40px; height: 40px;">REPORT</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	       <h3>신고 사유를 선택해주세요!</h3>
	       작성자 : ${mkBoard.nickName }
	       <br>
	       글제목 : ${mkBoard.boardTitle }
	       <br> <br>
			 <div class="form-check">
			  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
			  <label class="form-check-label" >
			    홍보/도배글이예요
			  </label>
			</div>
			<div class="form-check">
			  <input class="form-check-input" type="checkbox" value=""  >
			  <label class="form-check-label" >
			    청소년에게 유해한 내용이예요
			  </label>
			</div>
			<div class="form-check">
			  <input class="form-check-input" type="checkbox" value="" >
			  <label class="form-check-label" >
			    불법이예요
			  </label>
			</div>
			<div class="form-check">
			  <input class="form-check-input" type="checkbox"  >
			  <label class="form-check-label" >
			    욕설,혐오,차별적표현이예요
			  </label>
			</div>
			 <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary">신고하기</button>
	       	</div>
		  </div>
		</div>
	  </div>
	</div>
		
	
	
	<script>
		window.onload = () =>{
			//좋아요
			if(${wishList==null}){
				document.getElementById('likeBtn').addEventListener('click', ()=> {
					$.ajax({
						url: '${contextPath}/marketLike.ma',
						data:{boardNo:${mkBoard.boardNo}},
						success: (data)=>{
							document.getElementById('likeBtn').innerText = "취소";
							document.getElementById('likeBtn').src = "https://cdn-icons-png.flaticon.com/512/2589/2589175.png";
							document.getElementById('likeBtn').id =  "likeCancleBtn";
						},
						error: (data)=>{
							console.log(data);
						}
						
					});
				});
			
			}
	
			//좋아요취소
			if(${wishList!=null}){
				document.getElementById('likeCancleBtn').addEventListener('click', ()=> {
					$.ajax({
						url: '${contextPath}/marketLikeCancle.ma',
						data:{boardNo:${mkBoard.boardNo}},
						success: (data)=>{
							document.getElementById('likeBtn').innerText = "좋아요";
							document.getElementById('likeBtn').src = "https://cdn-icons-png.flaticon.com/512/2589/2589197.png";
							document.getElementById('likeBtn').id =  "likeBtn";
						},
						error: (data)=>{
							console.log(data);
						}
						
					});
				});
			}
			
			
			
			document.getElementById('reportBtn').addEventListener('click', ()=>{
				$('#reportModal').modal('show');	
			});
				
			document.getElementById('deleteBtn').addEventListener('click', ()=>{
				$('#deleteModal').modal('show');	
			});
			
			
			
			
			document.getElementById('replySubmit').addEventListener('click', ()=> {
				
				if(document.getElementById('replySecret').checked){
					document.getElementById('replySecret').value = 'Y';
				}
				
				$.ajax({
					url: '${contextPath}/replyInsert.ma',
					data: {replyContent:document.getElementById('replyContent').value,
							replySecret:document.getElementById('replySecret').value,
							boardNo:${mkBoard.boardNo},
							memberId: '${loginUser.memberId}',
							nickName: '${loginUser.nickName}'},
					success: (data) => {
						
						document.getElementById('replyContent').value = '';
						const reDiv = document.getElementsByClassName('replyDiv');
						reDiv.innerHTML = '';
						
						for(const r of data){
							let str = '<table class="table">';
							str += '<tr>';
							str += '<td style="text-align: center;" width="40"><img src="https://cdn-icons.flaticon.com/svg/3917/3917711.svg?token=exp=1670467359~hmac=b45251c2afca4a6751ba3fed9124eb31" width="20" height="20"></td>';
							str += '<td class="px-4">'+r.nickName+'</td>';
							str += '<td class="px-4">'+r.replyModifyDate+'</td>';
							str += '<td width="850px;"></td>';
							str += '<td>';
							str += '<div class="dropdown">';
							str += '<img class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" src="https://cdn-icons.flaticon.com/svg/3917/3917158.svg?token=exp=1670467948~hmac=2f18f7118b556af438bb1d4438649f4a" width="20" height="20">';
							if(${loginUser ne null}){
								if(${ loginUser.memberId eq r.memberId }){
									str += '<ul class="dropdown-menu" style="text-align: center;">';
									str += '<li><a class="dropdown-item reReplyBtn" >댓글달기</a></li>';
									str += '<li><a class="dropdown-item updateReBtn" >수정</a></li>';
									str += '<li><a class="dropdown-item deleteReBtn" >삭제</a></li>';
									str += '<input type="hidden" value="'+ r.replyNo +'" id="replyNo">';
									str += '</ul>';
								}else{
									str += '<ul class="dropdown-menu" style="text-align: center;">';
									str += '<li><a class="dropdown-item" >답글달기</a></li>';
									str += '<li><a class="dropdown-item" >신고</a></li>';
									str += '</ul>';
								}
							}	
							
							str += '</div>';
							str += '</td>';
							str += '</tr>';
							str += '<tr style="font-size: 20px;">';
							str += '<td class="px-5 py-3" colspan="5">'+r.replyContent +'</td>';
							str += '</tr>';
							str += '</table>';
							
							console.log(str);
							
							reDiv.innerHTML += str;
						}
					},
					error: (data) => {
						console.log(data);
					}
				});
			});
			
			
			const deleteReply = document.getElementsByClassName('deleteReBtn');
			for(const d of deleteReply){
				console.log(d.nextElementSibling);
				d.addEventListener('click', function() {
					location.href = '${contextPath}/replyDelete.ma?rNo=' + d.nextElementSibling.value + '&bNo=' + ${mkBoard.boardNo};
				});
			}

			
		}
			
			
	</script>
	
</body>
</html>