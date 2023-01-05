<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/navigation.jsp"%>
<div class="container" style="margin-top:30px">
<c:set var="paramUrl" value="page=${param.page}&title=${param.title}&isShow=${param.isShow}&startAt=${param.startAt}&endAt=${param.endAt}"/>
	<div class="row">
		<div class="col-sm-12">
	      <h2>본문</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="row">
				<div class="col-sm-6"style="display:flex">
				    <h4>제목: ${event.title}</h4>
                </div>
                <div class="col-sm-4" style="display:flex">
                    <p>작성일시 : ${event.createdAt}</p>
                </div>
                <div class="col-sm-2" style="display:flex">
                    <p>작성자 : ${event.createdBy}</p>
                </div>
                <hr/>
                <div class="col-sm-12">
                    <span>${event.content}</span>
                </div>
                <hr/>
                <div class="col-sm-12">
                    <p>이벤트 기간 : ${event.startAt} - ${event.endAt}</p>
                </div>
            </div>
            <div class="col-12 table-tool">
                <div>
                    <form action = "deleteAction" method = "POST">
                        <input type="hidden" value="${event.id}" id="id" name="id">
                        <button type="submit" class="btn btn-danger">삭제</button>
                    </form>
                </div>
                <div>
                    <a href="/event?${paramUrl}"  class="btn btn-primary">목록</a>
                    <a href="/event/modify?id=${event.id}&${paramUrl}" class="btn btn-primary">수정</a>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp"%>