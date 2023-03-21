<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table class="table table-bordered">
	<tr>
		<th>수상대회명</th>
		<td>${award.awardCompetition}</td>
	</tr>
	<tr>
		<th>수상명</th>
		<td>${award.awardName}</td>
	</tr>
	<tr>
		<th>수상대회종류</th>
		<td>${award.awardCategory}</td>
	</tr>
	<tr>
		<th>수상날짜</th>
		<td>${award.awardDate}</td>
	</tr>
	<tr>
		<th>수상기관</th>
		<td>${award.awardInstitution}</td>
	</tr>
	<tr>
		<th>수상내역 작성날짜</th>
		<td>${award.awardInsertDate}</td>
	</tr>
</table>
<a href="${pageContext.request.contextPath}/award"><button class="btn btn-primary">목록</button></a>
<a href="${pageContext.request.contextPath}/award/update?awardSn=${award.awardSn}"><button class="btn btn-secondary">수정하기</button></a>
<form action="<c:url value='/award/delete'/>" method="post" style="display: inline-block;">
	<input name="awardSn" value="${award.awardSn}" hidden/>
	<button type="submit" class="btn btn-danger">삭제하기</button>
</form>
