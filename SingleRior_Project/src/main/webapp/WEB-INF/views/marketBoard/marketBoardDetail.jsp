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
				
					<div id="map" class="mx-auto" style=" width:300px;height:200px;"></div><br><div class="mx-auto" style="text-align:center; background: #D9E5FF; border-radius:2em; padding: 20px; width: 650px;"  >${mkBoard.nickName}님은  ${mkBoard.location }에서 직거래하고 싶어해요!</div>
					<span>위도 : </span><input type="text" id="lat" name="lat" readonly/><br/>
					  <span>경도 : </span><input type="text" id="long" name="long" readonly/>
					  <div id="result"></div>
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
						<c:forEach items="${mkRList }" var="r">
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
						
						<!-- 대댓글창 -->
						<c:if test="${!empty loginUser }">
							<table class="table table-borderless p-5 reReplyInput" style="display: none;" >
		                    	<tr>
		                        	<td width="1em">
		                           		<i class="bi bi-arrow-return-right" style="font-size:1em">
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
						</c:forEach>
					</div>
					
					<!-- 대댓글 -->
					<c:forEach items="${mkRRList}" var="rr">
					<c:forEach items="${mkRList}" var="r">
					<c:if test="${rr.replyNo==r.replyNo }">
					<div class="px-5" style="padding-bottom: 50px; margin-left: 60px;" id="reReplyDiv">
						<table class="table">
							<tr>
								<td style="text-align: center;" width="40"><img src="https://cdn-icons-png.flaticon.com/512/9058/9058850.png" width="20" height="20">
								<td style="text-align: center;" width="40"><img src="https://cdn-icons.flaticon.com/svg/3917/3917711.svg?token=exp=1670467359~hmac=b45251c2afca4a6751ba3fed9124eb31" width="20" height="20"></td>
								<td class="px-4 ">${rr.nickName}</td>
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
					</div>
					
					</c:if>
					</c:forEach>
					</c:forEach>
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
			        <h1 class="modal-title fs-5" id="exampleModalToggleLabel2">SEND MESSAGE</h1>
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
	                           console.log(data);
	                           var symptCount = parseInt($('#likeCount').html());
	                           console.log(symptCount);
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
	                           console.log(data);
	                           var symptCount = parseInt($('#likeCount').html());
	                           console.log(symptCount);
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
								nickName: '${loginUser.nickName}'},
						success: (data) => {
							console.log(document.getElementById('replySecret'));
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
			
			//지도
			if(${mkBoard.location != null}){
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    	}; 

				var map = new kakao.maps.Map(mapContainer, mapOption); 
				var geocoder = new kakao.maps.services.Geocoder();
				geocoder.addressSearch('${ mkBoard.location}', function(result, status) {
				     if (status === kakao.maps.services.Status.OK) {
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				       	});
				        map.setCenter(coords);
				    	} 
					});
				$(document).on('click', ".distance", function(){
					console.log(123);
					
					
				});
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
				console.log(sender);
				console.log(id);
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
				console.log(input[0].value);
				console.log(input[1].value);
				console.log(input[2].value);
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
			console.log("value1 : " + textArea.value);
			
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
			document.getElementById('replyContent').value='';
			for(const r of data){
				console.log(data);
				let str = '<table class="table replyTable ">';
				str +=	'<tr>';
				
				if(r.profileImg != null){
					str += '<td style="text-align: center;" width="40"><img src="resources/uploadFiles/' + r.profileImg + '" width="50" height="50" style="border-radius: 70%"></td>';
				}else{
					str += '<td style="text-align: center;" width="40"><img src="resources/image/userProfile.png" width="50" height="50" style="border-radius: 70%"></td>';
				}
				str +=	'<td width="150px;  class="reNickName">';
				str +=	'<span class=" dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">' + r.nickName + '</span>';
				
				if('${ loginUser.nickName}'!= r.nickName){	
					str +=	'<ul class="dropdown-menu" style="text-align: center;">';
					str += 	'<li><a class="dropdown-item sendMsg" onclick="$(' + "'#msgModal'" + ').modal(' + "'show'" + ')">쪽지보내기</a></li></ul></td>'
				}
				
				str +=	'<td width="150px; class="px-4">'+ r.replyModifyDate + '</td>';
				str +=	'<td width="850px;"></td>';
				str +=	'<td>';
				str +=	'<div class="dropdown">';
				str +=	'<img class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" src="resources/image/menu-dots.png" width="20" height="20">';
				str +=	'<ul class="dropdown-menu" style="text-align: center;">';
				
				if('${ loginUser.memberId}'== r.memberId){	
					str +=	'<li class="reReplyBtn"><a class="dropdown-item ">답글달기</a></li>';
					str +=	'<li class="updateReBtn"><a class="dropdown-item">수정</a></li>';
					str +=	'<li class="deleteReBtn"><a class="dropdown-item ">삭제</a><input type="hidden" class="replyNo" value="'+ r.replyNo +'"></li>';
				}else{										
					str +=	'<li><a class="dropdown-item" >답글달기</a></li>';
					str +=	'<li class="reportBtn" ><a class="dropdown-item" >신고</a></li>';
				}
					str +=	'</ul>';
					str +=	'</div>';
					str +=	'</td>';
					str +=	'</tr>';
					str +=	'<tr style="font-size: 20px;">';
					str +=	'<td class="px-5 py-3" colspan="5">';
					str +=	'<div class="input-group replyContentArea" >';
				
				if(r.replySecret=='Y' &&('${loginUser.memberId}' == '${mkBoard.writer}' || '${loginUser.memberId}' == r.memberId || '${loginUser.memberAuthority}' == 'Y')){
					str +=	'<textarea class="reContent" readonly style="width: 1000px; border: none; resize: none;">'+ r.replyContent + '</textarea>';
				}else if(r.replySecret=='Y' && '${loginUser.memberId}' != '${mkBoard.writer}' && '${loginUser.memberId}' != r.memberId &&'${loginUser.memberAuthority}' != 'Y'){
					str +=	'<input readonly style="width: 1000px; border: none; resize: none;"> 비밀댓글 입니다. </input>';
				}else if(r.replySecret=='N'){
					str +=	'<textarea class="reContent" readonly style="width: 1000px; border: none; resize: none;">'+ r.replyContent + '</textarea>';
				}	
					str +=	'<input type="hidden"  value="'+ r.replyNo + '">';
					str +=	'</div>';
					str +=	'</td>';
					str +=	'</tr>';
					str +=	'</table>';
					str +=	'<table class="table table-borderless p-5 reReplyInput" style="display: none;" >';
					str +=	'<tr>';
					str +=	'<td width="1em">';
					str +=	'<i class="bi bi-arrow-return-right" style="font-size:1em">';
					str +=	'</td>';
					str +=	'<td >';
					str +=	'<input type="hidden" name="boardNo" value="'+ ${mkBoard.boardNo} + '">';     
					str +=	'<input type="hidden" name="replyNo" value="'+ r.replyNo+ '">';
					str +=	'<div class="input-group" >';
					str +=	'<textarea  style="width: 1000px; border: none; resize: none;"></textarea>';
                    str +=	'<button class="btn btn-outline-primary btn-lg reReplySubmit" type="button" style="width: 100px;">등록</button>';
                    str +=	'</div>';
                    str +=	'</td>';
                    str +=	'</tr>';
                    str +=	'</table>';
					document.getElementById('replyDiv').innerHTML += str;
					$("#replyCount").html(replyCount);
			}
		}
		
		//답글창
		 $(document).on("click", ".reReplyBtn", function(){
	        console.log("답글");
	        console.log(this);
			const input = this.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.nextElementSibling;
			console.log(input);
			
			if(input.style.display == 'none') {
	        	input.style.display = 'inline';
	        } else {
	        	input.style.display = 'none';
	        }
	     });

		
			
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
	
	<script>
	var latitude = "", longitude = "";
    
    window.onload = function() {
    	if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(onSuccess, onError);
        } else {
            latitude = "", longitude = "";
        }	
    }
    
    function onSuccess(position) {
    	latitude = position.coords.latitude;
        longitude = position.coords.longitude;
        console.log("위도 : "  +latitude);
        console.log("경도 : "  +longitude);
		document.getElementById("result").innerHTML = "<p>성공</p>";
    }
    
    function onError() {
    	latitude ="N/A";
    	longitude = "N/A";
        document.getElementById("result").innerHTML = "<p>실패</p>";
    }
    
    document.getElementById("lat").value = latitude;
    document.getElementById("long").value = longitude;
    
    
</script>
	
</body>
</html>