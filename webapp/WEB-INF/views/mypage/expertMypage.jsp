<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023. 2. 2.      허근주      최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/layoutTwo.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/saramin/board.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/saramin/help.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/saramin/components.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/saramin/layout.css">
<!-- <script  src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<style>
#sri_wrap {
	display: table-row;
	width: 100%;
	height: 100%;
}

.profile-img {
	text-align: center;
}

.profile .useid {
	font-size: 26px;
	font-weight: 700;
	line-height: 32px;
	letter-spacing: -.67px;
	word-break: break-all;
}

.menu_text {
	display: inline-block;
	font-size: 19px;
	line-height: 26px;
	font-weight: 400;
	letter-spacing: -1.18px;
	color: #303038;
}

.left_menu {
	
}

.left_menu .menu_text.on {
	position: relative;
	font-weight: 700;
	color: #1e1e23;
}

#sri_gnb_wrap {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	z-index: 25;
	padding-top: 96px;
	width: 271px;
	border-right: 1px solid #f0f0f0;
	background: #fff;
	transition: width 0.5s;
}

#sri_gnb_wrap .gnb {
	margin: 0 auto;
	width: 240px;
}

#sri_gnb_wrap .gnb>li {
	position: relative;
}

#sri_gnb_wrap .gnb>li>a {
	display: block;
	position: relative;
	padding: 10px 0 14px 56px;
	height: 44px;
	box-sizing: border-box;
}

#sri_gnb_wrap .gnb>li>a>svg {
	display: block;
	position: absolute;
	top: 10px;
	left: 16px;
	z-index: 3;
	width: 24px;
	height: 24px;
}

#sri_gnb_wrap .gnb>li.selected>a>.txt {
	color: #4876ef;
	font-weight: bold;
}

#sri_section {
	display: table;
	padding: 0 0 0 272px;
	width: 100%;
	height: 100%;
	box-sizing: border-box;
	transition: padding-left 0.5s
}

.no_gnb #sri_section {
	padding: 0
}

#sri_gnb_wrap {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	z-index: 25;
	padding-top: 96px;
	width: 271px;
	border-right: 1px solid #f0f0f0;
	background: #fff;
	transition: width 0.5s
}

#sri_gnb_wrap .ci {
	display: block;
	position: absolute;
	top: 33px;
	left: 32px;
	width: 120px;
	height: 24px
}

#sri_gnb_wrap .ci svg {
	width: 100%;
	height: 100%
}

#sri_gnb_wrap .ci svg.img_ci_icon {
	display: none
}

#sri_gnb_wrap .btn_toggle_gnb {
	display: inline-block;
	position: absolute;
	z-index: 5;
	top: 28px;
	right: 22px;
	width: 32px;
	height: 32px;
	background-color: #fff;
	border: 1px solid #fff;
	border-radius: 50%;
	text-align: center;
	box-sizing: border-box
}

#sri_gnb_wrap .btn_toggle_gnb:hover {
	background-color: #f4f6fa;
	border-color: #f4f6fa
}

#sri_gnb_wrap .btn_toggle_gnb svg {
	display: inline-block;
	width: 16px;
	height: 16px;
	color: #AFBAC8
}

#sri_gnb_wrap .btn_toggle_gnb svg.svg_icon_open {
	display: none
}

#sri_gnb_wrap .gnb {
	margin: 0 auto;
	width: 240px
}

#sri_gnb_wrap .gnb>li {
	position: relative
}

#sri_gnb_wrap .gnb>li+li {
	margin-top: 8px
}

#sri_gnb_wrap .gnb>li>a {
	display: block;
	position: relative;
	padding: 10px 0 14px 56px;
	height: 44px;
	box-sizing: border-box
}

#sri_gnb_wrap .gnb>li>a:before {
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	z-index: 1;
	width: 240px;
	height: 44px;
	border-radius: 5px;
	background: #f4f6fa;
	transition: opacity 0.5s;
	content: "";
	opacity: 0
}

#sri_gnb_wrap .gnb>li>a>svg {
	display: block;
	position: absolute;
	top: 10px;
	left: 16px;
	z-index: 3;
	width: 24px;
	height: 24px
}

#sri_gnb_wrap .gnb>li>a>svg use {
	color: #afbac8
}

