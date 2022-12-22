<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section{margin:auto;margin-top:70px;max-width:1500px;}
	.table{
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
	#cartDetail{margin:auto;margin-top:30px;max-width:1400px;}
	#deleteItem{float:right;}
	table tr:nth-child(n+2){text-align:center;}
	table tr:nth-child(n+3){margin-top:20px;}
	#cart div{margin:0 auto;}
	#pay{padding:50px;text-align:center;font-size:30px;}
	#pay table{display: flex;flex-direction: row;justify-content: center;align-items: center;}
	.bottomNone{border-bottom: none;}

</style>
</head>
<body>
	<header>
		<jsp:include page="../common/top.jsp"/>
	</header>
	<section>
		<h1 style="text-align:left">장바구니</h1><br><br>
			<input type='checkbox' id='selectAll' value='selectall'/>&nbsp;&nbsp;<h4 style="display:inline-block" onclick="">전체선택</h4>
			<button id= "deleteItem" type="button" class="btn btn-light btn-sm" style="background:#008cd4; color:white">삭제</button>
		<div id="cart">
			<form>
				<c:if test="${ !empty cartList  }">
					<c:forEach items="${cartList }" var="cr">
						<table class="table">
						    <tr>
						      <td scope="row" colspan="4"><input class="checkbox form-check-input" type="checkbox" id="flexCheckDefault"></td>
						    </tr>
						    <tr height="15">
						    	<td scope="row" width="250" rowspan="2" class="bottomNone"><img src="${ contextPath }/resources/uploadFiles/${cr.imgRename }" width="160"></td>
						     	<td>상품
						      	</td>
						      	<td>옵션/수량	      
						      	</td>
						      	<td>상품 금액
						      	</td>
						   	</tr>
						   	<tr>
						     	<td class="bottomNone">
						      		<div>${cr.boardTitle }</div>
						      	</td>
						      	<td class="bottomNone">
									<div>옵션 : ${cr.productOption }</div>
									<div>수량 : ${cr.quantity }개</div>		      
						      	</td>
						      	<td class="bottomNone">
						      		<div>${cr.lastPrice }원</div>
						      	</td>
						   	</tr>
						</table>
					</c:forEach>
				</c:if>
			</form>
		</div>
		<div id="pay">
			<table>
				<tr>
					<td width="300px;">선택상품금액<br>
						<div>12500원</div>
					</td>
					<td width="200px;">+
					</td>
					<td width="300px;">배송비
						<div>2,500원</div>
					</td>
					<td width="300px;">총 주문금액</td>
					<td style="font-size:40px; color:#008cd4">15,000원</td>
				</tr>
			</table>
		</div>
		<div class="d-grid gap-2">
			  <button class="btn" type="button" style="background:#008cd4; color:white">구매하기</button>
		</div>
	</section>
	<footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>
	
	<script>
	
	$(function(){
		var tables = $('.table');
		console.log(tables)
		
		$('#selectAll').change(function(){
			if($("#selectAll").prop("checked")){
				$('.checkbox').prop("checked",true);
			}else {
				$('.checkbox').prop("checked",false);
			}
		})
		$('.checkbox').change(function(){
			if(!$(this).prop("checked")){
				$('#selectAll').prop("checked",false);
			}else if($('.checkbox').prop("checked")){
				$('#selectAll').prop("checked",true);
			}
		});
	
	})
	
	
	</script>
</body>
</html>