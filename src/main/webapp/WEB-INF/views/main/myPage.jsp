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
<form action = "${pageContext.request.contextPath}/main/mypage" method="post" action="" id="form" class="container col-12">
            <h1 class="title">회원 정보 수정</h1>
            <div class="form-group">
                <input type="text" class="form-control" id="id" name="id" placeholder="아이디" value="${user.id}">
                <label for="id" class="error" id="id-error"></label>
            </div>
            <!-- form태그 안에 버튼 타입 지정안하면 기본 submit이 됨 -->
            <div class="form-group">
                <input type="text" class="form-control" id="pw" name="pw" placeholder="비밀번호" value="">
                <label for="pw" class="error" id="pw-error"></label>
              </div>
            <div class="form-group">
                <input type="text" class="form-control" id="pw2" name="pw2" placeholder="비밀번호2" value="">
                <label for="pw2" class="error" id="pw2-error"></label>
              </div>
            <div class="form-group">
                <input type="text" class="form-control" id="age" name="age" placeholder="나이" value="${user.age}">
                <label for="age" class="error" id="age-error"></label>
              </div>
            <div class="form-group">
                <input type="text" class="form-control" id="name" name="name" placeholder="이름" value="${user.name}">
                <label for="name" class="error" id="name-error"></label>
              </div>
            <div class="form-group">
                <input type="text" class="form-control" id="email" name="email" placeholder="이메일" value="${user.email}">
                <label for="email" class="error" id="email-error"></label>
              </div>
            <button type="submit" class="btn btn-outline-success">수정</button>
        </form>
        <script type="text/javascript">
			$('form').submit(function(){
				var pw = $('input[name=pw]').val();
				var pw2 = $('input[name=pw2]').val();
				if(pw == ''){
					alert('비밀번호를 입력하세요.');
					return false;
				}
				
				if(pw != pw2){
					alert('비밀번호가 일치하지 않습니다.');
					return false;
				}
			})	
        </script>
</body>
</html>