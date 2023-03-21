<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table class="table table-bordered">
	<tr>
		<th>자격번호</th>
		<td>${certification.certNo}</td>
	</tr>
	<tr>
		<th>자격증명</th>
		<td>${certification.certName}</td>
	</tr>
	<tr>
		<th>발급일</th>
		<td>${certification.certDate}</td>
	</tr>
	<tr>
		<th>시행부처</th>
		<td>${certification.certInstitution}</td>
	</tr>
	<tr>
		<th>자격증 작성날짜</th>
		<td>${certification.certInsertDate}</td>
	</tr>
</table>
<a href="${pageContext.request.contextPath}/certification"><button class="btn btn-primary">목록</button></a>
<a href="${pageContext.request.contextPath}/certification/update?certSn=${certification.certSn}"><button class="btn btn-secondary">수정하기</button></a>
<form action="<c:url value='/certification/delete'/>" method="post" style="display: inline-block;">
	<input name="certSn" value="${certification.certSn}" hidden/>
	<button type="submit" class="btn btn-danger">삭제하기</button>
</form>