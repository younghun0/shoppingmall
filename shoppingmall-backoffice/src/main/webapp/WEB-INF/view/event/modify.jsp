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
			    <input type="hidden" value="${event.id}" id="id" name="id" >
			    <div class="row">
				    <div class="col-sm-6"style="display:flex">
                        <h4>제목:</h4> <input type="text" class="form-control"value="${event.title}" id="title" name = "title">
                    </div>
                    <div class="col-sm-4" style="display:flex">
                        <p>작성일 :${event.createdAt} </p>
                    </div>
                    <div class="col-sm-2" style="display:flex">
                        <p>작성자 : ${event.createdBy}</p>
                    </div>
                    <hr/>
                    <div class="col-sm-12">
                        <textarea class="form-control" value="" rows="5" id="content" name = "content" >${event.content}</textarea>
                    </div>
                    <hr/>
                    <div class="col-sm-12">
                        <p>이벤트 기간 : <input type="datetime-local" class="from-control" id="startAt" name="startAt" value="${event.startAt}"> - <input type="datetime-local" class="from-control" id="endAt" name="endAt" value="${event.endAt}"> </p>
                    </div>
                </div>
                <div class="col-12 table-tool">
                    <div>
                        <a href="/event?${paramUrl}"  class="btn btn-primary">목록</a>
                    </div>
                    <div>
                        <button type="submit" id="updateButton" class="btn btn-primary" >수정완료</button>
                        <a href="/event/view?id=${param.id}${paramUrl}"  class="btn btn-danger">취소</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
     $("button#updateButton").on("click",function(e){
            var titleInput = $('input[name=title]').val();
            var contentInput = $('textarea[name=content]').val();
            var startAtInput = $('input[name=startAt]').val();
            var endAtInput = $('input[name=endAt]').val();
            console.log(titleInput);
             if(titleInput == ""){
                alert("제목이 입력되지 않았습니다.");
                return false;
            }
             if(contentInput == ""){
                alert("내용이 입력되지 않았습니다.");
                return false;
            }
            if(confirm("해당 내용으로 수정하시겠습니까?")){
                return true;
            }
            else{return false;}
    });
</script>
<%@ include file="../common/footer.jsp"%>