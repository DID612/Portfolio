<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" >
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
</head>
<body>
	<div class="container">
	  <h1>회원가입 페이지</h1>
	  <h5>정보를 정확히 입력해주세요 :</h5>
	  <form action="${pageContext.request.contextPath}/signup/" method="post">
	    <div class="form-group">
	      <label for="usr">아이디:</label>
	      <input type="text" class="form-control col-3" id="id" name="id">      
	    </div>
	    <button type="button" class="id-check" id="iCheck">중복검사</button>
	    <div class="form-group">
	      <label for="pwd">비밀번호:</label>
	      <input type="password" class="form-control" id="pwd" name="password">
	    </div>
	    <div class="form-group">
	      <label for="pwd2">비밀번호 재입력:</label>
	      <input type="password" class="form-control" id="pwd2" name="password2">
	    </div>
	    <button type="button" class="pw-check" id="pCheck">비밀번호 재확인</button>
	    <div class="form-group">
	      <label for="age">나이:</label>
	      <input type="text" class="form-control" id="age" name="age">
	    </div>
	    <div class="form-group">
	      <label for="name">이름:</label>
	      <input type="text" class="form-control" id="name" name="name">
	    </div>
	    <div class="form-group">
	      <label for="email">이메일:</label>
	      <input type="email" class="form-control" id="email" name="email">
	    </div>
	    <div class="form-group">
	      <label for="sex">성별:</label>
	      <select class="form-control" id="sex" name="sex">
	        <option>M</option>
	        <option>F</option>
	      </select>
	    </div>
	    <div class="form-group">
	      <label for="pNum">휴대폰 인증:</label>
	      <input type="text" class="form-control" id="pNum" name="pNum">
	    </div>
	    <button type="submit" class="btn btn-primary submit" name="submitBtn">Submit</button>
	  </form>
	  ${user.id}
	  ${user}
	</div>
	<script type="text/javascript">
		var iCheck = false;
		var pCheck = false;
		
		$('#iCheck').click(function(){
			var id = $('#id').val();
			if(id == ''){
				alert('아이디를 입력하세요')
				return;
			}
			var data = {'id' : id};
				$.ajax({
					url : '${pageContext.request.contextPath}/iCheck',
					type : 'post',
					data : data,
					success : function(data){
						if(data == "user"){
							alert('이미 가입한 아이디입니다.')
						}else{
							alert('가입 가능한 아이디 입니다.')
							iCheck = true;
						}
					},
					error : function(){
						console.log('실패');
					}
				})
		})
		
		$('#id').change(function(){
			iCheck = false;
		})
		
 		$('#pCheck').click(function(){
			var pw = $('#pwd').val();
			var pw2 = $('#pwd2').val();
			if(pw != '' && pw2 != ''){
				if(pw == pw2){
					pCheck = pw.chkPW(8,15);
				}
				pCheck = false;
			}
		})

		function chkPW(var min, var max){

			 var pw = $("#pwd").val();
			 var pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/

			 if(pw.length < max || pw.length > min){
				alert("8자리 ~ 15자리 이내로 입력해주세요. (영문자,숫자,특수문자 하나씩 사용)");
			  	return false;
			 }else if(!pw.match(pwReg)){
					alert("8자리 ~ 15자리 이내로 입력해주세요. (영문자,숫자,특수문자 하나씩 사용)");
			    return false;
			 }else{
				return true;
			 }
		}
		
		
		$('#submitBtn').submit(function(){
			if(!iCheck){
				alert('아이디 중복 검사를 하세요.');
				return false;
			}
			if(!pCheck){
				alert('재확인 비밀번호가 일치하지 않습니다.')
				return false;
			}
			console.log('가입완료')
		})
	</script>
</body>
</html>