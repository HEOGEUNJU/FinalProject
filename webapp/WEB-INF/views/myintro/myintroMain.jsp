<%--
* [[개정이력(Modification Information)]]
* 수정일             수정자            수정내용
* ----------  ---------  -----------------
* 2023. 2. 14.      최경수            최초작성
* 2023. 2. 24.      최경수            틀 수정
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- 숫자 애니메이션 -->
<script src="<%=request.getContextPath()%>/resources/js/isotope.pkgd.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/stickyfill.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.waypoints.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.animateNumber.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/layout.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/board.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/pattern.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/components.css"/>  

<style>
  .company_honest_qna .contents_container {
    width: 70%;
}

.wrap_community_topic .section_inner {
    width: 490px;
    height: 520px;
}

.wrap_community_topic .section_inner:nth-child(even) {
    float: left;
}
</style>


<div class="container" style="position: relative; top: -190px; left: 250px; scale: 0.8;">
  <div class="row pb-0 block__19738 section-counter" style="position: absolute; left: 30%; width: 70%;">

    <div class="col-6 col-md-6 col-lg-3 mb-5 mb-lg-0">
      <div class="d-flex align-items-center justify-content-center mb-2">
        <strong class="number" data-number="${myintroList.size()}">0</strong>
      </div>
      <span class="caption">총 항목 개수</span>
    </div>

    <div class="col-6 col-md-6 col-lg-3 mb-5 mb-lg-0">
      <div class="d-flex align-items-center justify-content-center mb-2">
        <strong class="number" data-number="3">0</strong>
      </div>
      <span class="caption">오늘 업데이트한 항목 개수</span>
    </div>

    <div class="col-6 col-md-6 col-lg-3 mb-5 mb-lg-0">
      <div class="d-flex align-items-center justify-content-center mb-2">
        <strong class="number" data-number="21">0</strong>
      </div>
      <span class="caption">미완성된 항목 개수</span>
    </div>

    <div class="col-6 col-md-6 col-lg-3 mb-5 mb-lg-0">
      <div class="d-flex align-items-center justify-content-center mb-2">
        <strong class="number" data-number="64">0</strong>
      </div>
      <span class="caption">내 자기소개서 총 변동 수</span>
    </div>
  </div>
</div>



<div class="company_honest_qna">
	<div class="contents_container">
		<div class="wrap_story_panel">
			<div class="wrap_section wrap_community_topic" style="margin-top: 36px;">
				<div class="wrap_title">
					<h3 class="main_tit">내 자기소개서 목록</h3>
				</div>
				<div class="tblType">
					<table>
						<thead>
							<tr>
								<th style="width: 20%;"></th>
								<th style="width: 60%;">제목</th>
								<th style="width: 20%;">작성날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty myintroList }">
								<c:forEach items="${myintroList}" var="myintro" varStatus="status">
									<tr>
										<td style="text-align: left; padding-left: 30px;">${status.index + 1}</td>
										<td style="text-align: left;"><a href="${pageContext.request.contextPath}/myintro/${myintro.myintroSn}">${myintro.myintroTitle}</a></td>
										<td>${myintro.myintroInsertDate}</td>
									</tr>
								</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="12">목록 없음.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
     		</div>
    	</div>
    </div>
</div>
<div style="display: flex; justify-content: flex-end; padding: 7rem; padding-top: 1rem; margin-right: 35px;">
	<a href="${pageContext.request.contextPath}/myintro/form"><button class="btn btn-outline-primary" style="width: 150px; border-radius: 0;">등록하기</button></a>
	<a href="${pageContext.request.contextPath}/resume"><button class="btn btn-outline-secondary"  style="width: 150px; border-radius: 0;">이력서</button></a>
</div>