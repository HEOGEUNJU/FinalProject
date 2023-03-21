<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table class="table table-bordered">
	<tr>
		<th>교육명</th>
		<td>${course.courseName}</td>
	</tr>
	<tr>
		<th>교육종류</th>
		<td>${course.courseCategory}</td>
	</tr>
	<tr>
		<th>교육기관</th>
		<td>${course.courseInstitution}</td>
	</tr>
	<tr>
		<th>교육기간</th>
		<td>${course.coursePeriod}</td>
	</tr>
	<tr>
		<th>교육이수 작성날짜</th>
		<td>${course.courseInsertDate}</td>
	</tr>
</table>
<a href="${pageContext.request.contextPath}/course"><button class="btn btn-primary">목록</button></a>
<a href="${pageContext.request.contextPath}/course/update?courseSn=${course.courseSn}"><button class="btn btn-secondary">수정하기</button></a>
<form action="<c:url value='/course/delete'/>" method="post" style="display: inline-block;">
	<input name="courseSn" value="${course.courseSn}" hidden/>
	<button type="submit" class="btn btn-danger">삭제하기</button>
</form>
