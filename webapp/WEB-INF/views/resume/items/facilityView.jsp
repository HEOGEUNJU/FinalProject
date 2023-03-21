<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table class="table table-bordered">
	<tr>
		<th>기능명</th>
		<td>${facility.facilityName}</td>
	</tr>
	<tr>
		<th>기능종류</th>
		<td>${facility.facilityCategory}</td>
	</tr>
	<tr>
		<th>수준</th>
		<td>${facility.facilityLevel}</td>
	</tr>
	<tr>
		<th>취득일</th>
		<td>${facility.facilityGetdate}</td>
	</tr>
	<tr>
		<th>훈련기간</th>
		<td>${facility.facilityPeriod}</td>
	</tr>
	<tr>
		<th>기능 작성날짜</th>
		<td>${facility.facilityInsertDate}</td>
	</tr>
</table>
<a href="${pageContext.request.contextPath}/facility"><button class="btn btn-primary">목록</button></a>
<a href="${pageContext.request.contextPath}/facility/update?facilitySn=${facility.facilitySn}"><button class="btn btn-secondary">수정하기</button></a>
<form action="<c:url value='/facility/delete'/>" method="post" style="display: inline-block;">
	<input name="facilitySn" value="${facility.facilitySn}" hidden/>
	<button type="submit" class="btn btn-danger">삭제하기</button>
</form>
