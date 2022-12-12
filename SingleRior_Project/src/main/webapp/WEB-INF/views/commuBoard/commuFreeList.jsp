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
  			<span class="px-4">자유 게시글</span>
  		</div>
  		<div class="container d-flex flex-wrap" style="padding-left: 50px; padding-bottom: 40px; font-size: 20px;">
  			<span class="px-4">주제 제한 없이 자유롭게 작성한 게시글 입니다.</span>
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
			  	
			  	<div class="col-md-2 py-2" style="text-align: center;">
			  		<button class="w-100 btn btn-outline-primary btn-lg" type="button" onclick="location.href='${ contextPath }/insertCommuBoard.co'">게시글 작성</button>
			  	</div>
			</div>
  		</div>
  		
  		<div class="container px-5 bd-example-snippet bd-code-snippet" style="padding-bottom: 20px; text-align: center;">
  			<div class="bd-example">
				<table class="table table-hover">
					<thead>
						<tr class="fs-5">
							<th width="100px">카테고리</th>
							<th>글 제목</th>
							<th width="130px">작성일</th>
							<th width="70px">공감</th>
							<th width="70px">댓글</th>
		          		</tr>
		          	</thead>
	         		<tbody>
	          			<tr>
							<th>[공지]</th>
							<th>이곳은 모두가 함께 사용하는 공간입니다. 타인에게 매너를 지켜주세요.</th>
							<th>2022-12-06</th>
							<th>0</th>
							<th>0</th>
	          			</tr>
	          			<tr>
							<th>[공지]</th>
							<th>글 작성 시 개인정보 유출에 주의 바랍니다.</th>
							<th>2022-12-06</th>
							<th>0</th>
							<th>0</th>
	          			</tr>
	          			<tr>
							<td>[자유]</td>
							<td>배가 너무 아픈데 주변에 약국이 다 문을 닫았어요..ㅜㅜ</td>
							<td>2022-12-06</td>
							<td>0</td>
							<td>0</td>
	          			</tr>
	          			<tr>
							<td>[자유]</td>
							<td>오늘 롯데월드 갔다왔는데 사람 너무 많았음;;;;;;</td>
							<td>2022-12-06</td>
							<td>0</td>
							<td>0</td>
	          			</tr>
	          			<tr>
							<td>[자유]</td>
							<td>WW 침대 프레임이랑 XX 매트리스 호환되나요? 아시는 분?</td>
							<td>2022-12-06</td>
							<td>0</td>
							<td>0</td>
	          			</tr>
	          			<tr>
							<td>[자유]</td>
							<td>하 집 가고 싶다......^^</td>
							<td>2022-12-06</td>
							<td>0</td>
							<td>0</td>
	          			</tr>
	          			<tr>
							<td>[자유]</td>
							<td>자꾸 하수구에서 냄새가 올라오는데 어케 해야하나요?</td>
							<td>2022-12-06</td>
							<td>0</td>
							<td>0</td>
	          			</tr>
	          			<tr>
							<td>[자유]</td>
							<td>배가 너무 아픈데 주변에 약국이 다 문을 닫았어요..ㅜㅜ</td>
							<td>2022-12-06</td>
							<td>0</td>
							<td>0</td>
	          			</tr>
	          			<tr>
							<td>[자유]</td>
							<td>오늘 롯데월드 갔다왔는데 사람 너무 많았음;;;;;;</td>
							<td>2022-12-06</td>
							<td>0</td>
							<td>0</td>
	          			</tr>
	          			<tr>
							<td>[자유]</td>
							<td>WW 침대 프레임이랑 XX 매트리스 호환되나요? 아시는 분?</td>
							<td>2022-12-06</td>
							<td>0</td>
							<td>0</td>
	          			</tr>
	          			<tr>
							<td>[자유]</td>
							<td>하 집 가고 싶다......^^</td>
							<td>2022-12-06</td>
							<td>0</td>
							<td>0</td>
	          			</tr>
	          			<tr>
							<td>[자유]</td>
							<td>자꾸 하수구에서 냄새가 올라오는데 어케 해야하나요?</td>
							<td>2022-12-06</td>
							<td>0</td>
							<td>0</td>
	          			</tr>
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
	</script>
</body>
</html>