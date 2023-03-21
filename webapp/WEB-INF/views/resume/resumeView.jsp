<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
							<div class="qna_write_wrap">
								<div class="qna_write_selection">
									<span class="qna_category_tit">이력서</span>
									<span style="position: relative; left: 85%;">
										<button class="btn btn-primary" onclick="window.open('${pageContext.request.contextPath}/pdf?resumeSn=${resume.resumeSn}', 'window_name', 'width=730, height=1080, location=no, status=no, scrollbars=yes')" style=" border-radius: 0;">
											pdf로 보기
										</button>
									</span>
								</div>
							</div>

							<fieldset style="display: flex; height: 40vh;">
<%-- 								<div style="width: 30%; background-image: url(${pageContext.request.contextPath}/resources/images/profile.jpg); background-size: cover; background-position: center; margin-right: 10px;">&nbsp;</div> --%>
								<div style="width: 30%; background-image: url('<spring:url value="/image/memberFolder/${attach.attSavename}"/>'); background-size: cover; background-position: center; margin-right: 10px;">&nbsp;</div>
								<div class="mine" style="display: inline-block; width: 70%;">
									<table style="width: 100%;">
									  	<tr>
										    <th scope="row">제목</th>
										    <td colspan="3">${resume.resumeTitle}</td>
									  	</tr>
									  	<tr>
										    <th scope="row">주소</th>
										    <td colspan="3">${resume.resumeAddr1}</td>
									  	</tr>
									  	<tr>
										    <th scope="row" >이름</th>
										    <td >${resume.resumeName}</td>
										    <th scope="row">성별</th>
										    <td >${resume.resumeGender}</td>
									  	</tr>
									  	<tr>
										    <th scope="row">이메일</th>
										    <td>${resume.resumeEmail}}</td>
										    <th scope="row">전화번호</th>
										    <td>${resume.resumeTel}</td>
									  	</tr>
									  	<tr>
										    <th scope="row">첨부파일</th>
										    <td colspan="3">
									    		<p class="noti_inp">졸업증명서.pdf &nbsp;&nbsp;&nbsp; 경력증명서.pdf &nbsp;&nbsp;&nbsp; 시험점수.pdf</p>
												<p class="noti_inp">교육인증서.pdf &nbsp;&nbsp;&nbsp; 상장.pdf</p>
											</td>
									  	</tr>
									</table>
								</div>
							</fieldset>
							
							<!-- ==================================================학력================================================== -->
							<div class="wrap_story_panel">
								<div class="wrap_section wrap_community_topic" style="margin-top: 36px;">		
									<div class="section_inner" style="margin-right:15px">
										<div class="wrap_title">
								 			<h4 class="title">
							  					<a href="<c:url value='/education'/>">학력</a>
								 			</h4>
								 			<a href="<c:url value='/education'/>">더보기</a>
										</div>
										<div class="tblType">
											<table style="width: 100%;">
							 					<thead>
								 					<tr>
														<th style="width: 5%;"></th>
														<th style="width: 13%;">학교명</th>
														<th style="width: 13%;">전공분류</th>
														<th style="width: 15%;">전공</th>
														<th style="width: 8%;">입학일</th>
														<th style="width: 8%;">졸업일</th>
														<th style="width: 8%;">상태</th>
														<th style="width: 8%;">학점</th>
														<th style="width: 8%;">기준학점</th>
														<th style="width: 8%;">작성날짜</th>
														<th style="width: 6%;"></th>
								 					</tr>
								 				</thead>
												<tbody id="eduBody">
												</tbody>
												<tfoot>
													<tr>
														<td colspan="11" id="eduFoot" style="text-align: center; height: 5vh; padding: 10px;">
															<button type="button" class="btn btn-outline-primary" id="eduBtn" style="width: 15%; font-size: 13px; border-radius: 0;">새로 추가하기</button>
															<button type="button" class="btn btn-outline-primary" style="width: 15%; font-size: 13px; border-radius: 0;" data-bs-toggle="modal" data-bs-target="#eduModal">기존 학력 추가하기</button>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
								</div>
							</div>
							<!-- ==================================================학력================================================== -->

							<!-- ==================================================경력================================================== -->
							<div class="wrap_story_panel">
								<div class="wrap_section wrap_community_topic" style="margin-top: 0px;">		
									<div class="section_inner" style="margin-right:15px">
										<div class="wrap_title">
								 			<h4 class="title">
							  					<a href="<c:url value='/career'/>">경력</a>
								 			</h4>
								 			<a href="<c:url value='/career'/>">더보기</a>
										</div>
										<div class="tblType">
											<table style="width: 100%;">
							 					<thead>
								 					<tr>
														<th style="width: 5%;"></th>
														<th style="width: 13%;">직장명</th>
														<th style="width: 13%;">업종</th>
														<th style="width: 15%;">직무</th>
														<th style="width: 8%;">직급</th>
														<th style="width: 8%;">입사일</th>
														<th style="width: 8%;">퇴사일</th>
														<th style="width: 8%;">연봉</th>
														<th style="width: 8%;">연차</th>
														<th style="width: 8%;">작성날짜</th>
														<th style="width: 6%;"></th>
								 					</tr>
								 				</thead>
												<tbody id="careerBody">
												</tbody>
												<tfoot>
													<tr>
														<td colspan="11" id="careerFoot" style="text-align: center; height: 5vh; padding: 10px;">
															<button type="button" class="btn btn-outline-primary" id="careerBtn" style="width: 15%; font-size: 13px; border-radius: 0;">새로 추가하기</button>
															<button type="button" class="btn btn-outline-primary" style="width: 15%; font-size: 13px; border-radius: 0;" data-bs-toggle="modal" data-bs-target="#careerModal">기존 경력 추가하기</button>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
								</div>
							</div>
							<!-- ==================================================경력================================================== -->
							
							<!-- ==================================================자격증================================================== -->
							<div class="wrap_story_panel">
								<div class="wrap_section wrap_community_topic" style="margin-top: 0px;">		
									<div class="section_inner" style="margin-right:15px">
										<div class="wrap_title">
								 			<h4 class="title">
							  					<a href="<c:url value='/certification'/>">자격증</a>
								 			</h4>
								 			<a href="<c:url value='/certification'/>">더보기</a>
										</div>
										<div class="tblType">
											<table style="width: 100%;">
							 					<thead>
								 					<tr>
														<th style="width: 5%;"></th>
														<th style="width: 29%;">자격증명</th>
														<th style="width: 20%;">자격번호</th>
														<th style="width: 8%;">발급일</th>
														<th style="width: 24%;">시행부처</th>
														<th style="width: 8%;">작성날짜</th>
														<th style="width: 6%;"></th>
								 					</tr>
								 				</thead>
												<tbody id="certBody">
												</tbody>
												<tfoot>
													<tr>
														<td colspan="7" id="certFoot" style="text-align: center; height: 5vh; padding: 10px;">
															<button type="button" class="btn btn-outline-primary" id="certBtn" style="width: 15%; font-size: 13px; border-radius: 0;">새로 추가하기</button>
															<button type="button" class="btn btn-outline-primary" style="width: 15%; font-size: 13px; border-radius: 0;" data-bs-toggle="modal" data-bs-target="#certModal">기존 자격증 추가하기</button>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
								</div>
							</div>
							<!-- ==================================================자격증================================================== -->
							
							<!-- ==================================================기능================================================== -->
							<div class="wrap_story_panel">
								<div class="wrap_section wrap_community_topic" style="margin-top: 0px;">		
									<div class="section_inner" style="margin-right:15px">
										<div class="wrap_title">
								 			<h4 class="title">
							  					<a href="<c:url value='/facility'/>">기능</a>
								 			</h4>
								 			<a href="<c:url value='/facility'/>">더보기</a>
										</div>
										<div class="tblType">
											<table style="width: 100%;">
							 					<thead>
								 					<tr>
														<th style="width: 5%;"></th>
														<th style="width: 30%;">기능명</th>
														<th style="width: 25%;">기능종류</th>
														<th style="width: 10%;">수준</th>
														<th style="width: 8%;">취득일</th>
														<th style="width: 8%;">훈련기간</th>
														<th style="width: 8%;">작성날짜</th>
														<th style="width: 6%;"></th>
								 					</tr>
								 				</thead>
												<tbody id="facBody">
												</tbody>
												<tfoot>
													<tr>
														<td colspan="8" id="facFoot" style="text-align: center; height: 5vh; padding: 10px;">
															<button type="button" class="btn btn-outline-primary" id="facBtn" style="width: 15%; font-size: 13px; border-radius: 0;">새로 추가하기</button>
															<button type="button" class="btn btn-outline-primary" style="width: 15%; font-size: 13px; border-radius: 0;" data-bs-toggle="modal" data-bs-target="#facModal">기존 기능 추가하기</button>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
								</div>
							</div>
							<!-- ==================================================기능================================================== -->
							
							<!-- ==================================================주요활동================================================== -->
							<div class="wrap_story_panel">
								<div class="wrap_section wrap_community_topic" style="margin-top: 0px;">		
									<div class="section_inner" style="margin-right:15px">
										<div class="wrap_title">
								 			<h4 class="title">
							  					<a href="<c:url value='/activity'/>">주요활동</a>
								 			</h4>
								 			<a href="<c:url value='/activity'/>">더보기</a>
										</div>
										<div class="tblType">
											<table style="width: 100%;">
							 					<thead>
								 					<tr>
														<th style="width: 5%;"></th>
														<th style="width: 25%;">주요활동명</th>
														<th style="width: 13%;">주요활동종류</th>
														<th style="width: 33%;">주요활동기관</th>
														<th style="width: 10%;">주요활동기간</th>
														<th style="width: 8%;">작성날짜</th>
														<th style="width: 6%;"></th>
								 					</tr>
								 				</thead>
												<tbody id="actBody">
												</tbody>
												<tfoot>
													<tr>
														<td colspan="7" id="actFoot" style="text-align: center; height: 5vh; padding: 10px;">
															<button type="button" class="btn btn-outline-primary" id="actBtn" style="width: 15%; font-size: 13px; border-radius: 0;">새로 추가하기</button>
															<button type="button" class="btn btn-outline-primary" style="width: 15%; font-size: 13px; border-radius: 0;" data-bs-toggle="modal" data-bs-target="#actModal">기존 주요활동 추가하기</button>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
								</div>
							</div>
							<!-- ==================================================주요활동================================================== -->
							
							<!-- ==================================================교육이수================================================== -->
							<div class="wrap_story_panel">
								<div class="wrap_section wrap_community_topic" style="margin-top: 0px;">		
									<div class="section_inner" style="margin-right:15px">
										<div class="wrap_title">
								 			<h4 class="title">
							  					<a href="<c:url value='/course'/>">교육이수</a>
								 			</h4>
								 			<a href="<c:url value='/course'/>">더보기</a>
										</div>
										<div class="tblType">
											<table style="width: 100%;">
							 					<thead>
								 					<tr>
														<th style="width: 5%;"></th>
														<th style="width: 25%;">교육명</th>
														<th style="width: 13%;">교육종류</th>
														<th style="width: 33%;">교육기관</th>
														<th style="width: 10%;">교육기간</th>
														<th style="width: 8%;">작성날짜</th>
														<th style="width: 6%;"></th>
								 					</tr>
								 				</thead>
												<tbody id="courseBody">
												</tbody>
												<tfoot>
													<tr>
														<td colspan="7" id="courseFoot" style="text-align: center; height: 5vh; padding: 10px;">
															<button type="button" class="btn btn-outline-primary" id="courseBtn" style="width: 15%; font-size: 13px; border-radius: 0;">새로 추가하기</button>
															<button type="button" class="btn btn-outline-primary" style="width: 15%; font-size: 13px; border-radius: 0;" data-bs-toggle="modal" data-bs-target="#courseModal">기존 교육이수 추가하기</button>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
								</div>
							</div>
							<!-- ==================================================교육이수================================================== -->
							
							<!-- ==================================================수상내역================================================== -->
							<div class="wrap_story_panel">
								<div class="wrap_section wrap_community_topic" style="margin-top: 0px;">		
									<div class="section_inner" style="margin-right:15px">
										<div class="wrap_title">
								 			<h4 class="title">
							  					<a href="<c:url value='/award'/>">수상내역</a>
								 			</h4>
								 			<a href="<c:url value='/award'/>">더보기</a>
										</div>
										<div class="tblType">
											<table style="width: 100%;">
							 					<thead>
								 					<tr>
														<th style="width: 5%;"></th>
														<th style="width: 22%;">수상대회명</th>
														<th style="width: 22%;">수상명</th>
														<th style="width: 10%;">수상대회종류</th>
														<th style="width: 22%;">수상기관</th>
														<th style="width: 8%;">수상날짜</th>
														<th style="width: 8%;">작성날짜</th>
														<th style="width: 6%;"></th>
								 					</tr>
								 				</thead>
												<tbody id="awardBody">
												</tbody>
												<tfoot>
													<tr>
														<td colspan="8" id="awardFoot" style="text-align: center; height: 5vh; padding: 10px;">
															<button type="button" class="btn btn-outline-primary" id="awardBtn" style="width: 15%; font-size: 13px; border-radius: 0;">새로 추가하기</button>
															<button type="button" class="btn btn-outline-primary" style="width: 15%; font-size: 13px; border-radius: 0;" data-bs-toggle="modal" data-bs-target="#awardModal">기존 수상내역 추가하기</button>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
								</div>
							</div>
							<!-- ==================================================수상내역================================================== -->
							
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</section>


