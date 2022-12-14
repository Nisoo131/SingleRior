<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script> 
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<style>
	.front{margin: 10px 300px}
</style>
<body>
	<header class="sticky-top">
		<div>
			<jsp:include page="../storeBoard/navbar.jsp"/>
		</div>
	</header>
	
	<!-- 대분류/소분류 구분 -->
	${ sList }  
	${ aList }  
	
 	<div class="front">
		<h5><b>전체 > 가구 > 침대 </b></h5>
			<h3><b> 침대 </b></h3>
		
		<div id="selectOption" dir="rtl">
			<select style="width:100px; height:30px;">
			  <option selected>인기순</option>
			  <option value="1">최신순</option>
			  <option value="2">낮은 가격순</option>
			  <option value="3">높은 가격순</option>
			</select>
		</div>
		<br>
	
	<!-- 상품카드 12개 -->
		
		 <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-4">
		  <c:forEach items="${ sList }" var="s">
		    <div class="col-3">
		      <div class="card">
		        <img src="resources/uploadFiles/${ a.imgRename }" width="100%" height="225">
		         <div class="card-body">
		          <h6 class="card-title">${ s.brand } </h6>
		          <h5 class="card-text">${ s.boardTitle }</h5>
		          <span style="width:20px">${ s.discount }%</span><span>　</span><span>${ s.price }</span><br>
		          <span>★4.9</span>
		        </div>
		      </div>
		    </div>
		   </c:forEach>
		</div>
	</div>
 
	<footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>  	
	
</body>
</html>