#sri_gnb_wrap .gnb>li>a>.txt {
	display: block;
	position: relative;
	z-index: 2;
	color: #5c667b;
	font-size: 15px;
	letter-spacing: -1px;
	line-height: 24px
}

#sri_gnb_wrap .gnb>li>a>.svg_beta {
	position: absolute;
	top: 10px;
	left: 135px;
	z-index: 1
}

#sri_gnb_wrap .gnb>li>a>.svg_beta>svg {
	display: block;
	width: 26px;
	height: 13px;
	color: #5c667b
}

#sri_gnb_wrap .gnb>li>a>.svg_beta_shot {
	display: none
}

#sri_gnb_wrap .gnb>li>a:hover:before {
	opacity: 1
}

#sri_gnb_wrap .gnb>li>a>.btn_expand {
	display: block;
	position: absolute;
	top: 6px;
	right: 8px;
	z-index: 3;
	width: 32px;
	height: 32px;
	border-radius: 16px;
	outline: 0
}

#sri_gnb_wrap .gnb>li>a>.btn_expand:before {
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	width: 32px;
	height: 32px;
	border-radius: 16px;
	background: #e8ebf2;
	transition: transform 0.3s, opacity 0.6s;
	-webkit-transform: scale(0);
	-ms-transform: scale(0);
	transform: scale(0);
	content: "";
	opacity: 0
}

#sri_gnb_wrap .gnb>li>a>.btn_expand svg {
	position: absolute;
	top: 14px;
	left: 12px;
	width: 10px;
	height: 7px
}

#sri_gnb_wrap .gnb>li>a>.btn_expand svg use {
	color: #ccd0d6
}

#sri_gnb_wrap .gnb>li>a>.btn_expand:hover:before {
	-webkit-transform: scale(1);
	-ms-transform: scale(1);
	transform: scale(1);
	opacity: 1
}

#sri_gnb_wrap .gnb>li>a>.btn_expand:hover svg use {
	color: #383e4f
}

#sri_gnb_wrap .gnb>li.selected>a:before {
	background: #eff5ff
}

#sri_gnb_wrap .gnb>li.selected>a svg use {
	color: #4876ef
}

#sri_gnb_wrap .gnb>li.selected>a>.txt {
	color: #4876ef;
	font-weight: bold
}

#sri_gnb_wrap .gnb>li.only.selected>a:before {
	opacity: 1
}

#sri_gnb_wrap .gnb>li>ul {
	display: none;
	padding: 4px 0 0 16px
}

#sri_gnb_wrap .gnb>li>ul>li {
	position: relative
}

#sri_gnb_wrap .gnb>li>ul>li+li {
	margin-top: 4px
}

#sri_gnb_wrap .gnb>li>ul>li>a {
	display: block;
	position: relative;
	padding: 8px 0 8px 40px;
	box-sizing: border-box
}

#sri_gnb_wrap .gnb>li>ul>li>a:before {
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	z-index: 1;
	width: 224px;
	height: 40px;
	border-radius: 5px;
	background: #f4f6fa;
	transition: opacity 0.5s;
	content: "";
	opacity: 0
}

#sri_gnb_wrap .gnb>li>ul>li>a .txt {
	display: block;
	position: relative;
	z-index: 2;
	color: #5c667b;
	font-size: 14px;
	letter-spacing: -1px;
	line-height: 24px
}

#sri_gnb_wrap .gnb>li>ul>li>a:hover:before {
	opacity: 1
}

#sri_gnb_wrap .gnb>li>ul>li.selected>a:before {
	background: #eff5ff;
	opacity: 1
}

#sri_gnb_wrap .gnb>li>ul>li.selected>a .txt {
	color: #4876ef;
	font-weight: bold
}

#sri_gnb_wrap .gnb>li.expanded>ul {
	display: block
}

#sri_gnb_wrap .gnb>li>ul>li>a:before {
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	z-index: 1;
	width: 224px;
	height: 40px;
	border-radius: 5px;
	background: #f4f6fa;
	transition: opacity 0.5s;
	content: "";
	opacity: 0;
}
</style>
<div style="margin-bottom: 30px; display: flex; margin-left: 100px;">
	<div id="sri_gnb_wrap" style="display: contents;">
		<div class="profile-img">
		<div class="seekerProfileArea" style="
   
    width: 270px;
    height: 317px;
        margin-right: 15px;
