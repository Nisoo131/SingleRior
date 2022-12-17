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
	#category{width:100px; float:right;}
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
		<div class="col mb-3" id="categoryDiv">
			<select class="form-select form-select-sm" name="category" id="category">
				<option selected>전체</option>
				<option >싱글벙글</option>
				<option>싱글마켓</option>
			</select>
		</div>
		<br><br><br>
		<div>
			<div class="card">
				<div class="card-header">집 밖에 나가기 너무 귀찮아요</div>
				<div class="card-body">
					<p>저두요..</p>
					<span style="float:right">2022-10-13</span>
				</div>
			</div>
			<br><br>
			<div class="card">
				<div class="card-header">집 밖에 나가기 너무 귀찮아요</div>
				<div class="card-body">
					<p>저두요..</p>
					<span style="float:right">2022-10-13</span>
				</div>
			</div>
			<br><br>
			<div class="card">
				<div class="card-header">집 밖에 나가기 너무 귀찮아요</div>
				<div class="card-body">
					<p>저두요..</p>
					<span style="float:right">2022-10-13</span>
				</div>
			</div>
			<br>
			<br>
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