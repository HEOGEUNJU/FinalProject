<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023. 2. 1.      허근주      최초작성
* 2023. 2. 2.      허근주      바디 마진 입력, 사이드바 제거
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/board.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/help.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/components.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/layout.css">
<style>
.pagination{
	justify-content: center;
}
</style>
<style>
/* 더잠실체  */
@font-face {
	font-family: 'TheJamsil5Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

/* 나눔스퀘어 네오 */
@font-face {
	font-family: 'NanumSquareNeo-Variable';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

.owl-item cloned {
	width: 400px;
}

.img-fluid:hover {
	opacity: 0.5;
}

.site-section {
	padding-bottom: 0px;
}

.company_honest_qna .contents_container {
	width: 90%;
}

.main_tit {
	color: #373f57;
	font-size: 30px;
	font-weight: bold;
	letter-spacing: -2px;
	line-height: 32px;
}
.exprodName_tit {
	color: #373f57;
	font-size: 21px;
	font-weight: bold;
	letter-spacing: -2px;
	line-height: 32px;
}

.wrap_board .tblType tbody td {
	height: 0px;
}

</style>

<section class="site-section block__62272" id="next-section">
<!-- 바디 영역 -->
	<div class="col-12 text-center" data-aos="fade">
		<h2 class="section-title mb-3">상담</h2>
	</div>
	<div class="container">
		<div class="row justify-content-center mb-5" data-aos="fade-up">
			<div id="filters" class="filters text-center button-group col-md-7">
				<%--             <a class="btn btn-primary active" href="<%=request.getContextPath() %>/expert/product">컨설팅</a> --%>
				<%--             <a class="btn btn-primary active" href="<%=request.getContextPath() %>/expert/class">클래스</a> --%>
				<button class="btn btn-primary active" style="background: #dee2e6;"
					data-filter="*">All</button>
				<c:forEach items="${exfield }" var="exfield">
					<button class="btn btn-primary"
						data-filter=".${exfield.exfieldId }"
						style="color: #495057; background: #dee2e6;">${exfield.exfieldName }</button>
				</c:forEach>
			</div>
		</div>
		<div class="wrap_board" data-aos="fade">
			<div class="search_area">
				<form id="searchUI" onclick="return false;" action="/INUProject/expert/event" method="get">
			<div class="search_right">
					<span class="inpSel" style="border: 1px solid #dbdbdb;">
					<select id="searchType" name="searchType">
						<option value="">전체</option>
						<option value="announcement">알림</option>
						<option value="open">오픈</option>
						<option value="etc">기타</option>
					</select>
					</span>
					<div class="searchTypoBox">
					<input id="searchWord" name="searchWord" class="inpTypo" type="text" value="" style="
					    width: 70%;
					">
					<input type="button" class="btnTypoSearch" value="검색" id="searchBtn">
					</div>
			</div>
				</form>
			</div>
			</div>
		<c:set var="exprodList" value="${pagingVO.dataList }"></c:set>
		<div class="row no-gutter" id="posts" >
				<c:choose>
					<c:when test="${not empty exprodList }">
						<c:forEach items="${exprodList }" var="exprod">
								<div
									class="item web col-6 col-sm-6 col-md-6 col-lg-4 col-xl-4 mb-4 ${exprod.exfieldId } block__87154  rounded">
									<a
										href="<%=request.getContextPath() %>/expert/prod/${exprod.exprodId }" style="
    opacity: 0.7;
"
										class="item-wrap"> <span class="icon" style="color: white;"><h4 style="font-weight: 900;border-top: solid;border-bottom: solid;margin-top: 10px; color: white;">${exprod.exprodPr }</h4></span>
										<img class="img-fluid"
										src="<%=request.getContextPath()%>/resources/images/MAIN.png" style="opactiy:0.5; height: 200px; width:450px;"/>
									</a>
									<h3 class="exprodName_tit"style="font-family: 'NanumSquareNeo-Variable'; height: 71px;">${exprod.exprodName }</h3>
									<div class="block__91147 d-flex align-items-center" onclick="expertDetail();" style="
								max-height: 43px;">
										<figure class="mr-4">
											<img
												src="<spring:url value='/image/memberFolder/${exprod.attSavename}'/>"
												alt="Image" class="img-fluid" />
										</figure>
										<div>
											<h3 id="memID" data-memid="${exprod.memId }">${exprod.memName }</h3>
											<span class="position">${exprod.expertField }</span>
										</div>
									</div>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
		</div>
	</div>
		<div id="pagingArea">
			<%--                ${pagingVO } --%>
			<%--                <%=new BootstrapPaginationRender().renderPagination((PagingVO)request.getAttribute("pagingVO")) %> --%>
			<ui:pagination pagingVO="${pagingVO }" type="bootstrap" />
		</div>

<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
	<form:hidden path="searchType" />
	<form:hidden path="searchWord" />
	<input type="hidden" name="page" />
</form:form>
</section>
<script type="text/javascript">
	let searchForm = $("#searchForm");
	let searchUI = $("#searchUI").on("click", "#searchBtn", function() {
		let inputs = searchUI.find(":input[name]");
		$.each(inputs, function(index, input) {
			let name = this.name;
			let value = $(this).val();
			searchForm.find("[name=" + name + "]").val(value);
		});
		searchForm.submit();
	});

	$("a.paging").on("click", function(event) {
		event.preventDefault();
		let page = $(this).data("page");
		if (!page)
			return false;
		searchForm.find("[name=page]").val(page);
		searchForm.submit();
		return false;
	});
</script>
