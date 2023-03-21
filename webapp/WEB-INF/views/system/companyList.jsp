<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/layout.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/board.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/pattern.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/components.css"/>  

<style>
.company_honest_qna .contents_container {
    width: 90%;
}

.wrap_community_topic .section_inner {
    width: 490px;
    height: 520px;
}

.wrap_community_topic .section_inner:nth-child(even) {
    float: left;
}
.company_honest_qna .contents_container {
    width: 95%;
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
								<h3 class="main_tit">기업 목록</h3>
							</div>
							<c:set var="companyList" value="${pagingVO.dataList }"/>
							<div class="list_num_tit sub">
								<strong class="count">총
									<span style="color: #ff3c00;">
										${pagingVO.totalRecord}
									</span>건
								</strong>
							</div>
							<div class="tblType">
								<table>
									<thead>
										<tr>
											<th>회사아이디</th>
											<th>법인명</th>
											<th>회사대표자성명</th>
											<th>회사설립일자</th>
											<th>회사형태</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty companyList }">
												<c:forEach items="${companyList }" var="company">
													<c:if test="${company.cmpCheck eq 'Y' }">
														<tr>
															<td>${company.cmpId }</td>
															<td>${company.cmpName }</td>
															<td>${company.cmpRepName }</td>
															<td>${company.cmpEstblDate }</td>
															<td>${company.cmpSmenp }</td>
															<td>
																<a href='<c:url value="/systemManagement/companyList/${company.cmpId }"/>'>
																	상세보기
																</a>
															</td>
														</tr>
													</c:if>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="6">목록 없음.</td>
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

<script src="<%=request.getContextPath()%>/resources/js/isotope.pkgd.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/stickyfill.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.waypoints.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.animateNumber.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>  