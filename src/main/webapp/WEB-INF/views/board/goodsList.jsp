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
	굿즈리스트
	${gdslist}
	<table class="table table-hover">
	    <tbody class="gdslist" id="gdslist">
		    <c:forEach items="${gdslist}" var="goods">
		      <tr>
		        <td>${gdslist.title}</td>
		        <td>${gdslist.gPrice}</td>
		      </tr>
		    </c:forEach>
	    </tbody>
	</table>
</body>
</html>