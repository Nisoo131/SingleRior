<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.btn:hover {
	color: #008cd4;
}
@font-face {
    font-family: 'BMJUA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
* {
	font-family: 'BMJUA';
}
	li a:hover {
		font-size: 20px;
}
</style>
</head>
<body>
	<jsp:include page="../common/top.jsp"/>
	<div style="background: #008cd4">
		<ul class="nav justify-content-center">
			<li class="nav-item"><a style="color: white;" class="nav-link active" href="marketNotiBoardList.ma?marketType=3&marketArray=${marketArray}&searchType=${searchType}&marketSear">공지</a></li>
			<li class="nav-item"><a style="color: white;" class="nav-link active" aria-current="page" href="marketBoardList.ma?marketType=1&marketArray=${marketArray}&searchType=${searchType}&marketSearch=${marketSearch}">같이사요</a></li>
			<li class="nav-item"><a style="color: white;" class="nav-link active" href="marketBoardList.ma?marketType=2&marketArray=${marketArray}&searchType=${searchType}&marketSearch=${marketSearch}">팝니다</a></li>
			<li class="nav-item"><a style="color: white;" class="nav-link active" href="marketBoardList.ma?marketType=3&marketArray=${marketArray}&searchType=${searchType}&marketSearch=${marketSearch}">삽니다</a></li>
		</ul>
	</div>
	
	
	
		<div class="container">
		<main>
			
			<div style="margin-left: 350px; margin-right: 350px; margin-top: 100px;">
				<form class="needs-validation" action="${ contextPath }/marketBoardUpdate.ma" method="POST" enctype="multipart/form-data" id="attmForm">
					
					<div class="row g-3">
					<h1 style="align-self: center;"><img alt="" src="https://cdn-icons-png.flaticon.com/512/595/595752.png" style="width: 40px; height: 40px; " >씽씽마켓</h1>
						<div class="col-12">
						<select name="marketType" class="form-select form-select-sm" aria-label=".form-select-sm example" style="width: 120px; margin-bottom: 15px;">
							<option value="1">같이사요</option>
							<option value="2">팝니다</option>
							<option value="3">삽니다</option>
						</select>
						
							<label for="boardTitle" class="form-label">TITLE</label>
							<input type="text" class="form-control" id="boardTitle" name="boardTitle" value="${mkBoard.boardTitle }">
							<label for="marketPrice" class="form-label">PRICE</label>
							<input type="number" class="form-control" id="marketPrice" name="marketPrice" value="${mkBoard.marketPrice }">
							<label for="marketPrice" class="form-label">lOCATION</label>
							<input type="text"  class="form-control" id="location" name="location" value="${mkBoard.location }">
						</div>
						

						<div class="col-12">
							<div class="input-group">
					          <textarea class="form-control" rows="10" name="boardContent" style="resize: none;">${mkBoard.boardContent }</textarea>
					        </div>
						</div>
						
						<div>
							<c:forEach items="${mkAList }" var="a">
								
									<a href="${contextPath }/resources/uploadFiles/${a.imgRename}" download="${a.imgOriginalName }">
										${a.imgOriginalName }
									</a>
									<button type="button" class="btn btn-outline-dark btn-sm deleteAttm" id="delete-${a.imgRename }/${a.level}">
										삭제
									</button>
									<input type="hidden" name="deleteAttm" >
								<br>
							</c:forEach>
						</div>
						
						<div id="fileArea">
							<button type="button" class="btn" id="addFile"><img src="https://cdn-icons-png.flaticon.com/512/4148/4148851.png" style="width: 40px; height: 40px;"> </button>
							<div class="mb-3 input-group">
								<input type="file" class="form-control" name="file">
								<button type="button" class="btn btn-outline-dark deleteFile" >삭제</button>
							</div>
						</div>
						<br><br><br><br><br>
						<input type="hidden" name="writer" value="${mkBoard.writer }">
						<input type="hidden" name="boardNo" value="${mkBoard.boardNo }">
						<input type="hidden" name="boardType" value="3">
						<button class="btn btn-outline-primary"  id="submitAttm">UPDATE</button>
						<button class="btn btn-outline-primary" type="button" onclick="javascript:history.back();">BACK</button>
					</div>
				</form>
			</div>
			
		<footer>
			<jsp:include page="../common/footer.jsp"/>
		</footer>
		</main>


	</div>
	
		<script>
		window.onload=()=>{
			
			const fileArea = document.querySelector('#fileArea');
			document.getElementById('addFile').addEventListener('click',()=>{
				const newDiv = document.createElement('div');
				newDiv.classList.add('mb-3');
				newDiv.innerHTML = '<div class="mb-3 input-group"><input type="file" class="form-control" name="file"><button type="button" class="btn btn-outline-dark deleteFile" >삭제</button></div>';
				
				fileArea.append(newDiv);
			});
			
			
			
			const delBtns = document.getElementsByClassName('deleteAttm');
			for(const btn of delBtns){
				btn.addEventListener('click', function() {
					const nextHidden = this.nextElementSibling;
					if(nextHidden.value == ''){ // 삭제 버튼을 누르지 않은 경우(삭제 OFF)
						this.style.background = 'black';
						this.style.color = 'white';
						this.innerHTML = '취소';
						nextHidden.value = this.id.split("-")[1];
					} else{ // 삭제 버튼을 누른 경우 (삭제 ON)
						this.style.background = 'none';
						this.style.color = 'black';
						this.innerHTML = '삭제';
						nextHidden.removeAttribute('value');
					}
				});
			}
			
			
		
			$(document).on('click', '.deleteFile', function(){
				$(this).parent().remove();
			});
		}
		
		
		
		
		
		
	</script>
</body>
</html>