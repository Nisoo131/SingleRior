<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${ contextPath }/resources/js/jquery-3.6.1.min.js"></script>
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
	</header>
		<div class="py-1 border-bottom fs-5" style="background-color: #008cd4; text-align: center;">
			<ul class="nav me-auto justify-content-center">
		        <li class="nav-item"><a href="${ contextPath }/commuAllList.co?commuType=1" class="nav-link px-5 mx-2" style="color: white;">생활팁</a></li>
		        <li class="nav-item"><a href="${ contextPath }/commuAllList.co?commuType=2" class="nav-link px-5 mx-2" style="color: white;">후기</a></li>
		        <li class="nav-item"><a href="${ contextPath }/commuAllList.co?commuType=3" class="nav-link px-5 mx-2" style="color: white;">자유</a></li>
		    </ul>
		</div>
	
	<main>
		<div class="container">
			<div class="col-md-1" style="text-align: center; padding-top: 100px;">
				<div class="row g-0 border rounded overflow-hidden flex-md-row shadow-sm h-md-250 position-relative mt-2 mb-4">
					<div class="col py-2 d-flex flex-column position-static">
						<table>
							<tr>
								<td><a href="${ contextPath }/commuAllList.co" class="nav-link link-dark"><img src="https://www.flaticon.com/svg/vstatic/svg/3916/3916912.svg?token=exp=1670460369~hmac=675d0b7c5b02f035ed8a059ae5814294" width="15" height="15"> 목록 보기</a></td>
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
							<c:if test="${ coBoard.commuType == 1 }">생활팁</c:if>
							<c:if test="${ coBoard.commuType == 2 }">후기</c:if>
							<c:if test="${ coBoard.commuType == 3 }">자유</c:if>
						</span>
						<input type="hidden" value="${ coBoard.boardNo }" name="boardNo">
						<input type="hidden" value="${ page }" name="page">
						<input type="hidden" value="${ coBoard.reportStatus }" id="reportStatus">
					</div>
					<table>
						<tr>
							<td class="fs-3 px-5 py-3" width="1100">${ coBoard.boardTitle }</td>
							<td width="20"><img src="https://cdn-icons.flaticon.com/svg/3916/3916586.svg?token=exp=1670462433~hmac=154ca1ce619f5c92644b4e20378081cd" width="20" height="20"></td>
							<td class="fs-5" style="text-align: center;" width="60" id="symptCount">${ coBoard.symptCount }</td>
							<td width="20"><img src="https://cdn-icons.flaticon.com/svg/3916/3916603.svg?token=exp=1670462662~hmac=f05590d1f51351a3e5542f67adfcb754" width="20" height="20"></td>
							<td class="fs-5" style="text-align: center;" width="60" id="replyCount">${ coBoard.replyCount }</td>
						</tr>
					</table>
					<!-- 프로필 -->
					<table>
						<tr>
							<td class="px-5" style="text-align: center;" width="40">
								<c:if test="${ profileAttm != null }">
									<img src="resources/uploadFiles/${ profileAttm.imgRename }" width="50" height="50" style="border-radius: 70%">
								</c:if>
								<c:if test="${ profileAttm == null }">
									<img src="${ contextPath }/resources/image/user.png" width="20" height="20">
								</c:if>
							</td>
							<td width="150">${ coBoard.nickName }</td>
							<td width="150">${ coBoard.createDate }</td>
							<td width="60">조회수</td>
							<td>${ coBoard.count }</td>
						</tr>
					</table>
					
					<div style="border-bottom: 1px solid #DCDCDC; padding-top: 10px;"></div>
					
					<!-- 본문 -->
					
					<!-- 이미지 파일 추가 -->
					<c:forEach items="${ list }" var="a">
						<c:if test="${ fn:containsIgnoreCase(a.imgRename, 'jpg') or fn:containsIgnoreCase(a.imgRename, 'png') }">
							<div class="container px-5 pt-5" style="width: 500px;">
								<div class="row">
									<div>
										<img src="${ contextPath }/resources/uploadFiles/${ a.imgRename }" width="100%" height="300">
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
						
					<div class="p-5" style="font-size: 20px;">
						<span>${ coBoard.boardContent }</span>
					</div>
					<div class="col-md-1" style="text-align: center; padding-top: 30px; padding-left: 50px; width: 170px;">
						<div class="row g-0 flex-md-row shadow-sm h-md-250 position-relative mt-2 mb-4">
							<c:if test="${ empty loginUser }">
								<button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#loginForm">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-emoji-smile" viewBox="0 0 16 16">
										<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
										<path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
									</svg>
									좋아요
								</button>
							</c:if>
							<c:if test="${ !empty loginUser && wishList == null }">
								<button type="button" class="btn btn-outline-danger symptClick">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-emoji-smile" viewBox="0 0 16 16">
										<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
										<path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
									</svg>
									좋아요
								</button>
							</c:if>
							<c:if test="${ !empty loginUser && wishList != null }">
								<button type="button" class="btn btn-outline-danger active symptClick">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-emoji-smile" viewBox="0 0 16 16">
										<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
										<path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
									</svg>
									좋아요
								</button>
							</c:if>
						</div>
					</div>
					
					<div style="border-bottom: 1px solid #DCDCDC; padding-top: 10px;"></div>
					
					<!-- 댓글 작성 -->
					<div class="px-5">
						<div class="input-group" style="padding-top: 50px;">
							<textarea class="form-control" rows="3" id="replyContent" style="resize: none;" placeholder="댓글을 작성해주세요."></textarea>
							<c:if test="${ empty loginUser }">
								<button class="btn btn-outline-primary btn-lg" data-bs-toggle="modal" data-bs-target="#loginForm" type="button" style="width: 100px;">등록</button>
							</c:if>
							<c:if test="${ !empty loginUser }">
								<button class="btn btn-outline-primary btn-lg" id="replySubmit" type="button" style="width: 100px;">등록</button>
							</c:if>
						</div>
						<div class="justify-content-center" style="padding-bottom: 50px; padding-right: 100px; color: #A9A9A9; text-align: right; font-size: 20px;">
							<span style="padding-right: 30px;">0 / 600</span>
							<label for="replySecret">비밀댓글</label>
							<input type="checkbox" id="replySecret" value="N">
						</div>
					</div>
					
					<!-- 댓글 목록 -->
					<div id="replyList">
						<!-- 댓글(reply) 출력 -->
						<c:forEach items="${ coRList }" var="r">
							<div class="px-5 replyCount">
								<table class="table" id="replyUpdateArea">
									<tr>
										<td style="text-align: center;" width="40"><img src="${ contextPath }/resources/image/user.png" width="20" height="20"></td>
										<td class="px-4 reNickName">${ r.nickName }</td>
										<td class="px-4">${ r.replyModifyDate }</td>
										<td width="850"></td>
										<td>
											<div class="dropdown">
												<img class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" src="${ contextPath }/resources/image/menu-dots.png" width="20" height="20">
												<ul class="dropdown-menu" style="text-align: center;">
													<c:if test="${ loginUser.memberId eq r.memberId }">
														<input type="hidden" value="${ r.replyNo }">
														<li class="reReplyBtn"><a class="dropdown-item">답글달기</a></li>
														<li class="replyUpdate"><a class="dropdown-item">수정</a></li>
														<li class="replyDelete"><a class="dropdown-item">삭제</a></li>
													</c:if>
													<c:if test="${ !(loginUser.memberId eq r.memberId) && !empty loginUser }">
														<li class="reReplyBtn"><a class="dropdown-item">답글달기</a></li>
														<li class="replyReport">
															<a class="dropdown-item">
																<input type="hidden" value="${ r.reportStatus }" class="r_reportStatus">
																<input type="hidden" class="replyNo" value="${ r.replyNo }">
																신고
															</a>
														</li>
													</c:if>
													<c:if test="${ empty loginUser }">
														<li><a class="dropdown-item reReplyBtn" data-bs-toggle="modal" data-bs-target="#loginForm">답글달기</a></li>
														<li><a class="dropdown-item replyReport" data-bs-toggle="modal" data-bs-target="#loginForm">신고</a></li>
													</c:if>
												</ul>
											</div>
										</td>
									</tr>
									<tr style="font-size: 20px;">
										<td class="px-5 py-3" colspan="5">
											<div class="input-group">
												<textarea style="width: 1000px; border: none; resize: none;" readonly>${ r.replyContent }</textarea>
												<input type="hidden" value="${ r.replyNo }">
											</div>
										</td>
									</tr>
								</table>
							</div>
						</c:forEach>
						
						<!-- 답글(reReply) 출력 -->
						<%-- <div class="px-5" style="padding-bottom: 50px; margin-left: 60px;">
							<table class="table">
								<tr>
									<td style="text-align: center;" width="40"><img src="${ contextPath }/resources/image/down-right.png" width="20" height="20">
									<td style="text-align: center;" width="40"><img src="${ contextPath }/resources/image/user.png" width="20" height="20"></td>
									<td class="px-4">닉네임</td>
									<td class="px-4">2022-12-15</td>
									<td width="750"></td>
									<td>
										<div class="dropdown">
											<img class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" src="${ contextPath }/resources/image/menu-dots.png" width="20" height="20">
											<ul class="dropdown-menu" style="text-align: center;">
												<c:if test="${ loginUser.memberId eq r.memberId }">
													<li><a class="dropdown-item" href="#">수정</a></li>
													<li><a class="dropdown-item" href="#">삭제</a></li>
												</c:if>
												<c:if test="${ !(loginUser.memberId eq r.memberId) }">
													<li><a class="dropdown-item" href="#">신고</a></li>
												</c:if>
											</ul>
										</div>
									</td>
								</tr>
								<tr style="font-size: 20px;">
									<td class="px-5 py-3" colspan="6">내용입니다요 내용내용 으아아아아아아내용입니다요 내용내용 으아아아아아아내용입니다요 내용내용 으아아아아아아내용입니다요 내용내용 으아아아아아아내용입니다요 내용내용 으아아아아아아</td>
								</tr>
							</table>
						</div> --%>
					</div>
					
					<div style="border-bottom: 1px solid #DCDCDC; padding-top: 10px;"></div>
					
					<!-- 이동 -->
					<div class="row px-5 py-4">
						<div class="col-md-1" style="text-align: center; width: 150px;">
							<button class="w-100 btn btn-outline-dark btn-lg" type="button" id="preForm" onclick="location.href='${contextPath}/selectCommuBoard.co?bNo=${ coBoard.boardNo - 1 }&writer=${ coBoard.nickName }'">이전글</button>
						</div>
						<div class="col-md-1" style="text-align: center; width: 150px;">
							<button class="w-100 btn btn-outline-dark btn-lg" type="button" id="nextForm" onclick="location.href='${contextPath}/selectCommuBoard.co?bNo=${ coBoard.boardNo + 1 }&writer=${ coBoard.nickName }'">다음글</button>
						</div>
						
						<c:if test="${ loginUser.memberId eq coBoard.writer }">
							<div class="col-md-10" style="width: 700px;"></div>
							<div class="col-md-1" style="text-align: center; width: 100px;">
								<button class="w-100 btn btn-outline-primary btn-lg" type="button" id="updateForm">수정</button>
							</div>
							<div class="col-md-1" style="text-align: center; width: 100px;">
								<button class="w-100 btn btn-outline-secondary btn-lg" type="button" data-bs-toggle="modal" data-bs-target="#deleteForm">삭제</button>
							</div>
						</c:if>
						<c:if test="${ !(loginUser.memberId eq coBoard.writer) && !empty loginUser }">
							<div class="col-md-10" style="width: 800px;"></div>
							<div class="col-md-1" style="text-align: center; width: 100px; float: right;">
								<button class="w-100 btn btn-outline-danger btn-lg reportBtn" type="button">신고</button>
							</div>
						</c:if>
						<c:if test="${ empty loginUser }">
							<div class="col-md-10" style="width: 800px;"></div>
							<div class="col-md-1" style="text-align: center; width: 100px; float: right;">
								<button class="w-100 btn btn-outline-danger btn-lg" type="button" data-bs-toggle="modal" data-bs-target="#loginForm">신고</button>
							</div>
						</c:if>
					</div>
				</form>
			</div>
		</div>
	</main>
	
	<!-- 삭제 모달 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="deleteForm">
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
	
	<!-- 로그인 모달 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="loginForm">
		<div class="modal-dialog" role="document">
	    	<div class="modal-content rounded-3 shadow">
	      		<div class="modal-body p-4 text-center">
	        		<h3 class="mb-0">로그인 후에 이용하실 수 있는 서비스입니다.</h3>
	        		<p class="mb-0">로그인 페이지로 이동합니다.</p>
	      		</div>
	      		<div class="modal-footer flex-nowrap p-0">
	      			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" data-bs-dismiss="modal">취소</button>
	        		<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" id="yes" onclick="location.href='${ contextPath }/loginView.me'">
	        			<strong>확인</strong>
	        		</button>
	      		</div>
	    	</div>
	  	</div>
	</div>
	
	<!-- 신고 모달 (default: B) -->
	<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel"><img src="https://cdn-icons-png.flaticon.com/512/2689/2689919.png" style="width: 40px; height: 40px;">REPORT</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<h3>신고 사유를 선택해주세요!</h3>
					<span id="reportNickName">작성자 : ${ coBoard.nickName } </span>
					<br>
					<span id="reportContent">글제목 : ${ coBoard.boardTitle } </span>
					<br><br>
					<form action="${ contextPath }/commuReport.co">
						<div class="form-check">
							<input name="reportType" class="form-check-input" type="checkbox" value="홍보도배">
							<input type="hidden" id="contentNo" name="contentNo" value="${ coBoard.boardNo }">
							<input type="hidden" id="reportCate" name="reportCate" value="B">
							<label class="form-check-label">홍보/도배글이에요</label>
						</div>
						<div class="form-check">
							<input name="reportType" class="form-check-input" type="checkbox" value="유해내용">
							<label class="form-check-label">청소년에게 유해한 내용이에요</label>
						</div>
						<div class="form-check">
							<input name="reportType" class="form-check-input" type="checkbox" value="불법">
							<label class="form-check-label">불법이에요</label>
						</div>
						<div class="form-check">
							<input name="reportType" class="form-check-input" type="checkbox" value="욕설혐오차별">
							<label class="form-check-label">욕설,혐오,차별적표현이에요</label>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							<button class="btn btn-primary">신고하기</button>
							<input type="hidden" name="boardNo" value="${ coBoard.boardNo }">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>
	
	<script>
		// 공감 (좋아요) 구현
		$(".symptClick").click(function(){
			if($(this).attr("class") == "btn btn-outline-danger symptClick"){
				$.ajax({
					url: '${contextPath}/symptOn.co',
					data: {boardNo: ${ coBoard.boardNo }},
					type: 'post',
					success:(data)=>{
						console.log(data);
						var symptCount = parseInt($('#symptCount').html());
						console.log(symptCount);
						$('#symptCount').html(symptCount + data);
					},
					error: (data)=>{
						console.log(data);
					}
				});
				
				$(this).attr("class","btn btn-outline-danger active symptClick");
			} else if($(this).attr("class") == "btn btn-outline-danger active symptClick"){
				$.ajax({
					url: '${contextPath}/symptOff.co',
					data: {boardNo: ${ coBoard.boardNo }},
					type: 'post',
					success:(data)=>{
						console.log(data);
						var symptCount = parseInt($('#symptCount').html());
						console.log(symptCount);
						$('#symptCount').html(symptCount - data);
					},
					error: (data)=>{
						console.log(data);
					}
				});
				
				$(this).attr("class","btn btn-outline-danger symptClick");
			}
		})
		
		// 댓글 insert
		$(document).on('click', "#replySubmit", function(){
			if(document.getElementById('replySecret').checked){
				document.getElementById('replySecret').value = 'Y';
			}
			
			$.ajax({
				url: '${contextPath}/insertReply.co',
				data: {replyContent:document.getElementById('replyContent').value,
						replySecret:document.getElementById('replySecret').value,
						boardNo:'${coBoard.boardNo}', memberId:'${loginUser.memberId}'},
				success: function(data){
					console.log(data);
					
					var listHtml = "";
					var replyCount = data.length;
					
					for(const i in data){
						listHtml += "<div class='px-5 replyCount'>";
						listHtml += '<table class="table" id="replyUpdateArea">';
						listHtml += "<tr>";
						listHtml += "<td style='text-align: center;' width='40'><img src='${ contextPath }/resources/image/user.png' width='20' height='20'></td>";
						listHtml += '<td class="px-4 reNickName">' + data[i].nickName + "</td>";
						listHtml += "<td class='px-4'>" + data[i].replyModifyDate + "</td>";
						listHtml += "<td width='850'></td>";
						listHtml += "<td>";
						listHtml += "<div class='dropdown'>";
						listHtml += "<img class='dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false' src='${ contextPath }/resources/image/menu-dots.png' width='20' height='20'>";
						if('${ loginUser.memberId }' == data[i].memberId){
							listHtml += "<ul class='dropdown-menu' style='text-align: center;'>";
							listHtml += '<input type="hidden" value="' + data[i].replyNo + '">';
							listHtml += '<li class="reReplyBtn"><a class="dropdown-item">답글달기</a></li>';
							listHtml += '<li class="replyUpdate"><a class="dropdown-item">수정</a></li>';
							listHtml += '<li class="replyDelete"><a class="dropdown-item">삭제</a></li>';
							listHtml += "</ul>";
						} else if (!('${ loginUser.memberId }' == data[i].memberId) && '${loginUser}' != null) {
							listHtml += "<ul class='dropdown-menu' style='text-align: center;'>";
							listHtml += '<li class="reReplyBtn"><a class="dropdown-item">답글달기</a></li>';
							listHtml += '<li class="replyReport">';
							listHtml += '<a class="dropdown-item">';
							listHtml += '<input type="hidden" value="' + data[i].reportStatus + '" class="r_reportStatus">';
							listHtml += '<input type="hidden" class="replyNo" value="' + data[i].replyNo + '">';
							listHtml += '신고';
							listHtml += '</a>';
							listHtml += '</ul>';
						} else if('${loginUser}' == null){
							listHtml += "<ul class='dropdown-menu' style='text-align: center;'>";
							listHtml += '<li><a class="dropdown-item reReplyBtn" data-bs-toggle="modal" data-bs-target="#loginForm">답글달기</a></li>';
							listHtml += '<li><a class="dropdown-item replyReport" data-bs-toggle="modal" data-bs-target="#loginForm">신고</a></li>';
							listHtml += '</ul>';
						}
						listHtml += "</div>";
						listHtml += "</td>";
						listHtml += "</tr>";
						listHtml += "<tr style='font-size: 20px;'>";
						listHtml += "<td class='px-5 py-3' colspan='5'>";
						listHtml += "<div class='input-group'>";
						listHtml += "<textarea style='width: 1000px; border: none; resize: none;' readonly>" + data[i].replyContent + "</textarea>";
						listHtml += '<input type="hidden" value="' + data[i].replyNo + '">';
						listHtml += "</div>";
						listHtml += "</td>";
						listHtml += "</tr>";
						listHtml += "</table>";
						listHtml += "</div>";
					}
					
					$("#replyCount").html(replyCount);
					$("#replyList").html(listHtml);
					$("#replyContent").val("");
					$("#replySecret").prop("checked", false);
					document.getElementById('replySecret').value = 'N';
				},
				error: (data)=>{
					console.log(data);
				}
			});
		});
		
		// 댓글 수정 (update)
		$(document).on('click', ".replyUpdate", function(){
			const textArea = this.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.querySelector('textarea');
			
			textArea.removeAttribute('readonly');
			textArea.style.border = "1px solid";
			textArea.focus();
			textArea.parentNode.innerHTML += '<button type="button" class="btn btn-outline-primary btn-lg reUpdateSubmit" style="width: 100px;">등록</button><span>비밀댓글&nbsp;&nbsp;<input type="checkbox" class="replyUpateSecret" value="N"></span>';
			
			const btn = this.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.querySelector('button');
			const $upBtn = $(this);
			
			$upBtn.css('display', 'none');
			
			btn.addEventListener('click', function () {
				if(this.parentNode.querySelector('input[type="checkbox"]').checked){
					this.parentNode.querySelector('input[type="checkbox"]').value = 'Y';
				}
				
				const replyNo =  this.parentNode.querySelector('input[type="hidden"]').value;
				const replySecret = this.parentNode.querySelector('input[type="checkbox"]').value;
				const replyContent = this.parentNode.querySelector('textarea').value;
				
				$.ajax({
					url: '${contextPath}/updateReply.co',
					data: {replyNo:replyNo,
						replyContent:replyContent,
						replySecret:replySecret,
						boardNo:'${coBoard.boardNo}'},
					type: 'post',
					success:(data)=>{
						var listHtml = "";
						
						for(const i in data){
							listHtml += "<div class='px-5 replyCount'>";
							listHtml += '<table class="table" id="replyUpdateArea">';
							listHtml += "<tr>";
							listHtml += "<td style='text-align: center;' width='40'><img src='${ contextPath }/resources/image/user.png' width='20' height='20'></td>";
							listHtml += '<td class="px-4 reNickName">' + data[i].nickName + "</td>";
							listHtml += "<td class='px-4'>" + data[i].replyModifyDate + "</td>";
							listHtml += "<td width='850'></td>";
							listHtml += "<td>";
							listHtml += "<div class='dropdown'>";
							listHtml += "<img class='dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false' src='${ contextPath }/resources/image/menu-dots.png' width='20' height='20'>";
							if('${ loginUser.memberId }' == data[i].memberId){
								listHtml += "<ul class='dropdown-menu' style='text-align: center;'>";
								listHtml += '<input type="hidden" value="' + data[i].replyNo + '">';
								listHtml += '<li class="reReplyBtn"><a class="dropdown-item">답글달기</a></li>';
								listHtml += '<li class="replyUpdate"><a class="dropdown-item">수정</a></li>';
								listHtml += '<li class="replyDelete"><a class="dropdown-item">삭제</a></li>';
								listHtml += "</ul>";
							} else if (!('${ loginUser.memberId }' == data[i].memberId) && '${loginUser}' != null) {
								listHtml += "<ul class='dropdown-menu' style='text-align: center;'>";
								listHtml += '<li class="reReplyBtn"><a class="dropdown-item">답글달기</a></li>';
								listHtml += '<li class="replyReport">';
								listHtml += '<a class="dropdown-item">';
								listHtml += '<input type="hidden" value="' + data[i].reportStatus + '" class="r_reportStatus">';
								listHtml += '<input type="hidden" class="replyNo" value="' + data[i].replyNo + '">';
								listHtml += '신고';
								listHtml += '</a>';
								listHtml += '</ul>';
							} else if('${loginUser}' == null){
								listHtml += "<ul class='dropdown-menu' style='text-align: center;'>";
								listHtml += '<li><a class="dropdown-item reReplyBtn" data-bs-toggle="modal" data-bs-target="#loginForm">답글달기</a></li>';
								listHtml += '<li><a class="dropdown-item replyReport" data-bs-toggle="modal" data-bs-target="#loginForm">신고</a></li>';
								listHtml += '</ul>';
							}
							listHtml += "</div>";
							listHtml += "</td>";
							listHtml += "</tr>";
							listHtml += "<tr style='font-size: 20px;'>";
							listHtml += "<td class='px-5 py-3' colspan='5'>";
							listHtml += "<div class='input-group'>";
							listHtml += "<textarea style='width: 1000px; border: none; resize: none;' readonly>" + data[i].replyContent + "</textarea>";
							listHtml += '<input type="hidden" value="' + data[i].replyNo + '">';
							listHtml += "</div>";
							listHtml += "</td>";
							listHtml += "</tr>";
							listHtml += "</table>";
							listHtml += "</div>";
						}
						$("#replyList").html(listHtml);
					},
					error: (data)=>{
						console.log(data);
					}
				});
			});
		});
		
		// 댓글 삭제 (delete)
		$(document).on('click', ".replyDelete", function(){
			console.log(this.parentNode.querySelector('input').value);
			var replyNo = this.parentNode.querySelector('input').value;
			
			$.ajax({
				url: '${contextPath}/deleteReply.co',
				data: {replyNo:replyNo,
					boardNo:'${coBoard.boardNo}', memberId:'${loginUser.memberId}'},
				success: function(data){
					console.log(data);
					
					var listHtml = "";
					var replyCount = data.length;
					
					for(const i in data){
						listHtml += "<div class='px-5 replyCount'>";
						listHtml += '<table class="table" id="replyUpdateArea">';
						listHtml += "<tr>";
						listHtml += "<td style='text-align: center;' width='40'><img src='${ contextPath }/resources/image/user.png' width='20' height='20'></td>";
						listHtml += '<td class="px-4 reNickName">' + data[i].nickName + "</td>";
						listHtml += "<td class='px-4'>" + data[i].replyModifyDate + "</td>";
						listHtml += "<td width='850'></td>";
						listHtml += "<td>";
						listHtml += "<div class='dropdown'>";
						listHtml += "<img class='dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false' src='${ contextPath }/resources/image/menu-dots.png' width='20' height='20'>";
						if('${ loginUser.memberId }' == data[i].memberId){
							listHtml += "<ul class='dropdown-menu' style='text-align: center;'>";
							listHtml += '<input type="hidden" value="' + data[i].replyNo + '">';
							listHtml += '<li class="reReplyBtn"><a class="dropdown-item">답글달기</a></li>';
							listHtml += '<li class="replyUpdate"><a class="dropdown-item">수정</a></li>';
							listHtml += '<li class="replyDelete"><a class="dropdown-item">삭제</a></li>';
							listHtml += "</ul>";
						} else if (!('${ loginUser.memberId }' == data[i].memberId) && '${loginUser}' != null) {
							listHtml += "<ul class='dropdown-menu' style='text-align: center;'>";
							listHtml += '<li class="reReplyBtn"><a class="dropdown-item">답글달기</a></li>';
							listHtml += '<li class="replyReport">';
							listHtml += '<a class="dropdown-item">';
							listHtml += '<input type="hidden" value="' + data[i].reportStatus + '" class="r_reportStatus">';
							listHtml += '<input type="hidden" class="replyNo" value="' + data[i].replyNo + '">';
							listHtml += '신고';
							listHtml += '</a>';
							listHtml += '</ul>';
						} else if('${loginUser}' == null){
							listHtml += "<ul class='dropdown-menu' style='text-align: center;'>";
							listHtml += '<li><a class="dropdown-item reReplyBtn" data-bs-toggle="modal" data-bs-target="#loginForm">답글달기</a></li>';
							listHtml += '<li><a class="dropdown-item replyReport" data-bs-toggle="modal" data-bs-target="#loginForm">신고</a></li>';
							listHtml += '</ul>';
						}
						listHtml += "</div>";
						listHtml += "</td>";
						listHtml += "</tr>";
						listHtml += "<tr style='font-size: 20px;'>";
						listHtml += "<td class='px-5 py-3' colspan='5'>";
						listHtml += "<div class='input-group'>";
						listHtml += "<textarea style='width: 100%; border: none; resize: none;' readonly>" + data[i].replyContent + "</textarea>";
						listHtml += '<input type="hidden" value="' + data[i].replyNo + '">';
						listHtml += "</div>";
						listHtml += "</td>";
						listHtml += "</tr>";
						listHtml += "</table>";
						listHtml += "</div>";
					}
					
					$("#replyCount").html(replyCount);
					$("#replyList").html(listHtml);
				},
				error: (data)=>{
					console.log(data);
				}
			});
		});
		
		// 글 edit 페이지로 넘어가기 (update)
		const upd = document.getElementById('updateForm');
		const form = document.getElementById('detailForm');
		if(upd != null){
			upd.addEventListener('click', () => {
				form.action = '${contextPath}/updateForm.co';
				form.submit();
			});
		}
		
		// 글 삭제 (delete)
		document.getElementById("delete").addEventListener('click', ()=>{
			form.action = '${contextPath}/deleteCommuBoard.co';
			form.submit();
		});
		
		// 글 신고 여부 확인 + 신고 모달 출력
		$(document).on('click', ".reportBtn", function(){
			if($('#reportStatus').val() == 'Y'){
				alert("이미 신고된 게시글 입니다.");
			} else {
				$('#reportModal').modal('show');	
			}
		});
		
		// 댓글 신고 시 댓글 신고 여부 확인 + 신고 모달 내용 변경 (R)
		$(document).on('click', ".replyReport", function(){
			if(this.querySelector('input').value == 'Y'){
				alert("이미 신고된 댓글 입니다.");
			} else {
				$("#reportContent").text("댓글내용 : " + this.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.querySelector('textarea').value);
				$("#reportNickName").text("작성자 : " + this.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.querySelector('.reNickName').innerText);
				$("#contentNo").val(this.parentNode.querySelector('.replyNo').value);
				$("#reportCate").val('R');
				$('#reportModal').modal('show');
			}
		});
	</script>
</body>
</html>