<!-- 학력모달 -->
<div class="modal fade" id="eduModal" tabindex="-1" aria-labelledby="eduModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="eduModalLabel">기존 학력 추가하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style=" border-radius: 0;"></button>
      </div>
      <div class="modal-body">
        <table class="table table-bordered">
        	<thead>
        		<tr>
        			<th></th>
        			<th>학교명</th>
        			<th>전공분류</th>
        			<th>전공</th>
        			<th>상태</th>
        			<th>학점</th>
        			<th>기준학점</th>
        			<th>선택</th>
        		</tr>
        	</thead>
        	<tbody id="eduModalBody">
        	
        	</tbody>
        </table>
      </div>
      <div id="eduModalDiv">
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="" style="width: 30%; border-radius: 0;">닫기</button>
        <button type="button" class="btn btn-primary" id="eduModalBtn" style="width: 30%; border-radius: 0;">추가</button>
      </div>
    </div>
  </div>
</div>

<!-- 경력모달 -->
<div class="modal fade" id="careerModal" tabindex="-1" aria-labelledby="careerModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="careerModalLabel">기존 경력 추가하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style=" border-radius: 0;"></button>
      </div>
      <div class="modal-body">
        <table class="table table-bordered">
        	<thead>
        		<tr>
        			<th></th>
        			<th>업종</th>
        			<th>직장명</th>
        			<th>직무</th>
        			<th>입사일</th>
        			<th>퇴사일</th>
        			<th>경력 작성날짜</th>
        			<th>선택</th>
        		</tr>
        	</thead>
        	<tbody id="careerModalBody">
        	
        	</tbody>
        </table>
      </div>
      <div id="careerModalDiv">
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="" style="width: 30%; border-radius: 0;">닫기</button>
        <button type="button" class="btn btn-primary" id="careerModalBtn" style="width: 30%; border-radius: 0;">추가</button>
      </div>
    </div>
  </div>
</div>

<!-- 자격증모달 -->
<div class="modal fade" id="certModal" tabindex="-1" aria-labelledby="certModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="certModalLabel">기존 자격증 추가하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style=" border-radius: 0;"></button>
      </div>
      <div class="modal-body">
        <table class="table table-bordered">
        	<thead>
        		<tr>
					<th></th>
					<th>자격번호</th>
					<th>자격증명</th>
					<th>발급일</th>
					<th>시행부처</th>
					<th>자격증 작성날짜</th>
					<th>선택</th>
        		</tr>
        	</thead>
        	<tbody id="certModalBody">
        	
        	</tbody>
        </table>
      </div>
      <div id="certModalDiv">
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="" style="width: 30%; border-radius: 0;">닫기</button>
        <button type="button" class="btn btn-primary" id="certModalBtn" style="width: 30%; border-radius: 0;">추가</button>
      </div>
    </div>
  </div>
</div>

<!-- 기능모달 -->
<div class="modal fade" id="facModal" tabindex="-1" aria-labelledby="facModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="facModalLabel">기존 기능 추가하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style=" border-radius: 0;"></button>
      </div>
      <div class="modal-body">
        <table class="table table-bordered">
        	<thead>
        		<tr>
        			<th></th>
        			<th>기능</th>
        			<th>기능분류</th>
        			<th>수준</th>
        			<th>취득일</th>
        			<th>훈련기간</th>
        			<th>기능 작성날짜</th>
        			<th>선택</th>
        		</tr>
        	</thead>
        	<tbody id="facModalBody">
        	
        	</tbody>
        </table>
      </div>
      <div id="facModalDiv">
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="" style="width: 30%; border-radius: 0;">닫기</button>
        <button type="button" class="btn btn-primary" id="facModalBtn" style="width: 30%; border-radius: 0;">추가</button>
      </div>
    </div>
  </div>
</div>

<!-- 주요활동모달 -->
<div class="modal fade" id="actModal" tabindex="-1" aria-labelledby="actModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="actModalLabel">기존 주요활동 추가하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style=" border-radius: 0;"></button>
      </div>
      <div class="modal-body">
        <table class="table table-bordered">
        	<thead>
        		<tr>
        			<th></th>
        			<th>주요활동명</th>
        			<th>주요활동종류</th>
        			<th>주요활동기관</th>
        			<th>주요활동기간</th>
        			<th>주요활동 작성날짜</th>
        			<th>선택</th>
        		</tr>
        	</thead>
        	<tbody id="actModalBody">
        	
        	</tbody>
        </table>
      </div>
      <div id="actModalDiv">
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="" style="width: 30%; border-radius: 0;">닫기</button>
        <button type="button" class="btn btn-primary" id="actModalBtn" style="width: 30%; border-radius: 0;">추가</button>
      </div>
    </div>
  </div>
</div>

