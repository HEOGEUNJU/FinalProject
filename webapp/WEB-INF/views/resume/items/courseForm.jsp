<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<form:form modelAttribute="course" method="post" enctype="multipart/form-data">

	<div class="form-group">
		<label for="job-title">교육명</label>
		<form:input path="courseName" type="text" cssClass="form-control" />
		<form:errors path="courseName" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">교육종류</label>
		<form:input path="courseCategory" type="text" cssClass="form-control" />
		<form:errors path="courseCategory" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">교육기관</label>
		<form:input path="courseInstitution" type="text" cssClass="form-control" />
		<form:errors path="courseInstitution" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">교육기간</label>
		<form:input path="coursePeriod" type="text" cssClass="form-control" />
		<form:errors path="coursePeriod" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<input type="submit" value="저장" /> 
		<input type="reset" value="취소" />		
	</div>
</form:form>