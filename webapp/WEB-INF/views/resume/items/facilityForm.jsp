<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<form:form modelAttribute="facility" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label for="job-title">기능명</label>
		<form:input path="facilityName" type="text" cssClass="form-control" />
		<form:errors path="facilityName" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">기능종류</label>
		<form:input path="facilityCategory" type="text" cssClass="form-control" />
		<form:errors path="facilityCategory" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">수준</label>
		<form:input path="facilityLevel" type="text" cssClass="form-control" />
		<form:errors path="facilityLevel" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">취득일</label>
		<form:input path="facilityGetdate" type="date" cssClass="form-control" />
		<form:errors path="facilityGetdate" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">훈련기간</label>
		<form:input path="facilityPeriod" type="text" cssClass="form-control" />
		<form:errors path="facilityPeriod" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<input type="submit" value="저장" /> 
		<input type="reset" value="취소" />		
	</div>
</form:form>