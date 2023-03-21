<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023. 2. 7.    양서연      최초작성
* 2023. 2. 17.   최경수      채용과정 관리 버튼
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %> 
<c:set  var="prePath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${prePath}/resources/css/custom-bs.css">
<link rel="stylesheet" href="${prePath}/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="${prePath}/resources/css/bootstrap-select.min.css">
<link rel="stylesheet" href="${prePath}/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="${prePath}/resources/fonts/line-icons/style.css">
<link rel="stylesheet" href="${prePath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${prePath}/resources/css/animate.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<link rel="stylesheet" href="${prePath}/resources/css/saramin/layout.css" />
<link rel="stylesheet" href="${prePath}/resources/css/saramin/board.css" />
<link rel="stylesheet" href="${prePath}/resources/css/saramin/pattern.css" />
<link rel="stylesheet" href="${prePath}/resources/css/saramin/components.css" />
<link rel="stylesheet" href="${prePath}/resources/css/saramin/jobs-view.css" />
<link rel="stylesheet" href="${prePath}/resources/css/saramin/jobs-recruit.css" />
<link rel="stylesheet" href="${prePath}/resources/css/saramin/recruit-template-reset.css" />
<link rel="stylesheet" href="${prePath}/resources/css/saramin/recruit-template.css" />
<link rel="stylesheet" href="${prePath}/resources/css/saramin/common_ui_keeping.css" />

<!-- MAIN CSS -->
<link rel="stylesheet" href="${prePath}/resources/css/style.css">

<style>
.ddt {
    clear:left;
    float:left;
    display:block;
    margin:0 0 1px;
    width:120px;
    
}
.ddd {
    padding:0 0 0 40px;
    margin:0 0 1px;
}
.ddd:after {
    content: "";
    display: table;
    clear: both;
}
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- <script src="sweetalert2.all.min.js"></script> -->

<!-- Button trigger modal -->
<button type="button" id="terModalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal_terminate" style="display: none">
 	만료테스트
</button>
<button type="button" id="delModalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal_delete" style="display: none">
 	삭제테스트
</button>
<button type="button" id="confirmModalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal_confirm" style="display: none">
 	확인테스트
</button>

<!-- 만료 -->
<div class="modal fade" id="modal_terminate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 999999999">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">진행중인 공고를 종료시키겠습니까?</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="color:black">
		변경 후에는 되돌릴 수 없습니다.
      </div>
      <div class="modal-footer">
        <button type="button" id="modal_terminate_ok_btn" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
        <button type="button" id="modal_terminate_no_btn" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- 삭제 -->
<div class="modal fade" id="modal_delete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 999999999">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">공고를 삭제하시겠습니까?</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
		삭제 후에는 되돌릴 수 없습니다.
      </div>
      <div class="modal-footer">
        <button type="button" id="modal_delete_ok_btn" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
        <button type="button" id="modal_delete_no_btn" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- 확인 -->
<div class="modal fade" id="modal_confirm" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 999999999">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">정상처리되었습니다</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-footer">
        <button type="button" id="modal_confirm_ok_btn" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
<!-- 모달 끝 -->



<!-- <button id="terminateBtn" class="sri_btn_lg for_btn_event" title="클릭하면 종료시킬 수 있는 창이 뜹니다."> -->
<!-- 	<span class="sri_btn_immediately">공고 종료</span> -->
<!-- </button> -->

<!-- <button id="deleteBtn" class="sri_btn_lg for_btn_event" title="클릭하면 삭제시킬 수 있는 창이 뜹니다."> -->
<!-- 	<span class="sri_btn_immediately">공고 삭제</span> -->
<!-- </button> -->
<%-- <c:url value="/announcement/update" var="updateAnnoURL"> --%>
<%-- 	<c:param name="what" value="${anno.annoNo}" /> --%>
<%-- </c:url> --%>
<%-- <button id="updateBtn" class="sri_btn_lg for_btn_event" onclick="location.href='${updateAnnoURL}'" title="클릭하면 수정시킬 수 있는 창이 뜹니다."> --%>
<!-- 	<span class="sri_btn_immediately">공고 수정</span> -->
<!-- </button> -->


