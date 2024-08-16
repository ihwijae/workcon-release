<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/templates/light/assets/fonts/font.css">
<title>${meetRoomVO.meet_Room_Name } 회의실 </title>
<style>
    #main-content{
        margin: 0px;
    }
    *, ::after, ::before{
        box-sizing: border-box;
    }
    .container-fluid-header, .container-fluid-footer{
        display: flex;
        justify-content: space-between;
    }
    body {
        padding: 0px 30px 30px 30px;
    }
    .col-xs-12 {
        padding: 5px;
    }
    div#main-content{
        border: solid 1px rgba(0,0,0,.03);
        border-radius: 1%;
        background-color: #ffffff;
        padding: 0px 10px 10px;
    }
    body{
        padding: 0px 30px 30px 30px;
        background-color: rgba(0,0,0,.03);
    }
    .form-control[disabled], .form-control[readonly], fieldset[disabled] .form-control{
        background-color: #ffffff;
    }
    #edit-participater{
        cursor: pointer;
    }
    .subTitleText h2 {
        display: flex;
        justify-content: flex-start;
        align-items: center;
        font-size: 27px;
        padding: 10px 0;
        font-family: "Noto Sans KR", sans-serif;
      }
      .subTitleText i {
        font-size: 24px;
        margin-right: 5px;
      }
      .row.reservationDeteailText {
            font-size: 17px;
        }
</style>


<%@ include file="../include/header.jsp"%>
<section class="subPageContain">
    <%@ include file="./sideBar.jsp"%>
  <!-- 메인 content -->
  <div id="main-content" style="width: 100%;">
    <div class="container-fluid">
        <div class="form-header container-fluid-header">
            <div class="subTitleText">
                <h2>
                  <i class="fa-solid fa-angles-right"></i>${meetRoomVO.meet_Room_Name } 회의실
                </h2>
            </div>
            <div>
                <button type="button" id="modifyBtn" onclick="javascript:location.href='<%=request.getContextPath() %>/reservation/modifyForm?meet_Room_Id=${meetRoomVO.meet_Room_Id}';" class="btn btn-info header-btn">수정</button>
                <button type="button" class="btn btn-danger" onclick="removeRoom();">삭제</button>
                <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/reservation/adminMain'">닫기</button>
            </div>
        </div>
        <hr>
        <div class="row" style="font-family: S-CoreDream-4Regular">
            <div class="col-md-4">
                <form:form modelAttribute="meetRoomVO" id="detailForm" name="detailForm" class="form-horizontal" autocomplete="off">
                    <form:hidden path="meet_Room_Id" />
                </form:form>
                <div class="row reservationDeteailText" >
                    <div class="col-xs-12">
                        <label class="col-xs-4" for="edit-title">회의실명</label>
                        <div class="col-sm-10 input-group-sm">
                            <form:input path="meetRoomVO.meet_Room_Name" id="meetRoomName" class="form-control" readonly="true"/>
                        </div>
                    </div>
                </div>
                <div class="row reservationDeteailText">
                    <div class="col-xs-12">
                        <label class="col-xs-4" for="edit-start">회의실 위치</label>
                        <div class="col-sm-10 input-group-sm">
                            <form:input path="meetRoomVO.meet_Room_No" id="meetRoomNo" class="form-control" readonly="true"/>
                        </div>
                    </div>
                </div>
                <div class="row reservationDeteailText">
                    <div class="col-xs-12">
                        <label class="col-xs-4" for="edit-end">수용인원</label>
                        <div class="col-sm-10 input-group-sm">
                            <form:input path="meetRoomVO.meet_Room_Capacity" id="meetRoomCapacity" class="form-control" readonly="true"/>
                        </div>
                    </div>
                </div>
                <div class="row reservationDeteailText">
                    <div class="col-xs-12">
                        <label class="col-xs-4" for="edit-end">내용</label>
                        <div class="col-sm-10 input-group-sm">
                            <form:textarea path="meetRoomVO.meet_Room_Content" id="meetRoomContent" class="form-control" rows="4" cols="40" readonly="true"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <%-- 				<div class="mailbox-attachment-icon has-img" id="pictureView" style="background-image: url('getPicture?picture=${meetRoomVO.meetRoomAttachPath}');"></div> --%>
                <img alt="" src="getPicture?picture=${meetRoomVO.meet_Room_Attach_Origin}" style="width: 550px;border-top-width: 10px;margin-top: 50px;">
            </div>
        </div>
    </div>
</div>
</section>
<%@ include file="../include/footer.jsp"%>

<script>

    function goBack() {
        window.history.back();
    }

    function removeRoom(){

        var meetRoomId = '${meetRoomVO.meet_Room_Id}';

        if(confirm('해당 회의실을 삭제하시겠습니까?')){
            var detailForm = $('form[name="detailForm"]')[0];
            var formData = new FormData(detailForm);

            $.ajax({
                url:"<c:url value='/reservation/remove'/>",
                type:'post',
                data:formData,
                processData:false,
                contentType:false,
                success:function(response){
                    if(response && response > 0){
                        alert("회의실이 삭제되었습니다.");
                        location.href='<%=request.getContextPath()%>/reservation/adminMain';
                    }else{
                        alert("회의실 삭제에 실패했습니다..");
                        location.href='<%=request.getContextPath()%>/reservation/adminMain';
                    }
                    window.close();
                },
                error:function(request, status, error){
                    alert("주소록 삭제에 실패했습니다..");
                    console.log(error);
                    CloseWindow();
                }
            });
        }
    }
</script>
