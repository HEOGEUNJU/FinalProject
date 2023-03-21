<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023. 2. 1.      허근주      최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 바디 영역 -->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/layout.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/board.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/pattern.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/components.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/jobs-view.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/jobs-recruit.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/recruit-template-reset.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/recruit-template.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/common_ui_keeping.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/expert/exprodDetail.css" />
<style>
</style>
<ul class="responsive-table"
	style="padding-left: 50px; padding-right: 50px; height: 100%;">
	<li class="table-row"
		style="padding: 0px; box-shadow: 0 0 0 0; margin-left: 0%;">
		<div class="productCover__WRmje">
			<div class="productInfo__zm1w7">
				<div class="inner__Xx9ku typeCircle__eRxEN"
					style="background-color: rgb(132, 141, 212);">
					<div class="dimmed__T9OEu"></div>
					<div class="box__CPuio">
						<div
							class="titleSection__aC4MJ SubTitleItem_titleSection__zCPQE SubTitle_SubTitleItem_titleSection__srGiO">
							<span
								class="title__nx4cO SubTitleItem_title__vOrep SubTitle_SubTitleItem_title__bbSP5 headline4__XMaz7 highlightWhite__rsNYG">${exprod.exprodName }</span>
						</div>
						<div class="info__lf90_">
							<a
								href="https://m.expert.naver.com/expert/profile/home?storeId=100029900"
								class="item__id_Eb">대상 : ${exprod.exprodTarget }</a><!-- <span class="item__id_Eb">디자인</span> -->
						</div>
					</div>
					<div class="productNotice__JHh7B primary__Eh7Fc">
						<div
							class="titleSection__aC4MJ SubTitleItem_titleSection__zCPQE SubTitle_SubTitleItem_titleSection__NIsrF">
							<span
								class="title__nx4cO SubTitleItem_title__vOrep SubTitle_SubTitleItem_title__KsvHd headline9__Dgibj">상품
								이용에 관한 중요한 안내</span>
						</div>
						<div class="listArea__tYmyJ">
							<ul class="listDefault__it3EP listDisc__ubW8k">
								<li class="item___O1qZ">거래 확정 이후에는 대화창을 통한 무료 수정 제공이 어려울 수
									있습니다.</li>
								<li class="item___O1qZ">음성/영상통화는 <strong>INU 앱</strong>과
									최신 버전의 <em>INU앱</em>에서만 사용할 수 있습니다.
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row align-items-center mb-5">
			<%-- <div class="col-lg-8 mb-4 mb-lg-0">
				<div class="d-flex align-items-center">
					<div class="border p-2 d-inline-block mr-3 rounded">
						<img src="<%=request.getContextPath()%>/resources/images/MAIN.png"
							alt="Image" style="max-width: 100px;">
					</div>
					<div>
						<h2>${exprod.exprodName }</h2>
						<div>
							<span class="ml-0 mr-2 mb-2"><span
								class="icon-briefcase mr-2"></span>${expert.expertAddr }
								${expert.expertAddr2 }</span> <span class="m-2"><span
								class="icon-room mr-2"></span>${expert.expertTel } </span> <span
								class="m-2"><span class="icon-clock-o mr-2"></span><span
								class="text-primary">${exprod.exprodTime }</span></span>
						</div>
					</div>
				</div>
			</div> --%>
			<!-- 관심버튼 -->
			<%-- <div class="col-lg-4 mb-4 mb-lg-0">
				<div class="row">
					<security:authorize access="hasRole('ROLE_SEEKER')">
														<security:authorize access="hasRole('INCRUITER')">
						<security:authentication property="principal"
							var="memberVOWrapper" />
						<security:authentication property="principal.realMember"
							var="authMember" />
															<input type="hidden" value="${authMember.memId}"/>
						<div class="col-6" id="likeExprodArea">
							<c:choose>
								<c:when test="${selectLikeExprod gt 0 }">
									<a class="btn btn-block btn-md"
										onclick="likeExprod('${authMember.memId}')"><span
										id="likeExprod" class="icon-heart mr-2 text-danger"></span>관심상품</a>
								</c:when>
								<c:otherwise>
									<a class="btn btn-block btn-md"
										onclick="likeExprod('${authMember.memId}')"><span
										id="likeExprod" class="icon-heart-o mr-2 text-danger"></span>관심상품</a>
								</c:otherwise>
							</c:choose>
						</div>
					</security:authorize>
				</div>
			</div> --%>

			<!-- <div class="col-lg-4">
					<div class="row">
						<div class="col-12">
							<a href="#" class="btn btn-block btn-light btn-md" onclick="likeExprod"><span
								class="icon-heart-o mr-2 text-danger" id="likeExprod"></span>찜하기</a>
						</div>
		<div class="col-6">
                <a href="#" class="btn btn-block btn-primary btn-md">Apply Now</a>
              </div>
					</div>
				</div> -->
		</div>
	</li>
	<li class="table-row"
		style="padding: 0px; box-shadow: 0 0 0 0; margin-left: 0%;">
		<div class="row mb-5 mt-5">
			<div class="col-lg-8">
				<h2 style="border-bottom: 2px solid #4876ef; padding: 10px;">상세설명</h2>
				<div style="
				    padding: 3%;
				    margin-left: 5%;
				">
				${exprod.exprodDetail }
				</div>
				<h2 style="border-bottom: 2px solid #4876ef; padding: 10px;">판매자
					정보</h2>
				<div class="foldInner__Rukpz" style="display: block;">
					<ul class="etcInfoList__ETD5b twoColumnList__ZM9kj">
						<li class="etcInfoItem__K2RcM"><span class="title__hxpoI">이름</span><span
							class="text__Y7rQf">${expert.memName }</span></li>
						<li class="etcInfoItem__K2RcM"><span class="title__hxpoI">메일</span><span
							class="text__Y7rQf">${expert.expertEmail }</span></li>
						<li class="etcInfoItem__K2RcM"><span class="title__hxpoI">고객센터</span><span
							class="text__Y7rQf">${expert.expertTel }</span></li>
						<li class="etcInfoItem__K2RcM"><span class="title__hxpoI">통신판매업번호</span><span
							class="text__Y7rQf">-</span></li>
						<li class="etcInfoItem__K2RcM"><span class="title__hxpoI">사업장
								주소</span><span class="text__Y7rQf">(우:${expert.expertZip })
								${expert.expertAddr } ${expert.expertAddr2 } </span></li>
					</ul>
				</div>
				<h2 style="border-bottom: 2px solid #4876ef; padding: 10px;">상품정보
					제공 고시</h2>
				<div class="foldInner__Rukpz" style="display: block">
					<ul class="etcInfoList__ETD5b">
						<li class="etcInfoItem__K2RcM"><span class="title__hxpoI">서비스
								제공 사업자</span><span class="text__Y7rQf">상품 상세 참조</span></li>
						<li class="etcInfoItem__K2RcM"><span class="title__hxpoI">인증/허가사항</span><span
							class="text__Y7rQf">상품 상세 참조</span></li>
						<li class="etcInfoItem__K2RcM"><span class="title__hxpoI">이용조건</span><span
							class="text__Y7rQf">상품 상세 참조</span></li>
						<li class="etcInfoItem__K2RcM"><span class="title__hxpoI">취소/환불
								조건</span><span class="text__Y7rQf">'청약철회 등 환불 안내' 기준에 따라 적용됨</span></li>
						<li class="etcInfoItem__K2RcM"><span class="title__hxpoI">취소/환불
								방법</span><span class="text__Y7rQf">네이버페이 취소 및 환불방법에 따라 적용됨</span></li>
						<li class="etcInfoItem__K2RcM"><span class="title__hxpoI">소비자상담전화</span><span
							class="text__Y7rQf">판매자 정보 참조</span></li>
					</ul>
					<a href="#" class="linkReport__el96l">상품 신고하기<i
						class="iconArrow__xG3fN"></i></a>
				</div>
				<div class="productFinance__cZMlN">
					<div
						class="titleSection__aC4MJ SubTitleItem_titleSection__zCPQE SubTitle_SubTitleItem_titleSection__SkVkP">
						<span
							class="title__nx4cO SubTitleItem_title__vOrep headline9__Dgibj">아이엔유파이낸셜<br>(결제대금예치업
							등록번호 : 02-0006-00056)
						</span>
					</div>
					<div class="textBox__ECG4L">
						<p class="text__Y7rQf">
							아이엔유파이낸셜(주)은 전자금융거래법에 따라 결제대금 예치업을 운영할 수 있는 전자금융업자로 금융위원회에
							등록되었으며, 본 eXpert는 아이엔유파이낸셜(주)이 제공하는 구매안전서비스를 적용하고 있습니다.<a
								href="${pageContext.request.contextPath}/expert/detail/${expert.memId }"
								target="_blank" rel="noreferrer" class="link__yOb5T">자세히 보기<i
								class="iconArrow__xG3fN"></i></a>
						</p>
					</div>
				</div>
				<h2 style="border-bottom: 2px solid #4876ef; padding: 10px;">후기</h2>
				<div class="row">
				<c:forEach items="${exprod.exreviewList }" var="exreviewList">
					<div class="col-lg-4">
						<div class="block__87154 bg-white rounded">
							<blockquote style="
							    height: 174px;
							    overflow: auto;
							">${exreviewList.exreviewContent }</blockquote>
							<div class="block__91147 d-flex align-items-center">
								<figure class="mr-4">
									<img
										src="<spring:url value='/image/expertFolder/exprodTop.jpg'/>"
										alt="Image" class="img-fluid" />
								</figure>
								<div>
									<h3>${exreviewList.exreviewWriter }</h3>
									<span class="position">${exreviewList.exreviewDate }</span>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>

			<div class="col-lg-4 ml-auto h-100 jm-sticky-top"
				style="margin-top: 60px;">
				<div class="productInfoArea__AF1Ny">
					<div class="productPrice__ZKXaJ">
						<div class="price___pqNQ ItemPrice_price__IF4Aa">
							<div class="priceBox__dJtyc ItemPrice_priceBox__p_U3i">
								<strong class="number__LtgFx ItemPrice_number__JERga"><span
									class="blind">판매가</span>${exprod.exprodPrice }</strong><span
									class="unit__yzEdt ItemPrice_unit__Vi7zM">원</span>
							</div>
						</div>
						<!-- 					<div class="col-lg-4 mb-4 mb-lg-0"> -->
						<div class="price___pqNQ ItemPrice_price__IF4Aa">
							<security:authorize access="hasRole('ROLE_SEEKER')">
								<%-- 								<security:authorize access="hasRole('INCRUITER')"> --%>
								<security:authentication property="principal"
									var="memberVOWrapper" />
								<security:authentication property="principal.realMember"
									var="authMember" />
								<%-- 									<input type="hidden" value="${authMember.memId}"/> --%>

							</security:authorize>
						</div>
						<!-- 				</div> -->
						<!-- 					<div class="countInfo__X_LZj">
							<div class="countLink__q41Pw">
								<div
									class="itemRating__J5FUY ItemRating_itemRating__dp0Km isDimmed__U7V5X">
									<span class="blind">평균 별점 </span>
									<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15"
										viewBox="0 0 13 12" class="iconStar__aM_Z1">
										<path fill="#4A65F6" fill-rule="evenodd"
											d="m6.5 9.75-3.82 2.009.73-4.255L.317 4.491l4.272-.62L6.5 0l1.91 3.87 4.272.621L9.59 7.504l.73 4.255z"></path></svg>
									
								</div>
							</div>
							<button type="button" class="countBookmark__t0qwy">
								<svg width="16" height="16" viewBox="0 0 24 24"
									xmlns="http://www.w3.org/2000/svg" class="iconHeart__qBSZC">
									<path
										d="M4.357 6.309c1.809-1.745 4.742-1.745 6.551 0L12 7.362l1.092-1.053c1.809-1.745 4.742-1.745 6.551 0a4.357 4.357 0 0 1 0 6.319L12 20l-7.643-7.372a4.357 4.357 0 0 1 0-6.32z"
										stroke="#FFF" stroke-width="2" fill="#FF7070"
										stroke-linecap="round" stroke-linejoin="round"
										fill-rule="evenodd"></path></svg>
								<span class="blind">찜하기</span><span class="blind">회</span>
							</button>
						</div> -->
					</div>
					<div class="gridBox__u0kfF">
						<div class="productOffering__ROovy">
							<strong class="title__m6PBt"> 기본 정보</strong>
							<div>
								<div class="item__NWOUd">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" class="badgeIcon__SGFRd">
										<g fill="none" fill-rule="evenodd">
										<path stroke="#333" stroke-linejoin="round" stroke-width="2"
											d="M4 4h16a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2z"></path>
										<path
											d="M6 12h2.5v2.5H6zm0 4.5h2.5V19H6zm4.5-4.5H13v2.5h-2.5zm0 4.5H13V19h-2.5zM15 12h2.5v2.5H15zm0 4.5h2.5V19H15z"
											fill="#7E96FF"></path>
										<path stroke="#333" stroke-linecap="square" stroke-width="2"
											d="M21 9.5H3"></path>
										<path stroke="#333" stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M6.5 1.5v2m11-2v2"></path></g></svg>
									<div class="infoArea__HhYQn">
										<p class="infoTitle__DtGOo">
											최대 작업 소요 <em>3일</em>
										</p>
									</div>
								</div>
								<div class="item__NWOUd">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="22"
										viewBox="0 0 24 22" class="badgeIcon__SGFRd">
										<g fill="none" fill-rule="evenodd">
										<path stroke="#333" stroke-linejoin="round"
											stroke-width="1.734"
											d="M3 14.678V19h4.214L19 7.106S21.047 5 19 3s-4.202 0-4.202 0L3 14.678z"></path>
										<path stroke="#333" stroke-width="2" d="m17.5 8.5-4-4"></path>
										<path fill="#7E96FF"
											d="M12 19c0 .552.456 1 .995 1h8.01c.55 0 .995-.444.995-1 0-.552-.456-1-.995-1h-8.01A.995.995 0 0 0 12 19z"></path></g></svg>
									<div class="infoArea__HhYQn">
										<p class="infoTitle__DtGOo">
											무료 수정 <em>2회</em>
										</p>
									</div>
								</div>
								<div class="item__NWOUd">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="22"
										viewBox="0 0 24 22" class="badgeIcon__SGFRd">
										<g fill="none" fill-rule="evenodd">
										<circle cx="11.975" cy="7.875" r="6.35" stroke="#333"
											stroke-width="2"></circle>
										<path fill="#7E96FF" stroke="#7E96FF" stroke-linecap="round"
											stroke-linejoin="round" stroke-width="1.05"
											d="M10.4 9.45c0 .7.525 1.05 1.575 1.05 1.05 0 1.575-.35 1.575-1.05H10.4z"></path>
										<path stroke="#333" stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M2 19.95c1.371-3.339 5.907-5.25 9.87-5.25h.21c3.945 0 8.48 1.94 9.87 5.25"></path></g></svg>
									<div class="infoArea__HhYQn">
										<p class="infoTitle__DtGOo">대화 방법</p>
										<p class="infoText__wBCn_">${exprod.exprodWay }</p>
									</div>
								</div>
								<div class="item__NWOUd">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="22"
										viewBox="0 0 26 22" class="badgeIcon__SGFRd">
										<g stroke-width="2" fill="none" fill-rule="evenodd">
										<path stroke="#333"
											d="M19 1a2.99 2.99 0 0 1 2.121.879A2.99 2.99 0 0 1 22 4v14a2.99 2.99 0 0 1-.879 2.121A2.99 2.99 0 0 1 19 21H7a2.99 2.99 0 0 1-2.121-.879A2.99 2.99 0 0 1 4 18V4c0-.828.336-1.578.879-2.121A2.99 2.99 0 0 1 7 1z"></path>
										<path stroke="#7E96FF" stroke-linecap="round"
											stroke-linejoin="round" d="M9.5 14.5h7m-7-4h7m-7-4h7"></path></g></svg>
									<div class="infoArea__HhYQn">
										<p class="infoTitle__DtGOo">수정 제공</p>
										<div class="infoText__wBCn_ typeDefault__Te74x">
											<div class="textInner__Xq8cs">
												<p class="text__cr0x7">세부수정 2회까지 가능합니다. 전체적 수정은 불가합니다.</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="jv_cont jv_howto" style="margin-bottom: 0px">
							<a class="placeholder" tabindex="-1"></a>
							<h2 class="jv_title">접수기간 및 방법</h2>
							<div class="cont box">
								<div class="status">
									<div class="info_timer" data-remain-time="820560">
										<span class="txt">남은 기간</span> <span class="day">9</span> <span
											class="txt_day">일</span> <span class="time">11:47:54</span>
									</div>
									<dl class="info_period">
										<dt>시작일</dt>
										<dd>${exprod.exprodStart }</dd>
										<dt class="end">마감일</dt>
										<dd>${exprod.exprodEnd }</dd>
									</dl>
								</div>
							</div>
						</div>
						<div class="col-12" id="likeExprodArea"
							style="margin-bottom: 19px;">
							<c:choose>
								<c:when test="${selectLikeExprod gt 0 }">
									<a class="btn btn-block btn-md"
										onclick="likeExprod('${authMember.memId}')"><span
										id="likeExprod" class="icon-heart mr-2 text-danger"></span>관심상품</a>
								</c:when>
								<c:otherwise>
									<a class="btn btn-block btn-md"
										onclick="likeExprod('${authMember.memId}')"><span
										id="likeExprod" class="icon-heart-o mr-2 text-danger"></span>관심상품</a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="productButtonArea__KKJKe">
							<div class="buttonArea__JuLVw ExpertButton_buttonArea__T6OOy">
							<form:form modelAttribute="excart" method="post" id="exprodPayForm"
								action="${pageContext.request.contextPath}/expert/pay/${exprod.exprodId }">
								<form:hidden path="excartPrice" value="${exprod.exprodPrice }" />
							</form:form>
								<button type="submit" aria-disabled="false" onclick="fn_direct_pay()"
									class="buttonExpert__HtMxO ExpertButton_buttonExpert__AVgfw typeLarge__MUlwq secondary__mlqIw"><span
									class="text__v4NwT">구매하기<svg
											xmlns="http://www.w3.org/2000/svg" width="20" height="20"
											viewBox="0 0 20 20">
											<g fill="#FFF" fill-rule="evenodd">
											<path
												d="M9.306 7.71 10.623 9H6.99a.99.99 0 0 0-.99.99v.019a.99.99 0 0 0 .99.989h3.482l-.022.13-1.114 1.123c-.35.354-.436.922-.146 1.327a.988.988 0 0 0 1.511.128l3.008-3.035a1.005 1.005 0 0 0 0-1.415l-3-2.964a.985.985 0 0 0-1.403 0 1.007 1.007 0 0 0 0 1.416"></path>
											<path fill-rule="nonzero"
												d="M10 20c5.523 0 10-4.477 10-10S15.523 0 10 0 0 4.477 0 10s4.477 10 10 10zm0-2a8 8 0 1 1 0-16 8 8 0 0 1 0 16z"></path></g></svg></span></button>
							</div>
						</div>
					</div>
				</div>
				<div class="mb-4">
					<%-- 						<h3 class="mb-4 h4 border-bottom">${exprod.exprodName }</h3> --%>
				</div>
				<%-- 	<div class="p-3 border rounded mb-4"
					style="background-color: #f8f9fa">
					<div class="ml-auto h-100">
						<div class="row"></div>
					</div>
					<div class="priceBox__dJtyc ItemPrice_priceBox__p_U3i">
						<strong
							class="productPrice__ZKXaJ number__LtgFx ItemPrice_number__JERga"><span
							class="blind">판매가</span>${exprod.exprodPrice }원</strong>
					</div>
					<ul class="list-unstyled mb-0">
						<li class="mb-2"><strong class="text-black">가격 : </strong>
							${exprod.exprodPrice }</li>
						<li class="mb-2"><strong class="text-black">상품이용방법 :
						</strong> ${exprod.exprodWay }</li>
					</ul>
					<div class="jv_cont jv_howto" style="margin-bottom: 0px">
						<a class="placeholder" tabindex="-1"></a>
						<h2 class="jv_title">접수기간 및 방법</h2>
						<div class="cont box">
							<div class="status">
								<div class="info_timer" data-remain-time="820560">
									<span class="txt">남은 기간</span> <span class="day">9</span> <span
										class="txt_day">일</span> <span class="time">11:47:54</span>
								</div>
								<dl class="info_period">
									<dt>시작일</dt>
									<dd>${exprod.exprodStart }</dd>
									<dt class="end">마감일</dt>
									<dd>${exprod.exprodEnd }</dd>
								</dl>
							</div>
						</div>
					</div>
					<div class="col-sm-12 col-md-12 mb-4 col-lg-12">
						<strong class="d-block text-black mb-3">구매</strong>
						<form:form modelAttribute="excart" method="post"
							action="${pageContext.request.contextPath}/expert/pay/${exprod.exprodId }">
							<form:hidden path="excartPrice" value="${exprod.exprodPrice }" />
							<form:button class="btn btn-outline-primary border-width-2"
								type="submit">구매하기</form:button>
						</form:form>
					</div>
				</div> --%>
				<div class="profile__IOgEL">
					<div class="expertInfoArea__G7QdU"
						style="background-color: rgb(132, 141, 212);">
						<strong class="userName__TmuO6">${member.memName }/${expert.expertField }</strong>
						<p class="introduce__Cdhof">${expert.expertIntroduction }</p>
					</div>
					<a
						href="/expert/profile/home?storeId=100029900&amp;u=9S3pWc%2Fpdx8bqTiAZZEqN3iFQ8J5qNndhaHB%2BV%2FE3Ac%3D"
						class="userThumbnail__AQj5I"
						style="background-image: url(&quot;<spring:url value='/image/memberFolder/${exprod.attSavename}'/>&quot;);"><span
						class="blind">프로필 사진</span></a>
					<div class="expertCareerArea__hHHmE">
						<div class="buttonArea__JuLVw ExpertButton_buttonArea__SNGTT">
							<a
								href="${pageContext.request.contextPath}/expert/detail/${expert.memId }"
								role="button" aria-disabled="false"
								class="buttonExpert__HtMxO ExpertButton_buttonExpert__aM1aU typeMedium__Ectj6"><span
								class="text__v4NwT">프로필 보기</span></a>
						</div>
					</div>
				</div>
				<%-- <div class="block__87154 mb-0" style="background-color: gainsboro;">

					<div class="block__91147 d-flex align-items-center">
						<figure class="mr-4">
							<img
								src="<%=request.getContextPath()%>/resources/images/Dobby.png"
								alt="Image" class="img-fluid">
						</figure>
						<div>
							<h3>${member.memName }</h3>
							<span class="position">${expert.expertField }</span>
						</div>
					</div>
					<blockquote>
						<p>${expert.expertIntroduction }</p>
					</blockquote>
				</div> --%>


			</div>
		</div>

	</li>


	<li class="table-row"
		style="padding: 0px; box-shadow: 0 0 0 0; margin-left: 0%;">

		<div class="row" style="margin-left: 29%;">
			<div class="col-md-2 text-center">
				<a
					href="${pageContext.request.contextPath}/expert/prod/${exprod.preExprod}"
					class="btn btn-md btn-outline-primary border-width-2 d-block"
					id="preBtn">&laquo; 이전</a>
			</div>
			<div class="col-md-2 text-center">
				<a href="${pageContext.request.contextPath}/expert/CONSULTING"
					class="btn btn-md btn-primary border-width-2 d-block">전체</a>
			</div>
			<div class="col-md-2 text-center">
				<a
					href="${pageContext.request.contextPath}/expert/prod/${exprod.nextExprod}"
					class="btn btn-md btn-outline-primary border-width-2 d-block"
					id="nextBtn">다음 &raquo;</a>
			</div>
		</div>
	</li>
