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
			      <input type="hidden" value="1" class="form-control-plaintext" id="createdBy" name="createdBy" readonly>
			    </div>
			    <div class="form-group">
				  <label for="comment">내용:</label>
				  <textarea class="form-control" rows="5" id="content" name = "content" ></textarea>
				</div>
				<div class="form-group">
                   <label for="startDate">시작일시:</label>
                   <input type="datetime-local" class="form-control"  id="startAt" name = "startAt" >
                </div>
                <div class="form-group">
                   <label for="endDate">종료일시:</label>
                   <input type="datetime-local" class="form-control"  id="endAt" name = "endAt" >
                </div>
                <c:set var="paramUrl" value="page=${param.page}&title=${param.title}&isShow=${param.isShow}&startAt=${param.startAt}&endAt=${param.endAt}"/>
                <div class="row">
                    <div class="col-12 table-tool">
                        <div>
                            <a class="btn btn-danger" href="/event?${paramUrl}">취소</a>
                        </div>
                        <div>
                            <button id="writeButton" type="submit" class="btn btn-primary">글쓰기</button>
                        </div>
                    </div>
                </div>
			  </form>
		</div>
	</div>
</div>
<script>
    $("button#writeButton").on("click",function(e){
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

        if(confirm("해당 내용으로 등록하시겠습니까?")){
            return true;
        }
        else{return false;}
});
</script>
<%@ include file="../common/footer.jsp"%>