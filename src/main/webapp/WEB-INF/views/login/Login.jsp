<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/login" method="post">
		<div class="form-group">
		  <label for="usr">아이디:</label>
		  <input type="text" class="form-control" id="id" name="id">
		</div>
		<div class="form-group">
		  <label for="pwd">비밀번호:</label>
		  <input type="password" class="form-control" id="pw" name="pw">
		</div>
		<button name="lBtn">로그인</button>
		<div class="userService">
			<a name ="findPw"href="${pageContext.request.contextPath}/find/pw">
				<span>비밀번호 찾기</span>
			</a>
			
			&nbsp;
			
			<a href="${pageContext.request.contextPath}/signup">
				<span>회원가입</span>
			</a>
		</div>

	</form>
	
<script type="text/javascript">
		$('#lBtn').click(function(){
			var id = $('#id').val();
			var pw = $('#pw').val();
			
			if(id != '' && pw != ''){
				if(id == ${user.id} && pw == ${user.password})
					return;
			}else{
				if(id == ''){
					alert('아이디를 입력해주세요.')
				}else if(pw == ''){
					alert('비밀번호를 입력해주세요.')
				}
				
			}
		})
	</script>
</body>
</html>