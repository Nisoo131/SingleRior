<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.inquiry{
		margin-top:70px; 
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	.title{margin:auto;
		margin-top:70px;
		max-width:1000px;}
		
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/top.jsp"/>
	</header>
	<section>
			<h1 class="title" style="color: #008cd4">상품 문의</h1>
		<div class="inquiry">
			<c:if test="${! empty iList }">
		 		<c:forEach items="${ iList }" var="i">
			 		<div style="border:black solid 1px; width:600px; padding:10px 10px; border-radius:10px;">
				        <p class="blog-post-meta">${i.inquiryTitle} | 
					        <c:if test="${ i.inquiryAnswer == null }">
					        	<span style="color:#008cd4;">답변대기</span>
					        </c:if>
					        <c:if test="${ i.inquiryAnswer != null }">
					        	<span style="color:#008cd4;">답변완료</span>
					        </c:if>
					        </p>
						<p> ${i.memberId} | ${i.inquiryDate}</p>
						<p><img src="https://cdn-icons-png.flaticon.com/512/8371/8371275.png" width="20px" height="20px"> ${ i.inquiryContent }</p>
						<p><img src="https://cdn-icons-png.flaticon.com/512/25/25628.png" width="20px" height="20px"> ${ i.inquiryAnswer }</p>
			    	</div>
		    	<br>
		    	</c:forEach>
			</c:if>
		</div>
	</section>
	<br><br>
	<c:if test="${! empty iList }">
		<nav aria-label="Standard pagination example">
			<ul class="pagination justify-content-center">
			    <c:if test="${ pi.currentPage > 1 }">
				<li class="page-item"><c:url var="goBack" value="${ loc }">
						<c:param name="page" value="${ pi.currentPage-1 }" />
						<c:param name="productNo" value="${ iList[0].productNo }" />
					</c:url> <a class="page-link" href="${ goBack }" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
				</a></li>
				</c:if>
				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
					<c:url var="goNum" value="${ loc }">
						<c:param name="page" value="${ p }" />
						<c:param name="productNo" value="${ iList[0].productNo }" />
					</c:url>
					<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
				</c:forEach>
				<c:if test="${ pi.currentPage < pi.maxPage }">
				<li class="page-item"><c:url var="goNext" value="${ loc }">
						<c:param name="page" value="${ pi.currentPage+1 }" />
						<c:param name="productNo" value="${ iList[0].productNo }" />
					</c:url> <a class="page-link" href="${ goNext }" aria-label="Next"> <span
						aria-hidden="true">&raquo;</span>
				</a></li>
				</c:if>
			</ul>
		</nav>
	</c:if>
	<footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>
</body>
</html>