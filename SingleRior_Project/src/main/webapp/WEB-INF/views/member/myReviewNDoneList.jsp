<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
	#navReview{
		margin:auto;
		margin-top:70px;
		max-width:1500px;
		font-size:30px;
		cursor:pointer;
	}
	table{
		word-break:break-all;
	}
	tr{font-size:20px;}
  	.reviewContent div{margin:auto; text-align:center; font-size:20px;}  
	img:hover{cursor:pointer;}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/top.jsp"/>
	</header>
	<nav class="navbar navbar-expand-lg" id="navReview">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<span class="nav-link" onclick="location.href='${contextPath}/myReviewDoneList.me'">내가 작성한 리뷰</span>
					<span class="nav-link active" aria-current="page" style="color:#008cd4" onclick="location.href='${contextPath}/myReviewNDoneList.me'">작성 가능한 리뷰</span> 
				</div>
			</div>
		</div>
	</nav>
	<section>
		<c:if test="${ !empty orList  }">
			<c:forEach items="${orList }" var="o">
				<div class="orderCancelProduct done">
					<span>주문번호 : ${ o.orderNo }</span>&nbsp;&nbsp;&nbsp;
					<span>주문일자 : ${ o.orderDate }</span>&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#orderRatingModal" style="background:#008cd4; color:white; float:right">리뷰작성</button>
					<table class="table">
					    <tr>
					      <td scope="row" colspan="4"></td>
					    </tr>
					    <tr height="15">
					    	<td scope="row" width="150" rowspan="2" class="trReview">
					    		<img class='img' src="${ contextPath }/resources/uploadFiles/${o.imgRename}" width="160">
					    		<input type="hidden" name="productNo" value="${o.productNo}">
					    	</td>
					     	<td width="200">상품</td>
					      	<td width="200">옵션</td>
					      	<td width="200">상품 금액</td>
					   	</tr>
					   	<tr>
					     	<td height='100'>
					      		<div>${o.boardTitle}</div>
					      	</td>
					      	<td>
								<div>${o.productOption}</div>		      
					      	</td>
					      	<td>
					      		<div><fmt:formatNumber value="${o.salePrice}" pattern="#,###"/>원</div>
					      	</td>
					   	</tr>
					</table>
					<div class="reviewContent">
						<div>아직 리뷰를 작성하지 않으셨습니다.</div>
						<div>이 제품의 리뷰를 남겨주세요.</div>
					</div>
					<hr>
					<br><br><br><br>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${ empty orList  }">
			<div class="alert alert-secondary" role="alert">
  				작성하실 리뷰가 없습니다.
			</div>
		</c:if>
		<c:if test="${ !empty orList  }">
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
			</c:if>
			
	<!-- 리뷰 작성 모달창 -->
	<div class="modal fade" id="orderRatingModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<form name="" id="" action="" method="post">
							<div class="modal-header">
								<h3 style="color:#008cd4">여러분의 리뷰를 작성해주세요</h3>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="mb-3">
  									<label for="formFile" class="form-label">제품의 사진을 올려주세요.</label>
  									<input class="form-control" type="file" id="formFile">
								</div>
								<div>
									<textarea class="form-control" placeholder="여러분의 리뷰를 작성해주세요." id="boardContent" name="boardContent" style="height: 300px; resize:none;"></textarea>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-light" data-bs-dismiss="modal">창 닫기</button>
								<button type="submit" class="btn btn-outline-light" style="background:#008cd4; color:white" id="reviewSubmit">리뷰 작성하기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
	</section>
	<footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>
	
	<script>
	window.onload = () =>{
		var imgs = document.getElementsByClassName("img");
// 		console.log(imgs);
		for(img of imgs){
			img.addEventListener('click',function(){
				const productNo= this.parentNode.childNodes[3].value;
				console.log(productNo);
				
				location.href='${contextPath}/productDetail.st?productNo=' + productNo;
			})
		}
	}	
	</script>
	
	
</body>
</html>