<!-- 교육이수모달 -->
<div class="modal fade" id="courseModal" tabindex="-1" aria-labelledby="courseModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="courseModalLabel">기존 교육이수 추가하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style=" border-radius: 0;"></button>
      </div>
      <div class="modal-body">
        <table class="table table-bordered">
        	<thead>
        		<tr>
				<th></th>
				<th>교육명</th>
				<th>교육종류</th>
				<th>교육기관</th>
				<th>교육기간</th>
				<th>교육이수 작성날짜</th>
				<th></th>
        		</tr>
        	</thead>
        	<tbody id="courseModalBody">
        	
        	</tbody>
        </table>
      </div>
      <div id="courseModalDiv">
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="" style="width: 30%; border-radius: 0;">닫기</button>
        <button type="button" class="btn btn-primary" id="courseModalBtn" style="width: 30%; border-radius: 0;">추가</button>
      </div>
    </div>
  </div>
</div>

<!-- 수상내역 모달 -->
<div class="modal fade" id="awardModal" tabindex="-1" aria-labelledby="awardModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="awardModalLabel">기존 수상내역 추가하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style=" border-radius: 0;"></button>
      </div>
      <div class="modal-body">
        <table class="table table-bordered">
        	<thead>
        		<tr>
				<th></th>
				<th>수상대회명</th>
				<th>수상명</th>
				<th>수상대회종류</th>
				<th>수상기관</th>
				<th>수상날짜</th>
				<th>수상내역 작성날짜</th>
				<th></th>
        		</tr>
        	</thead>
        	<tbody id="awardModalBody">
        	
        	</tbody>
        </table>
      </div>
      <div id="awardModalDiv">
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="" style="width: 30%; border-radius: 0;">닫기</button>
        <button type="button" class="btn btn-primary" id="awardModalBtn" style="width: 30%; border-radius: 0;">추가</button>
      </div>
    </div>
  </div>
</div>

<script>
////////////////////////////// 학력 관리 //////////////////////////////
let eduBtn = $("#eduBtn");
let eduBody = $("#eduBody");
let eduFoot = $("#eduFoot");

let makeEduTrTag = function(index, edu) {
	let aTag = $("<a>")
				.attr("href", "${pageContext.request.contextPath}/education/" + edu.eduSn)
				.html(edu.eduName);
	return $("<tr>").css("height", "4vh").append(
				$("<td>").html(index + 1)
				, $("<td>").html(aTag)
				, $("<td>").html(edu.eduDepartment)
				, $("<td>").html(edu.eduMajor)
				, $("<td>").html(edu.eduEntered.substr(0, 7))
				, $("<td>").html(edu.eduGraduated.substr(0, 7))
				, $("<td>").html(edu.eduStatus)
				, $("<td>").html(edu.eduScore)
				, $("<td>").html(edu.eduStandard)
				, $("<td>").html(edu.eduInsertDate.substr(0, 10))
				, $("<td>").append($("<button>").addClass("btn btn-outline-danger").addClass("eduRemoveBtn").css({"width":"60px", "font-size":"15px", "border-radius":"0"}).val(edu.eduSn).html("삭제"))
			);
}

let eduModalBody = $("#eduModalBody");

let makeEduModalTag = function(index, edu) {
	let eduIndex = "edu" + (index + 1);
	let modalATag =$("<a>")
				.attr("href", "${pageContext.request.contextPath}/education/" + edu.eduSn)
				.html(edu.eduName);
	return $("<tr>").append(
				$("<td>").html(index + 1)
				, $("<td>").html(modalATag)
				, $("<td>").html(edu.eduDepartment)
				, $("<td>").html(edu.eduMajor)
				, $("<td>").html(edu.eduStatus)
				, $("<td>").html(edu.eduScore)
				, $("<td>").html(edu.eduStandard)
				, $("<td>").append($("<input>").attr("type", "checkBox").attr("id", eduIndex).attr("name", "itemList.resumeItemSn").val(edu.eduSn))
			)
}

