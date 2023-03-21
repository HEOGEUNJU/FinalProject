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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
				src="<spring:url value="/image/companyFolder/${incruiter.companyVO.attatchList[0].attSavename }"/>"
				alt="" style="width: 270px;height: 300px;     border-radius: 15px;" />

			<%--    <div class="form-group">
			                <!-- <label for="company-website-tw d-block">프로필사진변경</label> <br> -->
			                <a class="btn btn-primary btn-md btn-file" href="${pageContext.request.contextPath }/update">
			                  회원정보수정
			                </a>
            		  </div> --%>
            		  </div>
			<div class="profile" style="margin-top: 50px;">
				<p class="useid">${incruiter.memId }</p>
				<p class="usemail">${incruiter.incruiterVO.memEmail }</p>
				<a class="btn btn-primary btn-md btn-file"
					href="<%-- ${pageContext.request.contextPath }/update --%>#" onclick="checkPass()"> 회원정보수정 </a>
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
							<use xlink:href="#"></use></svg> <span class="txt">공고</span>
				</a></li>
				<li class="" id="resumeList"><a href="${pageContext.request.contextPath }/process/list"
					onmousedown="pushDataLayer('ga_lead', 'pc_my_gnb', 'resume', '')">
						<svg>
							<use xlink:href="#svg_my_16"></use></svg> <span class="txt">공고목록</span>
				</a>
					</li>
				<li class="" id="resumeList"><a href="${pageContext.request.contextPath }/process/list"
					onmousedown="pushDataLayer('ga_lead', 'pc_my_gnb', 'resume', '')">
						<svg>
							<use xlink:href="#svg_my_16"></use></svg> <span class="txt">세부공고목록</span>
				</a>
					</li>
				
				<li class="only selected"><a
					href="${pageContext.request.contextPath }/process"
					onmousedown="pushDataLayer('ga_lead', 'pc_my_gnb', 'main', '')">
						<svg>
							<use xlink:href="#svg_my_15"></use></svg> <span class="txt">채용과정</span>
				</a></li>
								<li class="only selected"><a
					href="${pageContext.request.contextPath }/apply"
					onmousedown="pushDataLayer('ga_lead', 'pc_my_gnb', 'main', '')">
						<svg>
							<use xlink:href="#svg_my_15"></use></svg> <span class="txt">권한</span>
				</a>
					</li>
				<li class="only selected"><a
					href="${pageContext.request.contextPath }/update/company"
					onmousedown="pushDataLayer('ga_lead', 'pc_my_gnb', 'main', '')">
						<svg>
							<use xlink:href="#svg_my_15"></use></svg> <span class="txt">기업수정</span>
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
                <ul class="nav nav-tabs" id="myTab" role="tablist" >
                    <li class="nav-item">
                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">회원정보</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="resume-tab" data-toggle="tab" href="#resume" role="tab" aria-controls="resume" aria-selected="false">기업정보</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="apply-tab" data-toggle="tab" href="#apply" role="tab" aria-controls="apply" aria-selected="false">할 일</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="apply-tab" data-toggle="tab" href="#likeAnno" role="tab" aria-controls="apply" aria-selected="false">공고</a>
                    </li>
        <!--                                 <li class="nav-item">
                        <a class="nav-link" id="apply-tab" data-toggle="tab" href="#likeCompany" role="tab" aria-controls="apply" aria-selected="false">관심인재 목록</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="selfpr-tab" data-toggle="tab" href="#selfpr" role="tab" aria-controls="selfpr" aria-selected="false">홍보글</a>
                    </li> -->
                     <li class="nav-item">
                        <a class="nav-link" id="excart-tab" data-toggle="tab" href="#excart" role="tab" aria-controls="excart" aria-selected="false">관심인재</a>
                    </li> 
                </ul>
				<div class="tab-content profile-tab" id="myTabContent">
                       		<!-- 토글 회원정보 -->
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label>이름</label>
                                            </div>
                                            <div class="col-md-8">
                                                <p>${incruiter.memName}</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label>전화번호</label>
                                            </div>
                                            <div class="col-md-8">
                                                 <p>${incruiter.memTel}</p> 
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label>가입일</label>
                                            </div>
                                            <div class="col-md-8">
                                                <p>${incruiter.memDate}</p>
                                            </div>
                                        </div>
                            </div>
                            <!-- 토글 이력서 -->
                            <div class="tab-pane fade" id="resume" role="tabpanel" aria-labelledby="resume-tab">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label>회사번호</label>
                                            </div>
                                            <div class="col-md-8">
                                                <p>${incruiter.companyVO.cmpNo}</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label>회사명</label>
                                            </div>
                                            <div class="col-md-8">
                                                <p>${incruiter.companyVO.cmpName}</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label>회사주소</label>
                                            </div>
                                            <div class="col-md-8">
                                                <p>(${incruiter.companyVO.cmpZip}) ${incruiter.companyVO.cmpAddr1} ${incruiter.companyVO.cmpAddr2}</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label>대표자</label>
                                            </div>
                                            <div class="col-md-8">
                                                <p>${incruiter.companyVO.cmpRepName}</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label>대표 번호</label>
                                            </div>
                                            <div class="col-md-8">
                                                <p>${incruiter.companyVO.cmpPhone}</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label>구분</label>
                                            </div>
                                            <div class="col-md-8">
                                                <p>${incruiter.companyVO.cmpSmenp}</p>
                                            </div>
                                        </div>
