<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.ddit.or.kr/class305"  prefix="ui"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- CSS -->
<link rel="shortcut icon" href="ftco-32x32.png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom-bs.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/line-icons/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/layout.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/board.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/pattern.css" />

<style type="text/css">
#paging{font-size: 22pt;}
#sri_lnb .navi_depth3 li a {display: grid;padding: 0 16px;height: 44px;border-radius: 8px;white-space: nowrap;align-items: center;font-weight: initial;}
</style>
</head>

<body>
<!-- principal.realMember : MemberVO -->
<security:authorize access="isAuthenticated()"><!-- 로그인 되었다면.. -->
	<security:authentication property="principal.realMember" var="memberVO" />
</security:authorize>
	<c:if test="${param.gubun!='7'}">
		<div id="sri_lnb">
			<div class="btn btn_prev">
				<button type="button">
					<span class="blind">이전</span>
				</button>
			</div>
			<div class="wrap_lnb">
				<ul class="navi_depth3" style="width: 794px;">
					<li>
						<a class="<c:if test="${fn:length(param.gubun)<1}">active</c:if>" aria-current="page" href="${pageContext.request.contextPath}/board/boardTotal?gubun=">전체글</a>
					</li>
					<li>
						<a class="<c:if test="${param.gubun=='1'}">active</c:if>" href="${pageContext.request.contextPath}/board/boardTotal?gubun=1">신입</a>
					</li>
					<li>
						<a class="<c:if test="${param.gubun=='2'}">active</c:if>" href="${pageContext.request.contextPath}/board/boardTotal?gubun=2">취준</a>
					</li>
					<li>
						<a class="<c:if test="${param.gubun=='3'}">active</c:if>" href="${pageContext.request.contextPath}/board/boardTotal?gubun=3">채용공고</a>
					</li>
					<li>
						<a class="<c:if test="${param.gubun=='4'}">active</c:if>" href="${pageContext.request.contextPath}/board/boardTotal?gubun=4">자소서</a>
					</li>
					<li>
						<a class="<c:if test="${param.gubun=='5'}">active</c:if>" href="${pageContext.request.contextPath}/board/boardTotal?gubun=5">면접</a>
					</li>
					<li>
						<a class="<c:if test="${param.gubun=='6'}">active</c:if>" href="${pageContext.request.contextPath}/board/boardTotal?gubun=6">Q&amp;A</a>
					</li>
				</ul>
			</div>
			<div class="btn btn_next">
				<button type="button">
					<span class="blind">다음</span>
				</button>
			</div>
		</div>
	</c:if>

	<div id="sri_section" class=" layout_full ">
		<div id="sri_wrap">
			<div id="content">
				<div class="company_honest_qna">
					<input type="hidden" name="qna_action" value="sub" id="qna_action">
					<input type="hidden" name="keyword" value="" id="keyword">
					<input type="hidden" name="qna_searchType" value="" id="qna_searchType">
					<input type="hidden" name="csn" value="" id="csn">
					<input type="hidden" name="influencer" value="" id="influencer">
					<input type="hidden" name="type" value="" id="type">

					<!-- ?gubun=0 0:모두 / 1:신입 / 2:취준 / 3:퇴사 / 4:잡담-->
					<div class="contents_container">
						<div class="sub_top_wrap tag_list">
							<c:if test="${fn:length(param.gubun)<1}">
								<span class="sub_title_tag">
									<strong class="stit">게시글 전체</strong> 방
								</span>
								<div class="sub_title_desc">현재까지 등록된 전체 게시글입니다.</div>
							</c:if>
							<c:if test="${param.gubun=='1'}">
								<span class="sub_title_tag">
									<strong class="stit">신입</strong> 방
								</span>
								<div class="sub_title_desc">“신입” 관련 이야기를 공유하는 방입니다</div>
							</c:if>
							<c:if test="${param.gubun=='2'}">
								<span class="sub_title_tag">
									<strong class="stit">취준</strong> 방
								</span>
								<div class="sub_title_desc">“취준” 관련 이야기를 공유하는 방입니다</div>
							</c:if>
							<c:if test="${param.gubun=='3'}">
								<span class="sub_title_tag">
									<strong class="stit">채용공고</strong> 방
								</span>
								<div class="sub_title_desc">“채용공고” 관련 이야기를 공유하는 방입니다</div>
							</c:if>
							<c:if test="${param.gubun=='4'}">
								<span class="sub_title_tag">
									<strong class="stit">자소서</strong> 방
								</span>
								<div class="sub_title_desc">“자소서” 관련 이야기를 공유하는 방입니다</div>
							</c:if>
							<c:if test="${param.gubun=='5'}">
								<span class="sub_title_tag">
									<strong class="stit">면접</strong> 방
								</span>
								<div class="sub_title_desc">“면접” 관련 이야기를 공유하는 방입니다</div>
							</c:if>
							<c:if test="${param.gubun=='6'}">
								<span class="sub_title_tag">
									<strong class="stit">Q&amp;A</strong> 방
								</span>
								<div class="sub_title_desc">“Q&amp;A” 관련 이야기를 공유하는 방입니다</div>
							</c:if>
							<c:if test="${param.gubun=='7'}">
								<span class="sub_title_tag">
									<strong class="stit">이번주 인기글</strong>
								</span>
								<div class="sub_title_desc">지난 3일동안 조회수가 높았던 인기글 10개입니다.</div>
							</c:if>
						</div>

						<!-- 검색 -->
							<c:if test="${param.gubun!='7'}">
						<div class="search_form">
								<div class="list_num_tit sub">전체
									<strong id="totalCnt"></strong>건
								</div>

							<form:form id="searchUI" modelAttribute="simpleCondition" method="get" onclick="return false;">
							<div class="box_search">
								<div class="input_keyword">
									<form:input type="text" path="searchWord" id="input_keyword" value="" placeholder="다른 사람들은 어떤 이야기를 할까?" class="inpTypo" title="키워드, 기업명 입력"/>
									<button type="button" id="searchBtn" class="spr btn_search">
										<svg class="icon_search">
                        					<use xlink:href="#svg_my_8"></use>
                      					</svg>
									</button>
								</div>
							</div>

							<div class="" style="display: none">
								<svg xmlns="http://www.w3.org/2000/svg">
                    				<symbol id="svg_my_8" viewBox="0 0 24 24">
                      					<path fill="currentColor"
										d="M7 0c3.866 0 7 3.134 7 7 0 1.756-.647 3.36-1.714 4.59l.068.056 3.394 3.395c.195.195.195.511 0 .707-.174.173-.443.193-.638.058l-.07-.058-3.394-3.394-.056-.068C10.36 13.353 8.756 14 7 14c-3.866 0-7-3.134-7-7s3.134-7 7-7zm0 1C3.686 1 1 3.686 1 7s2.686 6 6 6 6-2.686 6-6-2.686-6-6-6z"
										transform="translate(-1125 -399) translate(447 335) translate(678 64) translate(4 4)">
										</path>
                    				</symbol>
                  				</svg>
							</div>
						</form:form>
						</div>
						</c:if>
						<!-- //검색 -->

						<div class="qna_list_wrap">
							<c:if test="${param.gubun!='7'}">
								<div class="qna_list_sort">
									<div class="icoChk_outline filter">
										<span class="inpChk icoChk">
											<input type="checkbox" id="popular" class="btn_sort" value="popular">
											<label class="lbl" for="popular">인기순</label>
										</span>
										<span class="inpChk icoChk">
											<input type="checkbox" id="reg_dt" class="btn_sort" value="reg_dt" checked="checked">
											<label class="lbl" for="reg_dt">최신순</label>
										</span>
										<span class="inpChk icoChk">
											<input type="checkbox" id="maxLike" class="btn_sort" value="maxLike">
											<label class="lbl" for="maxLike">공감 많은 순</label>
										</span>
										<span class="inpChk icoChk"> <input type="checkbox" id="maxAnwr" class="btn_sort" value="maxAnwr">
											<label class="lbl" for="maxAnwr">댓글 많은 순</label>
										</span>
									</div>

									<button type="button" class="btnSizeL btn_qna_write"
										onclick="location.href='${pageContext.request.contextPath }/board/boardInsert?gubun=${param.gubun}'">게시글 작성</button>
								</div>
							</c:if>

							<ul class="qna_list" id="qst_and_ans_list">
								<div class="list_qna">
									<span class="position" style="transform: translateY(66px);">
								</span>

									<c:set var="boardList" value="${boardVOList }" />
									<c:choose>
										<c:when test="${not empty boardList }">
											<c:forEach items="${boardList }" var="boardList">
												<li>
													<c:url value="/board/boardDetail" var="viewURL">
														<c:param name="boardNo" value="${boardList.boardNo }" />
													</c:url>
													<div class="qna_subject_wrap">
														<span class="qna_subject">${boardList.boardTitle }</span>
													</div>
														<span class="qna_desc">${boardList.boardContent }</span>
													<div class="qna_data_infos">
														<div class="emoticons_wrap">
															<span class="emoticon">
																<img src="http://www.saraminimage.co.kr/sri/company_review/list_emoji_cheer.png">
															</span>
															<span class="emoticon">
																<img src="http://www.saraminimage.co.kr/sri/company_review/list_emoji_help.png">
															</span>
															<span class="emoticon_num">공감 <strong></strong></span>
														</div>
														<span class="qna_info qna_reply">댓글 <strong>${boardList.replyCnt }</strong></span>
														<span class="qna_info qna_view">조회 <strong>${boardList.boardHits }</strong></span>
														<div class="qna_member_info">
															<span class="qna_from"> ${boardList.memId }님이 ${boardList.boardDate } 작성 </span>
															<div class="toolTipWrap">
																<button type="button" class="btn_qna_bookmark reputeScrap " data-idx="8703" data-value="y" data-reported="n">스크랩</button>
															</div>
														</div>
													</div>
														<a href="${viewURL }" class="go">자세히 보기</a>
												</li>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<li>등록된 게시글 없음.</li>
										</c:otherwise>
									</c:choose>
								</div>
							</ul>
							<c:if test="${param.gubun!='7'}">
								<div class="pagingArea"></div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
	<input type="hidden" name="page" />
	<input type="hidden" name="searchWord"/>
	<input type="hidden" name="likeCheck"/>
	<input type="hidden" name="boardNo" value="${boardList.boardNo }"/>
