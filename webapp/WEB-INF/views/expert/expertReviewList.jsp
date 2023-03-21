<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023. 2. 1.      허근주      최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/saramin/help.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/saramin/components.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/saramin/layout.css">
<style>
.wrap_help .list_help dt>button:before {
	content: "•";
}	
</style>
<!-- 바디 영역 -->
<div id="sri_section" class="  has_banner">
	<div id="sri_wrap">
		<div id="content" style="width: 80%;">
			<h2 class="section-title mb-3" style="
			text-align: center;
		">후기</h2>
				<!-- <h1 class="title_common" style="font-size: 40px;">후기</h1>
			</div> -->
			<div class="wrap_help">
				<!-- 검색 -->
				<div class="search_help">
					<form action="/zf_user/help/help-word/help-search"
						onsubmit="return isValidation();">
						<label for="helpSearchInput" class="copy"> <strong>궁금한
								후기</strong>가 있으면 <br>검색해 주세요<i>!</i>
						</label> <input id="helpSearchInput" name="keyword"
							class="input_search_help" type="text"
							placeholder="검색어는 20자 이내로 입력해주세요." value="">
						<button class="btn_search_help" type="button">
							<span class="blind">검색하기</span>
						</button>
						<div class="suggetion">
							<span class="tit">추천검색어</span> <a href="" class="item">제목</a> <a
								href="" class="item">평점</a> <a href="" class="item">직업</a> <a
								href="" class="item">성별</a>
						</div>
					</form>
				</div>
				<!-- // 검색 -->
				<ul class="tabList">
					<li id="private" class="select">
						<button class="inTab" value="HPS">
							<!-- 컨트롤러로 값을 보내줌 -->
							<span>후기</span>
						</button>
					</li>
					<!--   					<li id="company" class=""> -->
					<!--       					<button class="inTab" value="HPI"> -->
					<!--           					<span>기업회원</span> -->
					<!--       					</button> -->
					<!--   					</li> -->
				</ul>
				<script>
					$("#company").click(function() {
						$("#private").removeClass("select");
						$("#company").addClass("select");
					});
					$("#private").click(function() {
						$("#company").removeClass("select");
						$("#private").addClass("select");
					});
				</script>

				<!-- ===========================도움말 구분 이름=========================== -->
				<!-- 				<ul class="tab_help" id="listName"><li class="select"><button class="inTab" name="nameTab" value="HPS000">전체</button></li><li><button class="inTab" name="nameTab" value="HPS006">전문가 신청</button></li><li><button class="inTab" name="nameTab" value="HPS001">이력서 등록/관리</button></li><li><button class="inTab" name="nameTab" value="HPS002">회원정보/아이디/비밀번호</button></li><li><button class="inTab" name="nameTab" value="HPS003">입사지원/관리</button></li><li><button class="inTab" name="nameTab" value="HPS004">채용정보 검색/관리</button></li><li><button class="inTab" name="nameTab" value="HPS005">회원가입/탈퇴</button></li></ul> -->
				<!-- ================================================================= -->

				<!-- 리스트 영역 -->
				<div class="wrap_list_help">
					<h2 class="tit_list_help" style="border-bottom: 1px solid;">
					</h2>
					<!-- ==========================도움말 리스트========================= -->
					<ul class="list_help" id="helpList">
						<c:set var="exreviewList" value="${pagingVO.dataList }"></c:set>
						<c:choose>
							<c:when test="${not empty exreviewList }">
								<c:forEach items="${exreviewList }" var="exreview">
						<li class="HPS002"><dl>
								<dt>
									<button class="btn_close">
										<span class="">${exreview.exreviewName }</span>
									</button>
								</dt>
								<dd class="answer"><p style="border-bottom: 1px solid;">상품명 : ${exreview.exprodName }</p> <br>${exreview.exreviewContent }</dd>
								<dd class="date1">작성자 :${exreview.exreviewWriter }</dd>
								<dd class="date2">등록일 : 2023-02-13</dd>
								<input hidden="hidden">
							</dl>
							<button class="close btn_close">
								접기<span></span>
							</button></li>
							</c:forEach>
						</c:when>
					</c:choose>
					</ul>
					<!-- =============================================================== -->
				</div>
			</div>
			<script type="text/javascript">
				var $list = jQuery('.list_help'), $li = jQuery('> li', $list);

				$list.on('click', '.btn_close', function() {
					var $this = jQuery(this).closest('li');
					if ($this.hasClass('select')) {
						$this.removeClass('select');
					} else {
						$li.removeClass('select');
						$this.addClass('select');
					}
				});

				function isValidation() {
					if (jQuery('#helpSearchInput').val().length > 20) {
						alert('검색어는 20자 이내로 입력해주세요.\n키워드로 검색하시면 더 많은 검색결과를 찾을 수 있습니다.');
						return false;
					}
					return true;
				};
			</script>
		</div>
	</div>
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
