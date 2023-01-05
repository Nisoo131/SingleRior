<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
    	<style>
    	
    		section{
				margin:auto;
				max-width:1500px;
				}
			
			#logo {
				display: flex;
				flex-direction: column;
				justify-content: center;
				align-items: center;
				}
			
			
			@font-face {
				font-family: 'BMJUA';
				src:
					url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff')
					format('woff');
				font-weight: normal;
				font-style: normal;
			}
			
			* {
				font-family: 'BMJUA';
			}
			tr td{
		 		text-align:center;
		
			}
</style>
    </head>
    <body>
     
	<jsp:include page="../common/adminTop.jsp"/>
	<jsp:include page="../common/adminLeft.jsp"/>
	
<!-------------------------------------------------------- 내용 ----------------------------------------------------------------------- -->            
            <div id="layoutSidenav_content">
                <main>
                    <div id="logo">
                    <img src="${ pageContext.servletContext.contextPath }/resources/image/SingleRior_logo.png" style="width:250px; height:100px;">
                    <br>
                    <h1>상세 주문 목록</h1>
                    </div>
                    
          
                    <div id="pInsert">
                    <section >
						<h1 style="text-align:left"></h1><br><br>
						<div id="orderProduct">
							<span>주문번호 : ${list[0].orderNo}</span>&nbsp;&nbsp;&nbsp;
							<span>주문일자 : ${list[0].orderDate}</span>
							<span style="float:right;">총 주문 금액 : <fmt:formatNumber value="${list[0].orderTotalPrice}" pattern="#,###"/>원</span>
							<table class="table">
							    <c:forEach items="${list}" var="l">
							    
							    <tr>
							      <td scope="row" colspan="7"></td>
							    </tr>
							    <tr height="15">
							    	<td scope="row" width="250" rowspan="2"><img src="resources/uploadFiles/${l.imgServerName}" width="160"></td>
							     	<td><h4>상품 번호</h4>
							      	</td>
							     	<td><h4>상품 이름</h4>
							      	</td>
							      	<td><h4>옵션</h4>	      
							      	</td>
							      	<td><h4>개수</h4>
							      	</td>
							      	<td><h4>상품 금액</h4>
							      	</td>
							      	<td><h4>상태</h4></td>
							      	<td><c:if test=""></c:if></td>
							   	</tr>
							   	<tr>
							   		<td>${l.orderDetailNo}</td>
							     	<td>
							      		${l.productName}
							      	</td>
							      	<td>
										${l.productOption}		      
							      	</td>
							      	<td>
							      		${l.productQuantity} 개
							      	</td>
							      	<td>
							      		<fmt:formatNumber value="${l.productPrice}" pattern="#,###"/>원
							      	</td>
							      	<td>${l.status }</td>
							   	</tr>
							   	</c:forEach>
							   	<tr>
							      <td scope="row" colspan="7"></td>
							    </tr>
							</table>
						</div><br><br>
						<div class="orderInfo address">
							<h3>배송지 정보</h3>
							<hr>
							<h5>받는 사람</h5>
							<p>김로즈</p>
							<br>
							<h5>연락처</h5>
							<p>010-1111-2222</p>
							<br>
							<h5>주소</h5>
							<p>서울특별시 강남구 역삼동</p>
							<br>
							<h5>배송 메모</h5>
							<p>부재시 현관앞에 놓아주세요</p>
						</div>
						<br><br>
						<div class="orderInfo pay">
							<h3>결제 정보</h3>
							<hr>
							<h5>결제 방법</h5><p>카드결제</p><br>
							<h5>상품 금액</h5><p>12,500원</p><br>
							<h5>배송비</h5><p>2,500원</p><br>
							<h5>사용 포인트</h5><p>0원</p><br>
							<h5>결제금액</h5><p>15,000원</p><br>
							<h5>결제방법</h5><p>카드결제</p><br>
							<h5>주문자</h5><p>김이현</p><br>
							<h5>연락처</h5><p>010-1111-2222</p><br>
							<h5>이메일</h5><p>rose@ro.se</p><br>
						</div>
						<br><br>
						<div class="orderInfo Account">
							<h3>가상계좌정보(무통장입금)</h3>
							<hr>
							<h5>은행명</h5><p>국민은행</p><br>
							<h5>계좌번호</h5><p>123-456789-153</p><br>
							<h5>예금주</h5><p>주식회사 씽씽마켓</p><br>
							<h5>입금금액</h5><p>12,500원</p><br>
							<h5>기간</h5><p>2022-11-08 23:59까지</p><br>
						</div>
					</section>

                    </div>
                    
                    
                    
                    
                </main>
<!-------------------------------------------------------- 내용 ----------------------------------------------------------------------- -->                
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; SingleRior 2022</div>
                        </div>
                    </div>
                </footer>
            <!-- 주문 취소 모달창 -->
	<div class="modal" tabindex="-1" id="orderCancelModal">
		<div class="modal-dialog modal-dialog-centered">
	    	<div class="modal-content">
	     		 <div class="modal-header">
	       		 <h5 class="modal-title">주문을 취소하시겠습니까?</h5>
	       		 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	    	  </div>
	    	  <div class="modal-body">
	      		  <p>배송중이거나 구매확정일 경우 관리자에 주문취소가 철회될 수 있습니다.</p>
	      		  <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
							<option selected>취소 이유 선택</option>
							<option value="단순변심">단순변심</option>
							<option value="배송지연">배송지연</option>
							<option value="품절">품절</option>
							<option value="재주문">재주문</option>
							<option value="주문실수">주문실수</option>
							<option value="서비스불만족">서비스 불만족</option>
							<option value="기타">기타</option>
						</select>
						<div class="mb-3">
							<textarea class="form-control" id="exampleFormControlTextarea1"
								rows="3" placeholder="기타를 선택하신 경우 입력해주세요." style="resize:none;"></textarea>
						</div>
	     	 </div>
			 <div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
				<button type="button" class="btn btn-light" style="background:#008cd4; color:white">주문취소</button>
	     	 </div>
	    </div>
	  </div>
	</div>
	
	<!-- 배송지 변경 모달창 -->
	<div class="modal" tabindex="-1" id="orderAddressModal">
		<div class="modal-dialog modal-dialog-centered">
	    	<div class="modal-content">
	     		 <div class="modal-header">
	       		 <h5 class="modal-title">배송지 변경</h5>
	       		 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	    	  </div>
	    	  <div class="modal-body">
	      		  <div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">받는 사람</label>
 				 		<input type="text" class="form-control" id="exampleFormControlInput1">
				  </div>
	      		   <div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">연락처</label>
 				 		<input type="text" class="form-control" id="exampleFormControlInput1">
				  </div>
	      		  <div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">주소</label>
 				 		<input type="text" class="form-control" id="exampleFormControlInput1">
				  </div>
	      		  <div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">배송메모</label>
 				 		<input type="text" class="form-control" id="exampleFormControlInput1">
				  </div>
	     	 </div>
			 <div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
				<button type="button" class="btn btn-light" style="background:#008cd4; color:white">배송지변경</button>
	     	 </div>
	    </div>
	  </div>
	</div>
	
            
            </div>
        
        <script>
        console.log(typeof ${list.imgPath})
        
        
        </script>
        
        
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src='${ pageContext.servletContext.contextPath }/resources/js/scripts.js'></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/assets/demo/chart-area-demo.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/datatables-simple-demo.js"></script>
    </body>
</html>

