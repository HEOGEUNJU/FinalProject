<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/layout.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/board.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/pattern.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/components.css"/>  
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/help.css">

<style>
.company_honest_qna .contents_container {
  	width: 90%;
}
.count {
    color: #888;
    font-size: 20px;
    font-weight: normal;
    letter-spacing: -1px;
    line-height: 30px;
}
</style>

<div id="sri_section" class="layout_full">
	<div id="sri_wrap">
		<div id="content">
			<div class="company_honest_qna">
				<div class="contents_container">
					<div class="wrap_story_panel">
						<div class="wrap_section wrap_community_topic" style="margin-top: 36px;">
							<div class="wrap_title">
								<h3 class="main_tit">상품 신청목록</h3>
							</div>
							<c:set var="exprodList" value="${pagingVO.dataList }"/>
							<div class="list_num_tit sub">
								<strong class="count">총
									<span style="color: #ff3c00;">
										${pagingVO.totalRecord}
									</span>건
								</strong>
							</div>
							<div class="tblType">
								<table>
									<colgroup>
										<col width="80">
										<col width="250">
										<col width="200">
										<col width="400">
										<col width="150">
										<col width="150">
									</colgroup>
									<thead>
										<tr>
											<th>번호</th>
											<th>아이디</th>
											<th>신청자</th>
											<th>상품명</th>
											<th>분류</th>
											<th>가격</th>
											<th>신청일자</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty exprodList }">
												<c:forEach items="${exprodList }" var="exprod">
													<tr class="notice">
														<td>${exprod.rnum }</td>
														<td>${exprod.memId }</td>
														<td>${exprod.memName }</td>
														<td style="text-align: left;">
															${exprod.exprodName }
														</td>
														<c:if test="${exprod.exlprodId eq 'EL001'}">
															<td>클래스</td>
														</c:if>
														<c:if test="${exprod.exlprodId eq 'EL002'}">
															<td>컨설팅</td>
														</c:if>
														<td>${exprod.exprodPrice }</td>
														<td>${fn:substring(exprod.exprodAppliDate,0,10) }</td>
														<td>
															<a href='<c:url value="/systemManagement/acceptManagement/appliprodList/${exprod.exprodId}"/>'>
																상세보기
															</a>
														</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="8">
														목록 없음
													</td>
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
		</div>
	</div>
</div>





















