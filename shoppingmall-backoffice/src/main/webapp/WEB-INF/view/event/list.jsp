<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/navigation.jsp"%>
        <div class="container" style="margin-top:30px">
            <div class="row">
                <div class="col-sm-12">
                    <h2>이벤트</h2>
                    <c:set var="paramUrl" value="page=${page}&title=${title}&isShow=${isShow}&startAt=${startAt}&endAt=${endAt}"/>
                    <form class="search-form">
                        <input type="hidden" name="page" value="1" />
                        <table class="table search-table">
                            <tbody>
                                <tr>
                                    <th>제목</th>
                                    <td><input type="text" name="title" value="${title}"></td>
                                    <th >노출 여부</th>
                                    <td >
                                        <input type="radio" name="isShow" value="1" "${isShow == 1 ?" checked ": ""}" >노출
                                        <input type="radio" name="isShow" value="0" "${isShow == 0 ?" checked ": ""}" >비노출
                                    </td>
                                </tr>
                                <tr>
                                    <th>시작일시</th>
                                    <td>
                                        <input type="datetime-local" class="form-control"  id="startAt" name = "startAt"value="${startAt}" >
                                    </td>
                                    <th>종료일시</th>
                                    <td>
                                        <input type="datetime-local" class="form-control"  id="endAt" name = "endAt" value="${endAt}">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <button type="submit" class="btn btn-primary" style="width: 100%;">검색</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <hr />
                    <div class="row margin-bottom-16">
                        <div class="col-12 display-flex justify-content-space-between">
                            <form method="GET" action="/event" name="sortForm">
                                <input type="hidden" name="page" value="${page}"/>
                                <input type="hidden" name="title" value="${title}"/>
                                <input type="hidden" name="isShow" value="${isShow}"/>
                                <input type="hidden" name="startAt" value="${startAt}"/>
                                <input type="hidden" name="endAt" value="${endAt}"/>
                                <label for="sort" class="font-weight-bold">정렬옵션:&nbsp;</label>
                                <select id="sort" name="sort">
                                    <option>선택</option>
                                    <option value="title" ${param.sort == "title" ? "selected" : ""}>제목순</option>
                                    <option value="created_at"  ${param.sort == "created_at" ? "selected" : ""}>작성일순</option>
                                    <option value="updated_at" ${param.sort == "updated_at" ? "selected" : ""}>수정일순</option>
                                    <option value="is_show" ${param.sort == "is_show" ? "selected" : ""}>노출여부</option>
                                    <option value="start_at" ${param.sort == "start_at" ? "selected" : ""}>시작일순</option>
                                    <option value="end_at" ${param.sort == "end_at" ? "selected" : ""}>종료일순</option>
                                </select>
                            </form>
                            <div>
                                총 게시물 수: ${total}
                            </div>
                        </div>
                    </div>
                    <table id="eventBoard" class="table" style="width:100%">
                        <caption style="display: none;">이벤트</caption>
                        <thead>
                            <tr>
                                <th class="center" style="width: 5%;">
                                    <input type="checkbox" id="selectAll" />
                                </th>
                                <th class="center" style="width: 5%;">NO</th>
                                <th class="center" style="width: 20%;">제목</th>
                                <th class="center" style="width: 10%;">노출<br />여부</th>
                                <th class="center" style="width: 10%;">시작<br />일시</th>
                                <th class="center" style="width: 10%;">종료<br />일시</th>
                                <th class="center" style="width: 10%;">작성자</th>
                                <th class="center" style="width: 10%;">작성<br />일시</th>
                                <th class="center" style="width: 10%;">수정자</th>
                                <th class="center" style="width: 10%;">수정<br />일시</th>
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
                                    <td class="center"><input type="checkbox" name="idBox" value="${event.id}" /></td>
                                    <td class="center">${status.index + 1}</td>
                                    <td class="middle">
                                        <a href="/event/view?id=${event.id}&${paramUrl}">${event.title}</a>
                                    </td>
                                    <td class="center">${event.isShow ==1 ? "노출" : "비노출"}</td>
                                    <td class="center">${event.startAt}</td>
                                    <td class="center">${event.endAt}</td>
                                    <td class="center">${event.createdBy}</td>
                                    <td class="center">${event.createdAt}</td>
                                    <td class="center">${event.updatedBy}</td>
                                    <td class="center">${event.updatedAt}</td>
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
                        <jsp:param name="isShow" value="${isShow}" />
                        <jsp:param name="startAt" value="${startAt}" />
                        <jsp:param name="endAt" value="${endAt}" />
                    </jsp:include>
                    <div class="row">
                        <div class="col-12 table-tool margin-bottom">
                            <div>
                                <button type="button" id="deleteButton" class="btn btn-danger">삭제</button>
                            </div>
                            <div>
                                <a class="btn btn-primary" href="/event/write?${paramUrl}" id = "writeBtn">글쓰기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%@ include file="../common/footer.jsp"%>

<script>
    $("select[name=sort]").on("change", function(e){
        $(document.sortForm).submit();
    });

    $("button#deleteButton").on("click", function(e) {
        var idBoxes = $('input[name=idBox]:checked');
        if (idBoxes && idBoxes.length < 1) {
            alert("선택된 항목이 없습니다.");
            return;
        };

        if (confirm("정말로 삭제하시겠습니까?")) {
           alert("test...");
        }
    });
</script>

