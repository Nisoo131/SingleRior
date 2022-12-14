<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Masonry example · Bootstrap v5.2</title>
<style>
.bd-placeholder-img {font-size: 1.125rem; text-anchor: middle;}
@font-face {
    font-family: 'BMJUA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
* {
	font-family: 'BMJUA';
}
#col-12{
	border: 1px;
}

</style>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
	<div>
		<jsp:include page="../common/top.jsp"/>
	</div>
		<div style="background: #008cd4">
	<ul class="nav justify-content-center">
	  <li class="nav-item">
	    <a style="color: white;" class="nav-link active" aria-current="page" href="#">같이사요</a>
	  </li>
	  <li class="nav-item">
	    <a style="color: white;" class="nav-link active" href="#">팝니다</a>
	  </li>
	  <li class="nav-item">
	    <a style="color: white;" class="nav-link active" href="#">삽니다</a>
	  </li>
	</ul>
	</div>
	
	
			<main>
			<div class="py-5 text-center">
				
				<h1>씽씽마켓</h1>
			</div>

			<div style="margin-left: 350px; margin-right: 350px;">
				<form class="needs-validation" method="POST" id="datailForm">
					<div class="row g-3">
							<div class="col-12">
							<input style="font-size: 28px; border-style: none; width: 1100px; " value="[팝니다] 우리집 고양이 구경하기~" readonly="readonly"><img alt="" src="https://cdn-icons-png.flaticon.com/512/4226/4226020.png" style="width: 40px; height: 40px;">
							<br>
							<input  style="font-size: 20px; border-style: none;" value="3000원" readonly="readonly">
							</div>
						<div>
						
					<div class="mx-auto" style="height: 20%; text-align: center">
						<c:forEach items="${ aList }" var="a">
						<img style="margin: auto; width: 700px; height: 500px;" src="resources/uploadFiles/${ a.renameName }">
			</c:forEach>
		</div>
						
						
						<div class="col-12">
							<div class="input-group">
					          <textarea class="form-control" rows="10" name="boardContent" style="resize: none; "readonly>우리집고양이있따부럽지</textarea>
					        </div>
						</div>
						</div>
						<div class="col-12" style="background: #D9E5FF; border-radius:2em; padding: 20px;" >
						
							<table style="width: 100%">
								<tr>
									<td rowspan="2" style="width: 80px;"><img src="https://cdn-icons-png.flaticon.com/512/789/789473.png" style="width: 60px; height: 60px;"></td>
									<td style="align-content: "><span style="font-size: 25px;">병아리</span></td>
									<td><img  id="reportBtn" src="https://cdn-icons-png.flaticon.com/512/4898/4898673.png" style="width: 50px; height: 50px; float: right;"></td>
								</tr>
								<tr>
									<td><span>수원시 장안구 이목동</span></td>
									<td style="float: right; margin-right: 12px;"><span>신고</span></td>
								</tr>
							</table>
						</div>
					</div>	
					<br>
						<div style="float: right;">	
							<button class=" btn btn-outline-warning" type="button" style="width: 130px;">UPDATE</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button class=" btn btn-outline-warning" type="button" style="width: 130px;" id="deleteBtn">DELETE</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button class=" btn btn-outline-warning" type="button" style="width: 130px;" onclick="location.href='${contextPath}/list.bo?page=' +${page}">GO TO LIST</button>
						</div>
					<br><br>
					
					<br>

					<div class="input-group">
						<span class="input-group-text" style="background: #D9E5FF ">댓글</span>
						<textarea class="form-control" rows="3" id="replyContent" style="resize: none;"></textarea>
						<button class="btn btn-outline-primary btn-lg" id="replySubmit" type="button" >댓글달기</button>
					</div>
					<br>
					<table class="table" style="height: 400px;">
						<thead>
							<tr>
								<th width="130px">작성자</th>
								<th>작성내용</th>
								<th width="130px">작성일자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="r">
								<tr>
									<td>${r.nickName }</td>
									<td>${r.replyContent }</td>
									<td>${r.replyModifyDate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</main>
		
<!-- 삭제모달 -->

<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel"><img src="https://cdn-icons-png.flaticon.com/512/3720/3720719.png" style="width: 30px; height: 30px;">&nbsp;DELETE BOARD </h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       	정말 삭제하시겠습니까?
       	<br>
       	삭제한 게시글은 복구할 수 없습니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">삭제하기</button>
      </div>
    </div>
  </div>
</div>

<!-- 신고모달 -->

<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel"><img src="https://cdn-icons-png.flaticon.com/512/2689/2689919.png" style="width: 40px; height: 40px;">REPORT</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <h3>신고 사유를 선택해주세요!</h3>
       작성자 : user01
       <br>
       글제목 : 고양이안기여움
       <br> <br>
		 <div class="form-check">
		  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
		  <label class="form-check-label" >
		    홍보/도배글이예요
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="checkbox" value=""  >
		  <label class="form-check-label" >
		    청소년에게 유해한 내용이예요
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="checkbox" value="" >
		  <label class="form-check-label" >
		    불법이예요
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="checkbox"  >
		  <label class="form-check-label" >
		    욕설,혐오,차별적표현이예요
		  </label>
		</div>
	  </div>
	
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">신고하기</button>
      </div>
    </div>
  </div>
</div>
	
	
 	
 	<footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>	
</body>
	<script>
		window.onload = () =>{
			const upd = document.getElementById("updateForm");
			const form = document.getElementById('detailForm');
			if(upd != null){
				upd.addEventListener('click', ()=>{
					form.action = '${contextPath}/marketBoardUpdate.ma';
					form.submit();
				});
			}
			
			document.getElementById('reportBtn').addEventListener('click', ()=>{
				$('#reportModal').modal('show');	
			});
			
			document.getElementById('deleteBtn').addEventListener('click', ()=>{
				$('#deleteModal').modal('show');	
			});
			
			
		}
	</script>
</body>
</html>