<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<table class="table table-bordered">
	<tr>
		<th>주요활동명</th>
		<td>${activity.actName}</td>
	</tr>
	<tr>
		<th>주요활동종류</th>
		<td>${activity.actCategory}</td>
	</tr>
	<tr>
		<th>주요활동기관</th>
		<td>${activity.actInstitution}</td>
	</tr>
	<tr>
		<th>주요활동기간</th>
		<td>${activity.actPeriod}</td>
	</tr>
	<tr>
		<th>주요활동 작성날짜</th>
		<td>${activity.actInsertDate}</td>
	</tr>
</table>
<a href="${pageContext.request.contextPath}/activity"><button class="btn btn-primary">목록</button></a>
<a href="${pageContext.request.contextPath}/activity/update?actSn=${activity.actSn}"><button class="btn btn-secondary">수정하기</button></a>
<form:form modelAttribute="activity" action="${pageContext.request.contextPath}/activity/delete" method="post" style="display: inline-block;">
	<input name="actSn" value="${activity.actSn}" hidden/>
	<button type="submit" class="btn btn-danger">삭제하기</button>
</form:form>

