<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
	
	li{
  list-style-type: none;
	}
	
	/* 보여줄 구간의 높이와 넓이 설정 */
	#slideShow{
	  width: 500px;
	  height: 300px;
	  position: relative;
	  margin: 50px auto;
	  overflow: hidden;   
	  /*리스트 형식으로 이미지를 일렬로 
	  정렬할 것이기 때문에, 500px 밖으로 튀어 나간 이미지들은
	  hidden으로 숨겨줘야됨*/
	}
	
	
	.slides{
	  position: absolute;
	  left: 0;
	  top: 0;
	  width: 2500px; /* 슬라이드할 사진과 마진 총 넓이 */
	  transition: left 0.5s ease-out; 
	  /*ease-out: 처음에는 느렸다가 점점 빨라짐*/
	}
	
	/* 첫 번째 슬라이드 가운데에 정렬하기위해
	첫번째 슬라이드만 margin-left조정 */
	.slides li:first-child{
	  margin-left: 75px;
	}
	
	/* 슬라이드들 옆으로 정렬 */
	.slides li:not(:last-child){
	  float: left;
	  margin-right: 120px;
	}
	
	.slides li{
	  float: left;
	}
	
	.controller span{
	  position:absolute;
	  background-color: transparent;
	  color: black;
	  text-align: center;
	  border-radius: 50%;
	  padding: 10px 20px;
	  top: 50%;
	  font-size: 1.3em;
	  cursor: pointer;
	}
	
	/* 이전, 다음 화살표에 마우스 커서가 올라가 있을때 */
	.controller span:hover{
	  background-color: rgba(128, 128, 128, 0.11);
	}
	
	.prev{
	  left: 10px;
	}
	
	/* 이전 화살표에 마우스 커서가 올라가 있을때 
	이전 화살표가 살짝 왼쪽으로 이동하는 효과*/
	.prev:hover{
	  transform: translateX(-10px);
	}
	
	.next{
	  right: 10px;
	}
	
	/* 다음 화살표에 마우스 커서가 올라가 있을때 
	이전 화살표가 살짝 오른쪽으로 이동하는 효과*/
	.next:hover{
	  transform: translateX(10px);
	}
	
	
	.img{
    width: auto;
    border-radius: 10px;
    cursor: pointer;
    transition: 0.3s;
  }
  /* 이미지 클릭 시, 밝기 조절 */
  .img:hover {opacity: 0.8;}

  .modal {
    display: none; /* 모달창 숨겨 놓기 */
    position: fixed; 
    z-index: 1; /* 모달창을 제일 앞에 두기 */
    padding-top: 100px;
    left: 0; top: 0;
    width: 100%; height: 100%;
    overflow: auto; /* 스크롤 허용 auto */
    cursor: pointer; /* 마우스 손가락모양 */
    background-color: rgba(0, 0, 0, 0.8);
  }
  /* 모달창 이미지 */
  .modal_content {
    margin: auto;
    display: block;
    width: 50%; height: auto;
    max-width: 1000px;
    border-radius: 10px;
    animation-name: zoom;
    animation-duration: 0.8s;
  }
  /* 모달창 애니메이션 추가 */
  @keyframes zoom {
    from {transform: scale(0)}
    to {transform: scale(1)}
  }
  /* 닫기 버튼 꾸미기 */
  .close {
    position: absolute;
    top: 15px;
    right: 35px;
    color: #f1f1f1;
    font-size: 40px;
    font-weight: bold;
    transition: 0.3s;
  }
  .close:hover, .close:focus{
    color: #bbb;
    text-decoration: none;
    cursor: pointer;
  }
