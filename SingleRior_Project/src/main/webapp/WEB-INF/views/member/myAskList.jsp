<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#navAsk{
		margin:auto;
		margin-top:70px;
		max-width:1500px;
		font-size:30px;
		cursor:pointer;
	}
	section{
		margin:auto;
		margin-top:70px;
		max-width:1500px;
	}
	.myAskListDiv{cursor:pointer;}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/top.jsp"/>
	</header>
	<nav class="navbar navbar-expand-lg" id="navAsk">
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a class="nav-link" aria-current="page" onclick="location.href='${contextPath}/myAskList.me'" style="color:#008cd4">답변 미완료 문의</a>
					<a class="nav-link"onclick="location.href='${contextPath}/myAskDoneList.me'">답변 완료 문의</a>
				</div>
			</div>
	</nav>
	<section>
		<h1 style="text-align:left">나의 문의</h1><br><br>
			<c:if test="${ ! empty piList }">
				<c:forEach items="${ piList }" var="pi" varStatus="a">
					<div class="myAskListDiv">
						<span>문의일자 : ${pi.inquiryDate}</span>&nbsp;&nbsp;&nbsp;
						<span class="badge" style="background:#008cd4; color:white; float:right">답변대기</span>
						<div style="display:none" class="bNo">${pList[a.index].productNo}</div>
						<table class="table">
						    <tr>
						      <td scope="row" colspan="4"></td>
						    </tr>
						    <tr height="15">
						    	<td scope="row" width="250" rowspan="3"><img src="${ contextPath }/resources/uploadFiles/${aList[a.index].imgRename}" width="160"></td>
						    	<td>
							    	<span>${pList[a.index].productName}</span><br><br><br>
							    	<br><br><br>
							    	<div>
								    	<span>문의 유형 : ${pi.inquiryTitle}</span><br><br>
										<span>Q. &nbsp;&nbsp;${pi.inquiryContent}</span>
									</div>
						    	</td>
						   	</tr>
						</table>
					</div><br><br>
				</c:forEach>
			</c:if>
			<c:if test="${ empty piList }">
			<div class="alert alert-secondary" role="alert">
  				문의가 없습니다.
			</div>
			</c:if>
		<nav aria-label="Standard pagination example">
				<ul class="pagination justify-content-center">
					<li class="page-item"><c:url var="goBack" value="${ loc }">
							<c:param name="page" value="${ pi.currentPage-1 }" />
							<c:param name="category" value="${ category }"/>
						</c:url> <a class="page-link" href="${ goBack }" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
					</a></li>
					<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						<c:url var="goNum" value="${ loc }">
							<c:param name="page" value="${ p }" />
							<c:param name="category" value="${ category }"/>
						</c:url>
						<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
					</c:forEach>
					<li class="page-item"><c:url var="goNext" value="${ loc }">
							<c:param name="page" value="${ pi.currentPage+1 }" />
							<c:param name="category" value="${ category }"/>
						</c:url> <a class="page-link" href="${ goNext }" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
	</section>
	<footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>
	
	<script>
	window.onload = () =>{
		const cardDivs = document.getElementsByClassName('myAskListDiv');
		
		for(cardDiv of cardDivs){
			cardDiv.addEventListener('click',function(){
				const bNo = this.childNodes[5].innerText;
				console.log(bNo);
				location.href='${contextPath}/productDetail.st?productNo=' + bNo + '&page=' + ${pi.currentPage};
			});
		}
		
	}
		
	</script>
</body>
</html>