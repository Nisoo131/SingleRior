<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@font-face {
	    font-family: 'BMJUA';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	* {
		font-family: 'BMJUA';
	}
	.css-title{
		overflow: hidden;
		display: inline-block;
		color: rgb(47, 52, 56);
		letter-spacing: -0.3px;
		white-space: nowrap;
		text-overflow: ellipsis;
		font-size: 30px;
		line-height: 28px;
	}
</style>
</head>
<body>
	<header class="sticky-top">
		<div>
			<jsp:include page="../common/top.jsp"/>
		</div>
		
		<div class="py-1 border-bottom fs-5" style="background-color: #008cd4; text-align: center;">
			<ul class="nav me-auto justify-content-center">
		        <li class="nav-item"><a href="${ contextPath }/commuTipList.co" class="nav-link px-5 mx-2" style="color: white;">생활팁</a></li>
		        <li class="nav-item"><a href="${ contextPath }/commuReviewList.co" class="nav-link px-5 mx-2" style="color: white;">후기</a></li>
		        <li class="nav-item"><a href="${ contextPath }/commuFreeList.co" class="nav-link px-5 mx-2" style="color: white;">자유</a></li>
		    </ul>
		</div>
	</header>
	
	<main>
  		<div class="container">
			<div style="margin-left: 200px; margin-right: 200px; margin-top: 100px;">
				<form class="needs-validation" action="${ contextPath }/commuBoardInsert.co" method="POST" enctype="multipart/form-data" id="attmForm">
					<div class="row g-3">
						<h1 style="align-self: center;">싱글벙글</h1>
						<div class="col-12">
							<select class="form-select form-select-sm" aria-label=".form-select-sm example" style="width: 120px; margin-bottom: 15px; text-align: center;">
								<option>생활팁</option>
								<option>후기</option>
								<option>자유</option>
							</select>
						
							<label for="boardTitle" class="form-label">TITLE</label>
							<input type="text" class="form-control" id="boardTitle" name="boardTitle">
						</div>

						<div class="col-12">
							<label for="boardContent" class="form-label">CONTENT</label>
							<div class="input-group">
								<textarea class="form-control" rows="10" name="boardContent" style="resize: none;"></textarea>
					        </div>
						</div>
						
						<div id="fileArea">
							<div class="mb-3">
								<button type="button" class="btn " id="addFile"><img src="https://cdn-icons-png.flaticon.com/512/4148/4148851.png" style="width: 40px; height: 40px;"></button>
								<input type="file" class="form-control" name="file" style="margin-top: 15px;">
							</div>
						</div>
						
						<br><br><br><br><br>
						
						<div style="text-align: center;">
							<button class="btn btn-outline-primary" type="button" style="width: 100px;" onclick="javascript:history.back();">취소</button>
							<button class="btn btn-outline-primary" type="button" id="submitAttm" style="width: 100px;">등록</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</main>
	
	<footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>
	
	<script>
		window.onload = () =>{
			const fileArea = document.querySelector('#fileArea');
			document.getElementById('addFile').addEventListener('click',()=>{
				const newDiv = document.createElement('div');
				newDiv.classList.add('mb-3');
				newDiv.innerHTML = '<input type="file" class="form-control" name="file">';
				
				fileArea.append(newDiv);
			});
		}
	</script>
</body>
</html>