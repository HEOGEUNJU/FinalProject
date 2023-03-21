<%--
* [[개정이력(Modification Information)]]
* 수정일             수정자            수정내용
* ----------  ---------  -----------------
* 2023. 2. 14.      최경수            최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/pattern.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/help.css">

<style>
.btn btn-block btn-primary btn-md{
    /* margin-bottom: 20px; */
    padding-bottom: 15px;
    padding-top: 15px;
}
.company_honest_qna .contents_container {
    width: 90%;
}

.wrap_community_topic .section_inner {
    width: 100%;
    height: auto;
}

.wrap_community_topic .section_inner:nth-child(even) {
    float: left;
}
.company_honest_qna .contents_container {
    width: 95%;
}
table {
	border-top: 2px solid gray;
}
.mine tr {
	width: 100%;
	height: 96px;
}
th {
	text-align: center;
	font-weight: bold;
	background-color: #f7f7f7;
	padding: 14px;
	height: 47px;
	margin: 0;
	box-sizing: border-box;
	color: #222;
	font-size: 14px;
	letter-spacing: -1px;
	line-height: 18px;
	border-color: inherit;
	border-style: solid;
	border-width: 0;
}
td {
	text-align: center;
	border-bottom: 1px solid #e1e1e1;
	color: #222;
}
.mine tbody {
	width: 837px;
}
.mine th {
	width: 25%;
}
.mine td {
	width: 32%;
}
</style>
<security:authentication property="principal.realMember.attach" var="attach"/>


	<section class="site-section" style="padding-bottom: 0px;">
		<div class="container" style="max-width: 90%;">

			<div class="row mb-5">
				<div class="col-lg-12">

					<div class="help_find help_contact wrap_help">
						<div class="cont_find">

							<!-- ==================================================지원내역================================================== -->
							<div class="qna_write_wrap" style="margin-top: 36px;">
								<div class="qna_write_selection" style="padding-top: 0;">
									<span class="qna_category_tit">지원</span>
								</div>
							</div>							
							<div class="wrap_story_panel">
								<div class="wrap_section wrap_community_topic">		
									<div class="section_inner" style="margin-right:15px">
										<div class="tblType">
											<table style="width: 100%;">
							 					<thead>
								 					<tr>
														<th style="width: 26%;">지원공고</th>
														<th style="width: 15%;">부서</th>
														<th style="width: 15%;">직무</th>
														<th style="width: 10%;">직급</th>
														<th style="width: 13%;">현채용과정</th>
														<th style="width: 13%;">현채용과정 결과</th>
														<th style="width: 8%;">지원날짜</th>
								 					</tr>
								 				</thead>
												<tbody>
													<tr>
														<td style="height: 40px;">${apply.anno.annoTitle}</td>
														<td style="height: 40px;">${apply.detail.daDepartment}</td>
														<td style="height: 40px;">${apply.detail.daFd}</td>
														<td style="height: 40px;">사원</td>
														<td style="height: 40px;">${apply.process.processCodeName}</td>
														<td style="height: 40px;">${apply.applyResult}</td>
														<td style="height: 40px;">${apply.applyDate}</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
													
							<!-- ==================================================공고================================================== -->
							<div class="qna_write_wrap">
								<div class="qna_write_selection" style="padding-top: 0;">
									<span class="qna_category_tit">세부공고</span>
								</div>
							</div>
							<div class="wrap_story_panel">
								<div class="wrap_section wrap_community_topic">		
									<div class="section_inner" style="margin-right:15px">
										<div class="tblType">
											<table style="width: 100%;">
												  <tr>
												  	<th scope="row">공고명</th>
												  	<td colspan="3"><a href="${pageContext.request.contextPath}/announcement/view/${apply.anno.annoNo}">${apply.anno.annoTitle}</a></td>
											  	  </tr>
												  <tr>
												    <th scope="row">법인명</th>
												    <td>${apply.company.cmpName}</td>
												    <th scope="row">회사대표자</th>
												    <td>${apply.company.cmpRepName}</td>
												  </tr>
												  <tr>
												    <th scope="row">공고 시작날짜</th>
												    <td>${apply.anno.annoStartdate}</td>
												    <th scope="row">공고 종료날짜</th>
												    <td>${apply.anno.annoEnddate}</td>
												  </tr>
												  <tr>
												    <th scope="row">공고 내용</th>
												    <td colspan="3">${fn:substring(apply.anno.annoContent, 0, 81)} ...</td>
												  </tr>
												  <tr>
												  	<th scope="row">담당업무</th>
												  	<td>${apply.detail.daFd}</td>
												  	<th scope="row">근무부서</th>
												  	<td>${apply.detail.daDepartment}</td>
												  </tr>
												  <tr>
												  	<th scope="row">상세업무</th>
												  	<td colspan="3">${fn:substring(apply.detail.daTask, 0, 81)} ...</td>
										  		</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
							
							<!-- ==================================================이력서================================================== -->
														
							<div class="qna_write_wrap" style="margin-top: 0;">
								<div class="qna_write_selection" style="padding-top: 20px;">
									<span class="qna_category_tit">이력서</span>
								</div>
							</div>
							
							<fieldset style="display: flex; height: 40vh;">
								<div style="width: 30%; background-image: url('<spring:url value="/image/memberFolder/${attach.attSavename}"/>'); background-size: cover; background-position: center; margin-right: 10px;">&nbsp;</div>
								<div class="mine" style="display: inline-block; width: 70%;">
									<table style="width: 100%;">
									  	<tr>
										    <th scope="row">제목</th>
										    <td colspan="3"><a href="${pageContext.request.contextPath}/resume/${apply.resume.resumeSn}">${apply.resume.resumeTitle}</a></td>
									  	</tr>
									  	<tr>
										    <th scope="row">주소</th>
										    <td colspan="3">${apply.resume.resumeAddr1}</td>
									  	</tr>
									  	<tr>
										    <th scope="row" >이름</th>
										    <td >${apply.resume.resumeName}</td>
										    <th scope="row">성별</th>
										    <td >${apply.resume.resumeGender}</td>
									  	</tr>
									  	<tr>
										    <th scope="row">이메일</th>
										    <td>${apply.resume.resumeEmail}}</td>
										    <th scope="row">전화번호</th>
										    <td>${apply.resume.resumeTel}</td>
									  	</tr>
									  	<tr>
										    <th scope="row">미리보기</th>
										    <td colspan="3">
												<button class="btn btn-primary" onclick="window.open('${pageContext.request.contextPath}/pdf?resumeSn=${apply.resume.resumeSn}', 'window_name', 'width=730, height=1080, location=no, status=no, scrollbars=yes')" style="width: 100px; border-radius: 0;">
													pdf로 보기
												</button>
											</td>
									  	</tr>
									</table>
								</div>
							</fieldset>
							
							<!-- ==================================================자소서================================================== -->
							<div class="qna_write_wrap" style="margin-top: 50px;">
								<div class="qna_write_selection" style="padding-top: 0;">
									<span class="qna_category_tit">자기소개서</span>
								</div>
							</div>							
							<div class="wrap_story_panel">
								<div class="wrap_section wrap_community_topic">		
									<div class="section_inner" style="margin-right:15px">
										<div class="tblType">
											<table style="width: 100%;">
							 					<thead>
								 					<tr>
														<th style="width: 5%;"></th>
														<th style="width: 20%;">제목</th>
														<th style="width: 15%;">항목1</th>
														<th style="width: 15%;">항목2</th>
														<th style="width: 31%;">· · · </th>
														<th style="width: 8%;">작성날짜</th>
														<th style="width: 6%;"></th>
								 					</tr>
								 				</thead>
												<tbody>
													<tr>
														<td></td>
														<td><a href="${pageContext.request.contextPath}/myintro/${apply.myintro.myintroSn}">${apply.myintro.myintroTitle}</a></td>
														<td>${fn:substring(apply.myintro.myintroGrowth, 0, 50)}</td>
														<td>${fn:substring(apply.myintro.myintroPersonality, 0, 50)}</td>
														<td>· · ·</td>
														<td>${apply.myintro.myintroInsertDate}</td>
														<td></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</section>












<div style="display: flex; justify-content: flex-end; padding: 7rem; padding-top: 1rem;">
	<a href="${pageContext.request.contextPath}/apply"><button class="btn btn-outline-primary" style="width: 150px; border-radius: 0;">목록</button></a>
	<a href="${pageContext.request.contextPath}/apply/edit?applySn=${apply.applySn}"><button class="btn btn-outline-secondary" style="width: 150px; border-radius: 0;">수정하기</button></a>
	<form:form modelAttribute="apply" action="${pageContext.request.contextPath}/apply/${apply.applySn}" method="delete" style="display: inline-block; width: 150px;">
		<button type="submit" class="btn btn-danger" style=" border-radius: 0;">삭제하기</button>
	</form:form>
</div>