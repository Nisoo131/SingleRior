<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>
	<header class="sticky-top">
		<div>
			<jsp:include page="../common/top.jsp"/>
		</div>
	</header>
	
	<main>
  		<div class="container d-flex flex-wrap css-title my-5" style="padding-left: 60px;">
  			<h1>공지사항</h1>
  		</div>
  		
  		<div class="container px-5 bd-example-snippet bd-code-snippet" style="padding-bottom: 20px; text-align: center;">
  			<div class="bd-example">
				<table class="table table-hover">
					<thead>
						<tr class="fs-5">
							<th width="100px">카테고리</th>
							<th>글 제목</th>
							<th width="130px">작성일</th>
		          		</tr>
		          	</thead>
	         		<tbody>
	          			<tr>
							<td>[싱글벙글]</td>
							<td><a href="${ contextPath }/selectNotiBoard.no">이곳은 모두가 함께 사용하는 공간입니다. 타인에게 매너를 지켜주세요.</a></td>
							<td>2022-12-06</td>
	          			</tr>
	          			<tr>
							<td>[싱글벙글]</td>
							<td>글 작성 시 개인정보 유출에 주의 바랍니다.</td>
							<td>2022-12-06</td>
	          			</tr>
	          			<tr>
							<td></td>
							<td>이곳은 모두가 함께 사용하는 공간입니다. 타인에게 매너를 지켜주세요.</td>
							<td>2022-12-06</td>
	          			</tr>
	          			<tr>
							<td></td>
							<td>글 작성 시 개인정보 유출에 주의 바랍니다.</td>
							<td>2022-12-06</td>
	          			</tr>
	          			<tr>
							<td>[씽씽마켓]</td>
							<td>이곳은 모두가 함께 사용하는 공간입니다. 타인에게 매너를 지켜주세요.</td>
							<td>2022-12-06</td>
	          			</tr>
	          			<tr>
							<td>[씽씽마켓]</td>
							<td>글 작성 시 개인정보 유출에 주의 바랍니다.</td>
							<td>2022-12-06</td>
	          			</tr>
	          			<tr>
							<td>[싱글벙글]</td>
							<td>이곳은 모두가 함께 사용하는 공간입니다. 타인에게 매너를 지켜주세요.</td>
							<td>2022-12-06</td>
	          			</tr>
	          			<tr>
							<td>[싱글벙글]</td>
							<td>글 작성 시 개인정보 유출에 주의 바랍니다.</td>
							<td>2022-12-06</td>
	          			</tr>
	          			<tr>
							<td></td>
							<td>이곳은 모두가 함께 사용하는 공간입니다. 타인에게 매너를 지켜주세요.</td>
							<td>2022-12-06</td>
	          			</tr>
	          			<tr>
							<td></td>
							<td>글 작성 시 개인정보 유출에 주의 바랍니다.</td>
							<td>2022-12-06</td>
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
		</div>
	</main>
	
	<footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>
</body>
</html>