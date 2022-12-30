<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/navigation.jsp"%>

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
			      <input type="number" value="1" class="form-control-plaintext" id="created_by" name="created_by" readonly>
			    </div>
			    <div class="form-group">
				  <label for="comment">내용:</label>
				  <textarea class="form-control" rows="5" id="content" name = "content" ></textarea>
				</div>
				<div class="form-group">
                   <label for="startDate">시작일:</label>
                   <input type="datetime-local" class="form-control"  id="start_at" name = "start_at" >
                </div>
                <div class="form-group">
                   <label for="endDate">종료일:</label>
                   <input type="datetime-local" class="form-control"  id="end_at" name = "end_at" >
                </div>
			    <button type="submit" class="btn btn-primary">글쓰기</button>
			  </form>
		</div>
	</div>

</div>
<%@ include file="../common/footer.jsp"%>