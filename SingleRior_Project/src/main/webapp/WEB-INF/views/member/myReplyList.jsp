<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section{
		margin:auto;
		margin-top:70px;
		max-width:1500px;
	}
	#navMyContent{
		margin:auto;
		margin-top:70px;
		max-width:1500px;
		font-size:30px;
		cursor:pointer;
	}
	.dropdown{float:right;}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/top.jsp"/>
	</header>
	<nav class="navbar navbar-expand-lg" id="navMyContent">
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-link" onclick="location.href='${contextPath}/myContentList.me'">나의 게시글</a>
				<a class="nav-link active" aria-current="page" style="color:#008cd4" onclick="location.href='${contextPath}/myReplyList.me'">나의 댓글</a>
			</div>
		</div>
	</nav>
	<section>
	<div class="dropdown">
			<button class="btn btn-secondary dropdown-toggle" type="button"
				data-bs-toggle="dropdown" aria-expanded="false">카테고리 선택</button>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item" href="#">전체</a></li>
				<li><a class="dropdown-item" href="#">싱글벙글</a></li>
				<li><a class="dropdown-item" href="#">싱글마켓</a></li>
			</ul>
		</div>
		<br><br><br><br>
	<div class="container" style="text-align: center; padding:0;">
			<div class="bd-example">
				<table class="table table-hover">
					<thead>
						<tr class="fs-5">
							<th width="100px">카테고리</th>
							<th>댓글 내용</th>
							<th width="130px">작성일</th>
							<th width="70px">공감</th>
							<th width="70px">댓글</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>싱글벙글</td>
							<td>배가 너무 아픈데 주변에 약국이 다 문을 닫았어요..ㅜㅜ</td>
							<td>2022-12-06</td>
							<td>0</td>
							<td>0</td>
						</tr>
						<tr>
							<td>씽씽마켓</td>
							<td>이번에 가습기 하나 장만했는디 가성비 좋네여!!!</td>
							<td>2022-12-06</td>
							<td>0</td>
							<td>0</td>
						</tr>
					</tbody>
				</table>
			</div>
			<br><br>
			<!-- 페이징 -->
			<nav aria-label="Standard pagination example">
				<ul class="pagination justify-content-center">
					<li class="page-item"><c:url var="goBack" value="${ loc }">
							<c:param name="page" value="${ pi.currentPage-1 }" />
						</c:url> <a class="page-link" href="${ goBack }" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
					</a></li>
					<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						<c:url var="goNum" value="${ loc }">
							<c:param name="page" value="${ p }" />
						</c:url>
						<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
					</c:forEach>
					<li class="page-item"><c:url var="goNext" value="${ loc }">
							<c:param name="page" value="${ pi.currentPage+1 }" />
						</c:url> <a class="page-link" href="${ goNext }" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</section>
	<footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>
</body>
</html>