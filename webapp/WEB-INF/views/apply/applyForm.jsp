<%--
* [[개정이력(Modification Information)]]
* 수정일             수정자            수정내용
* ----------  ---------  -----------------
* 2023. 2. 14.    최경수     최초작성
* 2023. 2. 15.    최경수     공고 추가
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
<link rel="stylesheet" href="${prePath}/resources/css/pdf.css"/>

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

													
							<!-- ==================================================공고================================================== -->
							<div class="qna_write_wrap">
								<div class="qna_write_selection" style="padding-top: 0;">
									<span class="qna_category_tit">공고</span>
								</div>
							</div>
							<div class="wrap_story_panel">
								<div class="wrap_section wrap_community_topic">		
									<div class="section_inner" style="margin-right:15px">
										<div class="tblType">
											<table style="width: 100%;">
												  <tr>
												  	<th scope="row">공고명</th>
												  	<td colspan="3"><a href="${pageContext.request.contextPath}/announcement/view/${anno.annoNo}">${anno.annoTitle}</a></td>
											  	  </tr>
												  <tr>
												    <th scope="row">법인명</th>
												    <td>${anno.company.cmpName}</td>
												    <th scope="row">회사대표자</th>
												    <td>${annoy.company.cmpRepName}</td>
												  </tr>
												  <tr>
												    <th scope="row">공고 시작날짜</th>
												    <td>${anno.annoStartdate}</td>
												    <th scope="row">공고 종료날짜</th>
												    <td>${anno.annoEnddate}</td>
												  </tr>
											</table>
										</div>
									</div>
								</div>
							</div>
							
							<!-- ==================================================세부공고================================================== -->
							<div class="qna_write_wrap">
								<div class="qna_write_selection" style="padding-top: 0;">
									<span class="qna_category_tit">세부공고</span>
								</div>
							</div>
							<div class="wrap_story_panel">
								<div class="wrap_section wrap_community_topic">		
									<c:forEach items="${anno.detailList}" var="detail" varStatus="status">
										<div class="section_inner" style="margin-right:15px">
											<div class="tblType">
												<table style="width: 100%;">
													  <tr>
													  	<th scope="row">직급</th>
													  	<td>${detail.positionList[status.index].positionName}</td>
													    <th scope="row">업무일자</th>
													    <td>${detail.daWorkday}</td>
												  	  </tr>
													  <tr>
													    <th scope="row">모집분야</th>
													    <td>${detail.daFd}</td>
													    <th scope="row">모집부서</th>
													    <td>${detail.daDepartment}</td>
													  </tr>
													  <tr>
													  	<th scope="row">직무</th>
													  	<td colspan="3">${fn.substring(detail.daTask, 0, 81)} ...</td>
													  </tr>
												</table>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>

							<!-- ==================================================지원내역================================================== -->
							<div class="qna_write_wrap" style="margin-top: 36px;">
								<div class="qna_write_selection" style="padding-top: 0;">
									<span class="qna_category_tit">지원하기</span>
								</div>
							</div>							
							<div class="wrap_story_panel" style="padding-bottom: 0;">
								<div class="wrap_section wrap_community_topic">		
									<form:form modelAttribute="apply" action="${pageContext.request.contextPath}/apply" method="post">
										<div class="section_inner" style="margin-right:15px">
											<div class="tblType">
												<div style="width: 100%;">
													<input name="annoNo" value="${anno.annoNo}" hidden/>
													<div class="form-group" style="width: 30%; display: inline-block; margin-left: 1.5%; margin-right: 1.5%;">
														<label for="job-title">세부공고</label>
														<form:select path="daNo" cssClass="form-control" >
															<option value="">세부공고선택</option>
															<c:forEach items="${anno.detailList }" var="detail">
																<option value="${detail.daNo}">${detail.daFd}</option>
															</c:forEach>
														</form:select>
														<form:errors path="daNo" element="span" cssClass="text-danger" />
													</div>
													<div class="form-group" style="width: 30%; display: inline-block; margin-left: 1.5%; margin-right: 1.5%;">
														<label for="job-title">내 이력서</label>
														<form:select path="resumeSn" cssClass="form-control">
															<option value="">이력서 선택</option>
															<c:forEach items="${resumeList}" var="resume">
																<option value="${resume.resumeSn}">${resume.resumeTitle}</option>
															</c:forEach>
														</form:select>
														<form:errors path="resumeSn" element="span" cssClass="text-danger" />
													</div>
													<div class="form-group" style="width: 30%; display: inline-block; margin-left: 1.5%; margin-right: 1.5%;">
														<label for="job-title">내 자기소개서</label>
														<form:select path="myintroSn" cssClass="form-control">
															<option value="">자기소개서 선택</option>
															<c:forEach items="${myintroList}" var="myintro">
																<option value="${myintro.myintroSn}">${myintro.myintroTitle}</option>
															</c:forEach>
														</form:select>
														<form:errors path="myintroSn" element="span" cssClass="text-danger" />
													</div>
												</div>											
											</div>
										</div>
										<div style="display: flex; justify-content: flex-end; padding: 7rem; padding-top: 1rem; padding-right: 0.5rem; padding-bottom: 0.5rem;">
											<button class="btn btn-primary" type="submit" style="width: 150px; height: 50px; border-radius: 0;">저장</button> 
											<button class="btn btn-danger" type="button" onclick='location.href="${pageContext.request.contextPath}/announcement/view/${anno.annoNo}"' style="width: 150px; height: 50px; border-radius: 0;">취소</button> 
										</div>
									</form:form>
								</div>
							</div>
							
							<!-- ==================================================이력서================================================== -->
														
							<div class="qna_write_wrap" style="margin-top: 0;">
								<div class="qna_write_selection" style="padding-top: 20px;">
									<span class="qna_category_tit">이력서 미리보기</span>
								</div>
							</div>
							
							<fieldset style="display: flex; height: 40vh;">
								<div style="width: 30%; background-image: url('<spring:url value="/image/memberFolder/${attach.attSavename}"/>'); background-size: cover; background-position: center; margin-right: 10px;">&nbsp;</div>
								<div class="mine" style="display: inline-block; width: 70%;">
									<table style="width: 100%;">
									  	<tr>
										    <th scope="row">제목</th>
										    <td colspan="3" id="resumeTitle"><a href="${pageContext.request.contextPath}/resume/${apply.resume.resumeSn}">${apply.resume.resumeTitle}</a></td>
									  	</tr>
									  	<tr>
										    <th scope="row">주소</th>
										    <td colspan="3" id="resumeAddr1">${apply.resume.resumeAddr1}</td>
									  	</tr>
									  	<tr>
										    <th scope="row" >이름</th>
										    <td id="resumeName">${apply.resume.resumeName}</td>
										    <th scope="row">성별</th>
										    <td id="resumeGender">${apply.resume.resumeGender}</td>
									  	</tr>
									  	<tr>
										    <th scope="row">이메일</th>
										    <td id="resumeEmail">${apply.resume.resumeEmail}</td>
										    <th scope="row">전화번호</th>
										    <td id="resumeTel">${apply.resume.resumeTel}</td>
									  	</tr>
									  	<tr>
										    <th scope="row">미리보기</th>
										    <td colspan="3" id="resumePdf">
												<button class="btn btn-primary pdfBtn" style="width: 100px; border-radius: 0;">pdf로 보기</button>
											</td>
									  	</tr>
									</table>
								</div>
							</fieldset>
							
							<!-- ==================================================자소서================================================== -->
							<div class="qna_write_wrap" style="margin-top: 50px;">
								<div class="qna_write_selection" style="padding-top: 0;">
									<span class="qna_category_tit">자기소개서 미리보기</span>
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
														<td id="myintroTitle"><a href="${pageContext.request.contextPath}/myintro/${apply.myintro.myintroSn}">${apply.myintro.myintroTitle}</a></td>
														<td>${fn:substring(apply.myintro.myintroGrowth, 0, 50)}</td>
														<td>${fn:substring(apply.myintro.myintroPersonality, 0, 50)}</td>
														<td>· · ·</td>
														<td id="myintroInsertDate">${apply.myintro.myintroInsertDate}</td>
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


