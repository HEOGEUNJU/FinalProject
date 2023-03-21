<%--
* [[개정이력(Modification Information)]]
* 수정일             수정자            수정내용
* ----------  ---------  -----------------
* 2023. 2. 14.      최경수            최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/pattern.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/help.css">

<!-- 숫자 애니메이션 -->
<script src="<%=request.getContextPath()%>/resources/js/isotope.pkgd.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/stickyfill.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.waypoints.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.animateNumber.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>

<style>
a:hover {text-decoration: none;}
element.style {padding: 9px 12px 11px 12px;height: 40px;/* border: 1px solid #d7dce5; */border-radius: 4px;box-sizing: border-box;color: #373f57;font-family: "Malgun Gothic",gulim,dotum,sans-serif;font-size: 14px;letter-spacing: -1px;line-height: 20px;vertical-align: middle;background-color: #fff;}
.wrap_community_topic .wrap_slide_category {position: relative;margin-top: 32px;padding-right: 0px;}
.wrap_community_topic .wrap_slide_category:after {display: contents;position: absolute;top: 0;right: 76px;z-index: 5;width: 37px;height: 100%;background: linear-gradient(to right, rgba(255, 255, 255, 0) -22%, rgba(255, 255, 255, 1) 33%);content: "";}
.txt_subject{font-weight: initial;}
.pf {
 	font-size: 24px; 
}

.radiuss{
	width: 100%;
	height: auto;
	border : 1px solid #eaedf4;
	border-radius: 12px;
/* 	padding-top: 50px; */
	margin-top: 2%;
	margin-bottom: 2%;
}
</style>

      <div class="container" style="position: relative; top: -190px; left: 250px; scale: 0.8;">
        <div class="row pb-0 block__19738 section-counter" style="position: absolute; left: 30%; width: 70%;">

          <div class="col-6 col-md-6 col-lg-3 mb-5 mb-lg-0">
            <div class="d-flex align-items-center justify-content-center mb-2">
              <strong class="number" data-number="${applyList.size()}">0</strong>
            </div>
            <span class="caption">총 지원 개수</span>
          </div>

          <div class="col-6 col-md-6 col-lg-3 mb-5 mb-lg-0">
            <div class="d-flex align-items-center justify-content-center mb-2">
              <strong class="number" data-number="1">0</strong>
            </div>
            <span class="caption">오늘 지원한 공고 개수</span>
          </div>

          <div class="col-6 col-md-6 col-lg-3 mb-5 mb-lg-0">
            <div class="d-flex align-items-center justify-content-center mb-2">
              <strong class="number" data-number="3">0</strong>
            </div>
            <span class="caption">결과가 난 지원 개수</span>
          </div>

          <div class="col-6 col-md-6 col-lg-3 mb-5 mb-lg-0">
            <div class="d-flex align-items-center justify-content-center mb-2">
              <strong class="number" data-number="17">0</strong>
            </div>
            <span class="caption">만료된 지원 개수</span>
          </div>
        </div>
      </div>

<!-- 지원 -->
<div class="radiuss">
	<div id="content" style="width: 85%;">
		<div class="company_honest_qna">
			<div class="contents_container" style="width: 90%;">
				<ul class="main_banners banners_th"></ul>
				<div class="wrap_area_left" style="width: 100%;">
					<div class="wrap_story_panel">
						<div class="qna_search">
							<h3 class="title">
								<a href="${pageContext.request.contextPath }/resume" class="link_go">나의 지원</a>
							</h3>
							<!-- 검색 -->
							<div class="search_form">
				              <div class="box_search">
				                <div class="input_keyword">
				                  <input type="text" name="input_keyword" id="input_keyword" value="" placeholder="어떤 지원을 했더라?" class="inpTypo" title="키워드, 이력서명 입력">
				                  	<button type="button" class="spr btn_search" style=" border-radius: 0;">
				                    	<svg class="icon_search">
				                     	 <use xlink:href="#svg_my_8"></use>
				                   		</svg>
				                    </button>
				                </div>
				              </div>
							  <div class="" style="display:none">
							    <svg xmlns="http://www.w3.org/2000/svg">
							      <symbol id="svg_my_8" viewBox="0 0 24 24">
							        <path fill="currentColor" d="M7 0c3.866 0 7 3.134 7 7 0 1.756-.647 3.36-1.714 4.59l.068.056 3.394 3.395c.195.195.195.511 0 .707-.174.173-.443.193-.638.058l-.07-.058-3.394-3.394-.056-.068C10.36 13.353 8.756 14 7 14c-3.866 0-7-3.134-7-7s3.134-7 7-7zm0 1C3.686 1 1 3.686 1 7s2.686 6 6 6 6-2.686 6-6-2.686-6-6-6z" transform="translate(-1125 -399) translate(447 335) translate(678 64) translate(4 4)"></path>
							      </symbol>
							    </svg>
							  </div>
							</div>
						</div>
	
						<!-- 이력서 -->
						<div class="wrap_section wrap_best_story">
							<div class="section_inner" style="padding-bottom: 17px;">
								<div class="wrap_title">
									<h4 class="title">
										<a href="${pageContext.request.contextPath}/resume" class="link_go">
											<b class="hot">MY!</b> 나의 전체 지원 🔥
										</a>
									</h4>
									<a href="${pageContext.request.contextPath}/apply" class="link_more">더보기</a>
								</div>
	
								<ul class="list_story">
									<c:forEach items="${applyList}" var="apply" varStatus="status">
									<ul class="list_story">
										<li style="margin: 0 0 17px">
											<a href="${pageContext.request.contextPath}/apply/${apply.applySn}" class="link" style="width: 100%;">
												<span class="txt_subject">
													<table class="table table-hover" style="width: 100%;">
														<tr>
															<td class="col-2" style="border-top: none;">${apply.company.cmpName}</td>
															<td class="col-5" style="border-top: none;">${apply.detail.daFd}</td>
															<td class="col-2" style="border-top: none; color: gray; font-size: 14px;">${apply.detail.daDepartment}</td>
															<td class="col-2" style="border-top: none; color: gray; font-size: 14px;">${apply.resume.resumeTitle}</td>
															<td class="col-1" style="border-top: none; color: gray; font-size: 14px;">${apply.applyDate}</td>
														</tr>
													</table>
												</span>
											</a>
											<div class="util">
												<span>${resume.resumeInsertDate}</span>
											</div>
										</li>
									</ul>
									</c:forEach>
								</ul>
							</div>
						</div>
						<br>
						<button type="button" class="btnSizeL btn_qna_write" onclick="location.href='${pageContext.request.contextPath}/announcement'" style="position: relative; left: 85%; width: 15%; border-radius: 0;">공고 보러 가기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>