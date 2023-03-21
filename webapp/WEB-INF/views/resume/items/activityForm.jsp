<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<form:form modelAttribute="activity" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label for="job-title">주요활동명</label>
		<form:input path="actName" type="text" cssClass="form-control" />
		<form:errors path="actName" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">주요활동종류</label>
		<form:input path="actCategory" type="text" cssClass="form-control" />
		<form:errors path="actCategory" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">주요활동기관</label>
		<form:input path="actInstitution" type="text" cssClass="form-control" />
		<form:errors path="actInstitution" element="span"
			cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">주요활동기간</label>
		<form:input path="actPeriod" type="text" cssClass="form-control" />
		<form:errors path="actPeriod" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">첨부파일</label>
		<input type="file" name="attFiles" />
		<input type="file" name="attFiles" />
		<input type="file" name="attFiles" />
	</div>
	<div class="form-group">
		<input type="submit" value="저장" /> 
		<input type="reset" value="취소" />		
	</div>
</form:form>