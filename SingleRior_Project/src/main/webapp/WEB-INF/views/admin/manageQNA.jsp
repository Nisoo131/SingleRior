
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    	 <style>
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
			
			#pInsert{
			
				display: flex;
				flex-direction: column;
				justify-content: center;
				align-items: center;
				margin-top:30px;	
			}
			input { 
				padding: 10px 20px; 
				margin: 5px 0; 
				box-sizing: border-box; 
				border-radius: 15px;
				
				}
			tr td{
				margin-right:50px;
				margin-left:50px;
				
			}
			.btn{
			
				display: flex;
				flex-direction: row;
				justify-content: center;
				align-items: center;
				
			
			}
    	 	.pageArea{
    	 		display: flex;
				flex-direction: row;
				justify-content: center;
				align-items: center;
				
    	 	
    	 	}
    	 
    	 
    	 </style>
    	 
    	 
    </head>
    <body>
    
	<jsp:include page="../common/adminTop.jsp"/>
	<jsp:include page="../common/adminLeft.jsp"/>
	
   
            <div id="layoutSidenav_content">
                <main>
                
                 <div id="logo">
                    <img src="${ pageContext.servletContext.contextPath }/resources/image/SingleRior_logo.png" style="width:250px; height:100px;">
                    <br>
                    <h1>Q&A 리스트</h1>
                    
                    <br>
                    
                    
                    </div>
                   <div class="container px-5 bd-example-snippet bd-code-snippet" style="padding-bottom: 20px; text-align: center;">
           
           
           <div class="bd-example">
           
           	<button style="float:right"  type="button" class="btn btn-outline-secondary" onclick="location.href='${contextPath}/insertQNA.adm'">공지 내용 작성</button>
           <br><br>
            <table class="table table-hover">
               <thead>
                  <tr class="fs-5">
                  	 <th>카테고리</th>
                     <th>글 제목</th>
                     <th width="130px">작성일</th>
                      </tr>
                   </thead>
                  <tbody>
                      <tr>
                      <td>Q&A</td>
                     <td>여러분 과탄산소다가 여기저기 쓸 곳 많은 거 알고계시나요...?</td>
                     <td>2022-12-06</td>
                      </tr>
                      <tr>
                      <td>Q&A</td>
                     <td>배가 너무 아픈데 주변에 약국이 다 문을 닫았어요..ㅜㅜ</td>
                     <td>2022-12-06</td>
                      </tr>
                      <tr>
                      <td>Q&A</td>
                     <td>이번에 가습기 하나 장만했는디 가성비 좋네여!!!</td>
                     <td>2022-12-06</td>
                      </tr>
                      <tr>
                      <td>Q&A</td>
                     <td>오늘 롯데월드 갔다왔는데 사람 너무 많았음;;;;;;</td>
                     <td>2022-12-06</td>
                      </tr>
                      <tr>
                      <td>Q&A</td>
                     <td>XX 매트리스 내돈내산 후기....^^</td>
                     <td>2022-12-06</td>
                      </tr>
                      <tr>
                      <td>Q&A</td>
                     <td>자취 꿀팁!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</td>
                     <td>2022-12-06</td>
                      </tr>
                      <tr>
                      <td>Q&A</td>
                     <td>WW 침대 프레임이랑 XX 매트리스 호환되나요? 아시는 분?</td>
                     <td>2022-12-06</td>
                      </tr>
                      <tr>
                      <td>Q&A</td>
                     <td>다이소 압축봉 장만하셔요!!!!! 이걸로 수납공간 확보 완료!!!!!</td>
                     <td>2022-12-06</td>
                      </tr>
                      <tr>
                      <td>Q&A</td>
                     <td>하 집 가고 싶다......^^</td>
                     <td>2022-12-06</td>
                      </tr>
                      <tr>
                      <td>Q&A</td>
                     <td>자꾸 하수구에서 냄새가 올라오는데 어케 해야하나요?</td>
                     <td>2022-12-06</td>
                      </tr>
                   </tbody>
              </table>
             </div>
      </div>
      	<div class="pageArea">
   			 <nav aria-label="Standard pagination example" style="float: right;">
				<ul class="pagination">
	          				<li class="page-item">
	           					<c:url var="goBack" value="${ loc }">
	           						<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
	           					</c:url>
	           					<a class="page-link" href="${ goBack }" aria-label="Previous">
	           						<span aria-hidden="true">&laquo;</span>
	             					</a>
	           				</li>
	           				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
	          					<c:url var="goNum" value="${ loc }">
	          						<c:param name="page" value="${ p }"></c:param>
	          					</c:url>
	           					<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
	           				</c:forEach>
	           				<li class="page-item">
	           					<c:url var="goNext" value="${ loc }">
	           						<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
	           					</c:url>
	           					<a class="page-link" href="${ goNext }" aria-label="Next">
	           						<span aria-hidden="true">&raquo;</span>
	           					</a>
	           				</li>
	   				</ul>
      			</nav>
            </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; SingleRior 2022</div>
                        </div>
                    </div>
                </footer>
            </div>
         
         <script>
         	window.onload=()=>{
         		const tbody=document.querySelector('tbody');
         		const tds = tbody.querySelectorAll('td');
         		
         		for(const td of tds){
         			td.addEventListener('click',function(){
         			const trTds=this.parentElement.querySelectorAll('td');
					const boardId=trTds[0].innerText;
         			location.href='${contextPath}/selectboard.bo??bId='+boardId;
         			});
         		}
         		
         		
         		
         	}
         
         
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