<div class="site-wrap">
	<section class="site-section" style="background-color: white" >
		<div class="container" style="max-width:1300px">
			<div class="row">
				<div class="col-lg-8">
					<div class="mb-5">
						<div class="row align-items-center">
							<div class=" mb-4 mb-lg-0">
								<div class="d-flex align-items-center">
									<div>
										<div class="wrap_jv_header">
											<a class="placeholder" tabindex="-1"></a>
											<div class="jv_header" data-rec_idx="44659375" data-rec_seq="0">
												<div class="title_inner" style="margin-bottom:5px">
													<a href="#" title="${anno.company.cmpName}" class="company" target="_blank">${anno.company.cmpName}</a>
													<a href="" class="btn_jview btn_careers" target="_blank">
														<span>채용중<span class="num"></span></span>
													</a>
												</div>
												<h1 class="tit_job">${anno.annoTitle}</h1>
											</div>
										</div>
										<div class="jv_cont jv_summary">
											<div class="cont">
												
												<div class="col">
													<dl>
														<dt>경력</dt>
														<dd>
														<c:forEach items="${anno.detailList[0].careerNames }" var="career">
															<strong>${career}</strong>	
														</c:forEach>
														</dd>
													</dl>
													<dl>
														<dt>학력</dt>
														<dd>
															<strong>${anno.eduName}</strong>
														</dd>
													</dl>
													<dl>
														<dt>근무형태</dt>
														<dd>
															<strong>${anno.detailList[0].empltypeName}</strong>
															<div class="toolTipWrap">
																<button type="button" class="spr_jview btn_jview btn_tooltip" aria-haspopup="dialog" aria-expanded="false">
																	<span class="blind">근무형태</span><span>상세보기</span>
																</button>
																<div class="toolTip" role="dialog" aria-label="근무형태" aria-describedby="details-jobtype-44659375">
																	<span class="tail tail_top_center"></span>
																	<div id="details-jobtype-44659375" class="toolTipCont txtLeft">
																		<ul class="toolTipTxt">
																			<li><span>${anno.detailList[0].empltypeName}</span> 수습기간 ${anno.annoProbation }</li>
																		</ul>
																	</div>
																	<button type="button" class="btnClose">
																		<span class="blind">닫기 근무형태 상세 설명</span>
																	</button>
																</div>
															</div>
														</dd>
													</dl>
												</div>
												<div class="col">
													<dl>
														<dt>급여</dt>
														<c:choose>
															<c:when test="${anno.annoSalary eq '면접후결정'}">
																<dd>면접 후 결정</dd>
															</c:when>
															<c:otherwise>
																<dd>${anno.annoSalary} ${anno.annoSalary2}만원</dd>
															</c:otherwise>

														</c:choose>
													</dl>
													<dl>
														<dt>직급/직책</dt>
														<dd>
														<c:forEach items="${anno.detailList[0].positionList}" var="positionList" varStatus="status">
															${positionList.positionName} <c:if test="${not status.last}">,</c:if>
														</c:forEach>
														</dd>
													</dl>
													<dl>
														<dt>근무지역</dt>
														<c:set var="detailList" value="${anno.detailList}"/>
														<dd>
														<c:forEach items="${detailList}" var="detail" varStatus="status">
															${detail.regionName} <c:if test="${not status.last}">,</c:if>
														</c:forEach>
														</dd>
													</dl>
												</div>
												<div class="meta">
													<ul class="list_meta">
														<li>조회수 <strong>${anno.annoHit}</strong></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="user_content">
							<div class="pc_recruit_template ver2 blue arrow">
								<table class="cont_recruit_template">
									<tbody>
										<tr>
											<td>
												<h2 class="tit_template">공통사항</h2>
												<div class="wrap_tbl_template">
													<table class="tbl_template">
														<colgroup>
															<col width="184">
															<col>
														</colgroup>
														<tbody>
													 		<tr>
													 			<th scope="row"> 
																	<strong class="tit">
																		<strong class="tit">
																			업종
																		</strong>
																	</strong>
																</th>
																<td>
																<table class="tbl_list">
																	<tbody>
																		<tr>
																			<td>
																				${anno.industryName}
																			</td>
																		</tr>
																	</tbody>
																</table>
													 		</tr>
													 		<tr>
																<td colspan='2'>
																<table class="tbl_list">
																	<tbody>
																		<tr>
																			<td>
																				${anno.annoContent}
																			</td>
																		</tr>
																	</tbody>
																</table>
													 		</tr>
													 		<c:if test="${not empty anno.annoWorkenv}">
														 		<tr>
														 			<th scope="row"> 
																		<strong class="tit">
																			<strong class="tit">
																				근무환경
																			</strong>
																		</strong>
																	</th>
																	<td>
																	<table class="tbl_list">
																		<tbody>
																			<tr>
																				<td>
																					${anno.annoWorkenv}
																				</td>
																			</tr>
																		</tbody>
																	</table>
														 		</tr>
													 		</c:if>
														</tbody>
													</table>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<h2 class="tit_template">모집부문 및 상세내용</h2>
												<div class="wrap_tbl_template">
													<table class="tbl_template">
														<colgroup>
															<col width="184">
															<col>
														</colgroup>
														<thead>
															<tr>
																<th scope="col">모집부문</th>
																<th scope="col">상세내용</th>
															</tr>
														</thead>
														<tbody id="detailArea">
															<!-- 반복문 시작 -->
														 	<c:forEach items="${detailList}" var="detail" varStatus="status">
														 		<tr>
														 			<th scope="row">
																		<strong class="tit">
																			<strong class="tit">
																				${detail.daFd} <!-- 모집분야 -->
																			</strong>
																			<span class="txt" style="font-weight: 400; ">${detail.daCount} 명 <br></span> <!-- 모집인원 -->
																			<span class="tit"></span>
																			<span class="txt" style="font-weight: 400;">( ${detail.empltypeName} )<br></span> 
																			<span class="tit"></span>
																			<hr>
																			<span class="txt" style="font-weight: 400;">
																				<c:if test="${not empty detail.careerNames}">
																					<c:forEach items="${detail.careerNames}" var="career" varStatus="status">
																						${career} <c:if test="${career eq '경력'}">${detail.daCarYeer}</c:if>
																						<c:if test="${not status.last}">,</c:if>
																					</c:forEach>
																				</c:if>
																			</span>
																			<span class="tit"></span>
																			<span class="txt" style="font-weight: 400;">
																				<c:if test="${not empty detail.positionList}">
																						<c:forEach items="${detail.positionList}" var="position" varStatus="status">
																							${position.positionName} <c:if test="${not status.last }">,</c:if>
																						</c:forEach>
																						 급
																				</c:if> 
																			</span>
																			<br>
																		</strong>
																	</th>
																	<td>
																	<table class="tbl_list">
																		<tbody>
																			<tr>
																				<td>
																					<c:if test="${not empty detail.daTask}">
																						<strong class="tit"><span>담당업무 ( ${detail.jobName} )</span></strong>
																						<p><span>${detail.daTask}</span></p>
																						<p><span><br></span></p>
																					</c:if>

																					<strong class="tit"><span>지역</span></strong>
																					<p><span>${detail.regionName}</span></p>
																					<p><span><br></span></p>
																					
																					
																					
																					<c:if test="${not empty detail.daDepartment}">
																						<strong class="tit"><span>근무부서</span></strong>
																						<p><span>${detail.daDepartment}</span></p>
																						<p><span><br></span></p>
																					</c:if>
																					
																					
																					<c:if test="${not empty detail.daCondition}">
																						<strong class="tit"><span>지원조건</span></strong>
																						<p><span>${detail.daCondition}</span></p>
																						<p><span><br></span></p>
																					</c:if>

																					<c:if test="${not empty detail.daPrefer}">
																						<strong class="tit"><span>우대사항</span></strong>
																						<p><span>${detail.daPrefer}</span></p>
																						<p><span><br></span></p>
																					</c:if> 
																				</td>
																			</tr>
																		</tbody>
																	</table>
														 	</c:forEach>
														 	<!-- 반복문 끝 -->
														</tbody>
													</table>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<p><span><br></span></p>
							                    <h2 class="tit_template" id="template_job_type_title">
							                        <span class="ico"></span>
							                        	복리후생
							                    </h2>
							                    <p><span><br></span></p>
							                    <div class="jv_cont jv_benefit expand">
													<div class="cont">
														<div class="details" id="welArea"></div>
													</div>
												</div>
							                </td>
										</tr>
										<tr>
											<td>
												<p><span><br></span></p>
							                    <h2 class="tit_template" id="template_job_type_title">
							                        <span class="ico"></span>
							                        	기업 후기
							                    </h2>
							                    <p><span><br></span></p>
							                    <div class="jv_cont jv_benefit expand">
													<div class="cont" >
														<div class="details">
															2023-02-19 <br><br>
															코로나의 수혜를 제일 잘 받은 기업. 운이 좋았어요 직원이 젊고 야근수당 챙겨주고 회식 많지 않아서 좋아여 직원이 젊어서 체계가 없고 야근이 많고 회식이 적어서 재미없어요
															<p><span><br></span></p>
															2023-01-04 <br><br>
															사업기반이 안정적이고 신입이 와서 적응하기 쉬운 회사. 
															사무실이 쾌적함. 다양한 사업이 진행중이다보니 일이 많아 자칫하다간 워라벨 균형이 무너질 수 있음. 따라서 개인이 워라벨 균형을 잘 조절해야함
															<p><span><br></span></p>
															2022-10-22 <br><br>
															신규사업에 좀 더 과감히 투자하면 성공가능성이 높아보이는 아이템임. 좀 더 과함한 투자와 지원이 있었으면 좋겠음
															<p><span><br></span></p>
															<span style="float: right"><a href="#">더 보기 ></a></span>
														</div>
													</div>
												</div>
							                </td>
										</tr>
										<tr>
											<td>
												<p><span><br></span></p>
							                    <p><span><br></span></p>
							                    <div class="jv_cont jv_benefit expand">
													<div class="cont" >
														<div class="details" id="reviewArea">
															<div class='row'>
															    <dl class='col'>
															        <dt class="ddt">담당자  </dt>
															        <dd class="ddd">${annoInc.memName}</dd>
															    </dl>
															    <dl class='col'>
															        <dt class="ddt">담당자 이메일  </dt>
															        <dd class="ddd">${annoInc.incruiterVO.memEmail}</dd>
															    </dl>
															    <dl class='col'>
															        <dt class="ddt">담당자 전화번호  </dt>
															        <dd class="ddd">${annoInc.incruiterVO.memTel}</dd>
															    </dl>
															</div>
														</div>
													</div>
												</div>
							                </td>
										</tr>
										<tr>
											<td>
							                    <p><span><br></span></p>
							                    <p><span><br></span></p>
							                    <div class="jv_cont jv_benefit expand">
													<div class="cont" >
														<div>
															※ 방문, 우편, 팩스 등 오프라인 접수의 경우, 『채용절차의 공정화에 관한 법률 제11조』 에 따라 구직자는 구인자에게 채용서류 반환을 요청 할 수 있으며, 구인자는 본인임을 확인한 후 채용서류를 반환하여야 합니다.
														</div>
													</div>
												</div>
							                </td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- 타이머 -->
					<div class="jv_cont jv_howto">
						<a class="placeholder" tabindex="-1"></a>
						<h2 class="jv_title">접수기간 및 방법</h2>
						<div class="cont box box2">
							<c:choose>
								<c:when test="${anno.annoStateCd eq 'B1'}">
									<div class="status">
										<div class="info_timer" data-remain-time="820560">
											<span class="txt">남은 기간</span>
											<span class="day">9</span>
											<span class="txt_day">일</span>
											<span class="time">11:47:54</span>
										</div>
										<dl class="info_period">
											<dt>시작일</dt>
											<dd>${anno.annoStartdate}</dd>
											<dt class="end">마감일</dt>
											<dd>${anno.annoEnddate}</dd>
										</dl>
										<security:authorize access="isAuthenticated()">
											<security:authentication property="principal" var="memberVOWrapper"/>
											<security:authentication property="principal.realMember" var="authMember"/>
												<c:choose>
													<c:when test="${authMember.memId eq anno.memId }">
														<button class="sri_btn_lg for_btn_event" title="클릭하면 입사지원할 수 있는 창이 뜹니다." onclick="location.href='${prePath}/process/${anno.annoNo}'">
															<span class="sri_btn_immediately">채용과정</span>
														</button>
													</c:when>
													<c:otherwise>
														<button class="sri_btn_lg for_btn_event" title="클릭하면 입사지원할 수 있는 창이 뜹니다." onclick="location.href='${prePath}/apply/form?annoNo=${anno.annoNo}'">
															<span class="sri_btn_immediately">입사지원</span>
														</button>
													</c:otherwise>
												</c:choose>
										</security:authorize>
									</div>
								</c:when>
								<c:otherwise>
									<div class="status">
										<button class="sri_btn_lg for_btn_event" title="클릭하면 입사지원할 수 있는 창이 뜹니다.">
											<span class="sri_btn_immediately">종료된 공고입니다.</span>
										</button>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<div class="ml-auto h-100 jm-sticky-top" style="top: 100px; width:350px; z-index: 99999; letter-spacing :13px;">
					<div class="p-3 border rounded mb-4 cont" style="background-color:white; letter-spacing: 0.1px; color: #444">
						<!-- 관심버튼 -->
						<div class="ml-auto h-100">
							<div class="row">
								<security:authorize access="isAuthenticated()">
