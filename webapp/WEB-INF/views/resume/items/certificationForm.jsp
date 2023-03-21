<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<form:form modelAttribute="certification" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label for="job-title">자격번호</label>
		<form:input path="certNo" type="text" cssClass="form-control" />
		<form:errors path="certNo" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">자격증명</label>
		<form:input path="certName" type="text" cssClass="form-control" />
		<form:errors path="certName" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">발급일</label>
		<form:input path="certDate" type="date" cssClass="form-control" />
		<form:errors path="certDate" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">시행부처</label>
		<form:input path="certInstitution" type="text" cssClass="form-control" />
		<form:errors path="certInstitution" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<input type="submit" value="저장" /> 
		<input type="reset" value="취소" />		
	</div>
</form:form>