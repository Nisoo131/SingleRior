<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>싱글리어 관리자 페이지</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/styles.css"  />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        
        <style>
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
        	table, td, th {
				 border : 1px solid black;
				 border-collapse : collapse;
				}
			th, td {
				 text-align: center;
				}
        
        </style>
        
        
        
    </head>
    <body class="sb-nav-fixed">
		<jsp:include page="../common/adminTop.jsp"/>
		<jsp:include page="../common/adminLeft.jsp"/><!-----------------------------------------------------좌측 네비바 ------------------------------------------------------------------------------------------------------------------->                    
<!-------------------------------------------------------- 내용 ----------------------------------------------------------------------- -->            
            <div id="layoutSidenav_content">
                <main>
                     <div class="container-fluid px-4">
                        <h1 class="mt-4">싱글리어 등록된 상품 목록</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                상품 정보
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>상품코드</th>
                                            <th>상품명</th>
                                            <th>판매가</th>
                                            <th>상위 카테고리</th>
                                            <th>하위 카테고리</th>
                                            <th>상태</th>
                                            <th>등록일</th>
                                            <th>수정일</th>
                                            <th>상태 변경</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>상품코드</th>
                                            <th>상품명</th>
                                            <th>판매가</th>
                                            <th>상위 카테고리</th>
                                            <th>하위 카테고리</th>
                                            <th>상태</th>
                                            <th>등록일</th>
                                            <th>수정일</th>
                                            <th>상태 변경</th>
                                            
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>001</td>
                                            <td>에이스 침대침대</td>
                                            <td>19999원</td>
                                            <td>가구</td>
                                            <td>침대</td>
                                            <td>판매중</td>
                                            <td>2022.12.12</td>
                                            <td>2022.12.12</td>
                                            <td><button style="display:inline-block;" type="button" class="btn btn-primary">수정</button>&nbsp;<button style="display:inline-block;" type="button" class="btn btn-danger">삭제</button></td>
                                        </tr>
                                         <tr>
                                            <td>002</td>
                                            <td>에이스 침대침대</td>
                                            <td>19999원</td>
                                            <td>가구</td>
                                            <td>침대</td>
                                            <td>판매중</td>
                                            <td>2022.12.12</td>
                                            <td>2022.12.12</td>
                                            <td><button style="display:inline-block;" type="button" class="btn btn-primary">수정</button>&nbsp;<button style="display:inline-block;" type="button" class="btn btn-danger">삭제</button></td>
                                        </tr>
                                         <tr>
                                            <td>003</td>
                                            <td>에이스 침대침대</td>
                                            <td>19999원</td>
                                            <td>가구</td>
                                            <td>침대</td>
                                            <td>판매중</td>
                                            <td>2022.12.12</td>
                                            <td>2022.12.12</td>
                                            <td><button style="display:inline-block;" type="button" class="btn btn-primary">수정</button>&nbsp;<button style="display:inline-block;" type="button" class="btn btn-danger">삭제</button></td>
                                        </tr>
                                         <tr>
                                            <td>001</td>
                                            <td>에이스 침대침대</td>
                                            <td>19999원</td>
                                            <td>가구</td>
                                            <td>침대</td>
                                            <td>판매중</td>
                                            <td>2022.12.12</td>
                                            <td>2022.12.12</td>
                                            <td><button style="display:inline-block;" type="button" class="btn btn-primary">수정</button>&nbsp;<button style="display:inline-block;" type="button" class="btn btn-danger">삭제</button></td>
                                        </tr>
                                         <tr>
                                            <td>001</td>
                                            <td>에이스 침대침대</td>
                                            <td>19999원</td>
                                            <td>가구</td>
                                            <td>침대</td>
                                            <td>판매중</td>
                                            <td>2022.12.12</td>
                                            <td>2022.12.12</td>
                                            <td><button style="display:inline-block;" type="button" class="btn btn-primary">수정</button>&nbsp;<button style="display:inline-block;" type="button" class="btn btn-danger">삭제</button></td>
                                        </tr>
                                         <tr>
                                            <td>001</td>
                                            <td>에이스 침대침대</td>
                                            <td>19999원</td>
                                            <td>가구</td>
                                            <td>침대</td>
                                            <td>판매중</td>
                                            <td>2022.12.12</td>
                                            <td>2022.12.12</td>
                                            <td><button style="display:inline-block;" type="button" class="btn btn-primary">수정</button>&nbsp;<button style="display:inline-block;" type="button" class="btn btn-danger">삭제</button></td>
                                        </tr>
                                        
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
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
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src='${ pageContext.servletContext.contextPath }/resources/js/scripts.js'></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/assets/demo/chart-area-demo.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
