<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" >
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" >	
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
	<div class="content-box after">
		<div class="homepage">
			<a href="${pageContext.request.contextPath}"><h1>홈페이지</h1></a>
		</div>
	
		<nav class="navbar navbar-expand-sm search-box">
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
					</form>
				</div>
			</div>
		</nav>
		<button class="btn btn-primary" id="search-btn" type="submit">검색</button>
	</div>
</body>
</html>