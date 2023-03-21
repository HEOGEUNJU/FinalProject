<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<form:form modelAttribute="award" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label for="job-title">수상대회명</label>
		<form:input path="awardCompetition" type="text" cssClass="form-control" />
		<form:errors path="awardCompetition" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">수상명</label>
		<form:input path="awardName" type="text" cssClass="form-control" />
		<form:errors path="awardName" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">수상대회종류</label>
		<form:input path="awardCategory" type="text" cssClass="form-control" />
		<form:errors path="awardCategory" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">수상날짜</label>
		<form:input path="awardDate" type="date" cssClass="form-control" />
		<form:errors path="awardDate" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<label for="job-title">수상기관</label>
		<form:input path="awardInstitution" type="text" cssClass="form-control" />
		<form:errors path="awardInstitution" element="span" cssClass="text-danger" />
	</div>
	<div class="form-group">
		<input type="submit" value="저장" /> 
		<input type="reset" value="취소" />		
	</div>
</form:form>