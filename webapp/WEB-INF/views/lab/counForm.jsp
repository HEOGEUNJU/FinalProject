<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자         수정내용
* ----------  ---------  -----------------
* 2023. 2. 2.   양서연        최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %> 
<c:set var="prePath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${prePath}/resources/css/style.css">
<link rel="stylesheet" href="${prePath}/resources/css/saramin/layout.css">
<link rel="stylesheet" href="${prePath}/resources/css/saramin/board.css">
<link rel="stylesheet" href="${prePath}/resources/css/saramin/pattern.css">
<link rel="stylesheet" href="${prePath}/resources/css/saramin/help.css" />
<link rel="stylesheet" href="${prePath}/resources/css/saramin/components.css" />

<script src="${prePath}/resources/ckeditor/ckeditor.js"></script>
<style>
.qna_write_wrap .qna_write_selection {padding: 0 0 22px;}
.btn-primary {background-color: #045738; border-color: #045738;}
.ck-editor__editable { height: 400px; }
.ck-content {font-size: 15px;}
</style>
<!-- 작성 -->
<security:authentication property="principal" var="memberVOWrapper"/>
<security:authentication property="principal.realMember" var="authMember"/>	
<section class="site-section">
	<div class="container">
		<div class="row mb-5">
			<div class="col-lg-12">
				<form:form modelAttribute="coun" id="counForm" enctype="multipart/form-data" method="post" class="p-4 p-md-5 border rounded">
					<form:hidden path="memId" value="${authMember.memId}"/>
					<div class="contents_container qna_write_wrap">
						<div class="qna_write_selection">
							<div class="col-2">
								<c:choose>
									<c:when test="${not empty refCoun}">
										<button type="button" class="btn_category_select">답변 등록</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn_category_select">상담 등록</button>
									</c:otherwise>
								</c:choose>
							</div>
							<c:if test="${empty refCoun}">
								<div class="company_honest_qna col-2">
									<div class="qna_list_sort">
										<div class="icoChk_outline filter">
											<span class="inpChk icoChk">
												<input type="checkbox" id="pubChk" name="pubChk" class="btn_sort" value="N"> 
												<c:if test="${coun.pubChk eq 'N'}">
													<input type="checkbox" id="pubChk" name="pubChk" class="btn_sort" value="N" checked="checked"> 
												</c:if>
												<label class="lbl" for="pubChk">비밀글</label>
											</span>
										</div>
									</div>
								</div>
							</c:if>
						</div>
					</div>
					<c:if test="${empty refCoun}">
						<div class="form-group">
							<label for="job-title"></label>
							<form:input class="form-control" path="counTitle" placeholder="제목을 입력해주세요"/>
						</div>
					</c:if>
					<div class="form-group">
						<label for="job-description"></label>
						<form:textarea path="counContent" id="editor"></form:textarea>
					</div>
					<div class="help_find help_lost wrap_help">
						<div class="wrap_input">
							<div class="wrap_file">
								<input type="file" id="help_upload" name="counFile" class="inp_upload" title="파일 업로드" name="uploaded_file">
								<label for="help_upload" class="btn_basic2 type03">파일첨부하기</label>
							</div>
							<div class="uploads">
								<span class="info_upload"> <span class="txt_upload" id="fileName">${attachedVO.attFilename}</span>
								</span>
							</div>
							<p class="noti_inp">
								10MB 이하의 hwp, pdf, zip, MS Office 파일, 이미지 파일(JPG, GIF, PNG, BMP) 만 등록 가능합니다.
								<br/>(최대 5개까지 가능)
							</p>
						</div>
					</div>
					<div class="wrap_board_view wrap_help">
						<div class="wrap_content_view">
							<div class="area_btn">
								<security:authorize access="hasRole('ROLE_SEEKER')">
									<a id="fillSeeker" class="btn_basic_type01 btn_list" style="cursor: pointer;" title="자동 채우기">
										자동채우기(SEEKER)
									</a>
								</security:authorize>
								<security:authorize access="hasRole('ROLE_ADMIN')">
									<a id="fillAdmin" class="btn_basic_type01 btn_list" style="cursor: pointer;" title="자동 채우기">
										자동채우기(ADMIN)
									</a>
								</security:authorize>
								<a href="#" id="submitBtn" class="btn_basic_type01 btn_list" title="이전 목록 바로가기">
									등록
								</a>
								<a href="${prePath}/lab/counseling" class="btn_basic_type01 btn_list" title="취소">
									취소
								</a>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</section>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>

<script>
console.log("refCoun : ${refCoun}");
/* CKEDITOR */
CKEDITOR.replace('counContent',{
	filebrowserUploadUrl: '${pageContext.request.contextPath}/help/notice/noticeAttach?command=QuickUpload&type=Files&responseType=json'
	, height : 400
});
$("#submitBtn").on("click", function(event){
	event.preventDefault();
	$("#counForm").submit();
	return false;
})

let fileTarget = $('#help_upload');
fileTarget.on('change', function() {
	let fileValue = fileTarget.val().split("\\");
	let fileName = fileValue[fileValue.length-1];
	$("#fileName").html(fileName);
})

</script>
<script src="${prePath}/resources/js/coun/counFill.js"></script>




