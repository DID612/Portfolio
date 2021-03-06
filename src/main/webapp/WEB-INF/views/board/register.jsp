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

  <form action="${pageContext.request.contextPath}/register" method="post"" enctype="multipart/form-data">
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

  </script>
</body>
</html>