<!--                                 <div class="row"> -->
<!--                                     <div class="col-md-12"> -->
<!--                                         <label>Your Bio</label><br/> -->
<!--                                         <p>Your detail description</p> -->
<!--                                     </div> -->
<!--                                 </div> -->
                            </div>
                            <!-- 토글 할일 -->
                            <div class="tab-pane fade" id="apply" role="tabpanel" aria-labelledby="apply-tab">
								<div class="row" style="height: 35px;">

									<div class="col-md-3">
										<label><strong>No</strong></label>
									</div>
									<div class="col-md-5">
										<p>
											<strong>TODO</strong>
										</p>
									</div>
									<div class="col-md-2">
										<p>
											<strong>DEADLINE</strong>
										</p>
									</div>
									<div class="col-md-2">
										<p>
											<strong>CHECK</strong>
										</p>
									</div>
								</div>
								<div class="row">

									<div class="col-md-3">
										<label><a
											href="#">42235</a></label>
									</div>
									<div class="col-md-5">
										<p>공고-세부공고-채용과정</p>
									</div>
									<div id="reviewArea" class="col-md-2 reviewArea">
										<p id="reviewState" class="reviewState">2023-02-20</p>
									</div>
									<div id="excartArea" class="col-md-2 excartArea">
										<p id="excartState" class="excartState" style="margin-left: 21px;"><input type="checkBox"></p>
									</div>
									
								</div>
								<div class="row">

									<div class="col-md-3">
										<label><a
											href="#">42442</a></label>
									</div>
									<div class="col-md-5">
										<p>세부공고-채용과정</p>
									</div>
									<div id="reviewArea" class="col-md-2 reviewArea">
										<p id="reviewState" class="reviewState">2023-02-21</p>
									</div>
									<div id="excartArea" class="col-md-2 excartArea">
										<p id="excartState" class="excartState" style="margin-left: 21px;"><input type="checkBox"></p>
									</div>
									
								</div>
								<div class="row">

									<div class="col-md-3">
										<label><a
											href="#">42257</a></label>
									</div>
									<div class="col-md-5">
										<p>채용과정-항목</p>
									</div>
									<div id="reviewArea" class="col-md-2 reviewArea">
										<p id="reviewState" class="reviewState">2023-02-22</p>
									</div>
									<div id="excartArea" class="col-md-2 excartArea">
										<p id="excartState" class="excartState" style="margin-left: 21px;"><input type="checkBox"></p>
									</div>
									
								</div>
								<div class="row">

									<div class="col-md-3">
										<label><a
											href="#">42311</a></label>
									</div>
									<div class="col-md-5">
										<p>점수입력</p>
									</div>
									<div id="reviewArea" class="col-md-2 reviewArea">
										<p id="reviewState" class="reviewState">2023-02-23</p>
									</div>
									<div id="excartArea" class="col-md-2 excartArea">
										<p id="excartState" class="excartState" style="margin-left: 21px;"><input type="checkBox"></p>
									</div>
									
								</div>
								<div class="row">

									<div class="col-md-3">
										<label><a
											href="#">42311</a></label>
									</div>
									<div class="col-md-5">
										<p>달력, 선형진행도</p>
									</div>
									<div id="reviewArea" class="col-md-2 reviewArea">
										<p id="reviewState" class="reviewState">2023-02-24</p>
									</div>
									<div id="excartArea" class="col-md-2 excartArea">
										<p id="excartState" class="excartState" style="margin-left: 21px;"><input type="checkBox"></p>
									</div>
									
								</div>
								<div class="row">

									<div class="col-md-3">
										<label><a
											href="#">42311</a></label>
									</div>
									<div class="col-md-5">
										<p>첨부파일</p>
									</div>
									<div id="reviewArea" class="col-md-2 reviewArea">
										<p id="reviewState" class="reviewState">2023-02-25</p>
									</div>
									<div id="excartArea" class="col-md-2 excartArea">
										<p id="excartState" class="excartState" style="margin-left: 21px;"><input type="checkBox"></p>
									</div>
									
								</div>
                            </div>
                            <!-- 토글 공고목록 -->
                            <div class="tab-pane fade" id="likeAnno" role="tabpanel" aria-labelledby="likeAnno-tab">
                                        <div class="row" style="height: 35px;">

									<div class="col-md-1">
										<label><strong>No</strong></label>
									</div>
									<div class="col-md-3" style="text-align: center;">
										<p>
											<strong>회사명</strong>
										</p>
									</div>
									<div class="col-md-6" style="text-align: center;">
										<p>
											<strong>공고명</strong>
										</p>
									</div>