<script>

$("[name=resumeSn]").on("change", function() {
	let resumeSn = $(this).val();
	$.ajax({
		url : "${pageContext.request.contextPath}/resume/ajax/" + resumeSn,
		dataType : "json",
		success : function(resume) {
			$("#resumeTitle").html('<a href="${pageContext.request.contextPath}/resume/' + resume.resumeSn + '">' + resume.resumeTitle + '</a>');
			$("#resumeAddr1").html(resume.resumeAddr1);
			$("#resumeName").html(resume.resumeName);
			$("#resumeGender").html(resume.resumeGender);
			$("#resumeEmail").html(resume.resumeEmail);
			$("#resumeTel").html(resume.resumeTel);
			$(".pdfBtn").attr("onclick", "window.open('${pageContext.request.contextPath}/pdf?resumeSn=" + resume.resumeSn + "', 'window_name', 'width=730, height=1080, location=no, status=no, scrollbars=yes')");
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
});

$("[name=myintroSn]").on("change", function() {
	let myintroSn = $(this).val();
	$.ajax({
		url : "${pageContext.request.contextPath}/myintro/ajax/" + myintroSn,
		dataType : "json",
		success : function(myintro) {
			$("#myintroTitle").html('<a href="${pageContext.request.contextPath}/myintro/' + myintro.myintroSn + '">' + myintro.myintroTitle.substring(3, 30) + '</a>');
			$("#myintroGrowth").html(myintro.myintroGrowth.substring(3, 30));
			$("#myintroPersonality").html(myintro.myintroPersonality.substring(3, 30));
			$("#myintroInsertDate").html(myintro.myintroInsertDate.substring(0, 10));

		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
});
</script>