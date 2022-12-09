<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div class="orderCancelProduct done">
			<span>문의일자 : 2022-02-12</span>&nbsp;&nbsp;&nbsp;
			<h4><span class="badge" style="background:#008cd4; color:white; float:right">답변대기</span></h4>
			<table class="table">
			    <tr>
			      <td scope="row" colspan="4"></td>
			    </tr>
			    <tr height="15">
			    	<td scope="row" width="250" rowspan="3"><img src="${ contextPath }/resources/image/babychicken.png" width="160"></td>
			    	<td>
			    	<span>병아리 인형</span><br><br>
			    	<span>문의 유형 : 배송</span>
			    	</td>
			   	</tr>
			</table>
			<div>
			<span>Q. 병아리인형이 노란색이 아니고 핑크색인데 이게 말이 되나요?..굉장히 화가 나네요ㅡㅡ!!</span>
			</div>
		</div><br><br>
	</section>
	<footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>
</body>
</html>