<%-- 								<security:authorize access="hasRole('INCRUITER')"> --%>
									<security:authentication property="principal" var="memberVOWrapper"/>
									<security:authentication property="principal.realMember" var="authMember"/>
<%-- 									<input type="hidden" value="${authMember.memId}"/> --%>
									<div class="col-6" id="likeAnnoArea">
										<c:choose>
											<c:when test="${selectLikeAnno gt 0}">
												<a class="btn btn-block btn-md" style="color: #444" onclick="likeAnnoFt('${authMember.memId}')"><span id="likeAnno" class="icon-heart mr-2 text-danger"></span>관심공고</a>
											</c:when>
											<c:otherwise>
												<a class="btn btn-block btn-md" style="color: #444" onclick="likeAnnoFt('${authMember.memId}')"><span id="likeAnno" class="icon-heart-o mr-2 text-danger"></span>관심공고</a>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="col-6" id="likeCmpArea">
										<c:choose>
											<c:when test="${selectLikeCmp gt 0}">
												<a class="btn btn-block btn-md" style="color: #444" onclick="likeCmpFt('${authMember.memId}')"><span id="likeCmp" class="mr-2 bi bi-star-fill text-danger"></span>관심기업</a>
											</c:when>
											<c:otherwise>
												<a class="btn btn-block btn-md" style="color: #444" onclick="likeCmpFt('${authMember.memId}')"><span id="likeCmp" class="mr-2 bi bi-star text-danger"></span>관심기업</a>
											</c:otherwise>
										</c:choose>
									</div>
								</security:authorize>
							</div>
						</div>
						<h3 class="text-primary  mt-3 h5 pl-3 mb-3" style="font-size: 17px">${anno.company.cmpName}</h3>
						<ul class="list-unstyled pl-3 mb-0" style="font-size: 15px">
							<c:set var="company" value="${anno.company}"/>
			                <li class="mb-2"><strong class="text-black">업종 : </strong>${company.cmpMbName}</li>
							<li class="mb-2"><strong class="text-black">사원수 : </strong>${company.cmpEmpNo} 명</li>
							<li class="mb-2"><strong class="text-black">설립일자 : </strong>${company.cmpEstblDate}</li>
							<li class="mb-2"><strong class="text-black">기업형태 : </strong>${company.cmpSmenp}</li>
							<li class="mb-2"><strong class="text-black">주소 : </strong>${company.cmpAddr1}</li>
							<li class="mb-2"><strong class="text-black">홈페이지 : </strong>${company.cmpUrl}</li>
							<li class="mb-2"><strong class="text-black">이메일 : </strong>${company.cmpEmail}</li>
						</ul>
						<!-- 타이머 -->
						<div class="jv_cont jv_howto">
							<div class="cont box">
								<c:choose>
									<c:when test="${anno.annoStateCd eq 'B1'}">
										<div class="status">
						<!-- 				<p class="copy once"><strong>채용시 마감</strong>되는<br>공고입니다.</p> -->
											<div class="info_timer" data-remain-time="820560">
												<span class="txt">남은 기간</span>
												<span class="day">9</span>
												<span class="txt_day">일</span>
												<span class="time">11:47:54</span>
											</div>
											<dl class="info_period">
												<dt>시작일</dt>
												<dd>${anno.annoStartdate}</dd>
												<dt class="end">마감일</dt>
												<dd>${anno.annoEnddate}</dd>
											</dl>
											<security:authorize access="isAuthenticated()">
												<security:authentication property="principal" var="memberVOWrapper"/>
												<security:authentication property="principal.realMember" var="authMember"/>
													<c:choose>
														<c:when test="${authMember.memId eq anno.memId }">
															<button class="sri_btn_lg for_btn_event" title="클릭하면 입사지원할 수 있는 창이 뜹니다." onclick="location.href='${prePath}/process/${anno.annoNo}'">
																<span class="sri_btn_immediately">채용과정</span>
															</button>
														</c:when>
														<c:otherwise>
															<button class="sri_btn_lg for_btn_event" title="클릭하면 입사지원할 수 있는 창이 뜹니다." onclick="location.href='${prePath}/apply/form?annoNo=${anno.annoNo}'">
																<span class="sri_btn_immediately">입사지원</span>
															</button>
														</c:otherwise>
													</c:choose>
											</security:authorize>
										</div>
									</c:when>
									<c:otherwise>
										<div class="status">
											<button class="sri_btn_lg for_btn_event" title="클릭하면 입사지원할 수 있는 창이 뜹니다.">
												<span class="sri_btn_immediately">종료된 공고입니다.</span>
											</button>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="site-section" id="next" style="padding-top: 0px">
		<div class="container">
		    <div class="row mb-5 justify-content-center">
				<div class="col-md-7 text-center">
					<div class="wrap_recommend_slide type02 hot_slide" id="hot100-top10-list-45135822">
						<div class="hot_slide_tit">
					    	<h4 class="tit">이 공고를 찾은 회원들의 인기공고 <em>HOT 5</em></h4>
						</div>
					</div>
				</div>
		    </div>
		    <div class="top_recruilt_list">
				<section class="list_recruiting">
					<h2 class="blind">공고리스트</h2>
					<div class="list_head">
						<div class="col company_nm">기업명</div>
						<div class="col notification_info">제목</div>
						<div class="col recruit_condition">지원자격</div>
						<div class="col company_info">근무조건</div>
						<div class="col support_info">마감일·등록일</div>
					</div>
				    <div class="list_body">
				    	<div id="recommendBody"></div>
				    </div>
			    </section>
		    </div>
		</div>
	</section>
