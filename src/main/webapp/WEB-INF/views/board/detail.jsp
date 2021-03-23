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

  <form action="/action_page.php">
    <div class="form-group">
      <label for="usr">제목:</label>
      <input type="text" class="form-control" id="title" name="title" value="${board.title}" readonly>
    </div>
    <div class="form-group">
      <label for="pwd">작성자:</label>
      <input type="text" class="form-control" id="writer" name="writer" value="${board.writer}" readonly>
    </div>
    <div class="form-group">
	  <label for="registerDate">작성일:</label>
	  <input type="text" class="form-control" id="registerDate" name="registerDate" readonly value="${board.registerDate}">
	</div>
	<div class="form-group">
	      <label for="content">내용:</label>
	      <input type="text" class="form-control" id="content" name="content" readonly value="${board.content}">
	      <div>${board.content}</div>
	</div>
	
  </form>
  	<a href="<%=request.getContextPath()%>/list?page=${cri.page}&search=${cri.search}&type=${cri.type}">
	  <button type="button" class="btn btn-outline-info">목록</button>
	</a>
  	<a href="${pageContext.request.contextPath}/updateDetail?bNum=${board.bNum}">
      <button type="button" class="btn btn-primary">수정</button>  	
  	</a>
  	<a href="${pageContext.request.contextPath}/delete?bNum=${board.bNum}">
      <button type="button" class="btn btn-primary">삭제</button>  	
  	</a>

</body>
</html>