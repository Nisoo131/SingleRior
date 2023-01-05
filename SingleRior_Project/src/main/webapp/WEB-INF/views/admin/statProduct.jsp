<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<%
  Date now = new Date();
%>

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
    	 
    	 
    	 
    	 </style>
    	 
    	 
    </head>
    <body>
    
	<jsp:include page="../common/adminTop.jsp"/>
	<jsp:include page="../common/adminLeft.jsp"/>
	
            
             <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">판매 현황</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i>
                                일일 주문 현황
                            </div>
                            <div class="card-body"><canvas id="myAreaChart" width="100%" height="30"></canvas></div>
                             <div class="card-footer small text-muted">마지막 업데이트 일시: <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="<%= now %>"/></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                       일일 누적 매출액 현황
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="50"></canvas></div>
                                     <div class="card-footer small text-muted">마지막 업데이트 일시: <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="<%= now %>"/></div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-pie me-1"></i>
                                        카테고리별 상품 주문 현황
                                    </div>
                                    <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                                     <div class="card-footer small text-muted">마지막 업데이트 일시: <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="<%= now %>"/></div>
                                </div>
                            </div>
                        </div>
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
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src='${ pageContext.servletContext.contextPath }/resources/js/scripts.js'></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/assets/demo/chart-area-demo.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/assets/demo/chart-bar-demo.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/assets/demo/chart-pie-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
