<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- MAIN CSS -->
<style>
.pagination {
	text-align: center;
}

#tr1 {
/* 	text-align: center; */
	padding-left: -10px;
}

.td2 {
	text-align: left;
}

.card{
/* 	text-align: center; */
	padding-bottom: 30px;
}

.button1{
	text-align: right;
    padding-right: 38px;
}

.body{	
    padding-top: 15px;
    padding-left: 17px;
    padding-right: 17px;	

}
.dropdown-toggle::after{
	display: none;
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

</style>

<body>
<!-- 헤더인클루드 -->
<%@ include file="../../include/header.jsp"%>
<section class="subPageContain">
	<!-- 사이드바 -->
	<%@ include file="../boardSidebar.jsp"%>
	<!--컨텐츠 영역-->
	<div class="contentConteiner">

	<!-- 메인 content -->
	<div id="main-content">
		<div class="container-fluid">
			<div class="row clearfix">
				<div class="col-12" style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;" >
					<div class="subTitleText">
						<h2><i class="fa-solid fa-angles-right"></i>사내공지수정</h2>
					</div>
					<div>
						<button type="button" class="btn btn-secondary float-right" onclick="goBackToList();">목록</button>
						<button type="button" class="btn btn-primary float-right" data-type="success" onclick="modify_go();" >수정완료</button>
					</div>
				</div>
				<hr>
			</div>
			<div class="div2">
				<div class="row clearfix">
					<div class="col-lg-12 col-md-12">
					<form:form modelAttribute="boardFormVO" name="noticeModifyForm" action="${pageContext.request.contextPath }/board/notice/modify" enctype="multipart/form-data">
						<form:hidden path="noticeVO.notice_id" />
			          	<form:hidden path="noticeVO.notice_content" id="notice_content"/>
			          	<form:hidden path="noticeVO.emp_writer_id" value="${loginUser.emp_Id }"/>
			          	<div id="fileUploadForm">
			          	</div>
		          		<div id="deleteFile">
		          		</div>
						<div class="card">
							<div class="body project_report">
								<div class="body">
									<div class="table-responsive">
										<table class="table table-hover m-b-0">
											<thead class="shadow-none p-3 mb-5 bg-light rounded">
								<tr>
									<td style="width:130px;">
										<h6 id="h6" style="font-weight: bold;">제목</h6>
									</td>
									<td colspan="5">
										<div style="padding-left:15px;border-left: 1px dotted gray;">
											<form:textarea path="noticeVO.notice_title" style="width: 100%; height: 30px; "/>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<strong>작성일자</strong>
									</td>
									<td>
										<div style="padding-left:15px;border-left: 1px dotted gray;">
										
											<fmt:formatDate value="${boardFormVO.noticeVO.notice_create_dt }" pattern="yyyy-MM-dd"/>
										</div>
										
									</td>
									<td>
										<strong>작성자</strong>
									</td>
									<td>
										<div style="padding-left:15px;border-left: 1px dotted gray;">${boardFormVO.noticeVO.emp_Name }</div>
									</td>
									<td>
										<strong>조회수</strong>
									</td>
									<td>
										<div style="padding-left:15px; border-left: 1px dotted gray;">${boardFormVO.noticeVO.notice_readcnt }</div>
									</td>
								</tr>
								<tr>
									<th style="width: 15%;">
										<i class="fa fa-download"></i>
										<strong>첨부파일</strong>
										<a href="javascript:void(0);" id="showFileWindow" style="margin-left:10px;font-weight: normal;" onclick="toggleFileContent();"><i class="icon-note"></i>수정</a>
										<a href="javascript:void(0);" id="hideFileWindow" style="margin-left:10px;font-weight: normal;display:none;" onclick="toggleFileContent();"><i class="fa fa-times"></i> 닫기</a>
									</th>
									<th colspan="5">
										<div style="padding-left:15px;border-left: 1px dotted gray;">
											<div id="attachInline">
												<c:if test="${!empty boardFormVO.noticeVO.noticeAttachList }">
													<c:forEach items="${boardFormVO.noticeVO.noticeAttachList }" var="noticeAttach" varStatus="status">
														<!-- 파일 입력 -->
						                                <span class="attach_${status.index }" style="font-weight: normal; margin-right:15px;">
						                                	<c:choose>
						                                		<c:when test="${noticeAttach.attach_type eq 'JPG' || noticeAttach.attach_type eq 'PNG' || noticeAttach.attach_type eq 'GIF'}">
							                                		<i class="fa fa-file-photo-o"></i>
						                                		</c:when>
						                                		<c:otherwise>
							                                		<i class="fa fa-file-text-o"></i>
						                                		</c:otherwise>
						                                	</c:choose>
															&nbsp;${noticeAttach.attach_name }
														</span>   
													</c:forEach>
												</c:if>
												<c:if test="${empty boardFormVO.noticeVO.noticeAttachList }">
													<span id="noFile" style="font-weight: normal;">없음</span>
												</c:if>
											</div>
											<div id="attachBox" style="display:none;">
												<button type="button" class="btn btn-secondary" style="margin-bottom:5px;" onclick="myFileUpload();">파일 추가</button>
												<span class="float-right" style="margin:15px 10px 0 0;">파일 개수 <span id="fileCount">${empty boardFormVO.noticeVO.noticeAttachList ? 0 : boardFormVO.noticeVO.noticeAttachList.size()}</span>/5</span>
												<div style="border:1px solid gray;height:200px;overflow-y: scroll;">
													<table class="table table-hover center-aligned-table" style="margin-bottom: 0;">
														<thead style="height:50px;">
															<tr>
																<th style="width:200px;">타입</th>
																<th style="width:300px;">파일명</th>
																<th style="width:200px;">확장자</th>
																<th style="width:100px;"><i class="fas fa-trash-alt" style="cursor: pointer;" onclick="removeAll();"></i>
																</th>
															</tr>
														</thead>
					                                    <tbody id="appendTbody">
															<!-- 파일 입력 -->
					                                    	<c:if test="${!empty boardFormVO.noticeVO.noticeAttachList }">
																<c:forEach items="${boardFormVO.noticeVO.noticeAttachList }" var="noticeAttach" varStatus="status">
							                                    	<tr>
							                                    		<td>
							                                    			<c:choose>
							                                    				<c:when test="${noticeAttach.attach_type eq 'JPG' || noticeAttach.attach_type eq 'PNG' || noticeAttach.attach_type eq 'GIF'}">
								                                    				이미지
							                                    				</c:when>
							                                    				<c:otherwise>
								                                    				파일
							                                    				</c:otherwise>
							                                    			</c:choose>
							                                    		</td>
							                                    		<td style="font-weight: normal;">
																			${noticeAttach.attach_name }
							                                    		</td>
							                                    		<td style="font-weight: normal;">
																			${noticeAttach.attach_type }
							                                    		</td>
							                                    		<td>
																			<i class="fas fa-times" data-id="${status.index }" data-attach_id="${noticeAttach.attach_id }" style="cursor: pointer;" onclick="removeEl(this)"></i>
							                                    		</td>
							                                    	</tr>
																</c:forEach>
															</c:if>
						                                </tbody>	
					                                </table>
												</div>
											</div>
										</div>
									</th>
								</tr>
								<tr>
									<th colspan="6" style="padding:15px;">
<%--										<div class="summernote" style="padding-left:15px;border-left: 1px dotted gray;">--%>
											<div class="summernote">${boardFormVO.noticeVO.notice_content }</div>
<%--										</div>--%>
									</th>
								</tr>
							</thead>
						</table>
						</div>
					</div>
				</div>
			</div>
		</form:form>
		</div>
	</div>
</div>
</div>
</div>

<script>
	function goBackToList() {
		location.href = "${pageContext.request.contextPath}/board/notice/noticeList";
	}

//파일 다운로드
function fileDownload(obj){
	var fileForm = $('form[name="fileForm"]');
	$('input[name="attach_id"]').val($(obj).attr('data-attach_id'));
	$('input[name="fileUploadPath"]').val($(obj).attr('data-filePath'));
	fileForm.submit();
}

//열고 닫는 함수입니다.
function plusFromMinus(obj){
	if($(obj).hasClass("expandable-hitarea")){
		$(obj).parent("li").removeClass("expandable lastExpandable");
		$(obj).parent("li").addClass("collapsable lastCollapsable");
		$(obj).removeClass("hitarea expandable-hitarea lastExpandable-hitarea");
		$(obj).addClass("hitarea collapsable-hitarea lastCollapsable-hitarea");
		$(obj).parent("li").children("ul").css("display","block");
	}else{
		$(obj).parent("li").removeClass("collapsable lastCollapsable");
		$(obj).parent("li").addClass("expandable lastExpandable");
		$(obj).removeClass("hitarea collapsable-hitarea lastCollapsable-hitarea");
		$(obj).addClass("hitarea expandable-hitarea lastExpandable-hitarea");
		$(obj).parent("li").children("ul").css("display","none");
	}
}

//파일 첨부 창 보이기/닫기
function toggleFileContent() {
	if($("#hideFileWindow").css("display") == "none"){	// 수정창 열기
		$("#showFileWindow").css("display","none");
		$("#hideFileWindow").css("display","");
		
		$('#attachInline').css('display','none');
		$('#attachBox').css('display','');
	}
	else{	// 수정창 닫기
		$("#hideFileWindow").css("display","none");
		$("#showFileWindow").css("display","");
		
		$('#attachInline').css('display','');
		$('#attachBox').css('display','none');
	}
}

//파일 삭제용 고유 아이디
var uuid = ${empty boardFormVO.noticeVO.noticeAttachList ? 0 : boardFormVO.noticeVO.noticeAttachList.size()};

// 파일 업로드 버튼 클릭시
function myFileUpload() {
	if($('#appendTbody').children().length == 5){
		alert('파일은 5개까지만 첨부할 수 있습니다.');
		return;
	}

	// 선택 안된 파일 지우기
	$('.attach_'+uuid).remove();

	var input = $('<input>').attr({"type":"file",'class':'attach_'+uuid,"name":"fileUploadCommand.uploadFile",'onchange':'myFileChange();'}).css('display','none');
	$("#fileUploadForm").append(input);

	// 파일 선택
	var inputFileTag = $("input[name='fileUploadCommand.uploadFile']");
	inputFileTag.eq(inputFileTag.length-1).click();
}

//파일 선택시
function myFileChange(){
	var inputFileTag = $("input[name='fileUploadCommand.uploadFile']");
	var filesLength = inputFileTag.length;
	
	var fileName = inputFileTag.eq(filesLength-1)[0].files[0].name;
	var extension = getExtensionOfFilename(fileName);
	var fileSize = (inputFileTag.eq(filesLength-1)[0].files[0].size / 1000) / 1000; // MB
	var fileType;

	if(fileSize > 50){
		alert("50MB 이하로 업로드해 주세요.");
		inputFileTag.eq(filesLength-1).remove();
		return;
	}
	
	if(!(extension == 'PNG' || extension == 'DOC' || extension == 'DOCX'|| extension == 'EXE' || extension == 'GIF' || extension == 'JAVA' || extension == 'JPG' || extension == 'PDF'|| extension == 'PPT' || extension == 'PPTX'|| extension == 'TXT' || extension == 'XLSX'|| extension == 'ZIP')){
		alert("지원하지 않는 파일 형식입니다.");
		inputFileTag.eq(filesLength-1).remove();
		return;
	}
	if(extension == 'PNG' || extension == 'GIF' || extension == 'JPG'){
		fileType = '이미지';
	}else{
		fileType = '파일';
	}
	
	// 파일 업로드 창에 표시하기
	var fileTag = '<tr>'
				 +'<td>'+fileType+'</td>'
				 +'<td style="font-weight: normal;">'+fileName+'</td>'
				 +'<td style="font-weight: normal;">'+extension+'</td>'
				 +'<td><i class="fas fa-times" data-id="'+uuid+'" style="cursor: pointer;" onclick="removeEl(this)"></i></td>'
				 +'</tr>';
	$('#appendTbody').append(fileTag);

	// 닫기상태 창에 표시하기
	var sumnail = '<span class="attach_'+uuid+'" style="font-weight: normal; margin-right:15px;">'
				 +(fileType=='이미지' ? '<i class="fas fa-file-photo"></i>' : '<i class="far fa-file-text"></i>')
			 	 +'&nbsp;'+fileName
				 +'</span>';
	$('#attachInline').append(sumnail);
	
	// 파일개수 수정
	$('#fileCount').text($('#appendTbody').children().length);
	
	$('#noFile').remove();
	
	uuid++;
}

//파일 확장자 추출 함수
function getExtensionOfFilename(filename) {
	 
    var _fileLen = filename.length;
 
    var _lastDot = filename.lastIndexOf('.');
 
    var _fileExt = filename.substring(_lastDot+1, _fileLen).toUpperCase();
 
    return _fileExt;
}

//파일 전체 삭제
function removeAll(){
	if($('#appendTbody').children().length == 0) return;
	
	var check = confirm('파일을 전부 삭제하시겠습니까?');
	if(!check) return;
	
	$("input[name='fileUploadCommand.uploadFile']").remove();
	$('#appendTbody').children().each(function(){
		if($(this).find('i').attr('data-attach_id')){
			$('#deleteFile').append('<input type="hidden" name="fileUploadCommand.deleteFileIds" style="display:none;" value="'+$(this).find('i').attr('data-attach_id')+'"/>');
		}
		$(this).remove();
	});
	
	$('#attachInline').children().remove();
	$('#attachInline').append('<span id="noFile" style="font-weight: normal;">없음</span>');
	
	// 파일개수 수정
	$('#fileCount').text(0);
}

// 선택 파일 삭제
function removeEl(obj){
	var check = confirm('파일을 삭제하시겠습니까?');
	if(!check) return;

	if($(obj).attr('data-attach_id')){
		$('#deleteFile').append('<input type="hidden" name="fileUploadCommand.deleteFileIds" style="display:none;" value="'+$(obj).attr('data-attach_id')+'"/>');
	}
	
	$(obj).closest('tr').remove();
	$(".attach_"+$(obj).attr('data-id')).remove();
	
	// 파일개수 수정
	$('#fileCount').text($('#appendTbody').children().length);
}


//수정
function modify_go(){
	var modifyForm = $('form[name="noticeModifyForm"]')[0];
	console.log(modifyForm)


	if($.trim($('textarea[name="noticeVO.notice_title"]').val())==""){
		alert('제목을 입력하세요.');
		$('textarea[name="noticeVO.notice_title"]').focus();
		return;
	}

	if($.trim($('.note-editable').text())==""){
		alert('내용을 입력하세요.');
		$('.note-editable').focus();
		return;
	}
	// $('input[name="noticeVO.notice_content"]').val($('.note-editable').html());
	$('#notice_content').val($('.note-editable').html());
	// $('#noticeVO.notice_content').val($('.note-editable').html()); path값이 아니라 id값을 적어줘야함

	// 선택 안된 파일 지우기
	$('.attach_'+uuid).remove();

	console.log(modifyForm);
	var formData = new FormData(modifyForm);
	console.log(formData);

	$.ajax({
		url:modifyForm.action,
		type:'post',
		data:formData,
		processData:false,
		contentType:false,
		success:function(data){
			alert("글이 수정되었습니다.");

			window.location.href='<c:url value="/board/notice/detail?notice_id=${boardFormVO.noticeVO.notice_id}" />';
		},
		error:function(){
			alert("글 수정에 실패했습니다.");
			window.location.href='<c:url value="/board/notice/detail?notice_id=${boardFormVO.noticeVO.notice_id}" />';
		}
	});
}

</script>



</div>
</section>
<%@ include file="../../include/footer.jsp"%>
</body>
			