</div>


<!-- SCRIPTS -->
<script>
function likeAnnoFt(memId){
    console.log("likeAnnoFt",`${anno.annoNo}`,memId);

    let data = {annoNo:`${anno.annoNo}`,memId:memId};
    $.ajax({
       url : "${pageContext.request.contextPath}/announcement/likeAnno",
       method : "post",
       data : JSON.stringify(data),
       dataType : "text",
       contentType: 'application/json',
       success : function(resp) {
          console.log("resp : ",resp);
          if(resp=="delete"){
             $("#likeAnno").removeClass("icon-heart").addClass("icon-heart-o");
          } else if(resp=="insert") {
             $("#likeAnno").removeClass("icon-heart-o").addClass("icon-heart");
          }
       },
       error : function(jqXHR, status, error) {
          console.log(jqXHR);
          console.log(status);
          console.log(error);
       }
    });
}

function likeCmpFt(memId){
    console.log("likeCmpFt",`${anno.cmpId}`,memId);

    let data = {cmpId:`${anno.cmpId}`,memId:memId};
    $.ajax({
       url : "${pageContext.request.contextPath}/announcement/likeCmp",
       method : "post",
       data : JSON.stringify(data),
       dataType : "text",
       contentType: 'application/json',
       success : function(resp) {
          console.log("resp : ",resp);
          if(resp=="delete"){
             $("#likeCmp").removeClass("bi-star-fill").addClass("bi-star");
          } else if(resp=="insert") {
             $("#likeCmp").removeClass("bi-star").addClass("bi-star-fill");
          }
       },
       error : function(jqXHR, status, error) {
          console.log(jqXHR);
          console.log(status);
          console.log(error);
       }
    });
}

