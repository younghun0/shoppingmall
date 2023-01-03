<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/navigation.jsp"%>
<div class="container" style="margin-top:30px">
	<div class="row">
		<div class="col-sm-12">
            <h2>게시판</h2>
            총 게시판 수 :${total}<br />

            <form action="">
                <input type="hidden" name="page" value="1" />
                <table class="table">
                    <tbody>
                        <tr>
                            <th>제목</th>
                            <td><input type="text" name="title" value="${title}"></td>
                            <th >노출 여부</th>
                            <td >
                                <input type="radio" name="is_show" value="1"checked >노출
                                <input type="radio" name="is_show" value="0">비노출
                            </td>
                        </tr>
                        <tr>
                            <th>시작일시</th>
                            <td>
                                <input type="datetime-local" class="form-control"  id="start_at" name = "start_at"value="${start_at}" >
                            </td>
                            <th>종료일시</th>
                            <td>
                                <input type="datetime-local" class="form-control"  id="end_at" name = "end_at" value="${end_at}">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <button type="submit" style="width: 100%;">검색</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>

            <table id="example" class="table" style="width:100%">
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
		            <c:if test="${total <= 0}">
		                <tr>
		                    <td colspan="11">No Data.</td>
		                </tr>
		            </c:if>
		            <c:forEach var="event" varStatus="status" items="${eventList}">
		                <tr>
		                    <td><input type="checkbox" /></td>
		                    <td>${status.index+1}</td>
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
            <jsp:include page="../common/pagination.jsp">
                <jsp:param name="url" value="/event" />
                <jsp:param name="rowPerPage" value="${rowPerPage}" />
                <jsp:param name="total" value="${total}" />
                <jsp:param name="page" value="${page}" />
                <jsp:param name="title" value="${title}" />
                <jsp:param name="is_show" value="${is_show}" />
                <jsp:param name="start_at" value="${start_at}" />
                <jsp:param name="end_at" value="${end_at}" />
            </jsp:include>
			<a class="btn btn-primary" href="/event/write" id = "writeBtn">글쓰기</a>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp"%>