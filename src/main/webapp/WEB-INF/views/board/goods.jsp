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

	<div class="inputArea"> 
	  <label>1차 분류</label>
	  <select class="category1">
	   <option value="">전체</option>
	  </select>
	</div>
	

  <form action="${pageContext.request.contextPath}/register/goods" method="post"" enctype="multipart/form-data" autocomplete="off">
		
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
	
	<div class="inputArea">
	 <label for="gdsName">상품명</label>
	 <input type="text" id="gdsName" name="gdsName" />
	</div>
	
	<div class="inputArea">
	 <label for="gdsPrice">상품가격</label>
	 <input type="text" id="gdsPrice" name="gdsPrice" />
	</div>
	
	<div class="inputArea">
	 <label for="gdsStock">상품수량</label>
	 <input type="text" id="gdsStock" name="gdsStock" />
	</div>
	
	<div class="inputArea">
	 <label for="gdsDes">상품소개</label>
	 <textarea rows="5" cols="50" id="gdsDes" name="gdsDes"></textarea>
	</div>
	
	<div class="inputArea">
	 <button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
	</div>
	
	${goods}
	${user}
	
	<h1>파일업로드</h1>
    <input type="file" class="fileDrop" name="uploadfile" id="uploadfile"placeholder="${savedName}" /><br/>	

	<h1>작성</h1>
    <div class="form-group">
      <label for="usr">제목:</label>
      <input type="text" class="form-control" id="title" name="title" value="${board.title}">
    </div>
    
    <div class="form-group">
      <label for="pwd">작성자:</label>
      <input type="text" class="form-control" id="writer" name="writer" value="${user.id}" readonly>
    </div>
    
  	<div class="form-group" style="display:none">
	  <label for="comment">내용:</label>
	  <textarea class="form-control" rows="5" id="content" name="content"></textarea>
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
    });
    
    $('form').submit(function(){
  	  var code = $('#summernote').summernote('code');
  	  $('textarea[name=content]').val(code);
    })

	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();
	});
	
	$(".fileDrop").on("drop", function(event){
		event.preventDefault();
	});
	
	$(".fileDrop").on("change", function(event){
		var files = event.originalEvent.dataTransfer.files;
		var file = files[0];
			//console.log(file);
		var formData = new FormData(); // HTML5
		formData.append("file", file);
		
		$.ajax({
			url: '/upload/uploadAjax',
			data: formData,
			dataType: 'text',
			processData: false,
			contentType: false,
			type: 'POST',
			success: function(data){
				//alert(data);
				//서버로 파일을 전송한 다음에 그 파일을 다시 받아온다.?
				console.log('test');
				alert("되나?");
				//이미지 인경우 썸네일을 보여준다.
				if(checkImageType(data)){
					str = "<div>"
						+ "<a href='/upload/displayFile?fileName=" + getImageLink(data) + "'>"
						+ "<img src='/upload/displayFile?fileName=" + data + "'/>"
						+ "</a>"
						+ "<small data-src='" + data + "'>X</small></div>";
				}else {
					str = "<div>"
						+ "<a href='/upload/displayFile?fileName=" + data + "'>"
						+ getOriginalName(data) + "</a>"
						+ "<small data-src='" + data + "'>X</small></div>";
				}//else
					
				$(".uploadedList").append(str);	
			},
		})// ajax
	}) // input[file].change

		//업로드 파일 삭제 처리
		$(".uploadedList").on("click", "small", function(event){
			
			var that = $(this);
			
			alert($(this).attr("data-src"));
			
			$.ajax({
				url: "/sample/upload/deleteFile",
				type: "post",
				data: {fileName:$(this).attr("data-src")},
				dataType: "text",
				success : function(result){
					if(result == 'deleted'){
						//alert("deleted");
						that.parent("div").remove();
					}//
				},
			});
			
		});//uploadedList
		
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

			 for(var i = 0; i < cate2Arr.length; i++) {
			   cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
			        + cate2Arr[i].cateName + "</option>");
			 } 
			});
		
	/* 컨트롤러로 부터 전송받은 파일이 이미지 파일인지 확인하는 함수 */
	function checkImageType(fileName){
		var pattern = /jpg$|gif$|png$|jpeg$/i;
		return fileName.match(pattern);
	}//checkImageType
	
	//파일 이름 처리 : UUID 가짜 이름 제거
	function getOriginalName(fileName){
		if(checkImageType(fileName)){
			return;
	}
		
		var idx = fileName.indexOf("_") + 1;
		return fileName.substr(idx);
			
	}//getOriginalName
	
	//이미지 원본 링크 제공
	function getImageLink(fileName){
		
		if(!checkImageType(fileName)){
			return;
		}//if
		
		var front = fileName.substr(0, 12);
		var end = fileName.substr(14);
		
		return front + end;
		
	}//getImageLink
	
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


  </script>
</body>
</html>