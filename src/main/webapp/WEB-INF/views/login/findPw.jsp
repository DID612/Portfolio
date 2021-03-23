<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/find/pw" method="POST">
	<div class="form-group">
	  <label for="usr">아이디:</label>
	  <input type="text" class="form-control" id="usr" name="id">
	</div>
	<div class="form-group">
	  <label for="pNum">전화번호:</label>
	  <input type="text" class="form-control" id="pNum" placeholder="- 없이 입력해주세요.">
	</div>
	<div class="form-group">
	  <label for="email">이메일 주소:</label>
	  <input type="email" class="form-control" id="email" name="email">
	</div>
	<button type="submit">이메일 보내기</button>
</form>


</body>
</html>