<<<<<<< .mine
									<div class="col-md-3" style="text-align: center;">
||||||| .r311593
=======
									<div class="col-md-2" >
>>>>>>> .r312092
										<p>
											<strong>기간</strong>
										</p>
									</div>
								</div>
								<c:forEach items="${list}" var="anno" varStatus="status"  >
								<div class="row">

									<div class="col-md-1">
										<label><a
											href="#">${status.index+1 }</a></label>
									</div>
									<div class="col-md-3">
										<p>${anno.company.cmpName}</p>
									</div>
									<div id="reviewArea" class="col-md-5 reviewArea">
										<p id="reviewState" class="reviewState"><a href="${pageContext.request.contextPath}/announcement/view/${anno.annoNo}">${anno.annoTitle}</a></p>
									</div>
									<div id="excartArea" class="col-md-3 excartArea">
										<p id="excartState" class="excartState" style="margin-left: 21px;">${fn:substring(anno.annoStartdate, 0, 10)} ~ ${fn:substring(anno.annoEnddate, 0, 10)}</p>
									</div>
									
								</div>
								</c:forEach>
                            </div>
<!--                             토글 관심기업
                            <div class="tab-pane fade" id="likeCompany" role="tabpanel" aria-labelledby="likeCompany-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>likeCompany</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>Expert</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Hourly Rate</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>10$/hr</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Total Projects</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>230</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>English Level</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>Expert</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Availability</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>6 months</p>
                                            </div>
                                        </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Your Bio</label><br/>
                                        <p>Your detail description</p>
                                    </div>
                                </div>
                            </div>
                            토글 홍보글
                            <div class="tab-pane fade" id="selfpr" role="tabpanel" aria-labelledby="selfpr-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>selfpr</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>Expert</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Hourly Rate</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>10$/hr</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Total Projects</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>230</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>English Level</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>Expert</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Availability</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>6 months</p>
                                            </div>
                                        </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Your Bio</label><br/>
                                        <p>Your detail description</p>
                                    </div>
                                </div>
                            </div> -->

                            <!-- 토글 유료상품 구매내역 -->
                            <div class="tab-pane fade" id="excart" role="tabpanel" aria-labelledby="excart-tab">
                                        <div class="row" style="height: 35px;"> 
                                            <div class="col-md-2">
                                                <label><strong>번호</strong></label>
                                            </div>
                                            <div class="col-md-3">
                                                <label><strong>상품명</strong></label>
                                            </div>
                                            <div class="col-md-3">
                                                <p><strong>구매일시</strong></p>
                                            </div>
                                            <div class="col-md-2">
                                                <p><strong>리뷰등록</strong></p>
                                            </div>
                                            <div class="col-md-2">
                                                <p><strong>상품이용</strong></p>
                                            </div>
                                        </div>
                                       <c:forEach items="${excartList }" var="excart" varStatus="status">
                                        <div class="row">
                                            <div class="col-md-1">
                                                <label>${status.count }</label>
                                            </div>
                                            <div class="col-md-4">
                                                <label><a href="${pageContext.request.contextPath }/expert/prod/${excart.exprodId }">${excart.exprodName }</a></label>
                                            </div>
                                            <div class="col-md-3">
                                                <p>${excart.excartDate }</p>
                                            </div>
                                            <div id="reviewArea" class="col-md-2 reviewArea">
                                                <p id="reviewState" class="reviewState">${excart.reviewState }</p>
                                            </div>
                                            <div id="excartArea" class="col-md-2 excartArea">
                                                <p id="excartState" class="excartState">${excart.excartState }</p>
                                            </div>
                                            <input type="hidden" value="${excart.exprodId }" id="exprodId"/>
                                        </div>
                                       </c:forEach>
