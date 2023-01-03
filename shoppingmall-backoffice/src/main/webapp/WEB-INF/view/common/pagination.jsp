<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url" value="${param.url}"/>
<c:set var="page" value="${param.page == 0 ? 1 : param.page}"/>
<c:set var="total" value="${param.total}" />
<c:set var="rowPerPage" value="${param.rowPerPage}"/>
<c:set var="title" value="${param.title}"/>
<c:set var="is_show" value="${param.is_show}"/>
<c:set var="start_at" value="${param.start_at}"/>
<c:set var="end_at" value="${param.end_at}"/>
<c:set var="searchUrl" value="&title=${title}&is_show=${is_show}&start_at=${start_at}&end_at=${end_at}"/>
<c:set var="pageTotal" value="${total < 1 ? 0 : Math.round(Math.ceil(total / rowPerPage))}" />
<c:set var="startIndex" value="${Math.round((page - 1) / rowPerPage) + 1}"/>
<c:set var="endIndex" value="${((startIndex + rowPerPage) - 1 >= pageTotal ? pageTotal : (startIndex + rowPerPage) - 1)}"/>
<c:if test="${total > 0}">
    <div class="row">
        <div class="col">
            <ul id="paging" class"pagination" style="display:flex; list-style:none;">
                <li id ="pageStart"class ="page-item">
                    <a class="page-link" href="${url}?page=1${searchUrl}" aria-label="pageStart">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li id="Previous"class ="page-item">
                    <a class="page-link" href="${url}?page=${page-1}${searchUrl}" aria-label="Previous">
                        <span aria-hidden="true">&lt;</span>
                    </a>
                </li>
                <c:forEach var="count" begin="${startIndex}" end="${endIndex}">
                    <c:set var="targetUrl" value="${url}?page=${count}" />
                    <li id ="${count}" class ="page-item ${count == page ? "active" : ""}${searchUrl}">
                        <a class="page-link" href="${targetUrl}${searchUrl}">${count}</a>
                    </li>
                </c:forEach>
                <li id = "Next" class ="page-item">
                    <a class="page-link" href="${url}?page=${page == pageTotal ? pageTotal : page+1}${searchUrl}" aria-label="Next">
                        <span aria-hidden="true">&gt;</span>
                    </a>
                </li>
                <li id = "pageEnd"class ="page-item">
                    <a class="page-link" href="${url}?page=${pageTotal}${searchUrl}" aria-label="pageEnd">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</c:if>