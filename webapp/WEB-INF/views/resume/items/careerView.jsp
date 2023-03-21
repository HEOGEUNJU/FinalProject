<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table class="table table-bordered">
	<tr>
		<th>업종</th>
		<td>${career.careerCategory}</td>
	</tr>
	<tr>
		<th>직장명</th>
		<td>${career.careerCompany}</td>
	</tr>
	<tr>
		<th>직무</th>
		<td>${career.careerTask}</td>
	</tr>
	<tr>
		<th>직급</th>
		<td>${career.careerClass}</td>
	</tr>
	<tr>
		<th>입사일</th>
		<td>${career.careerJoin}</td>
	</tr>
	<tr>
		<th>퇴사일</th>
		<td>${career.careerResign}</td>
	</tr>
	<tr>
		<th>연봉</th>
		<td>${career.careerSalary}</td>
	</tr>
	<tr>
		<th>연차</th>
		<td>${career.careerAnnual}</td>
	</tr>
	<tr>
		<th>경력 작성날짜</th>
		<td>${career.careerInsertDate}</td>
	</tr>
</table>
<a href="${pageContext.request.contextPath}/career"><button class="btn btn-primary">목록</button></a>
<a href="${pageContext.request.contextPath}/career/update?careerSn=${career.careerSn}"><button class="btn btn-secondary">수정하기</button></a>
<form action="<c:url value='/career/delete'/>" method="post" style="display: inline-block;">
	<input name="careerSn" value="${career.careerSn}" hidden/>
	<button type="submit" class="btn btn-danger">삭제하기</button>
</form>