">
			<img
				src="<spring:url value='/image/memberFolder/${seeker.attatchList[0].attSavename }'/>"
				alt=""  style="width: 270px;height: 300px;     border-radius: 15px;" />

			<%--    <div class="form-group">
			                <label for="company-website-tw d-block">프로필사진변경</label> <br>
			                <a class="btn btn-primary btn-md btn-file" href="${pageContext.request.contextPath }/update">
			                  회원정보수정
			                </a>
            		  </div> --%>
            		  </div>
			<div class="profile" style="margin-top: 50px;">
				<p class="useid">${seeker.memId }</p>
				<p class="usemail">${seeker.memEmail }</p>
				<a class="btn btn-primary btn-md btn-file"
					href="<%-- ${pageContext.request.contextPath }/update --%>#"
					onclick="checkPass()"> 회원정보수정 </a>
			</div>
		</div>

		<!--    <div class="col-md-2">
                        <input type="submit" class="profile-edit-btn" name="btnAddMore" value="Edit Profile"/>
                        <input type="button" class="kakaopay" onclick="fn_direct_pay()"> 
                    </div> -->
		<div id="sri_gnb_wrap " style="width: 20%; margin-right: 5%;">
			<%-- <p>이력서</p>
                            <a href="${pageContext.request.contextPath }/">학력</a><br/>
                            <a href="${pageContext.request.contextPath }/">경력</a><br/>
                            <a href="${pageContext.request.contextPath }/">자격증</a><br/>
                            <a href="${pageContext.request.contextPath }/">기능</a><br/>
                            <a href="${pageContext.request.contextPath }/">주요활동</a><br/>
                            <a href="${pageContext.request.contextPath }/">교육이수</a><br/>
                            <a href="${pageContext.request.contextPath }/">수상내역</a><br/>
                            <p>자기소개서</p>
                            <p>지원</p>
                            <p>전문가신청</p>
                           <a href="${pageContext.request.contextPath }/expert/application1"><p>전문가신청</p></a> --%>
			<!-- <ul class="left_menu" role="menu" style="
							    margin-left: 6rem;
							">
					            <li>
					                <a href="/user2/help/myInfoV2?m=viewProfile&amp;lang=ko_KR" class="left_item" role="menuitem" onclick="clickcr(this,'lnb.info','','',event)" aria-current="">
					                    <div class="menu_text ">내프로필</div>
					                </a>
					            </li>
					            <li>
					                <a href="/user2/help/myInfoV2?m=viewSecurity&amp;lang=ko_KR" class="left_item" role="menuitem" onclick="clickcr(this,'lnb.protect','','',event)" aria-current="">
					                    <div class="menu_text ">보안설정</div>
					                </a>
					            </li>
					            <li>
					                <a href="/user2/help/myInfoV2?m=viewManageHistory&amp;lang=ko_KR" class="left_item" role="menuitem" onclick="clickcr(this,'lnb.history','','',event)" aria-current="true">
					                    <div class="menu_text on">이력관리</div>
					                </a>
					            </li>
					        </ul> -->
			<ul class="gnb">
			<li class="only selected"><a onclick="resumeList()"
					href="#"
					>
						<svg>
							<use xlink:href="#"></use></svg> <span class="txt">이력서</span>
				</a></li>
				<li class="" id="resumeList"><a href="${pageContext.request.contextPath }/resume"
					onmousedown="pushDataLayer('ga_lead', 'pc_my_gnb', 'resume', '')">
						<svg>
							<use xlink:href="#svg_my_16"></use></svg> <span class="txt">나의 이력서</span>
				</a>
					</li>
				<li class="" id="resumeList"><a href="${pageContext.request.contextPath }/education"
					onmousedown="pushDataLayer('ga_lead', 'pc_my_gnb', 'resume', '')">
						<svg>
							<use xlink:href="#svg_my_16"></use></svg> <span class="txt">학력</span>
				</a>
					</li>
				<li class="only" id="resumeList"><a href="${pageContext.request.contextPath }/career"
					onmousedown="pushDataLayer('ga_lead', 'pc_my_gnb', 'scrap', '')">
						<svg>
							<use xlink:href="#svg_my_17"></use></svg> <span class="txt">경력</span>
					</a>
				</li>
				<li class="" id="resumeList"><a href="${pageContext.request.contextPath }/certification"
					onmousedown="pushDataLayer('ga_lead', 'pc_my_gnb', 'reclist', '')">
						<svg>
							<use xlink:href="#svg_my_59"></use></svg> <span class="txt">자격증</span>
				</a>
					</li>
				<li class="" id="resumeList"><a href="${pageContext.request.contextPath }/facility"
					onmousedown="pushDataLayer('ga_lead', 'pc_my_gnb', 'pool', '')">
						<svg>
							<use xlink:href="#svg_my_18"></use></svg> <span class="txt">기능</span>
				</a>
					</li>
				<li class="" id="resumeList"><a href="${pageContext.request.contextPath }/activity"
					onmousedown="pushDataLayer('ga_lead', 'pc_my_gnb', 'apply', '')">
						<svg>
							<use xlink:href="#svg_my_19"></use></svg> <span class="txt">주요활동</span>
				</a>
					</li>
				<li class="" id="resumeList"><a href="${pageContext.request.contextPath }/activity"
					onmousedown="pushDataLayer('ga_lead', 'pc_my_gnb', 'apply', '')">
						<svg>
							<use xlink:href="#svg_my_19"></use></svg> <span class="txt">교육이수</span>
				</a>
					</li>
				<li class="" id="resumeList"><a href="${pageContext.request.contextPath }/award"
					onmousedown="pushDataLayer('ga_lead', 'pc_my_gnb', 'apply', '')">
						<svg>
							<use xlink:href="#svg_my_19"></use></svg> <span class="txt">수상내역</span>
				</a>
					</li>
				<li class="only selected"><a
					href="${pageContext.request.contextPath }/myintro"
					onmousedown="pushDataLayer('ga_lead', 'pc_my_gnb', 'main', '')">
						<svg>
							<use xlink:href="#svg_my_15"></use></svg> <span class="txt">자기소개서</span>
				</a></li>
								<li class="only selected"><a
					href="${pageContext.request.contextPath }/apply"
					onmousedown="pushDataLayer('ga_lead', 'pc_my_gnb', 'main', '')">
						<svg>
							<use xlink:href="#svg_my_15"></use></svg> <span class="txt">지원</span>
				</a>
					</li>
				<li class="only selected"><a href="${pageContext.request.contextPath }/expert/newprod">
						<svg>
							<use xlink:href="${pageContext.request.contextPath }/expert/newProd"></use></svg> <span class="txt">상품등록</span>
				</a></li>
			</ul>
		</div>
	</div>

	<div id="sri_wrap">
		<div class="" style="width: 89%;">
			<div class="profile-head">
				<div class="calendarArea" style="height: 400px;">
					<div id="calendar" style="padding: 3%; background-color: rgb(255,255,255,0.5)" data-source="${pageContext.request.contextPath}/process/events/details/process"></div>				
				</div>
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active" id="home-tab"
						data-toggle="tab" href="#home" role="tab" aria-controls="home"
						aria-selected="true">회원정보</a></li>
					<li class="nav-item"><a class="nav-link" id="resume-tab"
						data-toggle="tab" href="#resume" role="tab" aria-controls="resume"
						aria-selected="false">전문가정보</a></li>
					<li class="nav-item"><a class="nav-link" id="apply-tab"
						data-toggle="tab" href="#apply" role="tab" aria-controls="apply"
						aria-selected="false">상품목록</a></li>
					<li class="nav-item"><a class="nav-link" id="apply-tab"
						data-toggle="tab" href="#likeAnno" role="tab"
						aria-controls="apply" aria-selected="false">판매목록</a></li>
					<li class="nav-item"><a class="nav-link" id="selfpr-tab"
						data-toggle="tab" href="#selfpr" role="tab" aria-controls="selfpr"
						aria-selected="false">후기</a></li>
				</ul>
				<div class="tab-content profile-tab" id="myTabContent">
					<!-- 토글 회원정보 -->
					<div class="tab-pane fade show active" id="home" role="tabpanel"
						aria-labelledby="home-tab">
						<div class="row">
							<div class="col-md-4">
								<label>아이디</label>
							</div>
							<div class="col-md-7">
								<p>${seeker.memId }</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<label>이름</label>
							</div>
							<div class="col-md-7">
								<p>${seeker.memName }</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<label>이메일</label>
							</div>
							<div class="col-md-7">
								<p>${seeker.memEmail }</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<label>전화번호</label>
							</div>
							<div class="col-md-7">
								<p>${seeker.memTel }</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<label>주소</label>
							</div>
							<div class="col-md-7">
								<p>(${seeker.memZip }) ${seeker.memAddr1 } ${seeker.memAddr2 }
							</div>
						</div>
					</div>
					<!-- 전문가 정보 -->
                            <div class="tab-pane fade" id="resume" role="tabpanel" aria-labelledby="resume-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>승인일자</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${expert.expertApprovalDate }</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>사업장 주소</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>(${expert.expertZip }) ${expert.expertAddr } ${expert.expertAddr2 } </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>사업장 번호</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${expert.expertTel }</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>이메일</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${expert.expertEmail }</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>은행, 계좌</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${expert.expertBank } / ${expert.expertAccount }</p>
                                            </div>
                                        </div>
                            </div>
					<!-- 토글 유료상품 등록 상품내역 -->
                            <div class="tab-pane fade" id="apply" role="tabpanel" aria-labelledby="apply-tab">
                                        <div class="row" style="height: 35px;"> 
                                            <div class="col-md-1">
                                                <label><strong>번호</strong></label>
                                            </div>
                                            <div class="col-md-5" style="
											    text-align: center;
											">
                                                <label><strong>상품명</strong></label>
                                            </div>
                                            <div class="col-md-2" >
                                                <p><strong>등록일</strong></p>
                                            </div>
                                            <div class="col-md-2">
                                                <p><strong>등록상태</strong></p>
                                            </div>
                                            <div class="col-md-1">
                                                <p><strong></strong></p>
                                            </div>
                                            <div class="col-md-1">
                                                <p><strong></strong></p>
                                            </div>
                                        </div>
                                       <c:forEach items="${expert.exprodList }" var="exprodList" varStatus="status">
                                        <div class="row">
                                            <div class="col-md-1">
                                                <label>${status.count }</label>
                                            </div>
                                            <div class="col-md-5">
                                                <label><a href="${pageContext.request.contextPath }/expert/prod/${exprodList.exprodId }">${exprodList.exprodName }</a></label>
                                            </div>
                                            <div class="col-md-2">
                                                <p id="exprodAppliDate">${exprodList.exprodAppliDate }</p>
                                            </div>
                                            <div id="aprovalArea" class="col-md-2 reviewArea">
                                                <p id="aprovalState" class="reviewState">${exprodList.exprodAproval }</p>
                                            </div>
                                            <div class="col-md-1">
                                                <p class="updateProd"><a href="${pageContext.request.contextPath }/expert/pushprod/${exprodList.exprodId }">수정</a></p>
                                            </div>
                                            <div class="col-md-1">
                                                <p class="updateProd"><a href="javascript:void(window.open('${pageContext.request.contextPath }/expert/chat/${exprodList.exprodId }','채팅창','width=650px,height=600px'))">입장</a></p>
                                            </div>
                                        </div>
                                       </c:forEach>
                            </div>
					<!-- 토글 유료상품 판매내역 -->
                            <div class="tab-pane fade" id="likeAnno" role="tabpanel" aria-labelledby="likeAnno-tab">
                                        <div class="row" style="height: 35px;"> 
                                            <div class="col-md-1">
                                                <label><strong>번호</strong></label>
                                            </div>
                                            <div class="col-md-4" style="
											    text-align: center;
											">
                                                <label><strong>상품명</strong></label>
                                            </div>
                                            <div class="col-md-2">
                                                <p><strong>구매자</strong></p>
                                            </div>
                                            <div class="col-md-3" style="
											    text-align: center;
											">
                                                <p ><strong>판매일시</strong></p>
                                            </div>
                                            <div class="col-md-2">
                                                <p><strong>판매가격</strong></p>
                                            </div>
                                        </div>
                                       <c:forEach items="${excartList }" var="excartList" varStatus="status">
                                        <div class="row">
                                            <div class="col-md-1">
                                                <label>${status.count }</label>
                                            </div>
                                            <div class="col-md-4">
                                                <label><a href="${pageContext.request.contextPath }/expert/prod/${excartList.exprodId }">${excartList.exprodName }</a></label>
                                            </div>
                                            <div class="col-md-2 ">
                                                <p >${excartList.memId }</p>
                                            </div>
                                            <div class="col-md-3">
                                                <p id="excartDate" style="text-align: center;">${excartList.excartDate }</p>
                                            </div>
                                            <div class="col-md-2">
                                                <p>${excartList.excartPrice }원</p>
                                            </div>
                                        </div>
                                       </c:forEach>
                            </div>
					  <!-- 토글 홍보글 -->
                            <div class="tab-pane fade" id="selfpr" role="tabpanel" aria-labelledby="selfpr-tab">
                                        <div class="row" style="height: 35px;"> 
                                            <div class="col-md-1">
                                                <label><strong>번호</strong></label>
                                            </div>
                                            <div class="col-md-4" style="
											    text-align: center;
											">
                                                <label><strong>상품명</strong></label>
                                            </div>
                                            <div class="col-md-2">
                                                <p><strong>작성자</strong></p>
                                            </div>
                                            <div class="col-md-3" style="
											    text-align: center;
											">
                                                <p><strong>리뷰제목</strong></p>
                                            </div>
                                            <div class="col-md-2">
                                                <p><strong>작성일</strong></p>
                                            </div>
                                        </div>
                                       <c:forEach items="${exreviewList }" var="exreviewList" varStatus="status">
                                        <div class="row">
                                            <div class="col-md-1">
                                                <label>${status.count }</label>
                                            </div>
                                            <div class="col-md-4">
                                                <label><a href="${pageContext.request.contextPath }/expert/prod/${exreviewList.exprodId }">${exreviewList.exprodName }</a></label>
                                            </div>
                                            <div class="col-md-2 ">
                                                <p >${exreviewList.memId }</p>
                                            </div>
                                            <div class="col-md-3">
                                                <p>${exreviewList.exreviewName }</p>
                                            </div>
                                            <div class="col-md-2">
                                                <p id="exreviewDate">${exreviewList.exreviewDate }</p>
                                            </div>
                                        </div>
                                       </c:forEach>
                            </div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
