<%@ page language="java" contentType="text/html; charset=UTF-8"
          pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ include file="../common/header.jsp"%>
      <%@ include file="../common/navigation.jsp"%>
<div class="container" style="margin-top:30px">
	<div class="row">
		<div class="col-sm-12">
	      <h2>수정</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<form action="modifyAction" method = "POST" enctype="multipart/form-data">
			<input type="number" value="${event.id}" id="id" name="id" style="display:none">
			<div class="row">
				<div class="col-sm-6"style="display:flex">
				    <h2>제목:</h2> <input type="text" class="form-control"value="${event.title}" id="title" name = "title">
                    </div>
				    <div class="col-sm-3" style="display:flex">
				        <p>작성일 :${event.createdAt} </p>
				    </div>
				    <div class="col-sm-3" style="display:flex">
				        <p>작성자 :<input type="text" class="form-control"value="${event.createdBy}" id="createdBy" name = "createdBy"readonly ></p>
                </div>

				<div class="col-sm-12">
			      <textarea class="form-control" value="" rows="5" id="content" name = "content" >${event.content}</textarea>
				</div>
			</div>
		</div>
		<button type="button" class="btn btn-primary" id = "eventBtn">목록</button>
		<button type="submit" class="btn btn-primary" >수정완료</button>
		<button type="button" class="btn btn-primary" id = "writeBtn">취소</button>
		</form>
	</div>
</div>
</div>
<%@ include file="../common/footer.jsp"%>