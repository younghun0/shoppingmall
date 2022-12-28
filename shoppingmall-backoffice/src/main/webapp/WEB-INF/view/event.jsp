<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
 <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  </style>
<script type="text/javascript">
$(document).ready(function() {
    $("#writeBtn").click(function(){
    	location.href ="write";
    })
    $.ajax({url: "eventList", success: function(result){
        var html = "";
    	result.forEach(function(item){
        	html+="<tr><td>"+item.id+"</td>"
            html+="<td><a href = 'view?id=" + item.id + "'>" + item.title + "</a>"
            html+="<td>"+item.created_by+"</td>"
            html+="<td>"+item.created_at+"</td>"
        })
       $("#listArea").append(html)
       $('#example').DataTable({
       // 현재 상태를 보존
         	stateSave: true,
           	scrollX: true,
           	scrollY: false,
           	columnDefs: [
        		{ targets: 0, visible: false },
           		{ targets: 1, width: 100 }
           	]});
     }});

} );

</script>
</head>
<body>

<div class="jumbotron text-center" style="margin-bottom:0">
  <h1>이벤트</h1>
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="index">홈</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="event">게시판</a>
      </li>
    </ul>
  </div>
</nav>

<div class="container" style="margin-top:30px">
	<div class="row">
		<div class="col-sm-12">
	      <h2>게시판</h2>
			<table id="example" class="display" style="width:100%">
		        <thead>
		            <tr>
		                <th>#</th>
		                <th>제목</th>
		                <th>작성자</th>
		                <th>작성일</th>
		            </tr>
		        </thead>
		        <tbody id = "listArea">
		        </tbody>
		    </table>

			<button type="button" class="btn btn-primary" id = "writeBtn">글쓰기</button>
		</div>
	</div>
</div>
</body>
</html>