var exprodAppliDate = document.querySelectorAll("#exprodAppliDate");
for(var i=0; i<exprodAppliDate.length; i++){
	exprodAppliDate[i].innerHTML=exprodAppliDate[i].innerText.substring(0,10);
}  
var excartDate = document.querySelectorAll("#excartDate");
for(var i=0; i<excartDate.length; i++){
	excartDate[i].innerHTML=excartDate[i].innerText.substring(0,16);
}  
for(var i=0; i<exreviewDate.length; i++){
	exreviewDate[i].innerHTML=exreviewDate[i].innerText.substring(0,10);
}  
var checkPass = function(){
    Swal.fire({
        title: '비밀번호를 입력하세요',
        html: `<input type="password" id="login" class="swal2-input" placeholder="비밀번호" autocomplete='off'>`,
        inputAttributes: {
          autocapitalize: 'off'
        },
        showCancelButton: true,
        confirmButtonText: 'Look up',
        showLoaderOnConfirm: true,
        preConfirm: (login) => {
         var memPass = Swal.getPopup().querySelector('#login').value
          return fetch(`${pageContext.request.contextPath}/mypage/checkMempass`,{
        	  body : JSON.stringify({
        		  "memPass" : memPass
        	  }),
        	  method: 'POST',
        	  headers:{
        	  	'Content-Type' :'application/json;charset=UTF-8'
        		  
        	  },
        	  dataType:"json"
          })
          .then((response) => response.json())
          .then((data) => {
        	  var message = data.message;
          		if(message == "equal"){
        	  		return location.href = "${pageContext.request.contextPath}/update";
         		 }else{
         			return Swal.showValidationMessage(
         	      	          `비밀번호가 틀렸습니다.
         	      	          `
         	      	      )
         		 }
          })
	      .catch(error => {
	        Swal.showValidationMessage(
	          `Request failed: ${error}`
	        )
	      })
          
        },
        allowOutsideClick: () => !Swal.isLoading()
      }).then((result) => {
    	  console.log(result)
        if (result.isConfirmed) {
        	Swal.showValidationMessage(
      	          `Request failed: ${error}`
      	      )
        }
      })
}
  /*   
	swal({
		title: 'Submit email to subscribe',
		input : "text",
		showCancelButton: true,
		confirmButtonColor: "#DD6B55",
		confirmButtonText: "예",
		cancelButtonText: "아니요",
		closeOnConfirm: false,
		closeOnCancel : true
	}, function (isConfirm) {
		if (!isConfirm) return;
		jQuery.ajax({
			type : "get",
			url : "${pageContext.request.contextPath}/mypage/checkMempass",
			data : "content",
			cache: false,
			dataType : "text",
			success : function(data) {
				swal("성공", "작업을 정상적으로 완료하였습니다.", "success");
			},
			error : function(e) {
				swal("실패", "작업수행에 실패하였습니다.", "error");
			}, timeout:100000
		});
	}); */