</form:form>

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
<script src="${pageContext.request.contextPath}/resources/js/board/common.js"></script>
<script type="text/javascript">

	// 정렬
	$("input[type=checkBox]").on("click", function() {
		$("input:checkbox").prop("checked", false);
		$(this).prop("checked", true);

		let data = $(this).val();
		let body = $("#qst_and_ans_list");
		// console.log($(".page-item.active").children().html());
		let currentPage = $(".page-item.active").children().html();

		$.ajax({
			url : "${pageContext.request.contextPath}/board/boardTotal",
			method : "get",
			data : {
				data : data,
				page : currentPage
			},
			dataType : "json" // 응답데이터
			,
			success : function(resp) { // 요청처리 성공 -> 데이터(resp)
				body.empty();
				let dataList = resp.pagingVO.dataList;
				$.each(dataList, function(index, board){
					body.append(makeTrTag(board));
				});
			},
			error : function(jqXHR, status, error) { // 에러에 대한 정보(받아올 데이터)
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});

	let listBody = $("#qst_and_ans_list");

	let pagingArea = $(".pagingArea").on("click", "a.paging", function(event){
		event.preventDefault();
		let page = $(this).data("page");
		if(!page) return false;
		searchForm.find("[name=page]").val(page);
		searchForm.submit();
		return false;
	});

	let makeTrTag = function(board){
		console.log("board:",board);
		return $("<li>").append(
					$("<a>").attr("href","${pageContext.request.contextPath}/board/boardDetail?boardNo="+board.boardNo).append(
						$("<div>").attr("class","qna_subject_wrap").append(
							$("<span>").attr("class","qna_subject").html(board.boardTitle)
						),

							$("<span style='font-weight: initial;'>").attr("class","qna_desc").html(board.boardContent),
						$("<div>").attr("class","qna_data_infos").append(
							$("<div>").attr("class","emoticons_wrap").append(

							$("<span style='font-weight: initial;'>").attr("class","qna_info qna_like").html("공감").append($("<strong>").html(board.likeCnt))),
							$("<span style='font-weight: initial;'>").attr("class","qna_info qna_reply").html("댓글").append($("<strong>").html(board.replyCnt)),
							$("<span style='font-weight: initial;'>").attr("class","qna_info qna_view").html("조회").append($("<strong>").html(board.boardHits)),

							$("<div>").attr("class","qna_member_info").append($("<span>").attr("class","qna_from").html(board.memId+"님이"+" "+board.boardDate+"작성")
							))));
	}


	// 페이징&검색
	let searchForm = $("#searchForm").on("submit", function(event){
		event.preventDefault();
		let url = this.action;
		let method = this.method;
		let queryString = $(this).serialize();
		console.log("url:",url, "method:", method, "queryString:", queryString);

		let checkBoxs = $("input:checkbox");
		let data = "";
		for (let i = 0; i < checkBoxs.length; i++) {
			if ($(checkBoxs[i]).is(":checked")) {
				data = $(checkBoxs[i]).val();
			}
		}

		queryString = queryString + "&data=" + data;
		console.log(">>>>>>>>>>>>>>>>>>",queryString);

		$.ajax({
			url : url,
			method : method,
			data : queryString,
			dataType : "json",
			success : function(resp) {
				console.log("여기",resp);
				$("#totalCnt").html(resp.pagingVO.totalRecord);
				listBody.empty();
				pagingArea.empty();
				searchForm[0].page.value="";
				let pagingVO = resp.pagingVO;
				let dataList = pagingVO.dataList;

				let trTags = [];

				console.log("dataList" ,dataList);

				if(dataList.length>0){
					$.each(dataList, function(index, board){
						console.log("boardNo",board.boardNO)
						$.ajax({
							url:"replyCount",
							type: "post",
							dataType:"text",
							async:false,  // 순서상 일단 어쩔수 없이 동기
							data:{
								boardNo:board.boardNo
							},
							success:function(count){
								board.replyCnt = count;
							},
						})
						console.log("넘기기전  체크:",board);
						trTags.push(makeTrTag(board));
					});
				}else{
					let tr = $("<ul>").append(
								$("<div>").attr("class","list_qna").append(
									$("<span style='transform: translateY(66px);'>").attr("class","position"),
									$("<div>").attr("class","qna_list_none").append(
										$("<span>").attr("class","none_tit").html("앗! 해당 검색어에 대한 글이 없어요ㅠㅠ"),
										$("<br>"),
										$("<span>").attr("class","none_txt").html("검색한 글에 대해 먼저 남겨보세요!")
									)
								)
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

	// 검색
	let searchUI = $("#searchUI").on("click", "#searchBtn", function(){
		let inputs = searchUI.find(":input[name]");
		$.each(inputs, function(index, input){
			let name = this.name;
			let value = $(this).val();
			searchForm.find("[name="+name+"]").val(value);
		});
		searchForm.submit();
	});

	// 엔터로 검색
	$('#input_keyword').keypress(function(event){
	     if ( event.which == 13 ) {
	         $('#searchBtn').click();
	         return false;
	     }
	});
</script>
</body>