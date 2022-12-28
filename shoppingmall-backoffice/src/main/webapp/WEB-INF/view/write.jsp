<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>이벤트 페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>

<%@ include file="./fix/header.jsp"%>

<div class="container" style="margin-top:30px">
	<div class="row">
		<div class="col-sm-12">
	      <h2>글쓰기</h2>
	        <form action="writeAction" method = "POST" enctype="multipart/form-data">
				<div class="form-group">
				  <label for="usr">제목:</label>
				  <input type="text" class="form-control" id="title" name = "title">
				</div>
			    <div class="form-group">
			      <label>작성자: 숫자만</label>
			      <input type="text" value="1" class="form-control-plaintext" id="created_by" name="created_by" readonly>
			    </div>
			    <div class="form-group">
				  <label for="comment">내용:</label>
				  <textarea class="form-control" rows="5" id="content" name = "content" ></textarea>
				</div>
			    <button type="submit" class="btn btn-primary">글쓰기</button>
			  </form>
		</div>
	</div>

</div>
</body>
</html>