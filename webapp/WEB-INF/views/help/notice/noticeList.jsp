<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui" %>
    
<!-- MAIN CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/board.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/help.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/components.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/layout.css">

<style>
.company_honest_qna .contents_container {
  	width: 90%;
}
.main_tit {
    color: #373f57;
    font-size: 24px;
    font-weight: bold;
    letter-spacing: -2px;
    line-height: 32px;
}
.wrap_board .tblType tbody td {
    height: 0px; 
}
</style>

<div id="sri_section" class="layout_full">
	<div id="sri_wrap">
		<c:set var="noticeList" value="${pagingVO.dataList}"/>
		<div id="content">
			<div class="company_honest_qna">
				<div class="contents_container">
					<div class="wrap_story_panel">
						<div class="wrap_section wrap_community_topic" style="margin-top: 36px;">
							<div>
							    <h3 class="main_tit">공지사항</h3>
							</div>
							<div class="wrap_board">
								<div class="search_area">
									<strong class="count" style="font-size: 20px;">총 <span class="num"> ${pagingVO.totalRecord} </span>건 </strong>
									<form:form id="searchUI" modelAttribute="simpleCondition" method="get" onclick="return false;">
										<div class="search_right">
											<span class="inpSel" style="border: 1px solid #dbdbdb;">
												<form:select path="searchType">
													<option value>전체</option>
													<form:option value="announcement" label="안내" />
													<form:option value="open" label="오픈" />
													<form:option value="etc" label="기타" />
												</form:select>
											</span>
											<div class="searchTypoBox">
												<form:input path="searchWord" style="width: 276px" class="inpTypo" placeholder="특수문자를 제외한 키워드를 입력해주세요."/>
												<input type="button" class="btnTypoSearch" value="검색"  id="searchBtn"/>
											</div>
										</div>
									</form:form>
								</div>
					
								<div class="tblType">
									<table>
										<colgroup>
											<col width="64" />
											<col width="" />
											<col width="600" />
											<col width="107" />
										</colgroup>
										<thead>
											<tr>
						          				<th>번호</th>
						          				<th>구분</th>
						          				<th>제목</th>
						          				<th>날짜</th>
						          				<th>조회수</th>
						          			</tr>
										</thead>
										<tbody>
											
											<c:choose>
						          				<c:when test="${not empty noticeList}">
						          					<c:forEach items="${noticeList }" var="notice">
						          						<c:if test="${notice.noticeDelDate eq null }">
							          						<tr class="notice">
							          							<td class="">${notice.rnum }</td>
							          							<td class="category">${notice.noticeSort }</td>
							          							<td class="content_tit">
							          								<a href="<c:url value='/help/notice/${notice.noticeSn }'/>"><c:out value='${notice.noticeTitle }'/></a>
							          							</td>
							          							<td class="date">${notice.noticeDate }</td>
							          							<td>${notice.noticeHit }</td>
							          						</tr>
						          						</c:if>
						          					</c:forEach>
						          				</c:when>
						          				<c:otherwise>
						          					<tr>
						          						<td colspan="5">게시글 없음.</td>
						          					</tr>
						          				</c:otherwise>
						          			</c:choose>
											
										</tbody>
										<tfoot>
						          			<tr>
						          				<td colspan="5" style="text-align: center;">
						          					<div id = "pagingArea" style="margin: 40px 210px;">
						          						<ui:pagination pagingVO="${pagingVO }"  type="bootstrap"/>
						          					</div>
						          				</td>
						          			</tr>
						          		</tfoot>
											
									</table>
									<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
										<form:hidden path="searchType"/>
										<form:hidden path="searchWord"/>
										<input type="hidden" name="page" />
									</form:form>
								</div>
								<!-- 운영자만 보여야함 -->
								<security:authorize url="/help/notice/noticeInsert">
								<div>
									<input type="button" value="등록" onclick="location.href='<c:url value="/help/notice/noticeInsert"/>'">
								</div>
								</security:authorize>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	
	
	
<script>
let searchForm = $("#searchForm");
let searchUI = $("#searchUI").on("click", "#searchBtn", function(){
	let inputs = searchUI.find(":input[name]");
	$.each(inputs, function(index, input){
		let name = this.name;
		let value = $(this).val();
		searchForm.find("[name="+name+"]").val(value);
	});
	searchForm.submit();
});

$("a.paging").on("click", function(event){
	event.preventDefault();
	let page = $(this).data("page");
	if(!page) return false;
	searchForm.find("[name=page]").val(page);
	searchForm.submit();
	return false;
});

</script>


<!-- SCRIPTS -->
<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/isotope.pkgd.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/stickyfill.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.fancybox.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.easing.1.3.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.waypoints.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.animateNumber.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/owl.carousel.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/quill.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap-select.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
