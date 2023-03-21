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
    width: 95%;
}

.wrap_community_topic .section_inner {
    width: 490px; 
    height: 520px;
}

.wrap_community_topic .section_inner:nth-child(even) {
    float: left;
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
								<h3 class="main_tit">신고 목록</h3>
							</div>
							<div class="list_num_tit sub">
								<strong class="count">총
									<span style="color: #ff3c00;">
										${fn:length(reportList)}
									</span>건
								</strong>
							</div>
							<div class="tblType">
								<table>
									<colgroup>
										<col width="80">
										<col width="180">
										<col width="450">  
									</colgroup>
									<thead>
										<tr>
											<th>번호</th>
											<th>신고한 회원</th>
											<th>신고내용</th>
											<th>신고일자</th>
											<th>처리상태</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty reportList }">
												<c:forEach items="${reportList }" var="report">
													<tr>
														<td>${report.rnum }</td>
														<td>${report.memId }</td>
														<td>${report.boardRptReason }</td>
														<td>${fn:substring(report.boardRptDate,0,10) }</td>
														<td>${report.boardRptCheck }</td>
														<td>
															<a href='<c:url value="/board/boardDetail?boardNo=${report.boardRptNo }"/>'>
																상세보기
															</a>
														</td>
													</tr>
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
