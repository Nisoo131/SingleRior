<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div class="orderCancelProduct done">
			<span>주문번호 : 000-1111-123456</span>&nbsp;&nbsp;&nbsp;
			<span>주문일자 : 2022-02-12</span>&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#orderRatingModal" style="background:#008cd4; color:white; float:right">리뷰작성</button>
			<table class="table">
			    <tr>
			      <td scope="row" colspan="4"></td>
			    </tr>
			    <tr height="15">
			    	<td scope="row" width="250" rowspan="2" class="trReview">
			    		<img src="${ contextPath }/resources/image/babychicken.png" width="160">
			    	</td>
			     	<td>상품</td>
			      	<td>옵션</td>
			      	<td>상품 금액</td>
			   	</tr>
			   	<tr>
			     	<td height='100'>
			      		<div>병아리 인형</div>
			      	</td>
			      	<td>
						<div>색상 : 노란색</div>		      
			      	</td>
			      	<td>
			      		<div>12500원</div>
			      	</td>
			   	</tr>
			</table>
			<div class="reviewContent">
				<div>아직 리뷰를 작성하시 않으셨습니다.</div>
				<div>이 제품의 리뷰를 남겨주세요.</div>
			</div>
			<hr>
			<br><br><br><br>
		</div>
		
		
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
	
	
</body>
</html>