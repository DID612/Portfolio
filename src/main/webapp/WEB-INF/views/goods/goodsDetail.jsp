<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${pageContext.request.contextPath}

	<input type="hidden" name="gNum" value="${goods.gNum}" />

    <div class="form-group">
      <label for="usr">제목:</label>
      <input type="text" class="form-control" id="title" name="title" value="${goods.title}">
    </div>

    <div class="form-group">
      <label for="pwd">작성자:</label>
      <input type="text" class="form-control" id="writer" name="writer" value="${goods.writer}" readonly>
    </div>
			
	<div class="inputArea"> 
		<label>1차 분류</label>
		<select class="category1">
		  	<option value="">전체</option>
		</select>
	 
		<label>2차 분류</label>
		<select class="category2" name="cateCode" value="${goods.cateCode}">
			<option value="">전체</option>
		</select>
	</div>
    
    <!-- src 문제 -->
	<div class="inputArea file_wrap">
		 <label for="org_file_name">이미지</label>
		 <input type="file" id="org_file_name" name="uploadfile" value=""/>
		 <div class="select_img"><img class="thumb_img" src="" /></div>
    </div>
	
	<div class="inputArea">
		 <label for="gName">상품명</label>
		 <input type="text" id="gName" name="gName" value="${goods.gName}"/>
	</div>
	
	<div class="inputArea">
		 <label for="gPrice">상품가격</label>
		 <input type="text" id="gPrice" name="gPrice" value="${goods.gPrice}" />
	</div>
	
	<div class="inputArea">
		 <label for="gStock">상품수량</label>
		 <input type="text" id="gStock" name="gStock" value="${goods.gStock}"/>
	</div>

  	<div class="form-group" style="display:none">
		  <label for="comment">내용:</label>
		  <textarea class="form-control" rows="5" id="content" name="content">${goods.gPhone}</textarea>
	</div>
	
	<div class="inputArea">
		 <label for="gMaker">생산자</label>
		 <input type="text" id="gMaker" name="gMaker" value="${goods.gMaker}"/>
	</div>
	
	<div class="inputArea">
		 <label for="gPhone">연락처</label>
		 <input type="text" id="gPhone" name="gPhone" value="${goods.gPhone}"/>
	</div>
	
	<div class="inputArea">
		 <label for="gReceptionDay">예상 배송일수</label>
		 <input type="number" id="gReceptionDay" name="gReceptionDay" value="${goods.gReceptionDay}"/>
	</div>

	<div class="inputArea">
		<button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
		<button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
 	</div>
 	
 <script>
  var formObj = $("form[role='form']");
  
  $("#modify_Btn").click(function(){
   formObj.attr("action", "/admin/goods/modify");
   formObj.attr("method", "get")
   formObj.submit();
  });
  
  $("#delete_Btn").click(function(){    
   formObj.attr("action", "/admin/goods/delete");
   formObj.submit();
  });
 </script>
</div>
</body>
</html>