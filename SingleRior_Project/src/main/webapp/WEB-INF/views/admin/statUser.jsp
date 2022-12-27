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
    	 
    	 
    	 
    	 </style>
    	 
    	 
    </head>
    <body>
    
	<jsp:include page="../common/adminTop.jsp"/>
	<jsp:include page="../common/adminLeft.jsp"/>
	
            
             <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">방문 및 사용자 통계</h1>
                        <div class="card mb-4">
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i>
                                회원 가입 현황
                            </div>
                            <div class="card-body"><canvas id="myAreaChart" width="100%" height="30"></canvas></div>
                            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        일일/누적 회원가입 통계
                                    </div>
                                    <div class="card-body"><canvas id="userSum"></canvas></div>
                                    <div class="card-footer small text-muted">마지막 업데이트 일시 11:59 PM</div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-pie me-1"></i>
                                        사용자 컨텐츠 조회수
                                    </div>
                                    <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
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
            
            
            <script>
            
            			
            		var max=parseInt('${list[0].C}');
            		var max2=parseInt('${list[0].B}');
		            var ctx = document.getElementById('userSum').getContext('2d');
		            var chart = new Chart(ctx, {
		                // type : 'bar' = 막대차트를 의미합니다.
		                type: 'bar', // 
		                data: {
		                    labels: ['${list[4].A}','${list[3].A}','${list[2].A}','${list[1].A}','${list[0].A}'],
		                    datasets: [{
		                        label: '일일 회원 가입자 수',
		                        type : 'line',         // 'line' type
		                        fill : false,         // 채우기 없음
		                        lineTension : 0.2,  // 0이면 꺾은선 그래프, 숫자가 높을수록 둥글해짐
		                        pointRadius : 0,    // 각 지점에 포인트 주지 않음
		                        backgroundColor: 'rgb(255, 0, 0)',
		                        borderColor: 'rgb(255, 0, 0)',
		                        data: ['${list[4].B}','${list[3].B}','${list[2].B}','${list[1].B}','${list[0].B}'],
		                        yAxisID: 'right-y-axis'
		                    },{
		                        label: '누적 회원 가입자 수',
		                        backgroundColor: 'rgb(0, 128, 255)',
		                        borderColor: 'rgb(0, 128, 255)',
		                        data: ['${list[4].C}','${list[3].C}','${list[2].C}','${list[1].C}','${list[0].C}'],
		                        yAxisID: 'left-y-axis'
		                    
		                    }]
		                },
		                options: {
		                    scales: {
		                        yAxes: [{
		                            id: 'left-y-axis',
		                            type: 'linear',
		                            position: 'left',
		                            ticks:{
		                            	min:10,
		                            	stepSize:10,
		                            	max:max+10
		                            }
		                        }, {
		                            id: 'right-y-axis',
		                            type: 'linear',
		                            position: 'right',
		                            ticks:{
		                            	min:1,
		                            	stepSize:1,
		                            	max:max2+2
		                            }
		                        }]
		                    }
		                }
		                
		            });
		        

            
            
            
            </script>
            
        
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
