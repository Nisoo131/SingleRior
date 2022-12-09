<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
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
</style>
</head>
<body>
	<header class="sticky-top">
		<div>
			<jsp:include page="../common/top.jsp"/>
		</div>
	</header>
	
	<main>
		<div class="container">
			<div class="col-md-1" style="text-align: center; padding-top: 100px;">
				<div class="row g-0 border rounded overflow-hidden flex-md-row shadow-sm h-md-250 position-relative mt-2 mb-4">
					<div class="col py-2 d-flex flex-column position-static">
						<table>
							<tr>
								<td><a href="javascript:history.back();" class="nav-link link-dark"><img src="https://www.flaticon.com/svg/vstatic/svg/3916/3916912.svg?token=exp=1670460369~hmac=675d0b7c5b02f035ed8a059ae5814294" width="15" height="15"> 목록 보기</a></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="col-12 border rounded overflow-hidden">
				<!-- 헤더 -->
				<div style="font-size: 20px; padding-top: 30px; padding-left: 50px;">
					<span>싱글벙글</span>
				</div>
				<table>
					<tr>
						<td class="fs-3 px-5 py-3" width="1100">이곳은 모두가 함께 사용하는 공간입니다. 타인에게 매너를 지켜주세요.</td>
					</tr>
				</table>
				<table>
					<tr>
						<td class="px-5" width="150">관리자</td>
						<td width="180">22.12.08 &nbsp;&nbsp;&nbsp; 09:00</td>
						<td width="40">조회</td>
						<td>0</td>
					</tr>
				</table>
				
				<div style="border-bottom: 1px solid #DCDCDC; padding-top: 10px;"></div>
				
				<!-- 본문 -->
				<div class="p-5" style="font-size: 20px; height: 600px;">
					<span>매너를 지키는 당신은 정말 아름다운 사람입니다.....^^</span>
				</div>
				
				<div style="border-bottom: 1px solid #DCDCDC; padding-top: 10px;"></div>
				
				<!-- 이동 -->
				<div class="row px-5 py-4 justify-content-center">
					<div class="col-md-1" style="text-align: center; width: 150px;">
						<button class="w-100 btn btn-outline-dark btn-lg" type="button" id="preForm">이전글</button>
					</div>
					<div class="col-md-1" style="text-align: center; width: 150px;">
						<button class="w-100 btn btn-outline-dark btn-lg" type="button" id="nextForm">다음글</button>
					</div>
				</div>
			</div>
		</div>
	</main>
	
	<footer>
		<jsp:include page="../common/footer.jsp"/>
	</footer>
</body>
</html>