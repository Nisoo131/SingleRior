<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        
        
    </head>
    <body >
	<jsp:include page="../common/adminTop.jsp"/>
	<jsp:include page="../common/adminLeft.jsp"/>
<!-----------------------------------------------------좌측 네비바 ------------------------------------------------------------------------------------------------------------------->                    
<!-------------------------------------------------------- 내용 ----------------------------------------------------------------------- -->            
            <div id="layoutSidenav_content">
                <main>
                     <div class="container-fluid px-4">
                        <h1 class="mt-4">주문 목록 리스트</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                주문 목록
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>주문내역</th>
                                            <th>상품 명</th>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>연락처</th>
                                            <th>결제금액</th>
                                            <th>결제수단</th>
                                            <th>결제결과</th>
                                            <th>거래상태</th>
                                            <th>주문일시</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                       
                                    </tfoot>
                                    <tbody>
                                         <tr>
                                            <th>1</th>
                                            <th>123456</th>
                                            <th>다우니 외 2</th>
                                            <th>user01</th>
                                            <th>강건강</th>
                                            <th>010-1234-5678</th>
                                            <th>30000원</th>
                                            <th>신용카드</th>
                                            <th>정상</th>
                                            <th>배송중</th>
                                            <th>2022.12.08</th>
                                        </tr>
                                        <tr>
                                            <th>2</th>
                                            <th>123457</th>
                                            <th>침대 외2</th>
                                            <th>user02</th>
                                            <th>남나눔</th>
                                            <th>010-1234-5678</th>
                                            <th>30000원</th>
                                            <th>카카오페이</th>
                                            <th>정상</th>
                                            <th>배송준비</th>
                                            <th>2022.12.08</th>
                                        </tr>
                                        <tr>
                                            <th>3</th>
                                            <th>123458</th>
                                            <th>컴퓨터</th>
                                            <th>user03</th>
                                            <th>도대담</th>
                                            <th>010-1234-5678</th>
                                            <th>30000원</th>
                                            <th>카카오페이</th>
                                            <th>정상</th>
                                            <th>배송완료</th>
                                            <th>2022.12.08</th>
                                        </tr>
                                        <tr>
                                            <th>4</th>
                                            <th>123458</th>
                                            <th>컴퓨터</th>
                                            <th>user04</th>
                                            <th>류라라</th>
                                            <th>010-1234-5678</th>
                                            <th>30000원</th>
                                            <th>카카오페이</th>
                                            <th>취소</th>
                                            <th>취소</th>
                                            <th>2022.12.08</th>
                                        </tr>
                                        <tr>
                                            <th>5</th>
                                            <th>123458</th>
                                            <th>컴퓨터</th>
                                            <th>user05</th>
                                            <th>문미미</th>
                                            <th>010-1234-5678</th>
                                            <th>30000원</th>
                                            <th>카카오페이</th>
                                            <th>정상</th>
                                            <th>구매확정</th>
                                            <th>2022.12.08</th>
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