// 공통 모듈로 뺄 수 있을 듯?
let $eduList = function() {
	$.ajax({
		url : "${pageContext.request.contextPath}/resume/itemList?resumeSn=${resume.resumeSn}",
		method : "get",
		dataType : "json",
		success : function(resp) {
			eduBody.empty();
			let dataList = resp.resume.eduList;
			let trTags = [];
			if (dataList) {
				$.each(dataList, function(index, edu) {
					trTags.push(makeEduTrTag(index, edu));
					$("#eduForm").remove();
				});
			} else {
				let tr = $("<tr>").html(
					$("<td>").attr("colspan", "10")
							.html("학력을 아직 등록하지 않았습니다.")
				);	
				trTags.push(tr);
			}
			eduBody.html(trTags);
			
			eduModalBody.empty();
			let modalList = resp.exclude.eduList;
			let trModalTags = [];
			if (modalList) {
				$.each(modalList, function(index, edu) {
					trModalTags.push(makeEduModalTag(index, edu));
					$("#eduModalForm").remove();
				});
			} else {
				let modalTr = $("<tr>").html(
					$("<td>").attr("colspan", "7").html("이력서에 존재하지 않는 학력 항목이 없습니다.")
				);
				trModalTags.push(modalTr);
			}
			eduModalBody.html(trModalTags);
			$(".eduRemoveBtn").on("click", function() {
				eduRemove(this);
			});
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

$eduList();

function eduRemove(button) { // button = this
	console.log(button);
	let removeItem = $(button).val();
	
	$.ajax({
		url : "${pageContext.request.contextPath}/resume/${resumeSn}/itemRemove",
		method : "post",
		data : {
			"resumeItemSn" : removeItem
		},
		dataType : "json",
		success : function(resp) {
			$eduList();
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

eduBtn.on("click", function() {
	eduBody.append(
		$("<tr>").attr("id", "eduTr").append(
			$("<td>").css("width", "50")
			, $("<td>").append($("<input>").attr("name", "eduName").attr("type", "text").css("width", "140"))
			, $("<td>").append($("<input>").attr("name", "eduDepartment").attr("type", "text").css("width", "120"))
			, $("<td>").append($("<input>").attr("name", "eduMajor").attr("type", "text").css("width", "120"))
			, $("<td>").append($("<input>").attr("name", "eduEntered").attr("type", "date").css("width", "100"))
			, $("<td>").append($("<input>").attr("name", "eduGraduated").attr("type", "date").css("width", "100"))
			, $("<td>").append($("<input>").attr("name", "eduStatus").attr("type", "text").css("width", "60"))
			, $("<td>").append($("<input>").attr("name", "eduScore").attr("type", "number").attr("step", "0.01").css("width", "60"))
			, $("<td>").append($("<input>").attr("name", "eduStandard").attr("type", "number").attr("step", "0.01").css("width", "60"))
			, $("<td>").append($("<button>").attr("id", "eduSub").addClass("btn btn-primary").css("border-radius", "0").html("저장"))
			, $("<td>").append($("<button>").attr("id", "eduDelete").addClass("btn btn-danger").css("border-radius", "0").html("취소"))
		)
	)
	
	$(this).parent().hide();
	
	eduFoot.append(
		$("<form>").attr("method", "post").attr("encType", "multipart/form-data").attr("id", "eduForm").append(
			$("<input>").attr("name", "eduName").attr("type", "text")
			, $("<input>").attr("name", "eduDepartment").attr("type", "text")
			, $("<input>").attr("name", "eduMajor").attr("type", "text")
			, $("<input>").attr("name", "eduEntered").attr("type", "date")
			, $("<input>").attr("name", "eduGraduated").attr("type", "date")
			, $("<input>").attr("name", "eduStatus").attr("type", "text")
			, $("<input>").attr("name", "eduScore").attr("type", "number").attr("step", "0.01")
			, $("<input>").attr("name", "eduStandard").attr("type", "number").attr("step", "0.01")
			, $("<input>").attr("name", "memId").attr("type", "text")
		)
	)
	
	let eduForm = $("#eduForm").on("submit", function(event) {
		event.preventDefault();
		
		let method = this.method;
		let queryString = $(this).serialize();
		
		$.ajax({
			method : method,
			data :queryString,
			dataType : "json",
			success : function(resp) {
				$eduList();
				$("#eduBtn").parent().show();
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});
	
	$("#eduSub").on("click", function() {
		$("form > input[name=eduName]").attr("type", "hidden").val($("td > input[name=eduName]").val());
		$("form > input[name=eduDepartment]").attr("type", "hidden").val($("td > input[name=eduDepartment]").val());
		$("form > input[name=eduMajor]").attr("type", "hidden").val($("td > input[name=eduMajor]").val());
		$("form > input[name=eduEntered]").attr("type", "hidden").val($("td > input[name=eduEntered]").val());
		$("form > input[name=eduGraduated]").attr("type", "hidden").val($("td > input[name=eduGraduated]").val());
		$("form > input[name=eduStatus]").attr("type", "hidden").val($("td > input[name=eduStatus]").val());
		$("form > input[name=eduScore]").attr("type", "hidden").val($("td > input[name=eduScore]").val());
		$("form > input[name=eduStandard]").attr("type", "hidden").val($("td > input[name=eduStandard]").val());
		$("form > input[name=memId]").attr("type", "hidden").val("${resume.memId}");
		
		eduForm.submit();
	});
	
	$("#eduDelete").on("click", function() {
		$("#eduTr").remove();
		$("#eduBtn").parent().show();
		$("#eduForm").remove();
	});
	
});

let eduModalBtn = $("#eduModalBtn").on("click", function() {
	let checkBox = eduModalBody.find("input[type=checkBox]:checked");
	let eduModalDiv = $("#eduModalDiv");
	let inputTags = "";
	for (let i = 0; i < checkBox.length; i++) {
		inputTags += '<input type="hidden" name="itemList[' + i + '].resumeSn" value="${resumeSn}" />';
		inputTags += '<input type="hidden" name="itemList[' + i + '].resumeItemSn" value="' + checkBox[i].value + '" />'; 
	}
	
	let makeEduForm = '<form:form modelAttirbute="resume" id="eduModalForm"></form:form>'
	eduModalDiv.html(makeEduForm);
	$("#eduModalForm").html(inputTags);
	
	let eduModalForm = $("#eduModalForm").submit(function(event) {
		event.preventDefault();
		
		let queryString = $("#eduModalForm").serialize();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/resume/${resumeSn}/item",
			method : "post",
			data : queryString,
			dataType : "json",
			success : function(resp) {
				$eduList();
				$("button[data-bs-dismiss=modal]").trigger("click");
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
		return false;
	});
	
	eduModalForm.submit();
});


////////////////////////////// 경력 관리 //////////////////////////////
let careerBtn = $("#careerBtn");
let careerBody = $("#careerBody");
let careerFoot = $("#careerFoot");

let makeCareerTrTag = function(index, career) {
	let aTag = $("<a>")
				.attr("href", "${pageContext.request.contextPath}/career/" + career.careerSn)
				.html(career.careerCompany);
	return $("<tr>").append(
				$("<td>").html(index + 1)
				, $("<td>").html(aTag)
				, $("<td>").html(career.careerCategory)
				, $("<td>").html(career.careerTask)
				, $("<td>").html(career.careerClass)
				, $("<td>").html(career.careerJoin.substr(0, 10))
				, $("<td>").html(career.careerResign.substr(0, 10))
				, $("<td>").html(career.careerSalary)
				, $("<td>").html(career.careerAnnual)
				, $("<td>").html(career.careerInsertDate.substr(0, 10))
				, $("<td>").append($("<button>").addClass("btn btn-outline-danger").addClass("careerRemoveBtn").css({"width":"60px", "font-size":"15px", "border-radius":"0"}).val(career.careerSn).html("삭제"))
			);
}

let careerModalBody = $("#careerModalBody");

let makeCareerModalTag = function(index, career) {
	let careerIndex = "career" + (index + 1);
	let modalATag =$("<a>")
				.attr("href", "${pageContext.request.contextPath}/careercation/" + career.careerSn)
				.html(career.careerCompany);
	return $("<tr>").append(
				$("<td>").html(index + 1)
				, $("<td>").html(career.careerCategory)
				, $("<td>").html(modalATag)
				, $("<td>").html(career.careerTask)
				, $("<td>").html(career.careerJoin.substr(0, 10))
				, $("<td>").html(career.careerResign.substr(0, 10))
				, $("<td>").html(career.careerInsertDate.substr(0, 10))
				, $("<td>").append($("<input>").attr("type", "checkBox").attr("id", careerIndex).attr("name", "itemList.resumeItemSn").val(career.careerSn))
			)
}

let $careerList = function() {
	$.ajax({
		url : "${pageContext.request.contextPath}/resume/itemList?resumeSn=${resume.resumeSn}",
		method : "get",
		dataType : "json",
		success : function(resp) {
			console.log(resp);
			careerBody.empty();
			let dataList = resp.resume.careerList;
			let trTags = [];
			if (dataList) {
				$.each(dataList, function(index, career) {
					trTags.push(makeCareerTrTag(index, career));
					$("#careerForm").remove();
				});
			} else {
				let tr = $("<tr>").html(
					$("<td>").attr("colspan", "11")
							.html("경력을 아직 등록하지 않았습니다.")
				);	
				trTags.push(tr);
			}
			careerBody.html(trTags);
			
			careerModalBody.empty();
			let careerModalList = resp.exclude.careerList;
			let trModalTags = [];
			if (careerModalList) {
				$.each(careerModalList, function(index, career) {
					trModalTags.push(makeCareerModalTag(index, career));
					$("#careerModalForm").remove();
				});
			} else {
				let modalTr = $("<tr>").html(
					$("<td>").attr("colspan", "8").html("이력서에 존재하지 않는 경력 항목이 없습니다.")
				);
				trModalTags.push(modalTr);
			}
			careerModalBody.html(trModalTags);
			$(".careerRemoveBtn").on("click", function() {
				careerRemove(this);
			});
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

$careerList();

function careerRemove(button) {
	console.log(button);
	let removeItem = $(button).val();
	
	$.ajax({
		url : "${pageContext.request.contextPath}/resume/${resumeSn}/itemRemove",
		method : "post",
		data : {
			"resumeItemSn" : removeItem						
		},
		dataType : "json",
		success : function(resp) {
			$careerList();
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

careerBtn.on("click", function() {
	careerBody.append(
		$("<tr>").attr("id", "careerTr").append(
			$("<td>").css("width", "50")
			, $("<td>").append($("<input>").attr("name", "careerCategory").attr("type", "text").css("width", "140"))
			, $("<td>").append($("<input>").attr("name", "careerCompany").attr("type", "text").css("width", "120"))
			, $("<td>").append($("<input>").attr("name", "careerTask").attr("type", "text").css("width", "120"))
			, $("<td>").append($("<input>").attr("name", "careerClass").attr("type", "text").css("width", "100"))
			, $("<td>").append($("<input>").attr("name", "careerJoin").attr("type", "date").css("width", "100"))
			, $("<td>").append($("<input>").attr("name", "careerResign").attr("type", "date").css("width", "60"))
			, $("<td>").append($("<input>").attr("name", "careerSalary").attr("type", "text").css("width", "60"))
			, $("<td>").append($("<input>").attr("name", "careerAnnual").attr("type", "number").css("width", "60"))
			, $("<td>").append($("<button>").attr("id", "careerSub").addClass("btn btn-primary").css("border-radius", "0").html("저장"))
			, $("<td>").append($("<button>").attr("id", "careerDelete").addClass("btn btn-danger").css("border-radius", "0").html("취소"))
		)
	)
	
	$(this).parent().hide();
	
	careerFoot.append(
		$("<form>").attr("method", "post").attr("encType", "multipart/form-data").attr("id", "careerForm").append(
			$("<input>").attr("name", "careerCategory").attr("type", "text")
			, $("<input>").attr("name", "careerCompany").attr("type", "text")
			, $("<input>").attr("name", "careerTask").attr("type", "text")
			, $("<input>").attr("name", "careerClass").attr("type", "text")
			, $("<input>").attr("name", "careerJoin").attr("type", "date")
			, $("<input>").attr("name", "careerResign").attr("type", "date")
			, $("<input>").attr("name", "careerSalary").attr("type", "text")
			, $("<input>").attr("name", "careerAnnual").attr("type", "number")
			, $("<input>").attr("name", "memId").attr("type", "text")
		)
	)
	
	let careerForm = $("#careerForm").on("submit", function(event) {
		event.preventDefault();
		
		let method = this.method;
		let queryString = $(this).serialize();
		
		$.ajax({
			method : method,
			data :queryString,
			dataType : "json",
			success : function(resp) {
				$careerList();
				$("#careerBtn").parent().show();
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});
	
	$("#careerSub").on("click", function() {
		$("form > input[name=careerCategory]").attr("type", "hidden").val($("td > input[name=careerCategory]").val());
		$("form > input[name=careerCompany]").attr("type", "hidden").val($("td > input[name=careerCompany]").val());
		$("form > input[name=careerTask]").attr("type", "hidden").val($("td > input[name=careerTask]").val());
		$("form > input[name=careerClass]").attr("type", "hidden").val($("td > input[name=careerClass]").val());
		$("form > input[name=careerJoin]").attr("type", "hidden").val($("td > input[name=careerJoin]").val());
		$("form > input[name=careerResign]").attr("type", "hidden").val($("td > input[name=careerResign]").val());
		$("form > input[name=careerSalary]").attr("type", "hidden").val($("td > input[name=careerSalary]").val());
		$("form > input[name=careerAnnual]").attr("type", "hidden").val($("td > input[name=careerAnnual]").val());
		$("form > input[name=memId]").attr("type", "hidden").val("${resume.memId}");
		
		careerForm.submit();
	});
	
	$("#careerDelete").on("click", function() {
		$("#careerTr").remove();
		$("#careerBtn").parent().show();
		$("#careerForm").remove();
	});
	
});

let careerModalBtn = $("#careerModalBtn").on("click", function() {
	let checkBox = careerModalBody.find("input[type=checkBox]:checked");
	let careerModalDiv = $("#careerModalDiv");
	let inputTags = "";
	for (let i = 0; i < checkBox.length; i++) {
		inputTags += '<input type="hidden" name="itemList[' + i + '].resumeSn" value="${resumeSn}" />';
		inputTags += '<input type="hidden" name="itemList[' + i + '].resumeItemSn" value="' + checkBox[i].value + '" />'; 
	}
	
	let makeCareerForm = '<form:form modelAttirbute="resume" id="careerModalForm"></form:form>'
	careerModalDiv.html(makeCareerForm);
	$("#careerModalForm").html(inputTags);
	
	let careerModalForm = $("#careerModalForm").submit(function(event) {
		event.preventDefault();
		
		let queryString = $("#careerModalForm").serialize();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/resume/${resumeSn}/item",
			method : "post",
			data : queryString,
			dataType : "json",
			success : function(resp) {
				console.log(resp);
				$careerList();
				$("button[data-bs-dismiss=modal]").trigger("click");
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
		return false;
	});
	
	careerModalForm.submit();
});

//////////////////////////////자격증 관리 //////////////////////////////
let certBtn = $("#certBtn");
let certBody = $("#certBody");
let certFoot = $("#certFoot");

let makeCertTrTag = function(index, cert) {
	let aTag = $("<a>")
				.attr("href", "${pageContext.request.contextPath}/certification/" + cert.certSn)
				.html(cert.certName);
	return $("<tr>").append(
				$("<td>").html(index + 1)
				, $("<td>").html(aTag)
				, $("<td>").html(cert.certSn)
				, $("<td>").html(cert.certDate.substr(0, 10))
				, $("<td>").html(cert.certInstitution)
				, $("<td>").html(cert.certInsertDate.substr(0, 10))
				, $("<td>").append($("<button>").addClass("btn btn-outline-danger").addClass("certRemoveBtn").css({"width":"60px", "font-size":"15px", "border-radius":"0"}).val(cert.certSn).html("삭제"))
			);
}

let certModalBody = $("#certModalBody");

let makeCertModalTag = function(index, cert) {
	let certIndex = "cert" + (index + 1);
	let modalATag =$("<a>")
				.attr("href", "${pageContext.request.contextPath}/certification/" + cert.certSn)
				.html(cert.certName);
	return $("<tr>").append(
				$("<td>").html(index + 1)
				, $("<td>").html(cert.certSn)
				, $("<td>").html(modalATag)
				, $("<td>").html(cert.certDate.substr(0, 10))
				, $("<td>").html(cert.certInstitution)
				, $("<td>").html(cert.certInsertDate.substr(0, 10))
				, $("<td>").append($("<input>").attr("type", "checkBox").attr("id", certIndex).attr("name", "itemList.resumeItemSn").val(cert.certSn))
			)
}

let $certList = function() {
	$.ajax({
		url : "${pageContext.request.contextPath}/resume/itemList?resumeSn=${resume.resumeSn}",
		method : "get",
		dataType : "json",
		success : function(resp) {
			certBody.empty();
			let dataList = resp.resume.certList;
			let trTags = [];
			if (dataList) {
				$.each(dataList, function(index, cert) {
					trTags.push(makeCertTrTag(index, cert));
					$("#certForm").remove();
				});
			} else {
				let tr = $("<tr>").html(
					$("<td>").attr("colspan", "7")
							.html("경력을 아직 등록하지 않았습니다.")
				);	
				trTags.push(tr);
			}
			certBody.html(trTags);
			
			certModalBody.empty();
			let certModalList = resp.exclude.certList;
			let trModalTags = [];
			if (certModalList) {
				$.each(certModalList, function(index, cert) {
					trModalTags.push(makeCertModalTag(index, cert));
					$("#certModalForm").remove();
				});
			} else {
				let modalTr = $("<tr>").html(
					$("<td>").attr("colspan", "7").html("이력서에 존재하지 않는 경력 항목이 없습니다.")
				);
				trModalTags.push(modalTr);
			}
			certModalBody.html(trModalTags);
			$(".certRemoveBtn").on("click", function() {
				certRemove(this);
			});
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

$certList();

function certRemove(button) {
	console.log(button);
	let removeItem = $(button).val();
	
	$.ajax({
		url : "${pageContext.request.contextPath}/resume/${resumeSn}/itemRemove",
		method : "post",
		data : {
			"resumeItemSn" : removeItem						
		},
		dataType : "json",
		success : function(resp) {
			$certList();
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

certBtn.on("click", function() {
	certBody.append(
		$("<tr>").attr("id", "certTr").append(
			$("<td>").css("width", "50")
			, $("<td>").append($("<input>").attr("name", "certNo").attr("type", "text").css("width", "140"))
			, $("<td>").append($("<input>").attr("name", "certName").attr("type", "text").css("width", "120"))
			, $("<td>").append($("<input>").attr("name", "certDate").attr("type", "date").css("width", "120"))
			, $("<td>").append($("<input>").attr("name", "certInstitution").attr("type", "text").css("width", "100"))
			, $("<td>").append($("<button>").attr("id", "certSub").addClass("btn btn-primary").css("border-radius", "0").html("저장"))
			, $("<td>").append($("<button>").attr("id", "certDelete").addClass("btn btn-danger").css("border-radius", "0").html("취소"))
		)
	)
	
	$(this).parent().hide();
	
	certFoot.append(
		$("<form>").attr("method", "post").attr("encType", "multipart/form-data").attr("id", "certForm").append(
			$("<input>").attr("type", "hidden").attr("name", "certNo").attr("type", "text")
			, $("<input>").attr("type", "hidden").attr("name", "certName").attr("type", "text")
			, $("<input>").attr("type", "hidden").attr("name", "certDate").attr("type", "date")
			, $("<input>").attr("type", "hidden").attr("name", "certInstitution").attr("type", "text")
		)
	)
	
	let certForm = $("#certForm").on("submit", function(event) {
		event.preventDefault();
		
		let method = this.method;
		let queryString = $(this).serialize();
		
		$.ajax({
			method : method,
			data :queryString,
			dataType : "json",
			success : function(resp) {
				$certList();
				$("#certBtn").parent().show();
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});
	
	$("#certSub").on("click", function() {
		$("form > input[name=certNo]").attr("type", "hidden").val($("td > input[name=certNo]").val());
		$("form > input[name=certName]").attr("type", "hidden").val($("td > input[name=certName]").val());
		$("form > input[name=certDate]").attr("type", "hidden").val($("td > input[name=certDate]").val());
		$("form > input[name=certInstitution]").attr("type", "hidden").val($("td > input[name=certInstitution]").val());
		$("form > input[name=memId]").attr("type", "hidden").val("${resume.memId}");
		
		certForm.submit();
	});
	
	$("#certDelete").on("click", function() {
		$("#certTr").remove();
		$("#certBtn").parent().show();
		$("#certForm").remove();
	});
	
});

let certModalBtn = $("#certModalBtn").on("click", function() {
	let checkBox = certModalBody.find("input[type=checkBox]:checked");
	let certModalDiv = $("#certModalDiv");
	let inputTags = "";
	for (let i = 0; i < checkBox.length; i++) {
		inputTags += '<input type="hidden" name="itemList[' + i + '].resumeSn" value="${resumeSn}" />';
		inputTags += '<input type="hidden" name="itemList[' + i + '].resumeItemSn" value="' + checkBox[i].value + '" />'; 
	}
	
	let makecertForm = '<form:form modelAttirbute="resume" id="certModalForm"></form:form>'
	certModalDiv.html(makecertForm);
	$("#certModalForm").html(inputTags);
	
	let certModalForm = $("#certModalForm").submit(function(event) {
		event.preventDefault();
		
		let queryString = $("#certModalForm").serialize();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/resume/${resumeSn}/item",
			method : "post",
			data : queryString,
			dataType : "json",
			success : function(resp) {
				console.log(resp);
				$certList();
				$("button[data-bs-dismiss=modal]").trigger("click");
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
		return false;
	});
	
	certModalForm.submit();
});

//////////////////////////////기능 관리 //////////////////////////////
let facBtn = $("#facBtn");
let facBody = $("#facBody");
let facFoot = $("#facFoot");

let makefacTrTag = function(index, fac) {
	let aTag = $("<a>")
				.attr("href", "${pageContext.request.contextPath}/facility/" + fac.facilitySn)
				.html(fac.facilityName);
	return $("<tr>").append(
				$("<td>").html(index + 1)
				, $("<td>").html(aTag)
				, $("<td>").html(fac.facilityCategory)
				, $("<td>").html(fac.facilityLevel)
				, $("<td>").html(fac.facilityGetdate)
				, $("<td>").html(fac.facilityPeriod)
				, $("<td>").html(fac.facilityInsertDate.substr(0, 10))
				, $("<td>").append($("<button>").addClass("btn btn-outline-danger").addClass("facRemoveBtn").css({"width":"60px", "font-size":"15px", "border-radius":"0"}).val(fac.facilitySn).html("삭제"))
			);
}

let facModalBody = $("#facModalBody");

let makefacModalTag = function(index, fac) {
	let facIndex = "fac" + (index + 1);
	let modalATag =$("<a>")
				.attr("href", "${pageContext.request.contextPath}/facility/" + fac.facilitySn)
				.html(fac.facilityName);
	return $("<tr>").append(
				$("<td>").html(index + 1)
				, $("<td>").html(modalATag)
				, $("<td>").html(fac.facilityCategory)
				, $("<td>").html(fac.facilityLevel)
				, $("<td>").html(fac.facilityGetdate)
				, $("<td>").html(fac.facilityPeriod)
				, $("<td>").html(fac.facilityInsertDate.substr(0, 10))
				, $("<td>").append($("<input>").attr("type", "checkBox").attr("id", facIndex).attr("name", "itemList.resumeItemSn").val(fac.facilitySn))
			)
}

// 공통 모듈로 뺄 수 있을 듯?
let $facList = function() {
	$.ajax({
		url : "${pageContext.request.contextPath}/resume/itemList?resumeSn=${resume.resumeSn}",
		method : "get",
		dataType : "json",
		success : function(resp) {
			console.log(resp);
			facBody.empty();
			let dataList = resp.resume.facilityList;
			let trTags = [];
			if (dataList) {
				$.each(dataList, function(index, fac) {
					trTags.push(makefacTrTag(index, fac));
					$("#facForm").remove();
				});
			} else {
				let tr = $("<tr>").html(
					$("<td>").attr("colspan", "10")
							.html("기능을 아직 등록하지 않았습니다.")
				);	
				trTags.push(tr);
			}
			facBody.html(trTags);
			
			facModalBody.empty();
			let modalList = resp.exclude.facilityList;
			let trModalTags = [];
			if (modalList) {
				$.each(modalList, function(index, fac) {
					trModalTags.push(makefacModalTag(index, fac));
					$("#facModalForm").remove();
				});
			} else {
				let modalTr = $("<tr>").html(
					$("<td>").attr("colspan", "8").html("이력서에 존재하지 않는 기능 항목이 없습니다.")
				);
				trModalTags.push(modalTr);
			}
			facModalBody.html(trModalTags);
			$(".facRemoveBtn").on("click", function() {
				facRemove(this);
			});
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

$facList();

function facRemove(button) { // button = this
	console.log(button);
	let removeItem = $(button).val();
	
	$.ajax({
		url : "${pageContext.request.contextPath}/resume/${resumeSn}/itemRemove",
		method : "post",
		data : {
			"resumeItemSn" : removeItem
		},
		dataType : "json",
		success : function(resp) {
			$facList();
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

facBtn.on("click", function() {
	facBody.append(
		$("<tr>").attr("id", "facTr").append(
			$("<td>").css("width", "50")
			, $("<td>").append($("<input>").attr("name", "facilityName").attr("type", "text").css("width", "140"))
			, $("<td>").append($("<input>").attr("name", "facilityCategory").attr("type", "text").css("width", "120"))
			, $("<td>").append($("<input>").attr("name", "facilityLevel").attr("type", "text").css("width", "120"))
			, $("<td>").append($("<input>").attr("name", "facilityGetdate").attr("type", "date").css("width", "100"))
			, $("<td>").append($("<input>").attr("name", "facilityPeriod").attr("type", "text").css("width", "100"))
			, $("<td>").append($("<button>").attr("id", "facSub").addClass("btn btn-primary").css("border-radius", "0").html("저장"))
			, $("<td>").append($("<button>").attr("id", "facDelete").addClass("btn btn-danger").css("border-radius", "0").html("취소"))
		)
	)
	
	$(this).parent().hide();
	
	facFoot.append(
		$("<form>").attr("method", "post").attr("encType", "multipart/form-data").attr("id", "facForm").append(
			$("<input>").attr("name", "facilityName").attr("type", "text")
			, $("<input>").attr("name", "facilityCategory").attr("type", "text")
			, $("<input>").attr("name", "facilityLevel").attr("type", "text")
			, $("<input>").attr("name", "facilityGetdate").attr("type", "date")
			, $("<input>").attr("name", "facilityPeriod").attr("type", "text")
			, $("<input>").attr("name", "memId").attr("type", "text")
		)
	)
	
	let facForm = $("#facForm").on("submit", function(event) {
		event.preventDefault();
		
		let method = this.method;
		let queryString = $(this).serialize();
		
		$.ajax({
			method : method,
			data :queryString,
			dataType : "json",
			success : function(resp) {
				$facList();
				$("#facBtn").parent().show();
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});
	
	$("#facSub").on("click", function() {
		$("form > input[name=facilityName]").attr("type", "hidden").val($("td > input[name=facilityName]").val());
		$("form > input[name=facilityCategory]").attr("type", "hidden").val($("td > input[name=facilityCategory]").val());
		$("form > input[name=facilityLevel]").attr("type", "hidden").val($("td > input[name=facilityLevel]").val());
		$("form > input[name=facilityGetdate]").attr("type", "hidden").val($("td > input[name=facilityGetdate]").val());
		$("form > input[name=facilityPeriod]").attr("type", "hidden").val($("td > input[name=facilityPeriod]").val());
		$("form > input[name=memId]").attr("type", "hidden").val("${resume.memId}");
		
		facForm.submit();
	});
	
	$("#facDelete").on("click", function() {
		$("#facTr").remove();
		$("#facBtn").parent().show();
		$("#facForm").remove();
	});
	
});

let facModalBtn = $("#facModalBtn").on("click", function() {
	let checkBox = facModalBody.find("input[type=checkBox]:checked");
	let facModalDiv = $("#facModalDiv");
	let inputTags = "";
	for (let i = 0; i < checkBox.length; i++) {
		inputTags += '<input type="hidden" name="itemList[' + i + '].resumeSn" value="${resumeSn}" />';
		inputTags += '<input type="hidden" name="itemList[' + i + '].resumeItemSn" value="' + checkBox[i].value + '" />'; 
	}
	
	let makefacForm = '<form:form modelAttirbute="resume" id="facModalForm"></form:form>'
	facModalDiv.html(makefacForm);
	$("#facModalForm").html(inputTags);
	
	let facModalForm = $("#facModalForm").submit(function(event) {
		event.preventDefault();
		
		let queryString = $("#facModalForm").serialize();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/resume/${resumeSn}/item",
			method : "post",
			data : queryString,
			dataType : "json",
			success : function(resp) {
				$facList();
				$("button[data-bs-dismiss=modal]").trigger("click");
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
		return false;
	});
	
	facModalForm.submit();
});

//////////////////////////////주요활동 관리 //////////////////////////////
let actBtn = $("#actBtn");
let actBody = $("#actBody");
let actFoot = $("#actFoot");

let makeactTrTag = function(index, act) {
	let aTag = $("<a>")
				.attr("href", "${pageContext.request.contextPath}/act/" + act.actSn)
				.html(act.actName);
	return $("<tr>").append(
				$("<td>").html(index + 1)
				, $("<td>").html(aTag)
				, $("<td>").html(act.actCategory)
				, $("<td>").html(act.actInstitution)
				, $("<td>").html(act.actPeriod)
				, $("<td>").html(act.actInsertDate.substr(0, 10))
				, $("<td>").append($("<button>").addClass("btn btn-outline-danger").addClass("actRemoveBtn").css({"width":"60px", "font-size":"15px", "border-radius":"0"}).val(act.actSn).html("삭제"))
			);
}

let actModalBody = $("#actModalBody");

let makeactModalTag = function(index, act) {
	let actIndex = "act" + (index + 1);
	let modalATag =$("<a>")
				.attr("href", "${pageContext.request.contextPath}/act/" + act.actSn)
				.html(act.actName);
	return $("<tr>").append(
				$("<td>").html(index + 1)
				, $("<td>").html(modalATag)
				, $("<td>").html(act.actCategory)
				, $("<td>").html(act.actInstitution)
				, $("<td>").html(act.actPeriod.substr(0, 10))
				, $("<td>").html(act.actInsertDate)
				, $("<td>").append($("<input>").attr("type", "checkBox").attr("id", actIndex).attr("name", "itemList.resumeItemSn").val(act.actSn))
			)
}

let $actList = function() {
	$.ajax({
		url : "${pageContext.request.contextPath}/resume/itemList?resumeSn=${resume.resumeSn}",
		method : "get",
		dataType : "json",
		success : function(resp) {
			console.log(resp);
			actBody.empty();
			let dataList = resp.resume.activityList;
			let trTags = [];
			if (dataList) {
				$.each(dataList, function(index, act) {
					trTags.push(makeactTrTag(index, act));
					$("#actForm").remove();
				});
			} else {
				let tr = $("<tr>").html(
					$("<td>").attr("colspan", "10")
							.html("주요활동을 아직 등록하지 않았습니다.")
				);	
				trTags.push(tr);
			}
			actBody.html(trTags);
			
			actModalBody.empty();
			let modalList = resp.exclude.activityList;
			let trModalTags = [];
			if (modalList) {
				$.each(modalList, function(index, act) {
					trModalTags.push(makeactModalTag(index, act));
					$("#actModalForm").remove();
				});
			} else {
				let modalTr = $("<tr>").html(
					$("<td>").attr("colspan", "7").html("이력서에 존재하지 않는 주요활동 항목이 없습니다.")
				);
				trModalTags.push(modalTr);
			}
			actModalBody.html(trModalTags);
			$(".actRemoveBtn").on("click", function() {
				actRemove(this);
			});
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

$actList();

function actRemove(button) { // button = this
	console.log(button);
	let removeItem = $(button).val();
	
	$.ajax({
		url : "${pageContext.request.contextPath}/resume/${resumeSn}/itemRemove",
		method : "post",
		data : {
			"resumeItemSn" : removeItem
		},
		dataType : "json",
		success : function(resp) {
			$actList();
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

actBtn.on("click", function() {
	actBody.append(
		$("<tr>").attr("id", "actTr").append(
			$("<td>").css("width", "50")
			, $("<td>").append($("<input>").attr("name", "actName").attr("type", "text").css("width", "140"))
			, $("<td>").append($("<input>").attr("name", "actCategory").attr("type", "text").css("width", "120"))
			, $("<td>").append($("<input>").attr("name", "actInstitution").attr("type", "text").css("width", "120"))
			, $("<td>").append($("<input>").attr("name", "actPeriod").attr("type", "text").css("width", "100"))
			, $("<td>").append($("<button>").attr("id", "actSub").addClass("btn btn-primary").css("border-radius", "0").html("저장"))
			, $("<td>").append($("<button>").attr("id", "actDelete").addClass("btn btn-danger").css("border-radius", "0").html("취소"))
		)
	)
	
	$(this).parent().hide();
	
	actFoot.append(
		$("<form>").attr("method", "post").attr("encType", "multipart/form-data").attr("id", "actForm").append(
			$("<input>").attr("name", "actName").attr("type", "text")
			, $("<input>").attr("name", "actCategory").attr("type", "text")
			, $("<input>").attr("name", "actInstitution").attr("type", "text")
			, $("<input>").attr("name", "actPeriod").attr("type", "text")
			, $("<input>").attr("name", "memId").attr("type", "text")
		)
	)
	
	let actForm = $("#actForm").on("submit", function(event) {
		event.preventDefault();
		
		let method = this.method;
		let queryString = $(this).serialize();
		
		$.ajax({
			method : method,
			data :queryString,
			dataType : "json",
			success : function(resp) {
				$actList();
				$("#actBtn").parent().show();
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});
	
	$("#actSub").on("click", function() {
		$("form > input[name=actName]").attr("type", "hidden").val($("td > input[name=actName]").val());
		$("form > input[name=actCategory]").attr("type", "hidden").val($("td > input[name=actCategory]").val());
		$("form > input[name=actInstitution]").attr("type", "hidden").val($("td > input[name=actInstitution]").val());
		$("form > input[name=actPeriod]").attr("type", "hidden").val($("td > input[name=actPeriod]").val());
		$("form > input[name=memId]").attr("type", "hidden").val("${resume.memId}");
		
		actForm.submit();
	});
	
	$("#actDelete").on("click", function() {
		$("#actTr").remove();
		$("#actBtn").parent().show();
		$("#actForm").remove();
	});
	
});

let actModalBtn = $("#actModalBtn").on("click", function() {
	let checkBox = actModalBody.find("input[type=checkBox]:checked");
	let actModalDiv = $("#actModalDiv");
	let inputTags = "";
	for (let i = 0; i < checkBox.length; i++) {
		inputTags += '<input type="hidden" name="itemList[' + i + '].resumeSn" value="${resumeSn}" />';
		inputTags += '<input type="hidden" name="itemList[' + i + '].resumeItemSn" value="' + checkBox[i].value + '" />'; 
	}
	
	let makeactForm = '<form:form modelAttirbute="resume" id="actModalForm"></form:form>'
	actModalDiv.html(makeactForm);
	$("#actModalForm").html(inputTags);
	
	let actModalForm = $("#actModalForm").submit(function(event) {
		event.preventDefault();
		
		let queryString = $("#actModalForm").serialize();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/resume/${resumeSn}/item",
			method : "post",
			data : queryString,
			dataType : "json",
			success : function(resp) {
				$actList();
				$("button[data-bs-dismiss=modal]").trigger("click");
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
		return false;
	});
	
	actModalForm.submit();
});

//////////////////////////////교육이수 관리 //////////////////////////////
let courseBtn = $("#courseBtn");
let courseBody = $("#courseBody");
let courseFoot = $("#courseFoot");

let makeCourseTrTag = function(index, course) {
	let aTag = $("<a>")
				.attr("href", "${pageContext.request.contextPath}/course/" + course.courseSn)
				.html(course.courseName);
	return $("<tr>").append(
				$("<td>").html(index + 1)
				, $("<td>").html(aTag)
				, $("<td>").html(course.courseCategory)
				, $("<td>").html(course.courseInstitution)
				, $("<td>").html(course.coursePeriod)
				, $("<td>").html(course.courseInsertDate.substr(0, 10))
				, $("<td>").append($("<button>").addClass("btn btn-outline-danger").addClass("courseRemoveBtn").css({"width":"60px", "font-size":"15px", "border-radius":"0"}).val(course.courseSn).html("삭제"))
			);
}

let courseModalBody = $("#courseModalBody");

let makeCourseModalTag = function(index, course) {
	let courseIndex = "course" + (index + 1);
	let modalATag =$("<a>")
				.attr("href", "${pageContext.request.contextPath}/coursecation/" + course.courseSn)
				.html(course.courseName);
	return $("<tr>").append(
				$("<td>").html(index + 1)
				, $("<td>").html(modalATag)
				, $("<td>").html(course.courseCategory)
				, $("<td>").html(course.courseInstitution)
				, $("<td>").html(course.coursePeriod)
				, $("<td>").html(course.courseInsertDate.substr(0, 10))
				, $("<td>").append($("<input>").attr("type", "checkBox").attr("id", courseIndex).attr("name", "itemList.resumeItemSn").val(course.courseSn))
			);
}

// 공통 모듈로 뺄 수 있을 듯?
let $courseList = function() {
	$.ajax({
		url : "${pageContext.request.contextPath}/resume/itemList?resumeSn=${resume.resumeSn}",
		method : "get",
		dataType : "json",
		success : function(resp) {
			courseBody.empty();
			let dataList = resp.resume.courseList;
			let trTags = [];
			if (dataList) {
				$.each(dataList, function(index, course) {
					trTags.push(makeCourseTrTag(index, course));
					$("#courseForm").remove();
				});
			} else {
				let tr = $("<tr>").html(
					$("<td>").attr("colspan", "7")
							.html("교육이수 아직 등록하지 않았습니다.")
				);	
				trTags.push(tr);
			}
			courseBody.html(trTags);
			
			courseModalBody.empty();
			let modalList = resp.exclude.courseList;
			let trModalTags = [];
			if (modalList) {
				$.each(modalList, function(index, course) {
					trModalTags.push(makeCourseModalTag(index, course));
					$("#courseModalForm").remove();
				});
			} else {
				let modalTr = $("<tr>").html(
					$("<td>").attr("colspan", "7").html("이력서에 존재하지 않는 교육이수 항목이 없습니다.")
				);
				trModalTags.push(modalTr);
			}
			courseModalBody.html(trModalTags);
			$(".courseRemoveBtn").on("click", function() {
				courseRemove(this);
			});
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

$courseList();

function courseRemove(button) { // button = this
	console.log(button);
	let removeItem = $(button).val();
	
	$.ajax({
		url : "${pageContext.request.contextPath}/resume/${resumeSn}/itemRemove",
		method : "post",
		data : {
			"resumeItemSn" : removeItem
		},
		dataType : "json",
		success : function(resp) {
			$courseList();
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

courseBtn.on("click", function() {
	courseBody.append(
		$("<tr>").attr("id", "courseTr").append(
			$("<td>").css("width", "50")
			, $("<td>").append($("<input>").attr("name", "courseName").attr("type", "text").css("width", "140"))
			, $("<td>").append($("<input>").attr("name", "courseCategory").attr("type", "text").css("width", "120"))
			, $("<td>").append($("<input>").attr("name", "courseInstitution").attr("type", "text").css("width", "120"))
			, $("<td>").append($("<input>").attr("name", "coursePeriod").attr("type", "text").css("width", "100"))
			, $("<td>").append($("<button>").attr("id", "courseSub").addClass("btn btn-primary").css("border-radius", "0").html("저장"))
			, $("<td>").append($("<button>").attr("id", "courseDelete").addClass("btn btn-danger").css("border-radius", "0").html("취소"))
		)
	)
	
	$(this).parent().hide();
	
	courseFoot.append(
		$("<form>").attr("method", "post").attr("encType", "multipart/form-data").attr("id", "courseForm").append(
			$("<input>").attr("name", "courseName").attr("type", "text")
			, $("<input>").attr("name", "courseCategory").attr("type", "text")
			, $("<input>").attr("name", "courseInstitution").attr("type", "text")
			, $("<input>").attr("name", "coursePeriod").attr("type", "text")
			, $("<input>").attr("name", "memId").attr("type", "text")
		)
	)
	
	let courseForm = $("#courseForm").on("submit", function(event) {
		event.preventDefault();
		
		let method = this.method;
		let queryString = $(this).serialize();
		
		$.ajax({
			method : method,
			data :queryString,
			dataType : "json",
			success : function(resp) {
				$courseList();
				$("#courseBtn").parent().show();
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});
	
	$("#courseSub").on("click", function() {
		$("form > input[name=courseName]").attr("type", "hidden").val($("td > input[name=courseName]").val());
		$("form > input[name=courseCategory]").attr("type", "hidden").val($("td > input[name=courseCategory]").val());
		$("form > input[name=courseInstitution]").attr("type", "hidden").val($("td > input[name=courseInstitution]").val());
		$("form > input[name=coursePeriod]").attr("type", "hidden").val($("td > input[name=coursePeriod]").val());
		$("form > input[name=memId]").attr("type", "hidden").val("${resume.memId}");
		
		courseForm.submit();
	});
	
	$("#courseDelete").on("click", function() {
		$("#courseTr").remove();
		$("#courseBtn").parent().show();
		$("#courseForm").remove();
	});
	
});

let courseModalBtn = $("#courseModalBtn").on("click", function() {
	let checkBox = courseModalBody.find("input[type=checkBox]:checked");
	let courseModalDiv = $("#courseModalDiv");
	let inputTags = "";
	for (let i = 0; i < checkBox.length; i++) {
		inputTags += '<input type="hidden" name="itemList[' + i + '].resumeSn" value="${resumeSn}" />';
		inputTags += '<input type="hidden" name="itemList[' + i + '].resumeItemSn" value="' + checkBox[i].value + '" />'; 
	}
	
	let makecourseForm = '<form:form modelAttirbute="resume" id="courseModalForm"></form:form>'
	courseModalDiv.html(makecourseForm);
	$("#courseModalForm").html(inputTags);
	
	let courseModalForm = $("#courseModalForm").submit(function(event) {
		event.preventDefault();
		
		let queryString = $("#courseModalForm").serialize();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/resume/${resumeSn}/item",
			method : "post",
			data : queryString,
			dataType : "json",
			success : function(resp) {
				$courseList();
				$("button[data-bs-dismiss=modal]").trigger("click");
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
		return false;
	});
	
	courseModalForm.submit();
});

//////////////////////////////수상내역 관리 //////////////////////////////
let awardBtn = $("#awardBtn");
let awardBody = $("#awardBody");
let awardFoot = $("#awardFoot");

let makeAwardTrTag = function(index, award) {
	let aTag = $("<a>")
				.attr("href", "${pageContext.request.contextPath}/award/" + award.awardSn)
				.html(award.awardCompetition);
	return $("<tr>").append(
				$("<td>").html(index + 1)
				, $("<td>").html(aTag)
				, $("<td>").html(award.awardName)
				, $("<td>").html(award.awardCategory)
				, $("<td>").html(award.awardInstitution)
				, $("<td>").html(award.awardDate)
				, $("<td>").html(award.awardInsertDate.substr(0, 10))
				, $("<td>").append($("<button>").addClass("btn btn-outline-danger").addClass("awardRemoveBtn").css({"width":"60px", "font-size":"15px", "border-radius":"0"}).val(award.awardSn).html("삭제"))
			);
}

let awardModalBody = $("#awardModalBody");

let makeAwardModalTag = function(index, award) {
	let awardIndex = "award" + (index + 1);
	let modalATag =$("<a>")
				.attr("href", "${pageContext.request.contextPath}/awardcation/" + award.awardSn)
				.html(award.awardCompetition);
	return $("<tr>").append(
				$("<td>").html(index + 1)
				, $("<td>").html(modalATag)
				, $("<td>").html(award.awardName)
				, $("<td>").html(award.awardCategory)
				, $("<td>").html(award.awardInstitution)
				, $("<td>").html(award.awardDate)
				, $("<td>").html(award.awardInsertDate.substr(0, 10))
				, $("<td>").append($("<input>").attr("type", "checkBox").attr("id", awardIndex).attr("name", "itemList.resumeItemSn").val(award.awardSn))
			)
}

// 공통 모듈로 뺄 수 있을 듯?
let $awardList = function() {
	$.ajax({
		url : "${pageContext.request.contextPath}/resume/itemList?resumeSn=${resume.resumeSn}",
		method : "get",
		dataType : "json",
		success : function(resp) {
			awardBody.empty();
			let dataList = resp.resume.awardList;
			let trTags = [];
			if (dataList) {
				$.each(dataList, function(index, award) {
					trTags.push(makeAwardTrTag(index, award));
					$("#awardForm").remove();
				});
			} else {
				let tr = $("<tr>").html(
					$("<td>").attr("colspan", "7")
							.html("수상내역 아직 등록하지 않았습니다.")
				);	
				trTags.push(tr);
			}
			awardBody.html(trTags);
			
			awardModalBody.empty();
			let modalList = resp.exclude.awardList;
			let trModalTags = [];
			if (modalList) {
				$.each(modalList, function(index, award) {
					trModalTags.push(makeAwardModalTag(index, award));
					$("#awardModalForm").remove();
				});
			} else {
				let modalTr = $("<tr>").html(
					$("<td>").attr("colspan", "7").html("이력서에 존재하지 않는 수상내역 항목이 없습니다.")
				);
				trModalTags.push(modalTr);
			}
			awardModalBody.html(trModalTags);
			$(".awardRemoveBtn").on("click", function() {
				awardRemove(this);
			});
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

$awardList();

function awardRemove(button) { // button = this
	console.log(button);
	let removeItem = $(button).val();
	
	$.ajax({
		url : "${pageContext.request.contextPath}/resume/${resumeSn}/itemRemove",
		method : "post",
		data : {
			"resumeItemSn" : removeItem
		},
		dataType : "json",
		success : function(resp) {
			$awardList();
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

awardBtn.on("click", function() {
	awardBody.append(
		$("<tr>").attr("id", "awardTr").append(
			$("<td>").css("width", "50")
			, $("<td>").append($("<input>").attr("name", "awardCompetition").attr("type", "text").css("width", "140"))
			, $("<td>").append($("<input>").attr("name", "awardName").attr("type", "text").css("width", "120"))
			, $("<td>").append($("<input>").attr("name", "awardCategory").attr("type", "text").css("width", "120"))
			, $("<td>").append($("<input>").attr("name", "awardInstitution").attr("type", "text").css("width", "100"))
			, $("<td>").append($("<input>").attr("name", "awardDate").attr("type", "date").css("width", "100"))
			, $("<td>").append($("<button>").attr("id", "awardSub").addClass("btn btn-primary").css("border-radius", "0").html("저장"))
			, $("<td>").append($("<button>").attr("id", "awardDelete").addClass("btn btn-danger").css("border-radius", "0").html("취소"))
		)
	)
	
	$(this).parent().hide();
	
	awardFoot.append(
		$("<form>").attr("method", "post").attr("encType", "multipart/form-data").attr("id", "awardForm").append(
			$("<input>").attr("name", "awardCompetition").attr("type", "text")
			, $("<input>").attr("name", "awardName").attr("type", "text")
			, $("<input>").attr("name", "awardCategory").attr("type", "text")
			, $("<input>").attr("name", "awardInstitution").attr("type", "text")
			, $("<input>").attr("name", "awardDate").attr("type", "date")
			, $("<input>").attr("name", "memId").attr("type", "text")
		)
	)
	
	let awardForm = $("#awardForm").on("submit", function(event) {
		event.preventDefault();
		
		let method = this.method;
		let queryString = $(this).serialize();
		
		$.ajax({
			method : method,
			data :queryString,
			dataType : "json",
			success : function(resp) {
				$awardList();
				$("#awardBtn").parent().show();
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});
	
	$("#awardSub").on("click", function() {
		$("form > input[name=awardCompetition]").attr("type", "hidden").val($("td > input[name=awardCompetition]").val());
		$("form > input[name=awardName]").attr("type", "hidden").val($("td > input[name=awardName]").val());
		$("form > input[name=awardCategory]").attr("type", "hidden").val($("td > input[name=awardCategory]").val());
		$("form > input[name=awardInstitution]").attr("type", "hidden").val($("td > input[name=awardInstitution]").val());
		$("form > input[name=awardDate]").attr("type", "hidden").val($("td > input[name=awardDate]").val());
		$("form > input[name=memId]").attr("type", "hidden").val("${resume.memId}");
		
		awardForm.submit();
	});
	
	$("#awardDelete").on("click", function() {
		$("#awardTr").remove();
		$("#awardBtn").parent().show();
		$("#awardForm").remove();
	});
	
});

let awardModalBtn = $("#awardModalBtn").on("click", function() {
	let checkBox = awardModalBody.find("input[type=checkBox]:checked");
	let awardModalDiv = $("#awardModalDiv");
	let inputTags = "";
	for (let i = 0; i < checkBox.length; i++) {
		inputTags += '<input type="hidden" name="itemList[' + i + '].resumeSn" value="${resumeSn}" />';
		inputTags += '<input type="hidden" name="itemList[' + i + '].resumeItemSn" value="' + checkBox[i].value + '" />'; 
	}
	
	let makeawardForm = '<form:form modelAttirbute="resume" id="awardModalForm"></form:form>'
	awardModalDiv.html(makeawardForm);
	$("#awardModalForm").html(inputTags);
	
	let awardModalForm = $("#awardModalForm").submit(function(event) {
		event.preventDefault();
		
		let queryString = $("#awardModalForm").serialize();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/resume/${resumeSn}/item",
			method : "post",
			data : queryString,
			dataType : "json",
			success : function(resp) {
				$awardList();
				$("button[data-bs-dismiss=modal]").trigger("click");
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
		return false;
	});
	
	awardModalForm.submit(); 
});

</script>

<div style="display: flex; justify-content: flex-end; padding: 7rem; padding-top: 1rem;">
	<a href="${pageContext.request.contextPath}/resume"><button class="btn btn-outline-primary" style="width: 150px; border-radius: 0;">목록</button></a>
	<a href="${pageContext.request.contextPath}/resume/edit?resumeSn=${resume.resumeSn}"><button class="btn btn-outline-secondary" style="width: 150px; border-radius: 0;">수정하기</button></a>
	<form:form modelAttribute="resume" action="${pageContext.request.contextPath}/resume/delete" method="post" style="display: inline-block; width: 150px;">
		<input name="resumeSn" value="${resume.resumeSn}" hidden/>
		<button type="submit" class="btn btn-outline-danger" style="border-radius: 0;">삭제하기</button>
	</form:form>
</div>