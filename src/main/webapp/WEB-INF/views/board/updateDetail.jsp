<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
</head>
<body>

  <form action="${pageContext.request.contextPath}/updateDetail?bNum=${board.bNum}" method="post">
    <div class="form-group">
      <label for="usr">제목:바보</label>
      <input type="text" class="form-control" id="title" name="title" value="${board.title}">
    </div>
    <div class="form-group">
      <label for="pwd">작성자:</label>
      <input type="text" class="form-control" id="writer" name="writer" value="${board.writer}" readonly>
    </div>
  	<div class="form-group">
	  <label for="comment">내용:</label>
	  <textarea class="form-control" rows="5" id="content" name="content">${board.content}</textarea>
	</div>
	<button type="submit" class="btn btn-primary">수정 완료</button>  	
  </form>

</body>
</html>