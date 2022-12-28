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

</style>
<script>

 var ID = getQueryStringObject().id;
 function getQueryStringObject() {
     var a = window.location.search.substr(1).split('&');
     if (a == "") return {};
     var b = {};
     for (var i = 0; i < a.length; ++i) {
         var p = a[i].split('=', 2);
         if (p.length == 1)
             b[p[0]] = "";
         else
             b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
     }
     return b;
 }

  $.ajax({url: "eventView?id="+ID, success: function(result){
	  $("#title").text(result.title);
	  $("#content").text(result.content);
	  $("#created_at").text(result.created_at);
	  $("#created_by").text(result.created_by);
   }});

$(document).ready(function() {
    $("#eventBtn").click(function(){
    	location.href ="event";
    })
    $("#modifyBtn").click(function(){
      	location.href ="modify?id="+ID;
    })

})
  </script>
</head>
<body>

<%@ include file="./fix/header.jsp"%>

<div class="container" style="margin-top:30px">
	<div class="row">
		<div class="col-sm-12">
	      <h2>본문</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="row">
				<div class="col-sm-6"style="display:flex">
				    <h2>제목:</h2> <h2 id = "title"></h2>
                    </div>
				    <div class="col-sm-3" style="display:flex">
				        <p>작성일 : </p><p id = "created_at"></p>
				    </div>
				    <div class="col-sm-3" style="display:flex">
				        <p>작성자 : </p><p id = "created_by"></p>
                </div>
				<div class="col-sm-12">
			      <pre id = "content"></pre>
				</div>
			</div>
		</div>
		<button type="button" class="btn btn-primary" id = "eventBtn">목록</button>
		<button type="button" class="btn btn-primary" id = "modifyBtn">수정</button>
		<button type="button" class="btn btn-primary" id = "writeBtn">삭제</button>
	</div>
</div>
</div>
</body>
</html>