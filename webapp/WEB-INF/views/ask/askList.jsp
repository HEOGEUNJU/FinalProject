<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.ddit.or.kr/class305"  prefix="ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="Free-Template.co" />

<!-- MAIN CSS -->
<link rel="shortcut icon" href="ftco-32x32.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom-bs.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/line-icons/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/layout.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/components.css" />
<style>
.wrap_board.wrap_help .copy {margin-bottom: 20px;color: #444;font-size: 15px;letter-spacing: -1px;line-height: 22px;}
.pagination {margin: 40px 492px;}
</style>

</head>

<body id="top">
	<div class="site-wrap">
		<!-- 작성 -->
		<div id="sri_section" class="  has_banner" style="padding-left:250px;padding-right:250px;">
			<div id="sri_wrap">
				<div id="content" style="width: 100%;">
					<div class="wrap_title_recruit">
						<h1 class="title_common">내 문의 내역</h1>
					</div>
					<div class="wrap_board wrap_help">
						<p class="copy">
							평일 09시 에서 17시 까지 문의하신 내용은 당일 답변해드립니다.<br> 17시 이후에 문의하신 내용은
							다음날에 답변, 주말에 문의하신 내용은 그 다음주 월요일에 답변해 드립니다.
						</p>
						<div class="tblType">

							<table>
								<colgroup>
									<col style="width: 100px">
									<col style="width: 230px">
									<col>
									<col style="width: 100px">
									<col style="width: 90px">
								</colgroup>

								<tbody id="ask_list">
									<tr>
										<th class="count">문의번호</th>
										<th class="category">문의종류</th>
										<th class="content_tit">제목</th>
										<th class="date">등록일</th>
										<th class="status end">처리상태</th>
									</tr>

										<c:choose>
											<c:when test="${not empty askList }">
												<c:forEach items="${askList }" var="ask">
													<tr>
														<td id="askNo">${ask.askNo}</td>
														<td>${ask.askType }</td>
														<td><c:url value="/ask/detailAsk" var="viewURL">
																<c:param name="askNo" value="${ask.askNo }" />
															</c:url> <a href="${viewURL}">${ask.askTitle }</a></td>
														<td>${ask.askDate }</td>
														<td>${ask.askStatus}</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="5">게시글 없음.</td>
												</tr>
											</c:otherwise>
										</c:choose>

								</tbody>
							</table>
						</div>
						<!-- 페이지 -->
						<div class="pagingArea"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/stickyfill.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-select.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>

<form id="searchForm">
	<input type="hidden" name="page" />
</form>

<script type="text/javascript">
	$("[name=searchType]").val("${simpleCondition.searchType}");
	$("[name=searchWord]").val("${simpleCondition.searchWord}");


	let listBody = $("#ask_list");

	let pagingArea = $(".pagingArea").on("click", "a.paging", function(event){
		event.preventDefault();
		let page = $(this).data("page");
		if(!page) return false;
		searchForm.find("[name=page]").val(page);
		searchForm.submit();
		return false;
	});

	let headerTag = function(){
		return $("<tr>").append(
			$("<td>").attr("class","count").html("문의번호"),
			$("<td style=text-align:left;>").attr("class","category").html("문의종류"),
			$("<td>").attr("class","content_tit").html("제목"),
			$("<td>").attr("class","date").html("등록일"),
			$("<td>").attr("class","status end").html("처리상태")
		);
	}

	let makeTrTag = function(ask){
		return $("<tr>").append(
			$("<td>").html(ask.askNo.substring(4)),
			$("<td style=text-align:left;>").html(ask.askType),
			$("<td>").append(
				$("<a>").attr("href","${pageContext.request.contextPath}/ask/detailAsk?askNo="+ask.askNo).html(ask.askTitle)
			),
			$("<td>").html(ask.askDate),
			$("<td>").html(ask.askStatus)
		);
	}


	let searchForm = $("#searchForm").on("submit", function(event){
		event.preventDefault();
		let url = this.action;
		let method = this.method;
		let queryString = $(this).serialize();
		$.ajax({
			url : url,
			method : method,
			data : queryString,
			dataType : "json",
			success : function(resp) {
				listBody.empty();
				pagingArea.empty();
				searchForm[0].page.value="";

				let pagingVO = resp.pagingVO;

				let dataList = pagingVO.dataList;
				let trTags = [];

				trTags.push(headerTag());
				if(dataList != null && dataList != ""){
					$.each(dataList, function(index, ask){
						if(ask.refContent == null) {
							ask.askStatus = "확인중";
						}else{
							ask.askStatus = "답변완료";
						}
						trTags.push(makeTrTag(ask));
					});
				}else{
					let tr = $("<tr>").html(
						$("<td>").attr("colspan", "5").html("문의게시글 없음.")
					);
					trTags.push(tr);
				}
				listBody.html(trTags);
				if(resp.pagingHTML)
					pagingArea.html(resp.pagingHTML);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		return false;
	}).submit();

	let searchUI = $("#searchUI").on("click", "#searchBtn", function(){
		let inputs = searchUI.find(":input[name]");
		$.each(inputs, function(index, input){
			let name = this.name;
			let value = $(this).val();
			searchForm.find("[name="+name+"]").val(value);
		});
		searchForm.submit();
	});

</script>
</body>
</html>