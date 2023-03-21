<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<form:form modelAttribute="career" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label for="job-title">업종</label>
		<form:input path="careerCategory" type="text" cssClass="form-control" />
		<form:errors path="careerCategory" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">직장명</label>
		<form:input path="careerCompany" type="text" cssClass="form-control" />
		<form:errors path="careerCompany" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">직무</label>
		<form:input path="careerTask" type="text" cssClass="form-control" />
		<form:errors path="careerTask" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">직급</label>
		<form:input path="careerClass" type="text" cssClass="form-control" />
		<form:errors path="careerClass" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">입사일</label>
		<form:input path="careerJoin" type="date" cssClass="form-control" />
		<form:errors path="careerJoin" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">퇴사일</label>
		<form:input path="careerResign" type="date" cssClass="form-control" />
		<form:errors path="careerResign" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">연봉</label>
		<form:input path="careerSalary" type="text" cssClass="form-control" />
		<form:errors path="careerSalary" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">연차</label>
		<form:input path="careerAnnual" type="number" cssClass="form-control" step="0.01"/>
		<form:errors path="careerAnnual" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<input type="submit" value="저장" /> <input type="reset" value="취소" />
	</div>
</form:form>