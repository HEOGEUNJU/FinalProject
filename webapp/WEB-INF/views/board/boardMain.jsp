<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui" %>

<head>
<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom-bs.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/line-icons/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/quill.snow.css" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/layout.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/board.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/pattern.css" />

<style>
a:hover {text-decoration: none;}
element.style {padding: 9px 12px 11px 12px;height: 40px;/* border: 1px solid #d7dce5; */border-radius: 4px;box-sizing: border-box;color: #373f57;font-family: "Malgun Gothic",gulim,dotum,sans-serif;font-size: 14px;letter-spacing: -1px;line-height: 20px;vertical-align: middle;background-color: #fff;}
.wrap_community_topic .wrap_slide_category {position: relative;margin-top: 32px;padding-right: 0px;}
.wrap_community_topic .wrap_slide_category:after {display: contents;position: absolute;top: 0;right: 76px;z-index: 5;width: 37px;height: 100%;background: linear-gradient(to right, rgba(255, 255, 255, 0) -22%, rgba(255, 255, 255, 1) 33%);content: "";}
.txt_subject{font-weight: initial;}
.wrap_story_panel .list_story .link {
    overflow: hidden;
    float: left;
    width: calc(100% - 170px);
    height: 24px;
    box-sizing: border-box;
    color: #373f57;
    font-size: 16px;
    letter-spacing: -1px;
    line-height: 24px;
    text-overflow: ellipsis;
    white-space: nowrap;
}
</style>
</head>
<body id="top">
	<!-- 작성 -->
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
					<div class="contents_container">
						<ul class="main_banners banners_th"></ul>
						<div class="wrap_area_left">
							<div class="wrap_story_panel">
								<div class="qna_search">
									<h3 class="title">
										<a href="${pageContext.request.contextPath }/board/boardTotal" class="link_go">실시간 전체글
											<c:set var="cnt" value="${pagingVO.totalRecord }"></c:set>
											<span class="count">${cnt}</span>개
										</a>
									</h3>
									<!-- 검색 -->
									<div class="search_form">
										<form:form id="searchUI" modelAttribute="simpleCondition" method="get" onclick="return false;">
							              <div class="box_search">
							                <div class="input_keyword">
							                  <input type="text" name="input_keyword" id="input_keyword" value="" placeholder="다른 사람들은 어떤 이야기를 할까?" class="inpTypo" title="키워드, 기업명 입력">
							                  	<button type="button" class="spr btn_search">
							                    	<svg class="icon_search">
							                     	 <use xlink:href="#svg_my_8"></use>
							                   		</svg>
							                    </button>
							                </div>
							              </div>
						                <div class="" style="display:none">
						                  <svg xmlns="http://www.w3.org/2000/svg">
						                    <symbol id="svg_my_8" viewBox="0 0 24 24">
						                      <path fill="currentColor"
						                        d="M7 0c3.866 0 7 3.134 7 7 0 1.756-.647 3.36-1.714 4.59l.068.056 3.394 3.395c.195.195.195.511 0 .707-.174.173-.443.193-.638.058l-.07-.058-3.394-3.394-.056-.068C10.36 13.353 8.756 14 7 14c-3.866 0-7-3.134-7-7s3.134-7 7-7zm0 1C3.686 1 1 3.686 1 7s2.686 6 6 6 6-2.686 6-6-2.686-6-6-6z"
						                        transform="translate(-1125 -399) translate(447 335) translate(678 64) translate(4 4)"></path>
						                    </symbol>
						                  </svg>
						                </div>
										</form:form>
										</div>
									</div>

								<!-- 인기글 -->
								<div class="wrap_section wrap_best_story">
									<div class="section_inner" style="padding-bottom: 17px;">
										<div class="wrap_title">
											<h4 class="title">
												<a href="${pageContext.request.contextPath}/board/boardTotal?gubun=7" class="link_go">
													<b class="hot">HOT</b> 이번주 전체 인기 글 🔥
												</a>
											</h4>
											<a href="${pageContext.request.contextPath}/board/boardTotal?gubun=7" class="link_more">더보기</a>
										</div>

										<ul class="list_story">
											<c:set var="boardList" value="${boardVOList }" />
											<c:set var="counter" value="1" />
											<c:choose>
												<c:when test="${not empty boardList }">
													<c:forEach var="boardVO" items="${boardList}" varStatus="stat">
															<c:set var="counter" value="${counter+1}" />
														<c:url value="/board/boardDetail" var="viewURL">
															<c:param name="boardNo" value="${boardVO.boardNo }" />
														</c:url>
														<ul class="list_story">
															<li style="margin: 0 0 17px">
																<a href="${viewURL }" class="link">
																	<span class="txt_subject">
																		<c:out value="${boardVO.boardTitle }" />
																	</span>
																</a>
																<div class="util">
																	<span class="reply">${boardVO.replyCnt }</span>
																	<span class="views">${boardVO.boardHits }</span>
																</div>
															</li>
														</ul>
													</c:forEach>

												</c:when>
												<c:otherwise>
													<li>등록된 게시글 없음.</li>
												</c:otherwise>
											</c:choose>
										</ul>
									</div>
								</div>

								<!-- 주제별 커뮤니티 -->
								<div class="wrap_section wrap_community_topic">
									<div class="wrap_title">
										<h3 class="main_tit">주제별 커뮤니티</h3>
									</div>
									<div class="wrap_slide_category">
									   <ul class="list_category js-category" style="max-width: 889px;margin: 0 0 0 32px;">
											<li aria-hidden="false" style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
											<!-- selected -->
												<a class="item_cate selected" href="${pageContext.request.contextPath}/board/boardTotal?gubun=">
													전체글
												</a>
											</li>
											<li aria-hidden="false" style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
												<a class="item_cate" href="${pageContext.request.contextPath}/board/boardTotal?gubun=1">
													신입
												</a>
											</li>
											<li aria-hidden="false" style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
												<a class="item_cate" href="${pageContext.request.contextPath}/board/boardTotal?gubun=2">
													취준 </a>
											</li>
											<li aria-hidden="false" style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
												<a class="item_cate" href="${pageContext.request.contextPath}/board/boardTotal?gubun=3">
													채용공고
												</a>
											</li>
											<li aria-hidden="false" style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
												<a class="item_cate" href="${pageContext.request.contextPath}/board/boardTotal?gubun=4">
													자소서 </a>
											</li>
											<li aria-hidden="false" style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
												<a class="item_cate" href="${pageContext.request.contextPath}/board/boardTotal?gubun=5">
													면접
												</a>
											</li>
											<li aria-hidden="true" style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
												<a class="item_cate" href="${pageContext.request.contextPath}/board/boardTotal?gubun=6">
													Q&amp;A
												</a>
											</li>
										</ul>
									</div>

									<!-- 전체글 -->
									<div class="community_list">
										<li>
											<div class="section_inner">
												<div class="wrap_title">
													<h4 class="title">
														<a href="${pageContext.request.contextPath }/board/boardTotal" class="link_go">전체글</a>
													</h4>
													<a href="${pageContext.request.contextPath }/board/boardTotal" class="link_more">더보기</a>
												</div>

												<c:set var="boardList" value="${pagingVO.dataList}" />
											<c:set var="counter" value="1" />
											<c:choose>
												<c:when test="${not empty boardList }">
													<!-- varStatus : 반복문에서 사용할 변수 -->
													<c:forEach var="boardVO" items="${boardList}" varStatus="stat">
														<c:if test="${counter lt 5}">
															<c:set var="counter" value="${counter+1}" />
															<c:url value="/board/boardDetail" var="viewURL">
																<c:param name="boardNo" value="${boardVO.boardNo}" />
															</c:url>
															<ul class="list_story">
																<li style="margin: 0 0 17px">
																	<a href="${viewURL }" class="link">
																		<span class="txt_subject">
																			<c:out value="${boardVO.boardTitle }" />
																		</span>
																	</a>
																	<div class="util">
																		<span class="reply">${boardVO.replyCnt }</span>
																	</div>
																</li>
															</ul>
														</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<li>등록된 게시글 없음.</li>
												</c:otherwise>
											</c:choose>
											</div>
										</li>

										<!-- 신입 -->
										<div class="section_inner">
											<div class="wrap_title">
												<h4 class="title">
													<a href="${pageContext.request.contextPath}/board/boardTotal?gubun=1" class="link_go">신입</a>
												</h4>
													<a href="${pageContext.request.contextPath}/board/boardTotal?gubun=1" class="link_more">더보기</a>
											</div>

											<!-- boardList : List<BoardVO> -->
											<c:set var="boardList" value="${pagingVO.dataList}" />
											<c:set var="counter" value="1" />
											<c:choose>
												<c:when test="${not empty boardList }">
													<!-- varStatus : 반복문에서 사용할 변수 -->
													<c:forEach var="boardVO" items="${boardList}" varStatus="stat">
														<c:if test="${counter lt 5 && boardVO.boardSub=='신입'}">
															<c:set var="counter" value="${counter+1}" />
															<c:url value="/board/boardDetail" var="viewURL">
																<c:param name="boardNo" value="${boardVO.boardNo}" />
															</c:url>
															<ul class="list_story">
																<li style="margin: 0 0 17px">
																	<a href="${viewURL }" class="link">
																		<span class="txt_subject">
																			<c:out value="${boardVO.boardTitle }" />
																		</span>
																	</a>
																	<div class="util">
																		<span class="reply">${boardVO.replyCnt }</span>
																	</div>
																</li>
															</ul>
														</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<li>등록된 게시글 없음.</li>
												</c:otherwise>
											</c:choose>
										</div>

										<!-- 취준 -->
										<c:set var="counter" value="1" />
										<div class="section_inner">
											<div class="wrap_title">
												<h4 class="title">
													<a href="${pageContext.request.contextPath}/board/boardTotal?gubun=2" class="link_go">취준</a>
												</h4>
												<a href="${pageContext.request.contextPath}/board/boardTotal?gubun=2" class="link_more">더보기</a>
											</div>
											<c:choose>
												<c:when test="${not empty boardList }">
													<c:forEach var="boardVO" items="${boardList}" varStatus="stat">
														<c:if test="${counter lt 5&& boardVO.boardSub=='취준'}">
															<c:set var="counter" value="${counter+1}" />
															<c:url value="/board/boardDetail" var="viewURL">
																<c:param name="boardNo" value="${boardVO.boardNo }" />
															</c:url>
															<ul class="list_story">
																<li style="margin: 0 0 17px">
																	<a href="${viewURL }" class="link">
																		<span class="txt_subject">
																			<c:out value="${boardVO.boardTitle }" />
																	</span>
																</a>
																	<div class="util">
																		<span class="reply">${boardVO.replyCnt }</span>
																	</div>
																</li>
															</ul>
														</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<li>등록된 게시글 없음.</li>
												</c:otherwise>
											</c:choose>
										</div>

										<!-- 채용공고 -->
										<c:set var="counter" value="1" />
										<div class="section_inner">
											<div class="wrap_title">
												<h4 class="title">
													<a href="${pageContext.request.contextPath}/board/boardTotal?gubun=3" class="link_go">채용공고</a>
												</h4>
												<a href="${pageContext.request.contextPath}/board/boardTotal?gubun=3" class="link_more">더보기</a>
											</div>
											<c:choose>
												<c:when test="${not empty boardList }">
													<c:forEach var="boardVO" items="${boardList}" varStatus="stat">
														<c:if test="${counter lt 5 && boardVO.boardSub=='채용공고'}">
															<c:set var="counter" value="${counter+1}" />
															<c:url value="/board/boardDetail" var="viewURL">
																<c:param name="boardNo" value="${boardVO.boardNo }" />
															</c:url>
															<ul class="list_story">
																<li style="margin: 0 0 17px">
																	<a href="${viewURL }" class="link">
																		<span class="txt_subject">
																			<c:out value="${boardVO.boardTitle }" />
																	</span>
																</a>
																	<div class="util">
																		<span class="reply">${boardVO.replyCnt }</span>
																	</div>
																</li>
															</ul>
														</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<li>등록된 게시글 없음.</li>
												</c:otherwise>
											</c:choose>
										</div>

										<!-- 자소서 -->
										<c:set var="counter" value="1" />
										<div class="section_inner">
											<div class="wrap_title">
												<h4 class="title">
													<a href="${pageContext.request.contextPath}/board/boardTotal?gubun=4" class="link_go">자소서</a>
												</h4>
												<a href="${pageContext.request.contextPath}/board/boardTotal?gubun=4" class="link_more">더보기</a>
											</div>
											<c:choose>
												<c:when test="${not empty boardList }">
													<c:forEach var="boardVO" items="${boardList}" varStatus="stat">
														<c:if test="${boardVO.boardSub=='자소서'&&counter lt 5}">
															<c:set var="counter" value="${counter+1}" />
															<c:url value="/board/boardDetail" var="viewURL">
																<c:param name="boardNo" value="${boardVO.boardNo }" />
															</c:url>
															<ul class="list_story">
																<li style="margin: 0 0 17px">
																	<a href="${viewURL }" class="link">
																		<span class="txt_subject">
																			<c:out value="${boardVO.boardTitle }" />
																		</span>
																	</a>
																	<div class="util">
																		<span class="reply">${boardVO.replyCnt }</span>
																	</div>
																</li>
															</ul>
														</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<li>등록된 게시글 없음.</li>
												</c:otherwise>
											</c:choose>
										</div>

										<!-- 면접 -->
										<c:set var="counter" value="1" />
										<div class="section_inner">
											<div class="wrap_title">
												<h4 class="title">
													<a href="${pageContext.request.contextPath}/board/boardTotal?gubun=5" class="link_go">면접</a>
												</h4>
												<a href="${pageContext.request.contextPath}/board/boardTotal?gubun=5" class="link_more">더보기</a>
											</div>
											<c:choose>
												<c:when test="${not empty boardList }">
													<c:forEach var="boardVO" items="${boardList}" varStatus="stat">
														<c:if test="${boardVO.boardSub=='면접'&&counter lt 5}">
															<c:set var="counter" value="${counter+1}" />
															<c:url value="/board/boardDetail" var="viewURL">
																<c:param name="boardNo" value="${boardVO.boardNo }" />
															</c:url>
															<ul class="list_story">
																<li style="margin: 0 0 17px">
																	<a href="${viewURL }" class="link">
																		<span class="txt_subject">
																			<c:out value="${boardVO.boardTitle }" />
																		</span>
																	</a>
																	<div class="util">
																		<span class="reply">${boardVO.replyCnt }</span>
																	</div>
																</li>
															</ul>
														</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<li>등록된 게시글 없음.</li>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
<input type="hidden" name="searchWord"/>
<input type="hidden" name="page" />
</form:form>
<!-- SCRIPT -->
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
<script>
	$(".item_cate").on("click", function(){
		$(this).addClass('selected');
	});
</script>
</body>
</html>