<<<<<<< .mine
                          <!-- <div class="tab-pane fade active show" id="anno" role="tabpanel" aria-labelledby="profile-tab">
								<table style="border: 1px black solid">
									<tbody><tr style="background-color: lavender;">
										<th style=" text-align: center;">공고명</th>	
										<th style=" text-align: center;">공고진행기간</th>	
										<th style=" text-align: center;">상태관리</th>	
									</tr>
									<tr>
										<td style=" text-align: center;">한국타이어 신입 모집</td>
										<td style=" text-align: center;">23-03-05~23-03-06(종료됨)</td>
										<td style=" text-align: center;">
											<div class="searchTypoBox" style="display: inline-block; float: right; margin-right: 65px; margin:auto;">
												<button type="button" class="btnTypoSearch" id="searchBtn" style="background-color: #3157dd; border: 1px white solid">수정</button>
												<button type="button" class="btnTypoSearch" id="searchBtn" style="background-color: #3157dd; border: 1px white solid">종료</button>
												<button type="button" class="btnTypoSearch" id="searchBtn" style="background-color: #3157dd; border: 1px white solid">삭제</button>
											</div>
										</td>
									</tr>
								</tbody></table>
                            </div> -->
||||||| .r311593
=======
>>>>>>> .r312092

                            </div>
                        </div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
var $resumeList = document.querySelectorAll("#resumeList");
//for(var i=0; i<$resumeList.length; i++){
//	$resumeList[i].style.display ='none';
//}
function resumeList(){
	console.log($resumeList);
	if($resumeList[0].style.display =='none'){
		for(var i=0; i<$resumeList.length; i++){
			$resumeList[i].style.display ='';
		}
	}else{
		for(var i=0; i<$resumeList.length; i++){
			$resumeList[i].style.display ='none';
		}
	}
}

var checkPass = function(){
 Swal.fire({
     title: '비밀번호를 입력하세요',
     html: `<input type="password" id="login" class="swal2-input" placeholder="비밀번호" autocomplete="off">`,
     inputAttributes: {
       autocapitalize: 'off'
     },
     showCancelButton: true,
     confirmButtonText: 'OK',
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
     	  		return location.href = "${pageContext.request.contextPath}/update/incruiter";
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

	var reviewArea = document.querySelectorAll("#reviewArea");
	var reviewState = document.querySelectorAll("#reviewState");
	var excartArea = document.querySelectorAll("#excartArea");
	var excartState = document.querySelectorAll("#excartState");
	var exprodId = document.querySelectorAll("#exprodId");
	console.log(reviewState);
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
	for (var i = 0; i < excartState.length; i++) {
		if (excartState[i].innerText === "미사용") {
			excartState[i].innerHTML = "<a href="
					+ "javascript:void(window.open('${pageContext.request.contextPath }/expert/chat/"
					+ exprodId[i].value + "','채팅창','width=400px,height=650px')"
					+ ")>미사용</a>";
		} else {
			continue;
		}
	}
	for (var i = 0; i < excartState.length; i++) {
		if (excartState[i].innerText === "사용완료"
				&& reviewState[i].innerText === "미등록") {
			reviewState[i].innerHTML = "<button type=button onclick="+"location.href='${pageContext.request.contextPath }/expert/review/write';"+">미등록</button>";
		} else {
			continue;
		}
	}

	function reviewWrite() {
		location.href = "${pageContext.request.contextPath }/expert/write";
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

	function fn_direct_pay() {
		if (1 === 1) { // 결제금액이 0원일경우 바로 결제완료 처리
			// 카카오 결제 API
			var IMP = window.IMP; // 생략가능
			IMP.init('imp23062788'); // 가맹점 식별코드
			// IMP.request_pay(param, callback) 결제창 호출
			IMP.request_pay({
				pg : 'kakaopay', //pg사 선택 (kakao, kakaopay 둘다 가능)
				pay_method : 'card',// 기능 없음
				merchant_uid : '10000',
				name : '10000',
				amount : 10000, // 빌링키 발급과 함께 1,004원 결제승인을 시도합니다.
				//customer_uid 파라메터가 있어야 빌링키 발급을 시도함
				customer_uid : 'imp23062788',
				buyer_email : 'iamport@siot.do',
				buyer_name : '대전오슈',
				buyer_tel : '042-222-8202',
				buyer_addr : '대전광역시 중구 계룡로 846 3층',
			}, function(rsp) { //callback
				if (rsp.success) {
					console.log('빌링키 발급 성공', rsp)
					//빌링키 발급이 완료되었으므로, 서버에 결제 요청
					alert('예약 결제가 완료되었습니다');
					$('input[name=paymentResult]').attr('value', '결제완료')
				} else {
					var msg = '결제에 실패하였습니다.\n';
					msg += rsp.error_msg;
					alert(msg);
					return false;
				}
				//$("#final-support-submit").submit();
				$("#paymentInformation").submit();
			});
		} else {
			$('input[name=paymentResult]').attr('value', '결제완료')
			$("#paymentInformation").submit();
		}

	}
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