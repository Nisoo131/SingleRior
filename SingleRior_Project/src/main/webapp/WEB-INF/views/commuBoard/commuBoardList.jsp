<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	.css-title{
		overflow: hidden;
		display: inline-block;
		color: rgb(47, 52, 56);
		letter-spacing: -0.3px;
		white-space: nowrap;
		text-overflow: ellipsis;
		font-size: 30px;
		line-height: 28px;
	}
	.list-click{
		font-size: 20px;
		font-weight: bold;
	}
	td:hover{cursor: pointer;}
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
  		<div class="container d-flex flex-wrap css-title" style="padding-left: 50px; padding-top: 100px;">
  			<span class="px-4">전체 게시글</span>
  		</div>
  		<div class="container d-flex flex-wrap" style="padding-left: 50px; padding-bottom: 40px; font-size: 20px;">
  			<span class="px-4">커뮤니티에 게시된 전체 게시글 입니다.</span>
  		</div>
  		
  		<div class="container px-5">
  			<div class="row px-4">
			  	<div class="col-md-2" style="width: 380px;">
			  		<div class="row g-0 border rounded overflow-hidden flex-md-row shadow-sm h-md-250 position-relative mt-2 mb-4">
			  			<div class="col py-2 d-flex flex-column position-static px-3">
			  				<table>
			  					<tr style="text-align: center; height: 35px;">
			  						<td id="list1" width="80px;">
			  							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-check-lg me-1" viewBox="0 0 16 16">
			  								<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
			  							</svg>최신순
			  						</td>
			  						<td id="list2" width="120px;">
			  							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-check-lg me-1" viewBox="0 0 16 16">
			  								<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
			  							</svg>공감 많은 순
			  						</td>
			  						<td id="list3">
			  							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-check-lg me-1" viewBox="0 0 16 16">
			  								<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
			  							</svg>댓글 많은 순
			  						</td>
			  					</tr>
			  				</table>
			  			</div>
			  		</div>
			  	</div>
			  	
			  	<div class="col-md-8" style="width: 620px;"></div>
			  	
			  	<c:if test="${ empty loginUser }">
			  		<div class="col-md-2 py-2" style="text-align: center;">
				  		<button class="w-100 btn btn-outline-primary btn-lg" type="button" id="loginModal">게시글 작성</button>
				  	</div>
			  	</c:if>
			  	<c:if test="${ !empty loginUser }">
			  		<div class="col-md-2 py-2" style="text-align: center;">
				  		<button class="w-100 btn btn-outline-primary btn-lg" type="button" onclick="location.href='${ contextPath }/writeCommuBoard.co'">게시글 작성</button>
				  	</div>
			  	</c:if>
			</div>
  		</div>
  		
  		<div class="container px-5 bd-example-snippet bd-code-snippet" style="padding-bottom: 20px; text-align: center;">
  			<div class="bd-example">
				<table class="table table-hover">
					<thead>
						<tr class="fs-5">
							<th width="100px">카테고리</th>
							<th>글 제목</th>
							<th width="130px">작성자</th>
							<th width="130px">작성일</th>
							<th width="70px">공감</th>
							<th width="70px">댓글</th>
		          		</tr>
		          	</thead>
	         		<tbody>
	         			<c:forEach items="${ list }" var="b">
	         				<tr>
								<td>
									<c:if test="${ b.commuType == 1 }">생활팁</c:if>
									<c:if test="${ b.commuType == 2 }">후기</c:if>
									<c:if test="${ b.commuType == 3 }">자유</c:if>
									<input type="hidden" class="bNo" value="${ b.boardNo }">${ b.boardNo }
								</td>
								<td>${ b.boardTitle }</td>
								<td class="writer">${ b.nickName }</td>
								<td>${ b.createDate }</td>
								<td>${ b.symptCount }</td>
								<td>0</td>
		          			</tr>
	         			</c:forEach>
	          		</tbody>
	        	</table>
	       	</div>
	       	
	       	<!-- 페이징 -->
	       	<nav aria-label="Standard pagination example">
	        	<ul class="pagination justify-content-center">
		            <li class="page-item">
		            	<c:url var="goBack" value="${ loc }">
							<c:param name="page" value="${ pi.currentPage-1 }"/>
						</c:url>
		            	<a class="page-link" href="${ goBack }" aria-label="Previous">
		            		<span aria-hidden="true">&laquo;</span>
		              	</a>
		            </li>
		            <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
		            	<c:url var="goNum" value="${ loc }">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
		            </c:forEach>
		            <li class="page-item">
		            	<c:url var="goNext" value="${ loc }">
							<c:param name="page" value="${ pi.currentPage+1 }"/>
						</c:url>
						<a class="page-link" href="${ goNext }" aria-label="Next">
		            		<span aria-hidden="true">&raquo;</span>
		            	</a>
		            </li>
		    	</ul>
	        </nav>
	        
	        <div class="py-4">
	        	<table class="mx-auto">
		        	<tr>
		        		<td>
				        	<select class="form-select form-select-sm" aria-label=".form-select-sm example" style="width: 120px; text-align: center;">
				        		<option>--------</option>
				        		<option>제목</option>
				        		<option>내용</option>
				        		<option>작성자</option>
				        	</select>
		        		</td>
		        		<td>
				        	<form class="d-flex" role="search">
				        		<input class="form-control me-2" style="width: 300px;" type="search" placeholder="Search" aria-label="Search">
				        		<button class="btn btn-outline-primary" type="submit">검색</button>
				        	</form>
				        </td>
				    </tr>
		        </table>
	        </div>
		</div>
	</main>
	
	<div class="modal fade" tabindex="-1" role="dialog" id="modalChoice">
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
	
	<footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>
	
	<script>
		$(function(){
			$('#list1').addClass('list-click');
			$('#list1').click(function(){
				$(this).toggleClass('list-click');
				$('#list2').removeClass('list-click');
				$('#list3').removeClass('list-click');
			});
			$('#list2').click(function(){
				$(this).toggleClass('list-click');
				$('#list1').removeClass('list-click');
				$('#list3').removeClass('list-click');
			});
			$('#list3').click(function(){
				$(this).toggleClass('list-click');
				$('#list1').removeClass('list-click');
				$('#list2').removeClass('list-click');
			});
		})
		
		window.onload = () => {
			const loginModal = document.getElementById('loginModal');
			if(loginModal != null){
				loginModal.addEventListener('click', ()=>{
					$('#modalChoice').modal('show');
				});
			}
			
			const table = document.getElementsByClassName('table');
			for(const tr of table){
				tr.addEventListener('click', function(){
					const bNo = this.querySelector('.bNo').value;
					console.log(bNo);
					const writer = this.querySelector('.writer').innerText;
					console.log(writer);
					location.href='${contextPath}/selectCommuBoard.co?bNo=' + bNo + '&writer=' + writer + '&page=' + ${pi.currentPage};
				});
			}
		}
	</script>
</body>
</html>