let dday = new Date(`${anno.annoEnddate}`).getTime();
setInterval(function() {
	let today = new Date().getTime();
	let gap = dday - today;
	let day = Math.ceil(gap / (1000 * 60 * 60 * 24));
	let hour = Math.ceil((gap % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	let min = Math.ceil((gap % (1000 * 60 * 60)) / (1000 * 60));
	let sec = Math.ceil((gap % (1000 * 60)) / 1000);
	$(".day").html(day);

	if(hour<10) hour="0"+hour;
	if(min<10) min="0"+min;
	if(sec<10) sec="0"+sec;
	$(".time").html(hour+":"+min+":"+sec);
}, 1000);


let updateBtn = $("#update").on("click",function(event){
	event.preventDefault();
	let annoNo = `${anno.annoNo}`;
	location.href="${prePath}/announcement/update?what="+annoNo;
})

//종료
let terminateBtn = $("#terminate").on("click",function(event){
	event.preventDefault();
	let annoNo = `${anno.annoNo}`;
	let data = {annoNo : annoNo};
	//모달 띄우기
	Swal.fire({
		title: '진행중인 공고를 종료하시겠습니까?',
		text: "종료후에는 되돌릴 수 없습니다.",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '네',
		cancelButtonText: '아니요'
	}).then((result) => {
		if (result.isConfirmed) {
			$.ajax({
				url : "${prePath}/announcement/terminate",
				method : "post",
				data : JSON.stringify(data),
				contentType: 'application/json',
				success : function(resp) {
					console.log("resp",resp);
					Swal.fire(
							'완료',
							'공고가 종료되었습니다.',
							'확인'
							);
					$(".cont.box").html(`<div class="status">
							<button class="sri_btn_lg for_btn_event" title="클릭하면 입사지원할 수 있는 창이 뜹니다.">
								<span class="sri_btn_immediately">종료된 공고입니다.</span>
							</button>
						</div>`);
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			});
 		}
	})
});

//삭제
let deleteBtn = $("#delete").on("click",function(event){
	event.preventDefault();
	let annoNo = `${anno.annoNo}`;
	let data = {annoNo : annoNo};
	//모달띄우기
	Swal.fire({
		title: '공고를 삭제하겠습니까?',
		text: "삭제 후에는 되돌릴 수 없습니다.",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '네',
		cancelButtonText: '아니요'
	}).then((result) => {
		if (result.isConfirmed) {
			$.ajax({
				url : "${prePath}/announcement/delete",
				method : "post",
				data : JSON.stringify(data),
				contentType: 'application/json',
				success : function(resp) {
					console.log("resp",resp);
// 					Swal.fire(
// 							'완료',
// 							'공고가 삭제되었습니다.',
// 							'확인'
// 							);
					//location이동
					location.replace("${prePath}/announcement");
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			});
 		}
	});
});

//복지 ajax로 받아와서 태그 만들 것임
let annoData={annoNo:`${anno.annoNo}`};

$.ajax({
	url : "${prePath}/announcement/view/welAjax",
	method : "post",
	data : JSON.stringify(annoData),
	dataType : "json",
	contentType: 'application/json',
	success : function(resp) {
		let rn = "";
		let cnt = 0;
		let welHtml = "";
		for(wel of resp.welfareList){
			console.log(wel.refName);
			console.log(wel.welfareCode);
			console.log(wel.welfareName);

			//첫번째 ref -> <dt></dt>
			//ref 겹치는 값들 -> <dd></dd>
			//다른 ref -> <dt></dt>
			//ref 겹치는 값들 -> <dd></dd>
			//...반복
			//네번째 ref 나오면 dl태그 닫고 새로운 dl태그 열기
			//일곱번째 ref 나오면 dl태그 닫고 새로운 dl태그 열기
			//...반복

			if(wel.refName==rn){
				welHtml += "<dd>" + wel.welfareName + "</dd>"
			}else{
				//<dl class="col">
				rn = wel.refName;
				if(cnt%3==0){ //0,3,6
					//<div class="row">
					if(cnt==0){
						welHtml += "<div class='row'>";
						welHtml += "<dl class='col'>";
						welHtml += "<dt>" + wel.refName + "</dt>";
						welHtml += "<dd>" + wel.welfareName + "</dd>";
					} else {
						welHtml += "</dl></div><div class='row'>";
						welHtml += "<dl class='col'>";
						welHtml += "<dt>" + wel.refName + "</dt>";
						welHtml += "<dd>" + wel.welfareName + "</dd>";
					}
				} else {
					welHtml += "</dl><dl class='col'>";
					welHtml += "<dt>" + wel.refName + "</dt>";
					welHtml += "<dd>" + wel.welfareName + "</dd>";
				}
				cnt++;
			}
		}
		welHtml += "</div>";
		$("#welArea").html(welHtml);
	},
	error : function(jqXHR, status, error) {
		console.log("에러다 이거");
		console.log(jqXHR);
		console.log(status);
		console.log(error);
	}
});

let makeNewTag = function(anno,annoDate,careerNameList,jobTag,empltypeName){
	return $("<div class='list_item'>").attr("id",anno.annoNo)
			.append(
				$("<div class='col company_nm'>").attr("id",anno.cmpId).append(
					$("<a class='str_tit' target='_blank'>").attr("title",anno.company.cmpName).attr("href","회사상세페이지주소").append(
						$("<span>").html(anno.company.cmpName)
					)
					, $("<div class='toolTipWrap wrap_interested_corp'>").append(
						$("<div class='toolTip'>").append(
							$("<span class='tail tail_bottom_center'>")
							, $("<div class='toolTipCont txtCenter'>").html("관심기업 등록")
						)
					)
				)
				, $("<div class='col notification_info'>").append(
					$("<div class='job_tit'>").append(
						//HOT 아이콘
						$("<span class='prd_icon_02'>"),
						$("<a class='str_tit' target='_blank'>").attr("title",anno.annoTitle)
							.attr("href","${pageContext.request.contextPath}/announcement/view/"+anno.annoNo)
							.append(
								$("<span>").html(anno.annoTitle)
							)
						, $("<div class='toolTipWrap wrap_scrap'>").append(
							$("<div class='toolTip'>").append(
								$("<span class='tail tail_bottom_center'>")
								, $("<div class='toolTipCont txtCenter'>").html("스크랩")
							)
						)
					)
					, $("<div class='job_meta'>").append(
						$("<span class='job_sector'>").append(
							jobTag
						)
					)
				)
				, $("<div class='col recruit_condition'>").append(
					$("<p class='career'>").html(careerNameList)
					, $("<p class='education'>").html(anno.eduName)
				)
				, $("<div class='col company_info'>").append(
					$("<p class='employment_type'>").html(empltypeName)
					, $("<p class='work_place'>").html(anno.regionName)
				)
				, $("<div class='col support_info'>").append(
					$("<p class='support_type'>").append(
						$("<button class='sri_btn_xs' title='클릭하면 입사지원할 수 있는 창이 뜹니다.'>").append(
							$("<span class='sri_btn_immediately'>").html("입사지원")
						)
					)
					, $("<p class='deadlines'>")
						.append("~ "+anno.annoEnddate)
						.append($("<span class='reg_date'>").html(annoDate))
				)
	);
}

//공고 추천
let recommendBody = $("#recommendBody");
$.ajax({
	url : "${prePath}/announcement/recommend",
	method : "post",
	data : JSON.stringify(annoData),
	dataType : "json",
	contentType: 'application/json',
	success : function(resp) {
		let newTags = [];
		$.each(resp.recommendList,function(index,anno){
			let annoDate = timeForToday(anno.annoDate);
			let jobTag = [];
			let tempC = [];
			let careerNameList = [];
			let tempE = [];
			let empltypeName = [];
			let cntC=0;
			let cntE=0;
			let ed = new Date(anno.annoEnddate);
			let week = new Array('일', '월', '화', '수', '목', '금', '토');
			anno.annoEnddate = ed.getMonth()+1+'/'+ed.getDate()+'('+ week[ed.getDay()] +')';
			$.each(anno.detailList,function(index,detail){
				$.each(detail.careerNames,function(index,careers){
					if (!tempC.includes(careers)) {
						if(cntC==0){
							tempC.push(careers);
							careerNameList.push(careers);
							cntC=cntC+1;
						} else {
							tempC.push(careers);
							careerNameList.push(","+careers);
							cntC=cntC+1;
						}
					}
				})
			});
			$.each(anno.detailList,function(index,detail){
				jobTag.push($("<span>").html(detail.jobName));
			});
			$.each(anno.detailList,function(index,detail){
				if (!tempE.includes(detail.empltypeName)) {
					if(cntE==0){
						tempE.push(detail.empltypeName);
						empltypeName.push(detail.empltypeName);
						cntE=cntE+1;
					} else {
						tempE.push(detail.empltypeName);
						empltypeName.push(","+detail.empltypeName);
						cntE=cntE+1;
					}
				}
			})
			newTags.push(makeNewTag(anno,annoDate,careerNameList,jobTag,empltypeName));
		})
		recommendBody.html(newTags);
	},
	error : function(jqXHR, status, error) {
		console.log("에러에러에러");
		console.log(jqXHR);
		console.log(status);
		console.log(error);
	}
});

function timeForToday(value) {
    let today = new Date();
    let timeValue = new Date(value);

    let betweenTime = Math.floor((today.getTime() - timeValue.getTime())/1000/60);
    if (betweenTime<1) return '방금 전 등록';
    if (betweenTime<60) {
        return betweenTime+'분 전 등록';
    }

    let betweenTimeHour = Math.floor(betweenTime/60);
    if (betweenTimeHour<24) {
        return betweenTimeHour+'시간 전 등록';
    }

    let betweenTimeDay = Math.floor(betweenTime/60/24);
    if (betweenTimeDay<365) {
        return betweenTimeDay+'일 전 등록';
    }
    return Math.floor(betweenTimeDay/365)+'년 전 등록';
}

</script>
<script src="${prePath}/resources/js/jquery.min.js"></script>
<script src="${prePath}/resources/js/bootstrap.bundle.min.js"></script>
<script src="${prePath}/resources/js/isotope.pkgd.min.js"></script>
<script src="${prePath}/resources/js/stickyfill.min.js"></script>
<script src="${prePath}/resources/js/jquery.fancybox.min.js"></script>
<script src="${prePath}/resources/js/jquery.easing.1.3.js"></script>

<script src="${prePath}/resources/js/jquery.waypoints.min.js"></script>
<script src="${prePath}/resources/js/jquery.animateNumber.min.js"></script>
<script src="${prePath}/resources/js/owl.carousel.min.js"></script>
<script src="${prePath}/resources/js/quill.min.js"></script>

<script src="${prePath}/resources/js/bootstrap-select.min.js"></script>

<script src="${prePath}/resources/js/custom.js"></script>