// }
	//   if()
	//   reviewArea.append("adasdasdsad") 
	/*   for(var i=0; i<reviewState.length; i++){
	 if(reviewState[i].innerText==="미등록"){
	 console.log(exprodId[i].value);
	 reviewState[i].innerHTML = "<button type=button onclick="+"location.href='${pageContext.request.contextPath }/expert/review/write';"+">미등록</button>";
	 }else{
	 continue;
	 }
	 }  */
	  var aprovalArea = document.querySelectorAll("#aprovalArea");
	  var aprovalState = document.querySelectorAll("#aprovalState");
	  console.log(aprovalState);
	  for(var i=0; i<aprovalState.length; i++){
	  	if(aprovalState[i].innerText==="N"){
	  		aprovalState[i].innerHTML = "승인 대기중";
	  	}else{
	  		aprovalState[i].innerHTML = "승인 완료";
	  	}
	  } 

	/*   var reviewArea = $(".reviewArea");
	 var reviewState = $(".reviewState");
	
	 var excartArea = $(".excartArea");
	 var excartState = $(".excartState"); 
	 function button() {
	 return $("<button>").html("등록하기");
	 }
	 console.log(button)	  ;
	 $.each(reviewState, function(index, state) {
	 console.log(index, ":", state.innerHTML);
	 if (state.innerHTML == "미등록") {
	 reviewArea[index].innerHTML = "<p>미등록</p><button>등록하기</button>";
	 }
	 }); */


