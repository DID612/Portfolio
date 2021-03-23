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
	        <th>번호</th>
	        <th>제목</th>
	        <th>작성자</th>
	        <th>작성일</th>
	        <th>조회수</th>
	      </tr>
	    </thead>
	    <tbody>
	    <c:forEach items="${list}" var="board">
	      <tr>
	        <td>${board.bNum}</td>
	        <td><a href="${pageContext.request.contextPath}/detail?bNum=${board.bNum}&search=${pm.criteria.search}&type=${pm.criteria.type}">${board.title}</a></td>      
	        <td>${board.writer}</td>
	        <td>${board.registerDate}</td>
	        <td>${board.views}</td>
	      </tr>
	    </c:forEach>
	    </tbody>
	  </table>
	  <a href="${pageContext.request.contextPath}/register">
	 	 <button type="button" class="btn btn-primary">글쓰기</button>  		  
	  </a>
	  
<nav class="navbar navbar-expand-sm">
    <div class="container">
        <div class="input-group">
            <form class="form-inline">
                <select class="form-control" id="type" name="type" >
                   <option value="1" <c:out value="${pm.criteria.type==1?'selected':'' }"/>>선택
                    </option>
                   <option value="2" <c:out value="${pm.criteria.type==2?'selected':'' }"/>>제목
                	</option>
				   <option value="3" <c:out value="${pm.criteria.type==3?'selected':'' }"/>>저자
            		</option>
				   <option value="4" <c:out value="${pm.criteria.type==4?'selected':'' }"/>>내용
        			</option>
  				</select>
				<input class="form-control mr-sm-2" type="text" placeholder="Search"
                       name="search" value="${pm.criteria.search}">
				<button class="btn btn-success" type="submit">검색</button>
			</form>
		</div>
	</div>
</nav>
	  
	<ul class="pagination" style="justify-content: center;">
	    <c:if test="${pm.prev}">
	        <li class="page-item">
	            <a class="page-link" href="${pageContext.request.contextPath}/list?page=${pm.startPage-1}&search=${pm.criteria.search}&type=${pm.criteria.type}">이전</a>
	        </li>
	    </c:if>
	    
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="index">
			<c:if test="${index == pm.criteria.page}">
				<li class="page-item active">
		            <a class="page-link" href="${pageContext.request.contextPath}/list?page=${index}&search=${pm.criteria.search}&type=${pm.criteria.type}">${index}</a>
		        </li>
			</c:if>
			<c:if test="${index != pm.criteria.page}">
				<li class="page-item">
		            <a class="page-link" href="${pageContext.request.contextPath}/list?page=${index}&search=${pm.criteria.search}&type=${pm.criteria.type}">${index}</a>
		        </li>
			</c:if>
	    </c:forEach>
	    
	    <c:if test="${pm.next}">
	        <li class="page-item">
	            <a class="page-link" href="${pageContext.request.contextPath}/list?page=${pm.endPage+1}&search=${pm.criteria.search}&type=${pm.criteria.type}">다음</a>
	        </li>
	    </c:if>
	</ul>
</body>
</html>