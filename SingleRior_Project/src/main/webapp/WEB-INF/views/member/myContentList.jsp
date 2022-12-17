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
	tr:hover{cursor:pointer}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/top.jsp"/>
	</header>
	<nav class="navbar navbar-expand-lg" id="navMyContent">
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-link active" aria-current="page" style="color: #008cd4" onclick="location.href='${contextPath}/myContentList.me'">나의 게시글</a>
				<a class="nav-link" onclick="location.href='${contextPath}/myReplyList.me'">나의 댓글</a>
			</div>
		</div>
	</nav>
	<section>
		<div class="col mb-3" id="categoryDiv">
			<select class="form-select form-select-sm" name="category" id="category">
				<option <c:if test="${category != '싱글벙글' && category != '씽씽마켓'}">selected</c:if>>전체</option> 
				<option <c:if test="${category == '싱글벙글'}">selected</c:if>>싱글벙글</option>
				<option <c:if test="${category == '씽씽마켓'}">selected</c:if>>씽씽마켓</option>
			</select>
		</div>
		<br><br><br>
		<div style="text-align:center;" class="divAppendClone">
			<div class="bd-example cList">
				<table class="table table-hover">
					<thead>
						<tr class="fs-5">
							<th width="100px">카테고리</th>
							<th>글 제목</th>
							<th width="130px">작성일</th>
							<th width="70px">좋아요</th>
							<th width="70px">댓글</th>
						</tr>
					</thead>
					<c:if test="${ !empty bList }">
						<tbody class="tbody">
							<c:forEach items="${ bList }" var="b">
								<tr>
									<c:if test="${ b.boardType == 2 }">
										<td class="category">싱글벙글</td>
									</c:if>
									<c:if test="${ b.boardType == 3 }">
										<td class="category">씽씽마켓</td>
									</c:if>
									<td class="boardTitle">${ b.boardTitle}</td>
									<td class="modifyDate">${ b.modifyDate}</td>
									<td class="likeCount">${ b.likeCount}</td>
									<td class="replyCount">${ b.replyCount}</td>
									<td style="display: none">${ b.boardNo }</td>
								</tr>
							</c:forEach>
						</tbody>
					</c:if>
				</table>
				<c:if test="${ empty bList }">
					<div class="alert alert-secondary" role="alert">아직 작성하신 게시글이
						없습니다.</div>
				</c:if>
			</div>
			<br> <br>
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
	
	<!--  클론할 부분 -->
	<div class="bd-example clone" style="display:none">
				<table class="table table-hover">
					<thead>
						<tr class="fs-5">
							<th width="100px">카테고리</th>
							<th>글 제목</th>
							<th width="130px">작성일</th>
							<th width="70px">좋아요</th>
							<th width="70px">댓글</th>
						</tr>
					</thead>
					<c:if test="${ !empty bList }">
						<tbody class="tbody">
							<c:forEach items="${ bList }" var="b">
								<tr>
									<c:if test="${ b.boardType == 2 }">
										<td class="category">싱글벙글</td>
									</c:if>
									<c:if test="${ b.boardType == 3 }">
										<td class="category">씽씽마켓</td>
									</c:if>
									<td class="boardTitle"></td>
									<td class="modifyDate"></td>
									<td class="likeCount"></td>
									<td class="replyCount"></td>
									<td style="display: none" class="boardNo"></td>
								</tr>
							</c:forEach>
						</tbody>
					</c:if>
				</table>
				<c:if test="${ empty bList }">
					<div class="alert alert-secondary" role="alert">아직 작성하신 게시글이
						없습니다.</div>
				</c:if>
			</div>
							
	<footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>
	
	<script>
	window.onload = () =>{
		const tbody = document.querySelector('tbody');
		const trs = tbody.querySelectorAll('tr');
		for(const tr of trs) {
// 			console.log(tr);
			tr.addEventListener('click', function(){
				
				const cate = this.childNodes[1].innerText;
				const boardNo = this.childNodes[11].innerText;
				const writer = '${loginUser.nickName}';
				if(cate == "싱글벙글"){
					location.href='${contextPath}/selectCommuBoard.co?bNo=' + boardNo + '&writer=' + writer + '&page=' + ${pi.currentPage};
				}else if(cate == "씽씽마켓")
					location.href='${contextPath}/marketBoardDetail.ma?bNo=' + boardNo  +'&boardWriter=' + writer + '&page=' + ${pi.currentPage};
			});
		}
	}
	
	$(function(){
		var cloneDiv = $('.clone').clone();
		
		$('select[name=category]').change(function(){
			
			let category = $('select[name=category]').val();
			console.log(category);
			const page = '${pi.currentPage}';
// 			$.ajax({
// 				url : '${contextPath}/selectCategory.me',
// 				data : {category:category,page:page},
// 				success: (data) =>{
// 					console.log(data);
// 					$(".cList").html("");
// 					for(var i=0 ; i<data.length; i++){
// 						cloneDiv.prop("style").removeProperty("display");
// 						if(data[i].boardType == 2){
// 							cloneDiv.find(".category").text('싱글벙글');
// 						}else{
// 							cloneDiv.find(".category").text('씽씽마켓');
// 						}
// 						cloneDiv.find(".boardTitle").text(data[i].boardTitle);
// 						cloneDiv.find(".modifyDate").text(data[i].modifyDate);
// 						cloneDiv.find(".likeCount").text(data[i].likeCount);
// 						cloneDiv.find(".replyCount").text(data[i].replyCount);
// 						cloneDiv.find(".boardNo").text(data[i].boardNo);
						
// 					}
// 						$(".divAppendClone").prepend(cloneDiv.html());
// 				},
// 				error:(data)=>{
// 					console.log(data);
// 				}
// 			});
			location.href='${contextPath}/selectCategory.me?category=' + category + '&page=' + ${pi.currentPage};
		})
	});
	</script>
</body>
</html>