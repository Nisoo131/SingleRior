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


</style>
</head>
<body>
	<header>
		<jsp:include page="../common/top.jsp"/>
	</header>
	<section>
		<h1 style="text-align:left">주문취소/환불 내역</h1><br><br>
		<div class="orderCancelProduct done">
			<span>주문번호 : 000-1111-123456</span>&nbsp;&nbsp;&nbsp;
			<span>주문일자 : 2022-02-12</span>&nbsp;&nbsp;&nbsp;
			<span>환불일자 : 2022-02-12</span>
			<h4><span class="badge" style="background:#008cd4; color:white; float:right">환불완료</span></h4>
			<table class="table">
			    <tr>
			      <td scope="row" colspan="4"></td>
			    </tr>
			    <tr height="15">
			    	<td scope="row" width="250" rowspan="3"><img src="${ contextPath }/resources/image/babychicken.png" width="160"></td>
			     	<td>상품</td>
			      	<td>옵션</td>
			      	<td>상품 금액</td>
			   	</tr>
			   	<tr>
			     	<td>
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
			<table class="table">
				<tr height="50">
					<td width="250">취소 사유: </td>
					<td width="150">환불 금액: </td>
					<td width="150">환불 배송비: </td>
					<td width="150">총 환불 금액: </td>
				</tr>
			</table>
		</div><br><br>
		<div class="orderCancelProduct ing">
			<span>주문번호 : 000-1111-123456</span>&nbsp;&nbsp;&nbsp;
			<span>주문일자 : 2022-02-12</span>
			<h4><span class="badge bg-secondary" style="float:right">환불 진행중</span></h4>
			<table class="table">
			    <tr>
			      <td scope="row" colspan="4"></td>
			    </tr>
			    <tr height="15">
			    	<td scope="row" width="250" rowspan="3"><img src="${ contextPath }/resources/image/babychicken.png" width="160"></td>
			     	<td>상품</td>
			      	<td>옵션</td>
			      	<td>상품 금액</td>
			   	</tr>
			   	<tr>
			     	<td>
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
			<table class="table">
				<tr height="50">
					<td width="250">취소 사유: </td>
					<td width="150">예상 환불 금액: </td>
					<td width="150">예상 환불 배송비: </td>
					<td width="150">총 환불 금액: </td>
				</tr>
			</table>
		</div><br><br>
	</section>
	<footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>
	
	
</body>
</html>