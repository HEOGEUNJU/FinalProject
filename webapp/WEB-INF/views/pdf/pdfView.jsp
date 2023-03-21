<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023. 2. 25.  양서연      최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %> 
<c:set var="prePath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${prePath}/resources/css/pdf.css"/>
<script type="text/javascript" src="${prePath}/resources/js/jquery-3.6.1.min.js"></script>
<html>
	<div>
		<button type="button" id="createPdf">저장</button>
	</div>
	<!-- 시작 -->
	<div id="htmlStr">
		<div>
			<h1 class="red">이력서.pdf [미리보기 화면입니다.]</h1>
		</div>
		<table class="center " width="690" border="1" cellspacing="0">
			<tr class="center" height="40" bgcolor="#DBE9BF">
				<td class="DCDCDC"  rowspan="6" style="background-image: url('<spring:url value="/image/memberFolder/${seeker.attatchList[0].attSavename}"/>'); background-size: cover; background-position: center; width: 100px;"></td>
				<td class="DCDCDC title" colspan="7"><b>이&nbsp;&nbsp;&nbsp;력&nbsp;&nbsp;&nbsp;서</b></td>
			</tr>
			<tr class="center" height="20">
				<td class="DCDCDC" rowspan="2" colspan="2">성 명</td>
				<td rowspan="2" colspan="3">${resume.resumeName}</td>
				<td class="DCDCDC" colspan="2">성별</td>
			</tr>
			<tr class="center" height="20">
				<td colspan="2">${resume.resumeGender}</td>
			</tr>
			<tr class="center" height="20">
				<td class="DCDCDC" colspan="2">생년월일</td>
				<td colspan="5">${seeker.memBirth} (만 28세)</td>
			</tr>
			<tr class="center" height="20">
				<td class="DCDCDC" colspan="2">주소</td>
				<td colspan="6">${resume.resumeAddr1}</td>
			</tr>
			<tr class="center" height="20">
				<td class="DCDCDC">연락처</td>
				<td class="DCDCDC">전화번호</td>
				<td colspan="2">${resume.resumeTel}</td>
				<td class="DCDCDC">이메일</td>
				<td colspan="3">${resume.resumeEmail}</td>
			</tr>
			<c:if test="${not empty resume.eduList}">
				<tr class="center" height="20">
					<td class="DCDCDC" colspan="8"><b>학 력  사 항</b></td>
				</tr>
				<tr>
					<td class="DCDCDC" height="20">학교명</td>
					<td class="DCDCDC">전공분류</td>
					<td class="DCDCDC">전공</td>
					<td class="DCDCDC">입학일자</td>
					<td class="DCDCDC">졸업일자</td>
					<td class="DCDCDC">상태</td>
					<td class="DCDCDC">학점</td>
					<td class="DCDCDC">기준학점</td>
				</tr>
				<c:forEach var="eduList" items="${resume.eduList}">
					<tr>
						<td height="20">${eduList.eduName}</td>
						<td>${eduList.eduDepartment}</td>
						<td>${eduList.eduMajor}</td>
						<td>${eduList.eduEntered}</td>
						<td>${eduList.eduGraduated}</td>
						<td>${eduList.eduStatus}</td>
						<td>${eduList.eduScore}</td>
						<td>${eduList.eduStandard}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${not empty resume.careerList}">
				<tr class="center" height="20">
					<td class="DCDCDC" colspan="8"><b>경 력  사 항</b></td>
				</tr>
				<tr>
					<td class="DCDCDC" height="20">업종</td>
					<td class="DCDCDC">직장명</td>
					<td class="DCDCDC">직무</td>
					<td class="DCDCDC">직급</td>
					<td class="DCDCDC">입사일</td>
					<td class="DCDCDC">퇴사일</td>
					<td class="DCDCDC">연봉</td>
					<td class="DCDCDC">연차</td>
				</tr>
				<c:forEach var="careerList" items="${resume.careerList}">
					<tr>
						<td height="20">${careerList.careerCategory}</td>
						<td>${careerList.careerCompany}</td>
						<td>${careerList.careerTask}</td>
						<td>${careerList.careerClass}</td>
						<td>${careerList.careerJoin}</td>
						<td>${careerList.careerResign}</td>
						<td>${careerList.careerSalary}</td>
						<td>${careerList.careerAnnual}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${not empty resume.certList}">
				<tr class="center" height="20">
					<td class="DCDCDC" colspan="8"><b>자 격 증</b></td>
				</tr>
				<tr>
					<td class="DCDCDC" height="20">자격번호</td>
					<td class="DCDCDC" colspan="4">자격증명</td>
					<td class="DCDCDC" >발급일</td>
					<td class="DCDCDC" colspan="2">시행부처</td>
				</tr>
				<c:forEach var="certList" items="${resume.certList}">
					<tr>
						<td height="20">${certList.certNo}</td>
						<td colspan="4">${certList.certName}</td>
						<td>${certList.certDate}</td>
						<td colspan="2">${certList.certInstitution}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${not empty resume.facilityList}">
				<tr class="center" height="20">
					<td class="DCDCDC" colspan="8"><b>기 능</b></td>
				</tr>
				<tr>
					<td class="DCDCDC" height="20">기능명</td>
					<td class="DCDCDC" colspan="4">기능종류</td>
					<td class="DCDCDC">수준</td>
					<td class="DCDCDC">취득일</td>
					<td class="DCDCDC">훈련기간</td>
				</tr>
				<c:forEach var="facilityList" items="${resume.facilityList}">
					<tr>
						<td height="20">${facilityList.facilityName}</td>
						<td colspan="4">${facilityList.facilityCategory}</td>
						<td>${facilityList.facilityLevel}</td>
						<td>${facilityList.facilityGetdate}</td>
						<td>${facilityList.facilityPeriod}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${not empty resume.activityList}">
				<tr class="center" height="20">
					<td class="DCDCDC" colspan="8"><b>주 요 활 동</b></td>
				</tr>
				<tr>
					<td class="DCDCDC" height="20" colspan="2">활동명</td>
					<td class="DCDCDC" colspan="2">활동종류</td>
					<td class="DCDCDC" colspan="2">활동기관</td>
					<td class="DCDCDC" colspan="2">활동기간</td>
				</tr>
				<c:forEach var="activityList" items="${resume.activityList}">
					<tr>
						<td height="20" colspan="2">${activityList.actName}</td>
						<td colspan="2">${activityList.actCategory}</td>
						<td colspan="2">${activityList.actInstitution}</td>
						<td colspan="2">${activityList.actPeriod}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${not empty resume.courseList}">
				<tr class="center" height="20">
					<td class="DCDCDC" colspan="8"><b>교 육 이 수</b></td>
				</tr>
				<tr>
					<td class="DCDCDC" height="20" colspan="2">교육명</td>
					<td class="DCDCDC" colspan="2">교육종류</td>
					<td class="DCDCDC" colspan="2">교육기관</td>
					<td class="DCDCDC" colspan="2">교육기간</td>
				</tr>
				<c:forEach var="courseList" items="${resume.courseList}">
					<tr>
						<td height="20" colspan="2">${courseList.courseName}</td>
						<td colspan="2">${courseList.courseCategory}</td>
						<td colspan="2">${courseList.courseInstitution}</td>
						<td colspan="2">${courseList.coursePeriod}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${not empty resume.awardList}">
				<tr class="center" height="20">
					<td class="DCDCDC" colspan="8"><b>수 상 내 역</b></td>
				</tr>
				<tr>
					<td class="DCDCDC" height="20" colspan="2">대회명</td>
					<td class="DCDCDC" colspan="2">수상명</td>
					<td class="DCDCDC">대회종류</td>
					<td class="DCDCDC" colspan="2">수상기관</td>
					<td class="DCDCDC">수상날짜</td>
				</tr>
				<c:forEach var="awardList" items="${resume.awardList}">
					<tr>
						<td height="20" colspan="2">${awardList.awardCompetition }</td>
						<td colspan="2">${awardList.awardName }</td>
						<td>${awardList.awardCategory }</td>
						<td colspan="2">${awardList.awardInstitution }</td>
						<td>${awardList.awardDate }</td>
					</tr>
				</c:forEach>
			</c:if>
			<tr>
				<td colspan="8">
					<p>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</p>
					<p>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</p>
					<p>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</p>
					<p style = "text-align:center" >위의 사실이 틀림없음을 서약합니다.</p>
					<p>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</p>
					<p style = "text-align:center" >2023&nbsp;&nbsp;&nbsp;년&nbsp;&nbsp;&nbsp;&nbsp;3&nbsp;월&nbsp;&nbsp;&nbsp;16&nbsp;일 </p>
					<p style = "text-align:right" >${resume.resumeName} (인)&nbsp;&nbsp;&nbsp;</p>
					<p>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</p>
					<p>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</p>
				</td>
			</tr>
		</table>
	</div>
	<!-- 끝 -->
</html>
<script>
let htmlStr = $("#htmlStr").html();

$("#createPdf").on("click",function(){
	let data = { 
					htmlStr : htmlStr
					, resumeSn : `${resume.resumeSn}`
				};
	console.log("data",data);
	$.ajax({
		url : "${pageContext.request.contextPath}/pdf/createPdf",
		method : "post",
		data : JSON.stringify(data),
		contentType: 'application/json',
		success : function(resp) {
			alert(resp);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
})
</script>
