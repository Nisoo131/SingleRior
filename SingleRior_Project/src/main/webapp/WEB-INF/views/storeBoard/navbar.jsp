<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script> 
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
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
	#drop{position:relative;z-index:2}
	#card{position:relative;z-index:1}
	.carousel-item{text-align:center}
	
    display: block;
    margin-left: auto;
    margin-right: auto 
}
@import url(https://fonts.googleapis.com/css?family=Roboto:400,700,500);

/* main Styles */

	
	html { box-sizing: border-box; }
	
	*, *:before, *:after { box-sizing: inherit; }
	
	body {
	  background: #fafafa;
	  font-family: "Roboto", sans-serif;
	  font-size: 14px;
	  margin: 0;
	}
	
	a { text-decoration: none; }
	
	.container {
	  width: 1000px;
	  margin: auto;
	}
	
	h1 { text-align:center; margin-top:150px;}
	
	/* Navigation Styles */
	
	nav { background: #2ba0db; }
	
	nav ul {
	  font-size: 15px;
	  margin: 0;
	  padding: 0;
	}
	
	nav ul li {
	  display: inline-block;
	  position: relative;
	}
	
	nav ul li a {
	  color: #fff;
	  display: block;
	  font-size: 15px;
	  padding: 15px;
	  transition: 0.3s linear;
	}
	
	nav ul li:hover { background: #126d9b; }
	
	nav ul li ul {
	  border-bottom: 5px solid #2ba0db;
	  display: none;
	  position: absolute;
	  width: 250px;
	}
	
	nav ul li ul li {
	  border-top: 1px solid #444;
	  display: block;
	}
	
	nav ul li ul li:first-child { border-top: none; }
	
	nav ul li ul li a {
	  background: #373737;
	  display: block;
	  padding: 10px 14px;
	}
	
	nav ul li ul li a:hover { background: #126d9b; }
	
	nav .fa.fa-angle-down { margin-left: 6px; }
	
</style>
</head>
<body>
	<header class="sticky-top">
		<div>
			<jsp:include page="../common/top.jsp"/>
		</div>
	</header>
	
	<div id="drop" >
	<nav>
	  <div class="container">
	    <ul>
	      <li><a href="#">가구<i class='fa fa-angle-down'></i></a>
	      	<ul>
	          <li><a href="${ contextPath }/categoryList.st">침대</a></li>
	          <li><a href="#">테이블</a></li>
	          <li><a href="#">서랍장</a></li>
	          <li><a href="#">의자</a></li>
	          <li><a href="#">옷장</a></li>
	          <li><a href="#">화장대</a></li>
	        </ul>
	       </li>
	 
	       <li><a href="#">패브릭<i class='fa fa-angle-down'></i></a>
	      	<ul>
	          <li><a href="#">이불</a></li>
	          <li><a href="#">배개</a></li>
	          <li><a href="#">커튼/블라인드</a></li>
	          <li><a href="#">러그</a></li>
	        </ul>
	       </li>
	       <li class='sub-menu'> <a href="#">인테리어소품<i class='fa fa-angle-down'></i></a>
	        <ul>
	          <li><a href="#">식물</a></li>
	          <li><a href="#">시계</a></li>
	          <li><a href="#">캔들/디퓨저</a></li>
	          <li><a href="#">윌데코/장식</a></li>
	        </ul>
	      </li>
	        <li class='sub-menu'> <a href="#">주방용품<i class='fa fa-angle-down'></i></a>
	        <ul>
	          <li><a href="#">냄비/프라이팬</a></li>
	          <li><a href="#">그릇</a></li>
	          <li><a href="#">보관용기</a></li>
	          <li><a href="#">수저/커트러리</a></li>
	          <li><a href="#">컵/텀블러</a></li>
	          <li><a href="#">칼/도마</a></li>
	        </ul>
	      </li>
	
	        <li class='sub-menu'><a href="#">가전제품<i class='fa fa-angle-down'></i></a>
	        <ul>
	          <li><a href="#">냉장고</a></li>
	          <li><a href="#">TV/모니터</a></li>
	          <li><a href="#">세탁기/건조기</a></li>
	          <li><a href="#">컴퓨터/노트북/태블릿</a></li>
	          <li><a href="#">청소기</a></li>
	          <li><a href="#">계절가전</a></li>
	        </ul>
	      </li>
	        <li class='sub-menu'> <a href="#">소형가전<i class='fa fa-angle-down'></i></a>
	        <ul>
	          <li><a href="#">이어폰/헤드셋</a></li>
	          <li><a href="#">스피커</a></li>
	          <li><a href="#">마이크</a></li>
	          <li><a href="#">빔프로젝터</a></li>
	          <li><a href="#">미용가전</a></li>
	        </ul>
	      </li>
	      </ul>
	  </div>
	</nav>
	</div>

	<script>
	$('nav li').hover(
	  function() {
	      $('ul', this).stop().slideDown(200);
	      $('ul', this).css('background','transparent');
	  },
	    function() {
	    $('ul', this).stop().slideUp(200);
	  }
	);
	</script>
</body>
</html>