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
        	#btnGroup{
        		display: flex;
				flex-direction: row;
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
                        <h1 class="mt-4">신고 게시글 목록</h1>
                        <div id="btnGroup" class="btn-group" role="group" aria-label="Basic radio toggle button group">
								<input type="radio" class="btn-check" name="btnradio"
									id="btnradio1" autocomplete="off" checked> <label
									class="btn btn-outline-primary" for="btnradio1">게시글 신고목록</label>

								<input type="radio" class="btn-check" name="btnradio"
									id="btnradio2" autocomplete="off"> <label
									class="btn btn-outline-primary" for="btnradio2">댓글 신고 목록</label>

								<input type="radio" class="btn-check" name="btnradio"
									id="btnradio3" autocomplete="off"> <label
									class="btn btn-outline-primary" for="btnradio3">대댓글 신고 목록</label>
							</div>
							<br><br>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                신고 목록
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
							
							<thead>
                                        <tr>
                                            <th>신고번호</th>
                                            <th>게시글 종류</th>
                                            <th>신고 카테고리 </th>
                                            <th>신고 사유</th>
                                            <th>신고 일시</th>
                                            <th>신고한 회원</th>
                                            <th>상태 변경</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                          	<th>신고번호</th>
                                            <th>게시글 종류</th>
                                            <th>신고 카테고리 </th>
                                            <th>신고 사유</th>
                                            <th>신고 일시</th>
                                            <th>신고한 회원</th>
                                            <th>상태 변경</th>
                                            
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                       
                                       <c:forEach items="${rList}" var="r">
                                        <tr>
                                            <td>${r.reportNo }</td>
                                            <td><c:if test="${r.boardType eq 2}">싱글벙글</c:if><c:if test="${r.boardType eq 3}">씽씽마켓</c:if></td>
                                            <td>${r.reportType }</td>
                                            <td>${r.boardTitle }</td>
                                            <td>${r.createDate }</td>
                                            <td>${r.memberId }</td>
                                            <td><button style="display:inline-block;" type="button" class="btn btn-primary">신고글 보기</button>&nbsp;<button style="display:inline-block;" type="button" class="btn btn-warning">신고글 취소</button>&nbsp;<button style="display:inline-block;" type="button" class="btn btn-danger">신고글 삭제</button></td>
                                        </tr>
                                       </c:forEach>                                         
                                        
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
