<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/pattern.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/help.css">

<style>
.star {
  position: relative;
  font-size: 4rem;
  color: #ddd;
}

.star input {
  width: 100%;
  height: 100%;
  position: absolute;
  left: 0;
  opacity: 0;
  cursor: pointer;
}

.star span {
  width: 0;
  position: absolute; 
  left: 0;
  color: red;
  overflow: hidden;
  pointer-events: none;
  z-index:9999;
}

.pf {
 	font-size: 24px; 
}

.radiuss{
	width: 100%;
	height: auto;
	border : 1px solid #eaedf4;
	border-radius: 12px;
	padding: 20px 99px 100px 99px;
	margin-top: 2%;
	margin-bottom: 2%;
}

.annoTable table {
  	width: 100%;
   	height: 500px;
 	border-top: 1px solid #eaedf4;
  	border-collapse: collapse;
  	margin: 0px;
}
.annoTable th{
	background: #f7f7f7;
	border-bottom: 1px solid #eaedf4;
  	padding: 10px;
  	width: 200px;
} 

.annoTable td {
  	border-bottom: 1px solid #eaedf4;
  	padding: 20px;
}
th {
	font-weight: 800;
}

</style>
<div class="radiuss">
	<div class="qna_write_wrap">
		<div class="qna_write_selection">
			<span class="qna_category_tit" style="font-size: 40px;">세부공고</span>
		</div>
	</div>
	<hr style="background-color: #5c667b; height: 2px;">
	<table class="annoTable" style="width: 100%;">
		<tr>
			<th scope="row">학교명</th>
			<td colspan="3">${education.eduName}</td>
		</tr>
		<tr>
			<th scope="row">전공분류</th>
			<td>${education.eduDepartment}</td>
			<th scope="row">전공</th>
			<td>${education.eduMajor}</td>
		</tr>
		<tr>
			<th scope="row">입학일</th>
			<td>${education.eduEntered}</td>
			<th scope="row">졸업일,중퇴일,자퇴일</th>
			<td>${education.eduGraduated}</td>
		</tr>
		<tr>
			<th scope="row">학점</th>
			<td>${education.eduScore}</td>
			<th scope="row">기준학점</th>
			<td>${education.eduStandard}</td>
		</tr>
		<tr>
			<th scope="row">상태</th>
			<td>${education.eduStatus}</td>
			<th scope="row">작성날짜</th>
			<td>${education.eduInsertDate}</td>
		</tr>
		<tr>
			<th scope="row">첨부파일</th>
			<td>
				${education.attatchList[0].attFilename}
				<c:forEach items="${eduaction.attatchList}" var="attach">
					${attach.attFilename}.${attach.attMime}
				</c:forEach>
			</td>
		</tr>
	</table>
	<br><br>
	<div style="display: flex; justify-content: flex-end; padding: 7rem; padding-bottom: 0.5rem; padding-top: 1rem; margin-right: 1%;">	
		<a href="${pageContext.request.contextPath}/education"><button class="btn btn-primary" style="width: 150px; border-radius: 0;">목록</button></a>
		<a href="${pageContext.request.contextPath}/education/update?eduSn=${education.eduSn}"><button class="btn btn-secondary" style="width: 150px; border-radius: 0;">수정하기</button></a>
		<form action="<c:url value='/education/delete'/>" method="post" style="display: inline-block;">
			<input name="eduSn" value="${education.eduSn}" hidden/>
			<button type="submit" class="btn btn-danger" style="width: 150px; border-radius: 0;">삭제하기</button>
		</form>
	</div>
</div>
