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
<table class="table table-hover">
	<thead>
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>이메일</td>
			<td>나이</td>
			<td>권한</td>
			<td>수정</td>
		</tr>
	</thead>
	<c:forEach items="${list}" var="user">
		<tr class="user-row">
				<td class="id">${user.id}</td>
				<td>${user.name}</td>
				<td>${user.email}</td>
				<td>${user.age}</td>
			<td>
				<select class="authPower">
					<c:forEach begin="1" end="10" var="i">
						<option <c:if test="${i == user.authPower}">selected</c:if>>${i}</option>
					</c:forEach>
				</select>
			</td>
			<td>
				<button class="btn btn-outline-success modify-btn">수정</button>	
			</td>
		</tr>
	</c:forEach>
</table>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js">
	$('.modify-btn').click(function(){
		var id = $(this).parents('.user-row').find('.id').text();
		var authPower = $(this).parents('.user-row').find('.authPower').val();
    	var sendData = {'id' : id, 'authPower' : authPower};
    	
			$.ajax({
					url : "<%=request.getContextPath()%>/ajaxModify" ,
					type : 'post',
					data : JSON.stringify(sendData),
					dataType:"json",
					contentType:"application/json; charset=UTF-8",
					success : function(data){
					alert('권한 변경에 성공했습니다.')
					},
					error : function(){
						alert('권한 변경에 실패했습니다.');
					}
			})
	})
</script>
</body>
</html>