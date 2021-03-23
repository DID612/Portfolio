<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-light">
		<ul class="navbar-nav">
		   <c:if test="${user.id == null}">
			   <li class="nav-item">
			     <a class="nav-link" href="${pageContext.request.contextPath}/login">로그인</a>
			   </li>
		   </c:if>		   
			   
		   <c:if test="${user.id != null}">
			   <li class="nav-item">
			     <a class="nav-link" href="${pageContext.request.contextPath}/logout">로그아웃</a>
			   </li>
		   </c:if>
		   
		   <li class="nav-item">
		     <a class="nav-link" href="${pageContext.request.contextPath}/mypage">마이페이지</a>
		   </li>
		   
		   <li class="nav-item">
		     <a class="nav-link" href="${pageContext.request.contextPath}/modify">권한부여</a>
		   </li>
		   
		   <li class="nav-item">
		     <a class="nav-link" href="${pageContext.request.contextPath}/signup">회원가입</a>
		   </li>
		   
		   <li class="nav-item">
		     <a class="nav-link" href="${pageContext.request.contextPath}/list">게시판</a>
		   </li>
		</ul>
		<c:if test="${user.id!= null}">
			${user.id}님 환영합니다.
		</c:if>

	</nav>
</body>
</html>