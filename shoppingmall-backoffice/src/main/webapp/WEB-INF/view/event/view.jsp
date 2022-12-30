<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/navigation.jsp"%>
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
				    <h2>제목:</h2> ${event.title}</h2>
                    </div>
				    <div class="col-sm-3" style="display:flex">
				        <p>작성일 : ${event.created_at}</p>
				    </div>
				    <div class="col-sm-3" style="display:flex">
				        <p>작성자 : ${event.created_by}</p>
                </div>
				<div class="col-sm-12">
			      <pre id = "content"></pre>
				</div>
			</div>
		</div>
		<a href="/event?page=${page}"  class="btn btn-primary">목록</a>
		<a href="/event/modify?id=${event.id}&page=${page}" class="btn btn-primary">수정</a>
		<form action="deleteAction" method = "POST" enctype="multipart/form-data">
		<input type="number" value="${event.id}" id="id" name="id" style="display:none">
		<button type="submit" class="btn btn-primary" >비활성화</button>
		</form>
	</div>
</div>
</div>
<%@ include file="../common/footer.jsp"%>