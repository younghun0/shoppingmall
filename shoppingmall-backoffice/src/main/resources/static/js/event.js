
//이벤트 페이지 체크박스 전체 선택
$(document).ready(function(){
    $("#selectAll").click(function(){
        if($("#selectAll").is(":checked")) $("input[name=idBox]").prop("checked",true);
        else $("input[name=idBox]").prop("checked", false);
    });

    $("input[name=idBox]").click(function(){
        var total = $("input[name=idBox]").length;
        var checked = $("input[name=idBox]:checked").length;

        if(total != checked) $("#selectAll").prop("checked", false);
        else $("#selectAll").prop("checked",true);
    });
});