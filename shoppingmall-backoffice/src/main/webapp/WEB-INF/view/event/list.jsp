<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/navigation.jsp"%>
<div class="container" style="margin-top:30px">
	<div class="row">
		<div class="col-sm-12">
            <h2>게시판</h2>
            <table id="example" class="display" style="width:100%">
                <caption style="display: none;">이벤트</caption>
                <thead>
                    <tr>
                        <th><input type="checkbox" /></th>
                        <th>NO</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>수정자</th>
                        <th>수정일</th>
                        <th>노출여부</th>
                        <th>활성화여부</th>
                        <th>시작일</th>
                        <th>종료일</th>
                    </tr>
                </thead>
		        <tbody>
		            <c:forEach var="event" varStatus="status" items="${eventList}">
		                <tr>
		                    <td><input type="checkbox" /></td>
		                    <td>${status.index}</td>
		                    <td><a href="/event/view?id=${event.id}&page=${page}">${event.title}</a></td>
		                    <td>${event.created_by}</td>
		                    <td>${event.created_at}</td>
		                    <td>${event.updated_by}</td>
		                    <td>${event.updated_at}</td>
		                    <td>${event.is_show ? "노출" : "비노출"}</td>
		                    <td>${event.is_state ? "활성화" : "비활성화"}</td>
		                    <td>${event.start_at}</td>
		                    <td>${event.end_at}</td>

		                </tr>
		            </c:forEach>
		        </tbody>
		    </table>

			<a class="btn btn-primary" href="/event/write" id = "writeBtn">글쓰기</a>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp"%>