<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
</head>
<body>

  <form action="${pageContext.request.contextPath}/register/goods" method="post" enctype="multipart/form-data" autocomplete="off">	
    <div class="form-group">
      <label for="usr">제목:</label>
      <input type="text" class="form-control" id="title" name="title" value="${board.title}">
    </div>

    <div class="form-group">
      <label for="pwd">작성자:</label>
      <input type="text" class="form-control" id="writer" name="writer" value="${user.id}" readonly>
    </div>
			
	<div class="inputArea"> 
		<label>1차 분류</label>
		<select class="category1">
		  	<option value="">전체</option>
		</select>
	 
		<label>2차 분류</label>
		<select class="category2" name="cateCode">
			<option value="">전체</option>
		</select>
	</div>
    
    <!-- src 문제 -->
	<div class="inputArea file_wrap">
		 <label for="org_file_name">이미지</label>
		 <input type="file" id="org_file_name" name="uploadfile" />
		 <div class="select_img"><img class="thumb_img" src="" /></div>
    </div>
	    <%=request.getRealPath("/") %>
	<div class="inputArea">
		 <label for="gName">상품명</label>
		 <input type="text" id="gName" name="gName" />
	</div>
	
	<div class="inputArea">
		 <label for="gPrice">상품가격</label>
		 <input type="text" id="gPrice" name="gPrice" />
	</div>
	
	<div class="inputArea">
		 <label for="gStock">상품수량</label>
		 <input type="text" id="gStock" name="gStock" />
	</div>

  	<div class="form-group" style="display:none">
		  <label for="comment">내용:</label>
		  <textarea class="form-control" rows="5" id="content" name="content"></textarea>
	</div>
	
	<div class="inputArea">
		 <label for="gMaker">생산자</label>
		 <input type="text" id="gMaker" name="gMaker" />
	</div>
	
	<div class="inputArea">
		 <label for="gPhone">연락처</label>
		 <input type="text" id="gPhone" name="gPhone" />
	</div>
	
	<div class="inputArea">
		 <label for="gReceptionDay">예상 배송일수</label>
		 <input type="number" id="gReceptionDay" name="gReceptionDay" />
	</div>
	
	<div id="summernote"></div>
	<br>
	<button type="submit" class="btn btn-primary">등록</button>  	
  </form>
  
  
  <script type="text/javascript">
  	$('#summernote').summernote({
      placeholder: 'Hello Bootstrap 4',
      tabsize: 2,
      height: 300
    })
    
    $('form').submit(function(){
  	  var code = $('#summernote').summernote('code');
  	  $('textarea[name=content]').val(code);
    })

	// onImageUpload callback
	$('#summernote').summernote({
	  callbacks: {
	    onImageUpload: function(files) {
	      // upload image to server and create imgNode...
	      $summernote.summernote('insertNode', imgNode);
	    }
	  }
	});
	
	// summernote.image.upload
	$('#summernote').on('summernote.image.upload', function(we, files) {
	  // upload image to server and create imgNode...
	  $summernote.summernote('insertNode', imgNode);
	});
    
	// input 파일이 바뀌면 이미지 미리보기 적용
 	$("#org_file_name").change(function(){
		 if(this.files && this.files[0]) {
		    var reader = new FileReader;
		    reader.onload = function(data) {
		     	$(".select_img img").attr("src", data.target.result).width(500);        
		    }
		    reader.readAsDataURL(this.files[0]);
		 }
	})	

		// 컨트롤러에서 데이터 받기
		var jsonData = JSON.parse('${category}');
		console.log(jsonData);

		var cate1Arr = new Array();
		var cate1Obj = new Object();

		// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
		for(var i = 0; i < jsonData.length; i++) {
		 
			 if(jsonData[i].level == "1") {
			  cate1Obj = new Object();  //초기화
			  cate1Obj.cateCode = jsonData[i].cateCode;
			  cate1Obj.cateName = jsonData[i].cateName;
			  cate1Arr.push(cate1Obj);
			 }
		}

		// 1차 분류 셀렉트 박스에 데이터 삽입
		var cate1Select = $("select.category1")

		for(var i = 0; i < cate1Arr.length; i++) {
		 cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
		      + cate1Arr[i].cateName + "</option>"); 
		}
		
		$(document).on("change", "select.category1", function(){
			console.log('ddd');
			 var cate2Arr = new Array();
			 var cate2Obj = new Object();
			 
			 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
			 for(var i = 0; i < jsonData.length; i++) {
			  
			  if(jsonData[i].level == "2") {
			   cate2Obj = new Object();  //초기화
			   cate2Obj.cateCode = jsonData[i].cateCode;
			   cate2Obj.cateName = jsonData[i].cateName;
			   cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
			   
			   cate2Arr.push(cate2Obj);
			  }
			 }
			 
			 var cate2Select = $("select.category2");

			 for(var i = 0; i < cate2Arr.length; i++) {
			   cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
			        + cate2Arr[i].cateName + "</option>");
			 } 
			});
		
		$(document).on("change", "select.category1", function(){

			 var cate2Arr = new Array();
			 var cate2Obj = new Object();
			 
			 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
			 for(var i = 0; i < jsonData.length; i++) {
			  
				if(jsonData[i].level == "2") {
				   cate2Obj = new Object();  //초기화
				   cate2Obj.cateCode = jsonData[i].cateCode;
				   cate2Obj.cateName = jsonData[i].cateName;
				   cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
			   
			   	   cate2Arr.push(cate2Obj);
			  	}
			 }
			 
			 var cate2Select = $("select.category2");
		 
			 cate2Select.children().remove();

			 $("option:selected", this).each(function(){
			  
				  var selectVal = $(this).val();  
				  cate2Select.append("<option value='" + selectVal + "'>전체</option>");
				  
				  for(var i = 0; i < cate2Arr.length; i++) {
					   	if(selectVal == cate2Arr[i].cateCodeRef) {
					    	cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
					         + cate2Arr[i].cateName + "</option>");
					   	}
				  }
			  
			 });
			 
		});

  </script>
</body>
</html>