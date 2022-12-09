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
	#cart{
 	margin:auto; 
 	margin-top:50px; 
 	max-width:1500px;
 	padding:30px;
	background-color:#F5F5F5;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
	}
	
	#cartDetail{
		margin:auto;
 		margin-top:30px;
 		max-width:1400px;
	}

	#deleteItem{
		float:right;	
	}

	table tr:nth-child(n+2){
		text-align:center;
	}
	table tr:nth-child(n+3){
		margin-top:20px;
	}
	#cart div{
		margin:0 auto;
	}
	#pay{
		padding:50px;
		text-align:center;
		font-size:30px;
	}
	#pay table{
		display: flex; 
		flex-direction: row;
        justify-content: center;
        align-items: center;
	}

</style>
</head>
<body>
	<header>
		<jsp:include page="../common/top.jsp"/>
	</header>
	<section>
		<h1 style="text-align:left">장바구니</h1><br><br>
			<input type='checkbox' name='animal' value='selectall'/>&nbsp;&nbsp;<h4 style="display:inline-block">전체선택</h4>
			<button id= "deleteItem" type="button" class="btn btn-light btn-sm" style="background:#008cd4; color:white">삭제</button>
		<div id="cart">
			<table class="table">
			    <tr>
			      <td scope="row" colspan="4"><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
			    </tr>
			    <tr height="15">
			    	<td scope="row" width="250" rowspan="2"><img src="${ contextPath }/resources/image/babychicken.png" width="160"></td>
			     	<td>상품
			      	</td>
			      	<td>옵션	      
			      	</td>
			      	<td>상품 금액
			      	</td>
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
			<br>
			<table class="table">
			    <tr>
			      <td scope="row" colspan="4"><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
			    </tr>
			    <tr height="15">
			    	<td scope="row" width="250" rowspan="2"><img src="${ contextPath }/resources/image/babychicken.png" width="160"></td>
			     	<td>상품
			      	</td>
			      	<td>옵션	      
			      	</td>
			      	<td>상품 금액
			      	</td>
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
			<br>
			<table class="table">
			    <tr>
			      <td scope="row" colspan="4"><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
			    </tr>
			    <tr height="15">
			    	<td scope="row" width="250" rowspan="2"><img src="${ contextPath }/resources/image/babychicken.png" width="160"></td>
			     	<td>상품
			      	</td>
			      	<td>옵션	      
			      	</td>
			      	<td>상품 금액
			      	</td>
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
		</div>
		<div id="pay">
			<table>
				<tr>
					<td width="300px;">선택상품금액<br>
						<div>12500원</div>
					</td>
					<td width="200px;">+
					</td>
					<td width="300px;">총배송비
						<div>2,500원</div>
					</td>
					<td width="300px;">총 주문금액</td>
					<td style="font-size:40px; color:#008cd4">15,000원</td>
				</tr>
			</table>
		</div>
	</section>
	<footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>
</body>
</html>