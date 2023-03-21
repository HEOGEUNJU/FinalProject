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





<!-- 바디 영역 -->
	<div class="col-12 text-center" data-aos="fade">
		<h2 class="section-title mb-3">CONSULTING</h2>
	</div>
	<div class="container">
<%-- 		<div class="row justify-content-center mb-5" data-aos="fade-up">
			<div id="filters" class="filters text-center button-group col-md-7">
				            <a class="btn btn-primary active" href="<%=request.getContextPath() %>/expert/product">컨설팅</a>
				            <a class="btn btn-primary active" href="<%=request.getContextPath() %>/expert/class">클래스</a>
				<button class="btn btn-primary active" style="background: #dee2e6;"
					data-filter="*">All</button>
				<c:forEach items="${exfield }" var="exfield">
					<button class="btn btn-primary"
						data-filter=".${exfield.exfieldId }"
						style="color: #495057; background: #dee2e6;">${exfield.exfieldName }</button>
				</c:forEach>
			</div>
		</div> --%>
		<c:set var="exprodList" value="${pagingVO.dataList }"></c:set>
		<div id="posts" class="row no-gutter">
			<div class="your-class">
				<c:choose>
					<c:when test="${not empty exprodList }">
						<c:forEach items="${exprodList }" var="exprod">
							<div>
								<div
									class="item web col-6 col-sm-6 col-md-6 col-lg-4 col-xl-4 mb-4 ${exprod.exfieldId } block__87154  rounded">
									<a
										href="<%=request.getContextPath() %>/expert/prod/${exprod.exprodId }"
										class="item-wrap"> <span class="icon" style="color: white;">${exprod.exprodPr }</span>
										<img class="img-fluid"
										src="<%=request.getContextPath()%>/resources/images/MAIN.png" style="opactiy:0.5; height: 200px; width:450px;"/>
									</a>
									<h3><a href="<%=request.getContextPath() %>/expert/prod/${exprod.exprodId }" class="text-black">${exprod.exprodName }</a></h3>
									<div class="block__91147 d-flex align-items-center" onclick="expertDetail();">
										<figure class="mr-4">
											<img
												src="<%=request.getContextPath()%>/resources/images/Dobby.png"
												alt="Image" class="img-fluid" />
										</figure>
										<div>
											<h3 id="memID" data-memid="${exprod.memId }">${exprod.memName }</h3>
											<span class="position">${exprod.expertField }</span>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>
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