</script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.1/index.global.min.js'></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
	  var calendarEl = document.getElementById('calendar');
	  var calendar = new FullCalendar.Calendar(calendarEl, {
	    initialView: 'dayGridWeek'
//	    , plugins: [ 'interaction', 'dayGrid']
	    , headerToolbar: {
	      	  left: 'prevYear,prev,today',
	      	  center: 'title',
	      	  right: 'dayGridMonth,dayGridWeek,next,nextYear'
	    }
	    , editable: true
	    , droppable: true
	    , locale: 'ko'
	    , buttonText: {
          today: '오늘',
          week: '주',
          month: '월'
	    }
	    , eventSources : {
			url:"${pageContext.request.contextPath}/process/events/details/process",
			dataType:"json",
			extraParams : {
				date : "2022-01-01"
			},
			textColor : 'white'
		}
	  });
	  
	  calendar.setOption('aspectRatio', 1.2);
	  calendar.setOption('height', '100%');
	  calendar.render();
	  
	  document.querySelector(".fc-today-button").parentNode.style.width = "111%";
	  document.querySelector(".fc-anno-button").parentNode.style.width = "430px";
	  document.querySelector(".fc-anno-button").style.display = "inline-block";
	  document.querySelector(".fc-anno-button").style.width = "130px";
	  document.querySelector(".fc-detail-button").style.display = "inline-block";
	  document.querySelector(".fc-detail-button").style.width = "130px";
	  document.querySelector(".fc-process-button").style.display = "inline-block";
	  document.querySelector(".fc-process-button").style.width = "130px";
	});
</script>