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
	먼데??
	<table class="table table-hover">
    	<tbody class="gdslist_box" id="gdslist_box">
		    <c:forEach items="${gdslist}" var="goods">
		      <tr>   	
		      	<td><a href="${pageContext.request.contextPath}/goods/goodsDetail?gNum=${goods.gNum}">${goods.title}</a></td>
		        <td>${goods.gPrice}</td>
		        <td><img alt="" src="http://${pageContext.request.contextPath}/${goods.save_file_name}"></td>
		      </tr>
		    </c:forEach>
	    </tbody>
	</table>
</div>
</body>
</html>