</ul>
<script src="<%=request.getContextPath() %>/resources/js/pay.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
var price = '${exprod.exprodPrice }';
console.log(price.replace(',',''))
function fn_direct_pay(){
		console.log("onclick")
		// 결제금액이 0원일경우 바로 결제완료 처리
		// 카카오 결제 API
		  //var IMP = window.IMP; // 생략가능
		  IMP.init('imp23062788');  // 가맹점 식별코드
		  // IMP.request_pay(param, callback) 결제창 호출
		  IMP.request_pay({
		      pg : 'kakaopay', //pg사 선택 (kakao, kakaopay 둘다 가능)
		      pay_method: 'card',// 기능 없음
		      merchant_uid : 'merchant_' + new Date().getTime(),
		      name : '${member.memName }',
		      amount :  price.replace(',',''), // 빌링키 발급과 함께 1,004원 결제승인을 시도합니다.
		      //customer_uid 파라메터가 있어야 빌링키 발급을 시도함
				customer_uid : 'imp23062788',
				buyer_email : '${expert.expertEmail }',
				buyer_name : '${expert.memName }',
				buyer_tel : '${expert.expertTel }',
				buyer_addr : '대전광역시 중구 계룡로 846 3층',
		  }, function(rsp) { //callback
			  if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
					document.getElementById('exprodPayForm').submit();
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			  swal(msg);
		 });
}
	if (`${exprod.preExprod}` == "") {
		$("#preBtn").click(function() {
			return false;
		});
	}
	if (`${exprod.nextExprod}` == "") {
		$("#nextBtn").click(function() {
			return false;
		});
	}
	let dday = new Date(`${exprod.exprodEnd}`).getTime();
	setInterval(function() {
		let today = new Date().getTime();
		let gap = dday - today;
		let day = Math.ceil(gap / (1000 * 60 * 60 * 24));
		let hour = Math.ceil((gap % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		let min = Math.ceil((gap % (1000 * 60 * 60)) / (1000 * 60));
		let sec = Math.ceil((gap % (1000 * 60)) / 1000);
		$(".day").html(day);

		if (hour < 10)
			hour = "0" + hour;
		if (min < 10)
			min = "0" + min;
		if (sec < 10)
			sec = "0" + sec;
		$(".time").html(hour + ":" + min + ":" + sec);
	}, 1000);

	function likeExprod(memId) {
		console.log("likeExprod", `${exprod.exprodId}`, memId);

		let data = {
			exprodId : `${exprod.exprodId}`,
			memId : memId
		};
		$.ajax({
			url : "${pageContext.request.contextPath}/expert/likeExprod",
			method : "post",
			data : JSON.stringify(data),
			dataType : "text",
			contentType : 'application/json',
			success : function(resp) {
				console.log("resp : ", resp);
				if (resp == "delete") {
					$("#likeExprod").removeClass("icon-heart").addClass(
							"icon-heart-o");
				} else if (resp == "insert") {
					$("#likeExprod").removeClass("icon-heart-o").addClass(
							"icon-heart");
				}
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}
</script>

