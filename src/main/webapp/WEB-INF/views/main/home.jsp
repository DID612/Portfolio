<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
	<script src="https://kit.fontawesome.com/b1e3c8f87d.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/rolling.js"></script>	
</head>
<body>

<div class="navigation-box">
	<div class="category">
		<button>전체 카테고리</button>
	</div>
	<div class="all-service">
		<ul>
			<li>
				<a href="#">베스트</a>
			</li>
			<li>
				<a href="#">세일</a>
			</li>
			<li>
				<a href="#">이벤트</a>
			</li>
			<li>
				<a href="#">공지사항</a>
			</li>
		</ul>
	</div>
</div>
<div class="today-banner-wrap">
	<a class="prev">
		<i class="fas fa-chevron-circle-left fa-3x"></i>
	</a>
	<a class="next">
		<i class="fas fa-chevron-circle-right fa-3x"></i>
	</a>
	<div class="today-banner-container">
		<ul class="rolling-box">		
			<li class="rolling-banner">
				<img alt="" src="${pageContext.request.contextPath}/resources/image/banner1.jfif">
			</li>
			<li class="rolling-banner">
				<img alt="" src="${pageContext.request.contextPath}/resources/image/banner2.jfif">
			</li>
			<li class="rolling-banner">
				<img alt="" src="${pageContext.request.contextPath}/resources/image/banner3.jfif">
			</li>
			<li class="rolling-banner">
				<img alt="" src="${pageContext.request.contextPath}/resources/image/banner4.jfif">
			</li>
			<li class="rolling-banner">
				<img alt="" src="${pageContext.request.contextPath}/resources/image/banner5.jfif">
			</li>		
		</ul>
	</div>
</div>

 	  <table class="table table-hover">
	    <tbody class="recommended-sale" id="recommended-sale">
		    <c:forEach items="${list}" var="board">
		      <tr>
		        <td>${board.content}</td>
		      </tr>
		    </c:forEach>
	    </tbody>
	  </table>
	  <a href="${pageContext.request.contextPath}/register">
	 	 <button type="button" class="btn btn-primary">글쓰기</button>  		  
	  </a>
	  
<nav class="navbar navbar-expand-sm">
    <div class="container">
        <div class="input-group">
            <form class="form-inline">
                <select class="form-control" id="type" name="type" >
                   <option value="1" <c:out value="${pm.criteria.type==1?'selected':'' }"/>>선택
                    </option>
                   <option value="2" <c:out value="${pm.criteria.type==2?'selected':'' }"/>>제목
                	</option>
				   <option value="3" <c:out value="${pm.criteria.type==3?'selected':'' }"/>>저자
            		</option>
				   <option value="4" <c:out value="${pm.criteria.type==4?'selected':'' }"/>>내용
        			</option>
  				</select>
				<input class="form-control mr-sm-2" type="text" placeholder="Search"
                       name="search" value="${pm.criteria.search}">
				<button class="btn btn-success" type="submit">검색</button>
			</form>
		</div>
	</div>
</nav>
	  
	<ul class="pagination" style="justify-content: center;">
	    <c:if test="${pm.prev}">
	        <li class="page-item">
	            <a class="page-link" href="${pageContext.request.contextPath}/list?page=${pm.startPage-1}&search=${pm.criteria.search}&type=${pm.criteria.type}">이전</a>
	        </li>
	    </c:if>
	    
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="index">
			<c:if test="${index == pm.criteria.page}">
				<li class="page-item active">
		            <a class="page-link" href="${pageContext.request.contextPath}/list?page=${index}&search=${pm.criteria.search}&type=${pm.criteria.type}">${index}</a>
		        </li>
			</c:if>
			<c:if test="${index != pm.criteria.page}">
				<li class="page-item">
		            <a class="page-link" href="${pageContext.request.contextPath}/list?page=${index}&search=${pm.criteria.search}&type=${pm.criteria.type}">${index}</a>
		        </li>
			</c:if>
	    </c:forEach>
	    
	    <c:if test="${pm.next}">
	        <li class="page-item">
	            <a class="page-link" href="${pageContext.request.contextPath}/list?page=${pm.endPage+1}&search=${pm.criteria.search}&type=${pm.criteria.type}">다음</a>
	        </li>
	    </c:if>
	</ul>
	

<P>  The time on the server is ${serverTime}. </P>

<c:if test="${user != null}">
	<h2>
		${user.id}님 환영합니다.
	</h2>
</c:if>

<script type="text/javascript">
	var a1 = document.getElementById('#recommended-sale').src();
	console.log(a1);
	var content = $('#recommended-sale').src();
	console.log(content);
	console.log(2);
	console.log(content);
</script>
</body>
</html>
