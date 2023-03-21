<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/layout.css">

<style>
.pf {
 	font-size: 24px; 
}
.radiuss{
	border : 1px solid #eaedf4;
	border-radius: 12px;
	padding: 80px 99px 100px 99px;
}
table {
  	width: 100%;
  	height: 180px;
 	border-top: 1px solid #eaedf4;
  	border-collapse: collapse;
}
th{
	background: #f7f7f7;
	border-bottom: 1px solid #eaedf4;
  	padding: 10px;
  	width: 250px;
  	text-align: center;
  	font-size: 20px;
  	font-weight: 700;
} 
td {
  	border-bottom: 1px solid #eaedf4;
  	padding: 20px;
}
p { 
	line-height: 30px;
}
</style>


<section class="site-section" style="padding-bottom: 0;">
	<div class="container" >
		<div class="radiuss">
			<div style="display: flex; letter-spacing: -2px; line-height: 24px; align-items: center;">
				<span style="font-size: 40px;">자기소개서 정보</span>
			</div>
			<hr style="background-color: #5c667b; height: 2px;">
			<table>
			  	<tr>
				    <th scope="row">제목</th>
				    <td colspan="3">${myintro.myintroTitle}</td>
			  	</tr>
				<tr>
					<th scope="row">성장과정</th>
					<td colspan="3">${myintro.myintroGrowth}</td>
				</tr>
				<tr>
					<th scope="row">성격 장단점</th>
					<td colspan="3">${myintro.myintroPersonality}</td>
				</tr>
				<tr>
					<th scope="row">학창시절</th>
					<td colspan="3">${myintro.myintroSchoolday}</td>
				</tr>
				<tr>
					<th scope="row">직무경험</th>
					<td colspan="3">${myintro.myintroJob}</td>
				</tr>
				<tr>
					<th scope="row">지원동기</th>
					<td colspan="3">${myintro.myintroMotive}</td>
				</tr>
				<tr>
					<th scope="row">입사 후 포부</th>
					<td colspan="3">${myintro.myintroAspiration}</td>
				</tr>
				<tr>
					<th scope="row">가족소개</th>
					<td colspan="3">${myintro.myintroFamily}</td>
				</tr>
				<tr>
					<th scope="row">교외활동</th>
					<td colspan="3">${myintro.myintroSubactivity}</td>
				</tr>
				<tr>
					<th scope="row">전공선택</th>
					<td colspan="3">${myintro.myintroMajor}</td>
				</tr>
				<tr>
					<th scope="row">생활진로</th>
					<td colspan="3">${myintro.myintroCourse}</td>
				</tr>
				<tr>
					<th scope="row">희망업무</th>
					<td colspan="3">${myintro.myintroObjective}</td>
				</tr>
				<tr>
					<th scope="row">동아리</th>
					<td colspan="3">${myintro.myintroClub}</td>
				</tr>
				<tr>
					<th scope="row">봉사활동</th>
					<td colspan="3">${myintro.myintroVolunteer}</td>
				</tr>
				<tr>
					<th scope="row">추가항목1</th>
					<td colspan="3">${myintro.myintroAdd1}</td>
				</tr>
				<tr>
					<th scope="row">추가항목2</th>
					<td colspan="3">${myintro.myintroAdd2}</td>
				</tr>
				<tr>
					<th scope="row">추가항목3</th>
					<td colspan="3">${myintro.myintroAdd3}</td>
				</tr>
				<tr>
					<th scope="row">작성날짜</th>
					<td colspan="3">${myintro.myintroInsertDate}</td>
				</tr>
			</table>
		</div>
	</div>
</section>
<div style="display: flex; justify-content: flex-end; padding: 7rem; padding-top: 1rem; margin-right: 35px;">
	<a href="${pageContext.request.contextPath}/myintro"><button class="btn btn-outline-primary" style="width: 150px; border-radius: 0;">목록</button></a>
	<a href="${pageContext.request.contextPath}/myintro/edit?myintroSn=${myintro.myintroSn}"><button class="btn btn-outline-secondary"  style="width: 150px; border-radius: 0;">수정하기</button></a>
	<form:form modelAttribute="myintro" action="${pageContext.request.contextPath}/myintro/${myintro.myintroSn }" method="delete" style="display: inline-block; width: 150px;">
		<button type="submit" class="btn btn-outline-danger" style=" border-radius: 0;">삭제하기</button>
	</form:form>
</div>