</style>
</head>
<body>
	<header class="sticky-top">
		<div>
			<jsp:include page="../common/top.jsp"/>
		</div>
		
		<div class="py-1 border-bottom fs-5" style="background-color: #008cd4; text-align: center;">
			<ul class="nav justify-content-center">
				<li class="nav-item"><a style="color: white;" class="nav-link active" href="marketNotiBoardList.ma?marketType=3&marketArray=${marketArray}&searchType=${searchType}&marketSear">공지</a></li>
				<li class="nav-item"><a style="color: white;" class="nav-link active" aria-current="page" href="marketBoardList.ma?marketType=1">같이사요</a></li>
				<li class="nav-item"><a style="color: white;" class="nav-link active" href="marketBoardList.ma?marketType=2">팝니다</a></li>
				<li class="nav-item"><a style="color: white;" class="nav-link active" href="marketBoardList.ma?marketType=3">삽니다</a></li>
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
								<td><a href="javascript:history.back();" class="nav-link link-dark"><img src="https://www.flaticon.com/svg/vstatic/svg/3916/3916912.svg?token=exp=1670460369~hmac=675d0b7c5b02f035ed8a059ae5814294" width="15" height="15">목록 보기</a></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			
			<div class="col-12 border rounded overflow-hidden">
				<form class="needs-validation" method="POST" id="detailForm">
					<!-- 헤더 -->
					<a id="btnKakao" onclick="kakaoShare()" class="kakaotalk" target="_self" title="카카오톡 새창열림"><img alt="" src="https://cdn-icons-png.flaticon.com/512/8301/8301971.png" style="width: 40px; height: 40px; float: right; margin-right: 20px; margin-top: 10px;"></a>
					
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
							<td width="20"><img src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png" width="20" height="20"></td>
							<td class="fs-5" style="text-align: center;" width="60" id="likeCount">${ mkBoard.likeCount }</td>
							<td width="20"><img src="https://cdn-icons-png.flaticon.com/512/7789/7789458.png" width="20" height="20"></td>
							<td class="fs-5" style="text-align: center;" width="60" id="replyCount" >${ mkBoard.replyCount }</td>
						</tr>
					</table>
					<span class="px-5" width="200">${ mkBoard.createDate }</span>
					<span style="float: right; padding-right: 12px;">조회수 ${ mkBoard.count }</span>
					
					<div style="border-bottom: 1px solid #DCDCDC; padding-top: 10px;"></div>
					
					<!-- 본문 -->
					<div class="p-5" style="font-size: 20px;">
						<span>${ mkBoard.boardContent }</span>
					</div>
					
				<!-- 이미지 모달창 -->
				<div class="modal">
  					<span class="close" >&times;</span>
  					<img class="modal_content">
				</div>
				
				<!-- 첨부파일 -->
				<c:if test="${!empty mkAList}">
				<div id="slideShow">
				    <ul class="slides">
				    	<c:forEach items="${mkAList}" var="mkA">
				      	<li ><img class="img" src="resources/uploadFiles/${ mkA.imgRename}" alt="" style="width: 280px; height: 280px; "></li>
				    	</c:forEach>
				    </ul>  
				    <p class="controller">
				      <span class="prev">&lang;</span>  
				      <span class="next">&rang;</span>
				    </p>
				 </div>
				<script src="JS/slideShow.js"></script>
				</c:if>	

				<!-- 지도영역  -->
				<c:if test="${mkBoard.location ne null }">
					
					<div id="map" class="mx-auto" style=" width:300px;height:200px;"></div>
					<br>
					<div id="myLocation" class="mx-auto" style="width:230px; text-align:center; border-radius:2em;padding: 20px; "><img style="width: 30px; height: 30px;" alt="" src="resources/image/pick.png">&nbsp;&nbsp;내 위치 확인하기</div>
					<div id="tranLocation" class="mx-auto" style="width:230px; text-align:center; border-radius:2em; padding: 20px; display: none;"><img style="width: 30px; height: 30px;" alt="" src="resources/image/pick.png">&nbsp;&nbsp;직거래 위치 확인하기 </div>
					<div class="mx-auto" style="text-align:center; background: #D9E5FF; border-radius:2em; padding: 20px; width: 650px;"  >${mkBoard.nickName}님은  ${mkBoard.location }에서 직거래하하고 싶어해요!</div>
				</c:if>		
									
				<div class="col-md-1" style="text-align: center; padding-top: 30px; padding-left: 50px; width: 170px;">
	                  <div class="row g-0 flex-md-row shadow-sm h-md-250 position-relative mt-2 mb-4">
	                     <c:if test="${ empty loginUser }">
	                        <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#loginForm">
							<img alt="" src="https://cdn-icons-png.flaticon.com/512/3945/3945691.png" style="width: 20px; height: 20px;">
	                           좋아요
	                        </button>
	                     </c:if>
	                     <c:if test="${ !empty loginUser && wishList == null }">
	                        <button type="button" class="btn btn-outline-danger symptClick">
	                   		<img alt="" src="https://cdn-icons-png.flaticon.com/512/3945/3945691.png" style="width: 20px; height: 20px;">
	                           좋아요
	                        </button>
	                     </c:if>
	                     <c:if test="${ !empty loginUser && wishList != null }">
	                        <button type="button" class="btn btn-outline-danger active symptClick">
	                        <img alt="" src="https://cdn-icons-png.flaticon.com/512/3945/3945691.png" style="width: 20px; height: 20px;">
	                           좋아요
	                        </button>
	                     </c:if>
	                  </div>
	               </div> 	
			  	
				<div style="padding-top: 10px; "></div>
					<!-- 프로필 -->
					<div class="col-12" style="background: #D9E5FF; border-radius:2em; padding: 20px; " >
						<table style="width: 100%">
							<tr>
								<td style="width: 80px;" rowspan="2">
									<c:if test="${ mkBoard.profileImg!=null}">
										<img src="resources/uploadFiles/${ mkBoard.profileImg }"  style="width: 90px; height: 90px; border-radius: 70%">
									</c:if>
									<c:if test="${ mkBoard.profileImg==null}">
										<img src="${ contextPath }/resources/image/userProfile.png" style="width: 90px; height: 90px;  border-radius: 70%">
									</c:if>
								</td>
								<td >
									<span class=" dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 25px;" >&nbsp;&nbsp;${ mkBoard.nickName }</span>
									<ul class="dropdown-menu" style="text-align: center;">
										<li><a class="dropdown-item sendMsg">쪽지보내기</a></li>
									</ul>
								</td>									
								<td rowspan="2" style="float: right; margin-right: 12px; "><img src="${ contextPath }/resources/image/report.png" style="width: 60px; height: 60px; " id="reportBtn"></td>
								</tr>
							<tr>
								<td>&nbsp;&nbsp;
								<c:set value="${ fn:split(mkBoard.address,' ') }" var="address" />
									<span>
										<c:forEach items="${address}" var="a" begin='0' end='1'>
										${a}
										</c:forEach>
									</span>
								</td>
								<td style="float: right; margin-right: 12px; ">신고하기&nbsp;</td>
							</tr>
						</table>
					</div>&nbsp;
					
					<div style=" padding-top: 10px;"></div>
					
					<!-- 댓글작성 -->
					<div class="px-5">
						<div class="input-group" style="padding-top: 50px;" >
							<textarea class="form-control" rows="3" id="replyContent" style="resize: none;" placeholder="댓글을 작성해주세요."></textarea>
							<c:if test="${ !empty loginUser }">
								<button class="btn btn-outline-primary btn-lg" id="replySubmit" type="button" style="width: 100px;">등록</button>
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
						<c:forEach items="${mkRList}" var="r">
							<c:if test="${ r.replyNo == r.groupNo}">
							<table class="table replyTable">
								<tr>
								<c:if test="${ r.profileImg eq null}">
									<td style="text-align: center;" width="40"><img src="resources/image/userProfile.png" width="50" height="50" style="border-radius: 70%"></td>
								</c:if>
								<c:if test="${ r.profileImg ne null}">
									<td style="text-align: center;" width="40"><img src="resources/uploadFiles/${ r.profileImg }" width="50" height="50" style="border-radius: 70%"></td>
								</c:if>	
									<td width="150px;  class="reNickName">
										<span class=" dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">${r.nickName}</span>
										<ul class="dropdown-menu" style="text-align: center;">
											<li><a class="dropdown-item sendMsg" >쪽지보내기</a></li>
										</ul>
									</td>
									<td width="150px;">${r.replyModifyDate}</td>
									<td width="850px;"></td>
									<td>
										<div class="dropdown">
											<img class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" src="resources/image/menu-dots.png" width="20" height="20">
											<ul class="dropdown-menu" style="text-align: center;">
												<c:if test="${ loginUser.memberId eq r.memberId }">
													<li class="reReplyBtn"><a class="dropdown-item">답글달기</a></li>
													<li class="updateReBtn"><a class="dropdown-item">수정</a></li>
													<li class="deleteReBtn"><a class="dropdown-item ">삭제</a><input type="hidden" id="replyNo" class="replyNo" value="${ r.replyNo }"></li>
												</c:if>
												<c:if test="${ !(loginUser.memberId eq r.memberId) }">
													<li class="reReplyBtn"><a class="dropdown-item" >답글달기</a></li>
													<li class="reReportBtn"><input type="hidden" class="reportReplyNo" value="${ r.replyNo }"><input type="hidden" class="reportStatus" value="${ r.reportStatus }"><a class="dropdown-item" >신고</a></li>
												</c:if>
											</ul>
										</div>
									</td>
								</tr>
								<tr style="font-size: 20px;">
									<td class="px-5 py-3 " colspan="5">
										<div class="input-group replyContentArea" >
										<c:if test="${r.replySecret == 'Y' and (loginUser.memberId eq r.memberId  or loginUser.memberId eq mkBoard.writer or loginUser.memberAuthority eq 'Y')}">
											<textarea readonly class="reContent" style="width: 1000px; border: none; resize: none;">${r.replyContent }</textarea>
										</c:if>
										<c:if test="${r.replySecret == 'N' }">
											<textarea readonly class="reContent" style="width: 1000px; border: none; resize: none;">${r.replyContent }</textarea>
										</c:if>
										<c:if test="${r.replySecret == 'Y' and loginUser.memberId ne r.memberId and loginUser.memberId ne mkBoard.writer and loginUser.memberAuthority eq 'N'}">
											<textarea readonly style="width: 1000px; border: none; resize: none;">비밀 댓글입니다.</textarea>
										</c:if>
										<c:if test="${r.replySecret == 'Y' and loginUser eq null}">
											<textarea readonly style="width: 1000px; border: none; resize: none;">비밀 댓글입니다.</textarea>
										</c:if>
										<input type="hidden"  value="${ r.replyNo }">
										</div>
									</td>
								</tr>
							</table>
						</c:if>
						
						<!-- 대댓글창 -->
						<c:if test="${!empty loginUser }">
							<table class="table table-borderless p-5 reReplyInput" style="display: none;" >
		                    	<tr>
		                        	<td width="1em">
		                           		<img src="https://cdn-icons-png.flaticon.com/512/9058/9058850.png" width="20" height="20">
		                       		</td>
		                        	<td >
		                           		<input type="hidden" name="replyNo" value="${r.replyNo}">
		                           		<div class="input-group" >
		                           			<textarea  style="width: 1000px; border: none; resize: none;"></textarea>
											<button class="btn btn-outline-primary btn-lg reReplySubmit" type="button" style="width: 100px;">등록</button>
											<br>&nbsp;
											<label for="replySecret">비밀댓글</label>&nbsp;&nbsp;<input type="checkbox" class="reReplySecret" value="N">	
										</div>
		                        	</td>
		                     	</tr>
		                 	</table>
		                 </c:if>
					
					<!-- 대댓글 -->
					<c:forEach items="${mkRList}" var="rr">
					
					<c:if test="${ r.replyNo == rr.groupNo}">
					<c:if test="${ rr.replyNo != rr.groupNo}">
					<div class="px-5" style="padding-bottom: 20px; margin-left: 10px;" id="reReplyDiv">
						<table class="table">
							<tr>
								<td style="text-align: center;" width="40"><img src="https://cdn-icons-png.flaticon.com/512/9058/9058850.png" width="18" height="20">
								<c:if test="${ rr.profileImg eq null}">
									<td style="text-align: center;" width="40"><img src="resources/image/userProfile.png" width="50" height="50" style="border-radius: 70%"></td>
								</c:if>
								<c:if test="${ rr.profileImg ne null}">
									<td style="text-align: center;" width="40"><img src="resources/uploadFiles/${ rr.profileImg }" width="50" height="50" style="border-radius: 70%"></td>
								</c:if>	
								<td class="px-4"  style="width: 150px;">
									<span class=" dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">${rr.nickName}</span>
									<ul class="dropdown-menu" style="text-align: center;">
										<li><a class="dropdown-item sendMsg" >쪽지보내기</a></li>
									</ul>
								</td>
								<td class="px-4" style="width: 150px;">${rr.replyModifyDate}</td>
								<td width="750"></td>
								<td>
									<div class="dropdown">
										<img class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" src="resources/image/menu-dots.png" width="20" height="20">
										<ul class="dropdown-menu" style="text-align: center;">
											<c:if test="${ loginUser.memberId eq rr.memberId }">
												<li class="updateReBtn"><a class="dropdown-item" >수정</a></li>
												<li class="deleteReBtn"><a class="dropdown-item" >삭제</a><input type="hidden" id="replyNo" class="replyNo" value="${ rr.replyNo }"></li>
											</c:if>
											<c:if test="${ !(loginUser.memberId eq rr.memberId) }">
												<li class="reReportBtn"><input type="hidden" class="reportReplyNo" value="${ rr.replyNo }"><input type="hidden" class="reportStatus" value="${ rr.reportStatus }"><a class="dropdown-item" >신고</a></li>
											</c:if>
										</ul>
									</div>
								</td>
							</tr>
							<tr style="font-size: 20px;">
								<td class="px-5 py-3 " colspan="5">
										<div class="input-group replyContentArea" >
										<c:if test="${rr.replySecret == 'Y' and (loginUser.memberId eq rr.memberId  or loginUser.memberId eq mkBoard.writer or loginUser.memberAuthority eq 'Y')}">
											<textarea readonly class="reContent" style="width: 1000px; border: none; resize: none;">${rr.replyContent }</textarea>
										</c:if>
										<c:if test="${rr.replySecret == 'N' }">
											<textarea readonly class="reContent" style="width: 1000px; border: none; resize: none;">${rr.replyContent }</textarea>
										</c:if>
										<c:if test="${rr.replySecret == 'Y' and loginUser.memberId ne rr.memberId and loginUser.memberId ne mkBoard.writer and loginUser.memberAuthority eq 'N'}">
											<textarea readonly style="width: 1000px; border: none; resize: none;">비밀 댓글입니다.</textarea>
										</c:if>
										<c:if test="${rr.replySecret == 'Y' and loginUser eq null}">
											<textarea readonly style="width: 1000px; border: none; resize: none;">비밀 댓글입니다.</textarea>
										</c:if>
										<input type="hidden"  value="${ rr.replyNo }">
										</div>
									</td>
							</tr>
						</table>
					</div>
					</c:if>
					</c:if>
					</c:forEach>
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
						
						<c:if test="${ loginUser.memberId eq mkBoard.writer }">
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
	       <span id="reportNickName">작성자 : ${mkBoard.nickName }</span>
	       <br>
	       <span id="reportContent">글제목 : ${mkBoard.boardTitle }</span>
	       <br> <br>
			 <form action="${ contextPath }/marketReport.ma">
			 <div class="form-check">
			  <input  name="reportType" class="form-check-input" type="checkbox" value="홍보도배" id="flexCheckDefault">
			  <input type="hidden" id="contentNo" name="contentNo" value="${mkBoard.boardNo }">
			  <input type="hidden" id="boardNo" name="boardNo" value="${mkBoard.boardNo }">
			  <input type="hidden" id="reportCate" name="reportCate" value="B">
			  <label class="form-check-label" >
			    홍보/도배글이예요
			  </label>
			</div>
			<div class="form-check">
			  <input name="reportType" class="form-check-input" type="checkbox" value="유해내용"  >
			  <label class="form-check-label" >
			    청소년에게 유해한 내용이예요
			  </label>
			</div>
			<div class="form-check">
			  <input name="reportType" class="form-check-input" type="checkbox" value="불법" >
			  <label class="form-check-label" >
			    불법이예요
			  </label>
			</div>
			<div class="form-check">
			  <input name="reportType" class="form-check-input" type="checkbox" value="욕설혐오차별" >
			  <label class="form-check-label" >
			    욕설,혐오,차별적표현이예요
			  </label>
			</div>
			 <div class="modal-footer">
	        <button class="btn btn-secondary" data-bs-dismiss="modal" type="reset" aria-label="Close">닫기</button>
	        <button class="btn btn-primary">신고하기</button>
	       	</div>
	       	</form>
		  </div>
		</div>
	  </div>
	</div>
	
	<!-- 이미지 슬라이드 -->
	<div class="container-fluid ">
    <div class="row lightbox-container align-items-center">
      <div class="col-10 col-md-10 mx-auto text-right lightbox-holder">
        <span class="lightbox-close"><i class="fas fa-window-close"></i></span>
        <div class="lightbox-item"></div>
        <span class="lightbox-control btnLeft"><i class="fas fa-caret-left"></i></span>
        <span class="lightbox-control btnRight"><i class="fas fa-caret-right"></i></span>
      </div>
    </div>
  </div>
	
	<!-- 메세지 보내기 모달창 -->
	<div class="modal fade" id="msgModal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
	  <div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
			  	<div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalToggleLabel2"><img style="width:40px; height: 40px; " alt="" src="resources/image/msg.png">&nbsp;&nbsp;SEND MESSAGE</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			    </div>
			 	<div class="modal-body" style="text-align: left">
				    	제목<input type="text" class="form-control input" name="messageTitle">
				    	내용<input class="form-control input" style="height: 300px" name="messageContent">
				      	<br>
				      	받는 사람 : <input id="receiver" type="text" name="receiver" class="input" readonly style="border: none;">
				 </div>
				 <div class="modal-footer">
					<button class="btn btn-primary" id="sendBtn" ><strong>보내기</strong></button>
			      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				 </div>
	    	</div> 
	  </div>
	</div>	
	
	
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=798f33ea8b65e2cf58f7aae47be6ed55&libraries=services"></script>	
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
		
	
	<script>
		window.onload = () =>{
			//좋아요
	         $(".symptClick").click(function(){
	            if($(this).attr("class") == "btn btn-outline-danger symptClick"){
	                  $.ajax({
	                        url: '${contextPath}/marketLike.ma',
	                        data: {boardNo: ${ mkBoard.boardNo }},
	                        type: 'post',
	                        success:(data)=>{
	                           var symptCount = parseInt($('#likeCount').html());
	                           $('#likeCount').html(symptCount + data);
	                           
	                        },
	                        error: (data)=>{
	                         console.log(data);
	                      }
	                     });
	               
	                  $(this).attr("class","btn btn-outline-danger active symptClick");
	                  
	            } else if($(this).attr("class") == "btn btn-outline-danger active symptClick"){
	                  $.ajax({
	                        url: '${contextPath}/marketLikeCancle.ma',
	                        data: {boardNo:${mkBoard.boardNo}},
	                        type: 'post',
	                        success:(data)=>{
	                           var symptCount = parseInt($('#likeCount').html());
	                           $('#likeCount').html(symptCount - data);
	                         
	                        },
	                        error: (data)=>{
	                         console.log(data);
	                      }
	                     });
	                  $(this).attr("class","btn btn-outline-danger symptClick");
	            }
	         });
			
		
			//삭제모달
			if(${ loginUser.memberId eq mkBoard.writer }){
				document.getElementById('deleteBtn').addEventListener('click', ()=>{
					$('#deleteModal').modal('show');	
				});
			}
			
			//신고확인
			document.getElementById('reportBtn').addEventListener('click', ()=>{
				if(${mkBoard.reportStatus!='N'} ){
					alert("이미 신고된 글입니다.");
				}else{
					$('#reportModal').modal('show');	
				}
				
			});
			
			//댓글입력
			if(${ !empty loginUser }){
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
								nickName: '${loginUser.nickName}',groupNo:0
								},
						success: (data) => {
							document.getElementById('replySecret').checked = false;
							document.getElementById('replySecret').value = 'N';
							selectRList(data);
						},
						error: (data) => {
							console.log(data);
						}
					});
				});
			}
			
			//답글창
			 $(document).on("click", ".reReplyBtn", function(){
				const input = this.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.nextElementSibling;
				
				if(input.style.display == 'none') {
		        	input.style.display = 'inline';
		        } else {
		        	input.style.display = 'none';
		        }
		     });
			
			//대댓글
			   $(document).on("click", ".reReplySubmit", function(){
			           if(this.nextElementSibling.nextElementSibling.nextElementSibling.checked){
			            this.nextElementSibling.nextElementSibling.nextElementSibling.value ='Y';
			          }
			          
			          const reReplyContent = this.previousElementSibling.value;
			           const replyNo = this.parentNode.previousElementSibling.value;   
			           const reReplySecret= this.nextElementSibling.nextElementSibling.nextElementSibling.value;
			           
			           $.ajax({
			            url: '${contextPath}/replyInsert.ma',
			            data: {groupNo:replyNo,replyContent:reReplyContent,
			            	replySecret:reReplySecret,boardNo:${mkBoard.boardNo},
			            	},
			            type: 'post',
			            success:(data)=>{
			               for(const r of data){
			               
			               this.previousElementSibling.value = '';
			               this.parentNode.querySelector('.reReplySecret').checked = false;
			               var replyCount = data.length;
			               this.parentNode.parentNode.parentNode.parentNode.parentNode.style.display = "none";
			               selectRList(data);  
			            
			               }
			                  
			            },
			            error: (data)=>{
			               console.log(data);
			            }
			         });
			           
			       });
			
			//지도
			if(${mkBoard.location != null}){
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 4 // 지도의 확대 레벨
		    	}; 
				
				var latitude = "", longitude = "";
				    
				if (navigator.geolocation) {
					navigator.geolocation.getCurrentPosition(onSuccess, onError);
				} else {
					latitude = "", longitude = "";
				}   
				    
				function onSuccess(position) {
					latitude = position.coords.latitude; //y
					longitude = position.coords.longitude; //x
				    console.log(latitude);
				    
				

				var map = new kakao.maps.Map(mapContainer, mapOption); 
				map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);   
				var geocoder = new kakao.maps.services.Geocoder();
				var coords = "";
				geocoder.addressSearch('${ mkBoard.location}', function(result, status) {
				     if (status === kakao.maps.services.Status.OK) {
				    	console.log(result);
				        coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				        here = new kakao.maps.LatLng(latitude,longitude );
				        
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				       	});
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: here
				       	});
				        map.setCenter(coords);
				        $(document).on('click', "#myLocation", function(){
				        	 map.setCenter(here);
				        	 this.style.display = "none";
				        	 document.querySelector("#tranLocation").style.display = "block";
				        });
				        $(document).on('click', "#tranLocation", function(){
				        	map.setCenter(coords);
				        	 this.style.display = "none";
				        	 document.querySelector("#myLocation").style.display = "block";
				        });
				        
				        var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
				        var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
				        var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
				        var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
				        var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
				        
				     // 지도에 클릭 이벤트를 등록합니다
				     // 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
				     kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

				         // 마우스로 클릭한 위치입니다 
				         var clickPosition = mouseEvent.latLng;

				         // 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
				         if (!drawingFlag) {

				             // 상태를 true로, 선이 그리고있는 상태로 변경합니다
				             drawingFlag = true;
				             
				             // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
				             deleteClickLine();
				             
				             // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
				             deleteDistnce();

				             // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
				             deleteCircleDot();
				         
				             // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
				             clickLine = new kakao.maps.Polyline({
				                 map: map, // 선을 표시할 지도입니다 
				                 path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
				                 strokeWeight: 3, // 선의 두께입니다 
				                 strokeColor: '#db4040', // 선의 색깔입니다
				                 strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
				                 strokeStyle: 'solid' // 선의 스타일입니다
				             });
				             
				             // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
				             moveLine = new kakao.maps.Polyline({
				                 strokeWeight: 3, // 선의 두께입니다 
				                 strokeColor: '#db4040', // 선의 색깔입니다
				                 strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
				                 strokeStyle: 'solid' // 선의 스타일입니다    
				             });
				         
				             // 클릭한 지점에 대한 정보를 지도에 표시합니다
				             displayCircleDot(clickPosition, 0);

				                 
				         } else { // 선이 그려지고 있는 상태이면

				             // 그려지고 있는 선의 좌표 배열을 얻어옵니다
				             var path = clickLine.getPath();

				             // 좌표 배열에 클릭한 위치를 추가합니다
				             path.push(clickPosition);
				             
				             // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
				             clickLine.setPath(path);

				             var distance = Math.round(clickLine.getLength());
				             displayCircleDot(clickPosition, distance);
				         }
				     });
				         
				     // 지도에 마우스무브 이벤트를 등록합니다
				     // 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
				     kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {

				         // 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
				         if (drawingFlag){
				             
				             // 마우스 커서의 현재 위치를 얻어옵니다 
				             var mousePosition = mouseEvent.latLng; 

				             // 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
				             var path = clickLine.getPath();
				             
				             // 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
				             var movepath = [path[path.length-1], mousePosition];
				             moveLine.setPath(movepath);    
				             moveLine.setMap(map);
				             
				             var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // 선의 총 거리를 계산합니다
				                 content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다
				             
				             // 거리정보를 지도에 표시합니다
				             showDistance(content, mousePosition);   
				         }             
				     });                 

				     // 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
				     // 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
				     kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

				         // 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
				         if (drawingFlag) {
				             
				             // 마우스무브로 그려진 선은 지도에서 제거합니다
				             moveLine.setMap(null);
				             moveLine = null;  
				             
				             // 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
				             var path = clickLine.getPath();
				         
				             // 선을 구성하는 좌표의 개수가 2개 이상이면
				             if (path.length > 1) {

				                 // 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
				                 if (dots[dots.length-1].distance) {
				                     dots[dots.length-1].distance.setMap(null);
				                     dots[dots.length-1].distance = null;    
				                 }

				                 var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
				                     content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
				                     
				                 // 그려진 선의 거리정보를 지도에 표시합니다
				                 showDistance(content, path[path.length-1]);  
				                  
				             } else {

				                 // 선을 구성하는 좌표의 개수가 1개 이하이면 
				                 // 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
				                 deleteClickLine();
				                 deleteCircleDot(); 
				                 deleteDistnce();

				             }
				             
				             // 상태를 false로, 그리지 않고 있는 상태로 변경합니다
				             drawingFlag = false;          
				         }  
				     });    

				     // 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
				     function deleteClickLine() {
				         if (clickLine) {
				             clickLine.setMap(null);    
				             clickLine = null;        
				         }
				     }

				     // 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
				     // 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
				     function showDistance(content, position) {
				         
				         if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면
				             
				             // 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
				             distanceOverlay.setPosition(position);
				             distanceOverlay.setContent(content);
				             
				         } else { // 커스텀 오버레이가 생성되지 않은 상태이면
				             
				             // 커스텀 오버레이를 생성하고 지도에 표시합니다
				             distanceOverlay = new kakao.maps.CustomOverlay({
				                 map: map, // 커스텀오버레이를 표시할 지도입니다
				                 content: content,  // 커스텀오버레이에 표시할 내용입니다
				                 position: position, // 커스텀오버레이를 표시할 위치입니다.
				                 xAnchor: 0,
				                 yAnchor: 0,
				                 zIndex: 3  
				             });      
				         }
				     }

				     // 그려지고 있는 선의 총거리 정보와 
				     // 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
				     function deleteDistnce () {
				         if (distanceOverlay) {
				             distanceOverlay.setMap(null);
				             distanceOverlay = null;
				         }
				     }

				     // 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
				     // 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
				     function displayCircleDot(position, distance) {

				         // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
				         var circleOverlay = new kakao.maps.CustomOverlay({
				             content: '<span class="dot"></span>',
				             position: position,
				             zIndex: 1
				         });

				         // 지도에 표시합니다
				         circleOverlay.setMap(map);

				         if (distance > 0) {
				             // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
				             var distanceOverlay = new kakao.maps.CustomOverlay({
				                 content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
				                 position: position,
				                 yAnchor: 1,
				                 zIndex: 2
				             });

				             // 지도에 표시합니다
				             distanceOverlay.setMap(map);
				         }

				         // 배열에 추가합니다
				         dots.push({circle:circleOverlay, distance: distanceOverlay});
				     }

				     // 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
				     function deleteCircleDot() {
				         var i;

				         for ( i = 0; i < dots.length; i++ ){
				             if (dots[i].circle) { 
				                 dots[i].circle.setMap(null);
				             }

				             if (dots[i].distance) {
				                 dots[i].distance.setMap(null);
				             }
				         }

				         dots = [];
				     }

				     // 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
				     // 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
				     // HTML Content를 만들어 리턴하는 함수입니다
				     function getTimeHTML(distance) {

				         // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
				         var walkkTime = distance / 67 | 0;
				         var walkHour = '', walkMin = '';

				         // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
				         if (walkkTime > 60) {
				             walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
				         }
				         walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

				         // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
				         var bycicleTime = distance / 227 | 0;
				         var bycicleHour = '', bycicleMin = '';

				         // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
				         if (bycicleTime > 60) {
				             bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
				         }
				         bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

				         // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
				         var content = '<ul class="dotOverlay distanceInfo">';
				         content += '    <li>';
				         content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
				         content += '    </li>';
				         content += '    <li>';
				         content += '        <span class="label">도보</span>' + walkHour + walkMin;
				         content += '    </li>';
				         content += '    <li>';
				         content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
				         content += '    </li>';
				         content += '</ul>'

				         return content;
				     }
				    } 
				});
			}
				
				function onError() {
					alert("현재위치를 가져오지 못했습니다.");
				}
				
				
				
			}
			
		//이미지 슬라이드
		if(${ !empty mkAList }){
				const slides = document.querySelector('.slides');
				const slideImg = document.querySelectorAll('.slides li'); 
				let currentIdx = 0;
				const slideCount = slideImg.length; 
				const prev = document.querySelector('.prev');
				const next = document.querySelector('.next');
				const slideWidth = 300;
				const slideMargin = 100;
	
				slides.style.width = (slideWidth + slideMargin) * slideCount + 'px';
	
				function moveSlide(num) {
				  slides.style.left = -num * 400 + 'px';
				  currentIdx = num;
				}
	
				prev.addEventListener('click', function () {
				  if (currentIdx !== 0) moveSlide(currentIdx - 1);
				});
	
				next.addEventListener('click', function () {
				  if (currentIdx !== slideCount - 1) {
				    moveSlide(currentIdx + 1);
				  }
				});
		}
			//이미지 모달창 
			const modal = document.querySelector(".modal");
			const img = document.querySelector(".img");
			const modal_img = document.querySelector(".modal_content");
			const span = document.querySelector(".close");

			$(document).on('click', ".img", function(){
			  modalDisplay("block");
			  modal_img.src = this.src;
			});
			span.addEventListener('click', ()=>{
			  modalDisplay("none");
			});
			modal.addEventListener('click', ()=>{
			  modalDisplay("none");
			});
			function modalDisplay(text){
			  modal.style.display = text;
			}
			
			//메세지 보내기
			$(document).on('click', ".sendMsg", function(){
				const senderNickname = this.parentNode.parentNode.parentNode.querySelector('span').innerText;
				const sender = senderNickname.trim();
				const id = '${loginUser.nickName}';
				document.getElementById('receiver').value = sender;
				
				if(id != sender){
					$('#msgModal').modal('show');
				}
				
				if(id == sender){
					alert("본인에게 메세지를 보낼 수 없습니다.");
				}
				
			});
			
			
			document.getElementById('sendBtn').addEventListener('click', () => {
				const input = document.getElementsByClassName('input');
				$.ajax({
					url: '${ contextPath }/insertMsg.cm',
					data: {messageTitle:input[0].value,
						   messageContent:input[1].value,
						   receiver:input[2].value,
						   },
					success: (data) => {
						$('#msgModal').modal('hide')
						input[0].value = '';
						input[1].value = ''; 
						location.reload();
					},
					error: (data) => {
						console.log(data);
					}
				});
			});
			
		}
		
		
		//비밀댓글
		$(document).on('click', "input[type='checkbox']", function(){
			    if(this.checked) {
			        const checkboxes = $("input[type='checkbox']");
			        for(let ind = 0; ind < checkboxes.length; ind++){
			            checkboxes[ind].checked = false;
			        }
			        this.checked = true;
			    } else {
			        this.checked = false;
			    }
			});
		
		
		//댓글삭제
		$(document).on('click', '.deleteReBtn', function(){
			console.log("삭제");
				$.ajax({
					url: '${contextPath}/replyDelete.ma',
					data: {rNo:this.parentNode.querySelector('input[type="hidden"]').value, bNo:${mkBoard.boardNo}},
					success: (data) => {
						selectRList(data);
					},
					error: (data) => {
						console.log(data);
					}
				});
		});
		
		
		//댓글수정
		$(document).on('click', '.updateReBtn', function(){
			console.log("수정");
			const textArea = this.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.querySelector('textarea');
			
			textArea.removeAttribute('readOnly');
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
					url: '${contextPath}/replyUpdate.ma',
					data: {replyNo:replyNo,replyContent:replyContent,replySecret:replySecret,boardNo:${mkBoard.boardNo}},
					type: 'post',
					success:(data)=>{
						this.parentNode.querySelector('input[type="checkbox"]').checked = false;
						this.parentNode.querySelector('input[type="checkbox"]').value = 'N';
						selectRList(data);
					},
					error: (data)=>{
						console.log(data);
					}
				});
			});
			
			
		});
		
		
		//신고하기
		$(document).on('click', ".reReportBtn", function(){
			var rNo = this.parentNode.querySelector('.reportReplyNo').value;
			var rStatus = this.parentNode.querySelector('.reportStatus').value;
			
			if(rStatus=='Y'){
				alert("이미 신고된 댓글입니다.");
			}else{
				$("#reportContent").text("댓글내용 : " + this.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.querySelector('textarea').value);
				$("#reportNickName").text("작성자 : " + this.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.querySelector('.reNickName').innerText);
				$("#contentNo").val(this.parentNode.querySelector('input[type="hidden"]').value);
				$("#reportCate").val('R');
				$('#reportModal').modal('show');	
			}
		});
		
		//댓글 출력 함수
		function selectRList(data){
			var replyCount = data.length;
			document.getElementById('replyDiv').innerHTML = '';
			document.getElementById('replyContent').value='';
			
			for(const r of data){
				let str = " ";
				if(r.replyNo == r.groupNo){
					str += '<table class="table replyTable">';
					str += '<tr>';
					if( r.profileImg == null){
						str += '<td style="text-align: center;" width="40"><img src="resources/image/userProfile.png" width="50" height="50" style="border-radius: 70%"></td>';
					}else if(r.profileImg != null){
						str += '<td style="text-align: center;" width="40"><img src="resources/uploadFiles/'+ r.profileImg + '" width="50" height="50" style="border-radius: 70%"></td>';
					}	
					str += '<td width="150px;  class="reNickName">';
					str += '<span class=" dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">'+r.nickName+'</span>';
					str += '<ul class="dropdown-menu" style="text-align: center;">';
					str += '<li><a class="dropdown-item sendMsg" >쪽지보내기</a></li>';
					str += '</ul></td>';
					str += '<td width="150px;">'+ r.replyModifyDate + '</td>';
					str += '<td width="850px;"></td>';
					str += '<td>';					
					str += '<div class="dropdown">';
					str += '<img class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" src="resources/image/menu-dots.png" width="20" height="20">';
					str += '<ul class="dropdown-menu" style="text-align: center;">';
					if('${ loginUser.memberId }' == r.memberId){
						str +='<li class="reReplyBtn"><a class="dropdown-item">답글달기</a></li>';
						str +='<li class="updateReBtn"><a class="dropdown-item">수정</a></li>';
						str +='<li class="deleteReBtn"><a class="dropdown-item ">삭제</a><input type="hidden" id="replyNo" class="replyNo" value="'+ r.replyNo+ '"></li>';
					}else if('${ loginUser.memberId }' != r.memberId){
						str +='<li class="reReplyBtn"><a class="dropdown-item" >답글달기</a></li>';
						str +='<li class="reReportBtn"><input type="hidden" class="reportReplyNo" value="'+ r.replyNo +'"><input type="hidden" class="reportStatus" value="'+ r.reportStatus +'"><a class="dropdown-item" >신고</a></li>';
					}	
					
					str +='</ul></div></td>	</tr>';
					str +='<tr style="font-size: 20px;">';
					str +='<td class="px-5 py-3 " colspan="5">';
					str +='<div class="input-group replyContentArea" >';		
					if(r.replySecret =='Y' && ('${ loginUser.memberId }' == '${ mkBoard.writer }' || '${ loginUser.memberId }' == r.memberId || '${ loginUser.memberAuthority }' == 'Y')){
						str +='<textarea readonly class="reContent" style="width: 1000px; border: none; resize: none;">'+r.replyContent+ '</textarea>';
					}else if(r.replySecret =='N'){
						str +='<textarea readonly class="reContent" style="width: 1000px; border: none; resize: none;">'+r.replyContent+ '</textarea>';
					}else if(r.replySecret =='Y' && '${ loginUser.memberId }' != '${ mkBoard.writer }' && '${ loginUser.memberId }' != r.memberId && '${ loginUser.memberAuthority }' == 'N'){
						str +='<textarea readonly style="width: 1000px; border: none; resize: none;">비밀 댓글입니다.</textarea>';
					}else if(r.replySecret =='Y' && '${loginUser}' == null){
						str +='<textarea readonly style="width: 1000px; border: none; resize: none;">비밀 댓글입니다.</textarea>';
					}
					
					str +='<input type="hidden"  value="'+ r.replyNo+ '">';					
					str +='</div></td></tr></table>';						
					
					if('${loginUser!=null}'){
						str +='<table class="table table-borderless p-5 reReplyInput" style="display: none;">';	
						str +='<tr><td width="1em"><img src="https://cdn-icons-png.flaticon.com/512/9058/9058850.png" width="20" height="20"></td>';	
						str +='	<td ><input type="hidden" name="replyNo" value="'+r.replyNo+'">';
						str +='	<div class="input-group" >';
						str +='	<textarea  style="width: 1000px; border: none; resize: none;"></textarea>';
						str +='	<button class="btn btn-outline-primary btn-lg reReplySubmit" type="button" style="width: 100px;">등록</button>';
						str +='<br>&nbsp;<label for="replySecret">비밀댓글</label>&nbsp;&nbsp;<input type="checkbox" class="reReplySecret" value="N">';
						str +='</div></td></tr></table>';
						
					}
				for(const rr of data){
					if(r.replyNo == rr.groupNo && rr.replyNo != rr.groupNo){
						str += '<div class="px-5" style="padding-bottom: 20px; margin-left: 10px;" id="reReplyDiv">';
						str += '<table class="table">';
						str += '<tr>';
						str += '<td style="text-align: center;" width="40"><img src="https://cdn-icons-png.flaticon.com/512/9058/9058850.png" width="18" height="20">';
						if( rr.profileImg == null){
							str += '<td style="text-align: center;" width="40"><img src="resources/image/userProfile.png" width="50" height="50" style="border-radius: 70%"></td>';
						}else if(rr.profileImg != null){
							str += '<td style="text-align: center;" width="40"><img src="resources/uploadFiles/'+rr.profileImg +'" width="50" height="50" style="border-radius: 70%"></td>';
						}
						str += '<td class="px-4"  style="width: 150px;">';
						str += '<span class=" dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">'+rr.nickName+'</span>';
						str += '<ul class="dropdown-menu" style="text-align: center;">';
						str += '<li><a class="dropdown-item sendMsg" >쪽지보내기</a></li>';
						str += '</ul>';
						str += '</td>';
						str += '<td class="px-4" style="width: 150px;">'+rr.replyModifyDate+'</td>';
						str += '<td width="750"></td>';
						str += '<td>';
						str += '<div class="dropdown">';
						str += '<img class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" src="resources/image/menu-dots.png" width="20" height="20">';
						str += '<ul class="dropdown-menu" style="text-align: center;">';
						if('${ loginUser.memberId }' == rr.memberId){
							str += '<li class="updateReBtn"><a class="dropdown-item" >수정</a></li>';
							str += '<li class="deleteReBtn"><a class="dropdown-item" >삭제</a><input type="hidden" id="replyNo" class="replyNo" value="'+ rr.replyNo +'"></li>';
						}else if('${ loginUser.memberId }' != rr.memberId){
							str += '<li class="reReportBtn"><input type="hidden" class="reportReplyNo" value="'+ rr.replyNo +'"><input type="hidden" class="reportStatus" value="'+ rr.reportStatus+ '"><a class="dropdown-item" >신고</a></li>';
						}
						str += '</ul>';
						str += '</div>';
						str += '</td>';
						str += '</tr>';
						str += '<tr style="font-size: 20px;">';
						str += '<td class="px-5 py-3 " colspan="5">';
						str += '<div class="input-group replyContentArea" >';
						if(rr.replySecret =='Y' && ('${ loginUser.memberId }' == '${ mkBoard.writer }' || '${ loginUser.memberId }' == rr.memberId || '${ loginUser.memberAuthority }' == 'Y')){
							str +='<textarea readonly class="reContent" style="width: 1000px; border: none; resize: none;">'+rr.replyContent+ '</textarea>';
						}else if(rr.replySecret =='N'){
							str +='<textarea readonly class="reContent" style="width: 1000px; border: none; resize: none;">'+rr.replyContent+ '</textarea>';
						}else if(rr.replySecret =='Y' && '${ loginUser.memberId }' != '${ mkBoard.writer }' && '${ loginUser.memberId }' != rr.memberId && '${ loginUser.memberAuthority }' == 'N'){
							str +='<textarea readonly style="width: 1000px; border: none; resize: none;">비밀 댓글입니다.</textarea>';
						}else if(rr.replySecret =='Y' && '${loginUser}' == null){
							str +='<textarea readonly style="width: 1000px; border: none; resize: none;">비밀 댓글입니다.</textarea>';
						}
						str += '<input type="hidden"  value="'+ rr.replyNo + '">';
						str += '</div>';
						str += '</td>';
						str += '</tr>';
						str += '</table>';
						str += '</div>';
					}
					}
			}
				document.getElementById('replyDiv').innerHTML += str;
				$("#replyCount").html(replyCount);
			}
		}
		
			
		//카카오톡 공유하기
		Kakao.init('798f33ea8b65e2cf58f7aae47be6ed55');
		Kakao.isInitialized();
		const currUrl =	$(location).attr('href');
		function kakaoShare() {
			Kakao.Share.sendDefault({
				  objectType: 'feed',
				  content: {
				    title: '${mkBoard.boardTitle}',
				    description: '${ fn:substring(vBoard.boardContent, 0, 20) }',
				    imageUrl: 'https://ifh.cc/g/1Lygac.png',
				    link: {
				      webUrl: currUrl,
				    },
				  },
				  buttons: [
				    {
				      title: 'SingleRior로 이동',
				      link: {
				        webUrl: currUrl,
				      },
				    },
				  ],
				});
		}
		
		
		
	</script>
   
	
</body>
</html>