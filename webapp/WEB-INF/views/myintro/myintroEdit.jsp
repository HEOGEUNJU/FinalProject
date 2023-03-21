<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/pattern.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/help.css">

<style>
.ck-editor__editable_inline {
    min-height: 200px;
}
label {
	font-size: 25px;
	font-weight: bold;
}
</style>

<form:form modelAttribute="myintro" action="${pageContext.request.contextPath}/myintro/${myintro.myintroSn}" method="put" enctype="multipart/form-data">
	<div class="form-group">
		<label for="job-title">자기소개서 제목</label>
		<form:input path="myintroTitle" type="text" cssClass="form-control" />
		<form:errors path="myintroTitle" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">성장과정</label>
		<form:textarea path="myintroGrowth" cssClass="form-control textIncumContent" id="editor" placeholder="내가 어떻게 자라왔는지 적어주세요."></form:textarea>
		<form:errors path="myintroGrowth" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">성격 장단점</label>
		<form:textarea path="myintroPersonality" cssClass="form-control textIncumContent" id="editor2" placeholder="나의 성격 장단점을 적어주세요."></form:textarea>
		<form:errors path="myintroPersonality" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">학창시절</label>
		<form:textarea path="myintroSchoolday" cssClass="form-control textIncumContent" id="editor3" placeholder="학창시절의 경험을 적어주세요."></form:textarea>
		<form:errors path="myintroSchoolday" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">직무경험</label>
		<form:textarea path="myintroJob" cssClass="form-control textIncumContent" id="editor4" placeholder="직무를 맡아서 일했을 때의 경험을 적어주세요."></form:textarea>
		<form:errors path="myintroJob" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">지원동기</label>
		<form:textarea path="myintroMotive" cssClass="form-control textIncumContent" id="editor5" placeholder="왜 회사에 지원하려고 하는지 적어주세요."></form:textarea>
		<form:errors path="myintroMotive" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">입사 후 포부</label>
		<form:textarea path="myintroAspiration" cssClass="form-control textIncumContent" id="editor6" placeholder="입사 후의 의지를 적어주세요."></form:textarea>
		<form:errors path="myintroAspiration" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">가족소개</label>
		<form:textarea path="myintroFamily" cssClass="form-control textIncumContent" id="editor7" placeholder="나의 가족과의 일화를 적어주세요."></form:textarea>
		<form:errors path="myintroFamily" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">교외활동</label>
		<form:textarea path="myintroSubactivity" cssClass="form-control textIncumContent" id="editor8" placeholder="학교 밖에서 어떤 활동을 했는지 적어주세요."></form:textarea>
		<form:errors path="myintroSubactivity" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">전공선택</label>
		<form:textarea path="myintroMajor" cssClass="form-control textIncumContent" id="editor9" placeholder="왜 내 전공을 선택했는지 이유를 적어주세요."></form:textarea>
		<form:errors path="myintroMajor" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">생활진로</label>
		<form:textarea path="myintroCourse" cssClass="form-control textIncumContent" id="editor10" placeholder="앞으로의 계획, 진로에 대해서 적어주세요."></form:textarea>
		<form:errors path="myintroCourse" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">희망업무</label>
		<form:textarea path="myintroObjective" cssClass="form-control textIncumContent" id="editor11" placeholder="어떤 업무를 희망하는지 적어주세요."></form:textarea>
		<form:errors path="myintroObjective" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">동아리</label>
		<form:textarea path="myintroClub" cssClass="form-control textIncumContent" id="editor12" placeholder="동아리 활동한 것을 적어주세요."></form:textarea>
		<form:errors path="myintroClub" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">봉사활동</label>
		<form:textarea path="myintroVolunteer" cssClass="form-control textIncumContent" id="editor13" placeholder="어떤 봉사활동을 했는지 적어주세요."></form:textarea>
		<form:errors path="myintroVolunteer" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">추가항목1</label>
		<form:textarea path="myintroAdd1" cssClass="form-control textIncumContent" id="editor14" placeholder="추가로 말할 것이 있다면 적어주세요."></form:textarea>
		<form:errors path="myintroAdd1" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">추가항목2</label>
		<form:textarea path="myintroAdd2" cssClass="form-control textIncumContent" id="editor15" placeholder="추가로 말할 것이 있다면 적어주세요."></form:textarea>
		<form:errors path="myintroAdd2" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">추가항목3</label>
		<form:textarea path="myintroAdd3" cssClass="form-control textIncumContent" id="editor16" placeholder="추가로 말할 것이 있다면 적어주세요."></form:textarea>
		<form:errors path="myintroAdd3" element="span" cssClass="text-danger" />
	</div>
	<div style="display: flex; justify-content: flex-end; padding: 7rem; padding-top: 1rem; padding-right: 0.5rem; padding-bottom: 0.5rem;">
		<button class="btn btn-primary" type="submit" style="width: 150px; height: 50px; border-radius: 0;">저장</button> 
		<button class="btn btn-danger" type="button" onclick='location.href="${pageContext.request.contextPath}/myintro"' style="width: 150px; height: 50px; border-radius: 0;">취소</button> 
	</div>
</form:form>




<!-- SCRIPTS -->
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script>
	ClassicEditor.create(document.querySelector('#editor'), {
		language : "ko"
	});
	ClassicEditor.create(document.querySelector('#editor2'), {
		language : "ko"
	});
	ClassicEditor.create(document.querySelector('#editor3'), {
		language : "ko"
	});
	ClassicEditor.create(document.querySelector('#editor4'), {
		language : "ko"
	});
	ClassicEditor.create(document.querySelector('#editor5'), {
		language : "ko"
	});
	ClassicEditor.create(document.querySelector('#editor6'), {
		language : "ko"
	});
	ClassicEditor.create(document.querySelector('#editor7'), {
		language : "ko"
	});
	ClassicEditor.create(document.querySelector('#editor8'), {
		language : "ko"
	});
	ClassicEditor.create(document.querySelector('#editor9'), {
		language : "ko"
	});
	ClassicEditor.create(document.querySelector('#editor10'), {
		language : "ko"
	});
	ClassicEditor.create(document.querySelector('#editor11'), {
		language : "ko"
	});
	ClassicEditor.create(document.querySelector('#editor12'), {
		language : "ko"
	});
	ClassicEditor.create(document.querySelector('#editor13'), {
		language : "ko"
	});
	ClassicEditor.create(document.querySelector('#editor14'), {
		language : "ko"
	});
	ClassicEditor.create(document.querySelector('#editor15'), {
		language : "ko"
	});
	ClassicEditor.create(document.querySelector('#editor16'), {
		language : "ko"
	});
</script>