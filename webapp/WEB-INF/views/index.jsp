<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link href="<%=request.getContextPath()%>/resources/index/index.css" rel="stylesheet"/>

<!-- gridstack -->
<link href="<%=request.getContextPath()%>/resources/index/node_modules/gridstack/dist/gridstack.min.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/resources/index/grid.css" rel="stylesheet"/>
<script src="${pageContext.request.contextPath}/resources/index/node_modules/gridstack/dist/gridstack-all.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<div class="grid-stack">
<!-- ============================================프로필=================================================== -->
<!-- spring security용 -->
    <div class="grid-stack-item"  gs-x="0" gs-y="0" gs-w="3" gs-h="4">
		<security:authorize url="/mypage.do">
			<security:authentication property="principal" var="memberVOWrapper"/>
			<security:authentication property="principal.realMember" var="authMember"/>
			<!-- incruiter랑 expert도 -->
			<c:choose>
				<c:when test="${not empty authMember.seekerVO.memNickname}">
					<div class="grid-stack-item-content" style="background-image: url('<spring:url value="/image/memberFolder/${authMember.attach.attSavename}"/>'); background-size: cover; background-position: center;">
				</c:when>
				<c:when test="${not empty authMember.incruiterVO.cmpId}">
					<div class="grid-stack-item-content" style="background-image: url('<spring:url value="/image/companyFolder/${authMember.incruiterVO.attSavename}"/>'); background-size: cover; background-position: center;">
				</c:when>
				<c:otherwise>
					<div class="grid-stack-item-content" style="background-image: url(${pageContext.request.contextPath}/resources/images/profile.jpg); background-size: cover; background-position: center;">
				</c:otherwise>
			</c:choose>
				<div id="profile" style="padding: 3%; height: 65%;"></div>
				<div style="width: 90%; height: 30%; background-color: rgb(0, 0, 0, 0.4); padding: 20px; border-radius: 16px; margin-left: auto; margin-right: auto;">
					<a href="<c:url value='/mypage/seeker'/>" style="color: white; position: absolute; top: 70%;"><h2 style="color: white; display: inline-block; margin-bottom: 0;">${authMember.memName }</h2>님</a>
					<h6 style="color: white; margin-bottom: 0; position: absolute; top: 81%;">[${authMember.memAuthCd }]</h6>
					<h6 style="color: white; display: inline-block; margin-bottom: 0; position: absolute; top: 86%;">${authMember.seekerVO.memEmail}</h6>
					<h6 style="color: white; display: inline-block; margin-bottom: 0; position: absolute; top: 86%;">${authMember.incruiterVO.incruiterEmail}</h6>
					<a href="<c:url value='/logout'/>" class="logoutBtn" style=" display: inline-block; position: absolute; top: 88%; right: 8%;"><h6 style="color: white; display: inline-block;">로그아웃</h6></a>
				</div>
			</div>
		</security:authorize>
		<security:authorize url="/join/seeker">
	        <div class="grid-stack-item-content" style="background-image: url(${pageContext.request.contextPath}/resources/images/noImage.png); background-size: cover; background-position: center;">
				<div id="profile" style="padding: 3%; height: 65%;"></div>
				<div style="width: 90%; height: 30%; background-color: rgb(0, 0, 0, 0.4); padding: 20px; border-radius: 16px; margin-left: auto; margin-right: auto;">
					<div>
						<a href="<c:url value='/login'/>"><h2 style="color: white;">로그인</h2></a>
					</div>
					<div>
						<a style="color: white;" href="<c:url value='/join/seeker'/>">회원가입</a>
<%-- 						<a href="<c:url value='/join/incruiter'/>">기업회원가입</a> --%>
<%-- 						<a href="<c:url value='/join/seeker'/>">일반회원가입</a> --%>
						<a style="color: white;" href="<c:url value='/help/find'/>">아이디/비밀번호 찾기</a>
					</div>
				</div>
			</div>
		</security:authorize>
    </div>
<!-- ============================================달력=================================================== -->    
    <div class="grid-stack-item"  gs-x="3" gs-y="0" gs-w="6" gs-h="5">
        <div class="grid-stack-item-content">
			<div id="calendar" style="padding: 3%; background-color: rgb(255,255,255)" data-source="${pageContext.request.contextPath}/process/events/details/process"></div>
		</div>
    </div>
<!-- ============================================일정=================================================== -->
    <div class="grid-stack-item"  gs-x="9" gs-y="0" gs-w="3" gs-h="4">
        <div class="grid-stack-item-content">
			<div class="top shadow-sm" style="height: 70px; background-color: rgb(255, 255, 255, 0.5);">
				<span style="position:absolute; left: 30px; top: 5px; font-size: 2em; font-weight: 700;">할 일</span><br><span style="position:absolute; left: 30px; top: 45px">할 일 모아보기</span>
			</div>  
			<div id='schedular' class="table-responsive" style="padding-top: 20px; width: 100%; height: 100%;">
				<ul class="responsive-table">
				  <li class="table-header">
				    <div class="col col-1">No</div>
				    <div class="col col-2">TODO</div>
				    <div class="col col-3">DEADLINE</div>
				    <div class="col col-4" style="position: relative; left: -15px;">CHECK</div>
				  </li>
				  <li class="table-row">
				    <div class="col col-1">42235</div>
				    <div class="col col-2"><input type="text" value="공고-세부공고-채용과정"></div>
				    <div class="col col-3"><input type="date" value="2023-02-20"></div>
				    <div class="col col-4"><input type="checkBox"></div>
				  </li>
				  <li class="table-row">
				    <div class="col col-1">42442</div>
				    <div class="col col-2"><input type="text" value="세부공고-채용과정"></div>
				    <div class="col col-3"><input type="date" value="2023-02-21"></div>
				    <div class="col col-4"><input type="checkBox"></div>
				  </li>
				  <li class="table-row">
				    <div class="col col-1">42257</div>
				    <div class="col col-2"><input type="text" value="채용과정-항목"></div>
				    <div class="col col-3"><input type="date" value="2023-02-22"></div>
				    <div class="col col-4"><input type="checkBox"></div>
				  </li>
				  <li class="table-row">
				    <div class="col col-1">42311</div>
				    <div class="col col-2"><input type="text" value="점수입력"></div>
				    <div class="col col-3"><input type="date" value="2023-02-23"></div>
				    <div class="col col-4"><input type="checkBox"></div>
				  </li>
				  <li class="table-row">
				    <div class="col col-1">42311</div>
				    <div class="col col-2"><input type="text" value="달력, 선형진행도"></div>
				    <div class="col col-3"><input type="date" value="2023-02-24"></div>
				    <div class="col col-4"><input type="checkBox"></div>
				  </li>
				  <li class="table-row">
				    <div class="col col-1">42311</div>
				    <div class="col col-2"><input type="text" value="첨부파일"></div>
				    <div class="col col-3"><input type="date" value="2023-02-25"></div>
				    <div class="col col-4"><input type="checkBox"></div>
				  </li>
				</ul>
			</div>
		</div>
    </div>
<!-- ============================================빠른메뉴=================================================== -->
    <div class="grid-stack-item"  gs-x="0" gs-y="3" gs-w="3" gs-h="1">
        <div class="grid-stack-item-content">
			<div class="down" style="height: 100%; display: flex; justify-content: space-evenly; background-color: rgba(255, 255, 255, 0.5)">
				<c:choose>
					<c:when test="${not empty authMember.seekerVO.memNickname}">
						<a href="${pageContext.request.contextPath}/apply" style="display: inline-block; width: 25%; padding: 7px;"><button class="btn btn-outline-primary" style="width: 100%; height: 100%; border-radius: 16px; word-break: keep-all;">지원서</button></a>
						<a href="${pageContext.request.contextPath}/resume" style="display: inline-block; width: 25%; padding: 7px;"><button class="btn btn-outline-primary" style="width: 100%; height: 100%; border-radius: 16px; word-break: keep-all;">이력서</button></a>
						<a href="${pageContext.request.contextPath}/myintro" style="display: inline-block; width: 25%; padding: 7px;"><button class="btn btn-outline-primary" style="width: 100%; height: 100%; border-radius: 16px; word-break: keep-all;">자소서</button></a>
						<a href="${pageContext.request.contextPath}/selfpr" style="display: inline-block; width: 25%; padding: 7px;"><button class="btn btn-outline-primary" style="width: 100%; height: 100%; border-radius: 16px; word-break: keep-all; padding: 0;">인재홍보</button></a>
					</c:when>
					<c:when test="${not empty authMember.incruiterVO.cmpId}">
						<a href="${pageContext.request.contextPath}/announcement/insert" style="display: inline-block; width: 25%; padding: 7px;"><button class="btn btn-outline-primary" style="width: 100%; height: 100%; border-radius: 16px; word-break: keep-all; padding: 0;">공고작성</button></a>
						<a href="${pageContext.request.contextPath}/process/list" style="display: inline-block; width: 25%; padding: 7px;"><button class="btn btn-outline-primary" style="width: 100%; height: 100%; border-radius: 16px; word-break: keep-all; padding: 0;">공고목록</button></a>
						<a href="${pageContext.request.contextPath}/process" style="display: inline-block; width: 25%; padding: 7px;"><button class="btn btn-outline-primary" style="width: 100%; height: 100%; border-radius: 16px; word-break: keep-all; padding: 0;">채용과정</button></a>
						<a href="${pageContext.request.contextPath}/selfpr" style="display: inline-block; width: 25%; padding: 7px;"><button class="btn btn-outline-primary" style="width: 100%; height: 100%; border-radius: 16px; word-break: keep-all; padding: 0;">인재홍보</button></a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/apply" style="display: inline-block; width: 25%; padding: 7px;"><button class="btn btn-outline-primary" style="width: 100%; height: 100%; border-radius: 16px; word-break: keep-all;">지원서</button></a>
						<a href="${pageContext.request.contextPath}/resume" style="display: inline-block; width: 25%; padding: 7px;"><button class="btn btn-outline-primary" style="width: 100%; height: 100%; border-radius: 16px; word-break: keep-all;">이력서</button></a>
						<a href="${pageContext.request.contextPath}/myintro" style="display: inline-block; width: 25%; padding: 7px;"><button class="btn btn-outline-primary" style="width: 100%; height: 100%; border-radius: 16px; word-break: keep-all;">자소서</button></a>
						<a href="${pageContext.request.contextPath}/process" style="display: inline-block; width: 25%; padding: 7px;"><button class="btn btn-outline-primary" style="width: 100%; height: 100%; border-radius: 16px; word-break: keep-all; padding: 0;">채용과정</button></a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
    </div>
<!-- ============================================선형진행도=================================================== -->
    <div class="grid-stack-item"  gs-x="0" gs-y="5" gs-w="6" gs-h="3">
        <div class="grid-stack-item-content">
   			<div class="top shadow-sm" style="height: 70px; background-color: rgb(255, 255, 255, 0.5);">
				<span style="position:absolute; left: 30px; top: 5px; font-size: 2em; font-weight: 700;">선형 진행도</span><br><span style="position:absolute; left: 30px; top: 45px"><a>공고 보러 가기</a></span>
			</div>
			<div class="pContainer">
				<c:forEach items="${list}" var="anno" end="2">
					<c:choose>
						<c:when test="${not empty anno.detailList}">
							<c:forEach items="${anno.detailList}" var="detail">
							<div style="height: 30%; padding-left: 30px; margin-bottom: 30px;">
								<div class="plContainer">${fn:substring(detail.daFd, 0, 20)}</div>
								<div class="ppContainer">
									<c:choose>
										<c:when test="${not empty detail.processList[0].processCodeId}">
											<div class="pline-container">
											  	<div class="pline">
											    	<div class="percent"></div>
											  	</div>
											  	<div class="steps">
											  		<c:forEach items="${detail.processList}" var="process" varStatus="status">
											  			<c:set var="start" value="${fn:substring(process.processStartDate, 0, 10)}"/>
											  			<c:set var="sd" value="${fn:replace(start, '-', '')}"/>
											  			<c:set var="end" value="${fn:substring(process.processEndDate, 0, 10)}"/>
											  			<c:set var="ed" value="${fn:replace(end, '-', '')}"/>
											    		<div class="step <c:if test="${sd le now and now le ed or ed lt now}">selected</c:if> <c:if test="${ed lt now }">completed</c:if>" id="${status.index}"></div>
											    	</c:forEach>
											  	</div>
										  	</div>						  	
										  	
										  	<div class="process-container">
												<c:forEach items="${detail.processList}" var="process" >
											  		<div class="process">
											  			<h5>${process.processCodeName}</h5>
											  			<h6 style="font-size: 7px;">${fn:substring(process.processStartDate, 0, 10)}</h6>
											  			<h6 style="font-size: 7px;">${fn:substring(process.processEndDate, 0, 10)}</h6>
											  		</div>
												</c:forEach>
										  	</div>
									  	</c:when>
									  	<c:otherwise>
									  		<div style="position: relative; left: 30px;">
									  			등록된 채용과정이 없습니다.
									  		</div>
									  	</c:otherwise>
									</c:choose>
								</div>
							</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div style="position: relative; left: 30px; top: 30px;">
								현재 진행중인 공고가 없음.
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>
    </div>
<!-- ============================================찜목록=================================================== -->
    <div class="grid-stack-item"  gs-x="6" gs-y="5" gs-w="3" gs-h="3">
        <div class="grid-stack-item-content" style="background-color: rgb(255, 255, 255, 0.5);">
			<div class="top shadow-sm" style="height: 70px; background-color: rgb(255, 255, 255, 0.5);">
				<span style="position:absolute; left: 30px; top: 5px; font-size: 2em; font-weight: 700;">찜한 공고</span><br><span style="position:absolute; left: 30px; top: 45px">나의 찜 보러 가기</span>
			</div>
			<div class="down" style="height: 100%; overflow: auto;">
				<c:choose>
					<c:when test="${not empty likeList}">
						<c:forEach items="${likeList}" var="list">
							<div style="width: 100%; height: 70px; padding: 5px; box-shadow: 0 1px 2px rgba(0,0,0,0.08), 0 1px 2px rgba(0,0,0,0.16);">
								<img src='<spring:url value="/image/companyFolder/${list.attSavename}"/>' style="width: 100px; height: 60px;">
								<a href="${pageContext.request.contextPath}/announcement/view/${list.annoNo}">${fn:substring(list.annoTitle, 0, 15)} ...</a>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div style="position: relative; left: 30px; top: 30px;">
							찜한 공고가 없습니다.
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
    </div>
<!-- ============================================알림=================================================== -->
    <div class="grid-stack-item"  gs-x="9" gs-y="4" gs-w="3" gs-h="4">
        <div class="grid-stack-item-content" style="overflow: auto;">
			<div class="top shadow-sm" style="height: 70px; background-color: rgb(255, 255, 255, 0.5);">
				<span style="position:absolute; left: 30px; top: 5px; font-size: 2em; font-weight: 700;">알림</span><br><span style="position:absolute; left: 30px; top: 45px">알림 모아보기</span>
			</div>        
			<div class="accordion" id="accordionExample" style="background-color: rgba(255, 255, 255, 0.5)">
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingOne">
						<button id="alarmBtn" class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne" style="font-size: 1.125rem; font-weight: 700;">
							채용과정
						</button>
					</h2>
					<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
						<table class="table table-hover table-bordered accordion-body">
							<thead>
								<tr class="col-sm-12">
									<th class="col-sm-2">번호</th>
									<th class="col-sm-8">내용</th>
									<th class="col-sm-2">읽음</th>
								</tr>
							</thead>
							<tbody class="alarm-body" id="alarm">
							
							</tbody>
						</table>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingTwo">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" style="font-size: 1.125rem; font-weight: 700;">
							유료상품
						</button>
					</h2>
					<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
						<table class="table table-hover table-bordered accordion-body">
							<thead>
								<tr class="col-sm-12">
									<th class="col-sm-2">번호</th>
									<th class="col-sm-8">내용</th>
									<th class="col-sm-2">읽음</th>
								</tr>
							</thead>
							<tbody class="alarm-body">
								<tr>
									<td>1</td>
									<td>전문가 신청이 정상적으로 접수되었습니다.</td>
									<td><input type="checkBox"></td>
								</tr>
								<tr>
									<td>2</td>
									<td>구매하신 상품을 이용하실 시간입니다.</td>
									<td><input type="checkBox"></td>
								</tr>
							
							</tbody>
						</table>
					</div>
				</div>
				<div class="accordion-item">
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingFour">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseFour" style="font-size: 1.125rem; font-weight: 700;">
							인재홍보
						</button>
					</h2>
					<div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
						<table class="table table-hover table-bordered accordion-body">
							<thead>
								<tr class="col-sm-12">
									<th class="col-sm-2">번호</th>
									<th class="col-sm-8">내용</th>
									<th class="col-sm-2">읽음</th>
								</tr>
							</thead>
							<tbody class="alarm-body">
								<tr>
									<td>1</td>
									<td>김*현 : 자바 웹 개발자</td>
									<td><input type="checkBox"></td>
								</tr>
								<tr>
									<td>2</td>
									<td>유*래 : 웹 디자이너</td>
									<td><input type="checkBox"></td>
								</tr>
								<tr>
									<td>3</td>
									<td>최*자 : super developer</td>
									<td><input type="checkBox"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
    </div>
    
    <!-- ============================================유료상품=================================================== -->
    <div class="grid-stack-item"  gs-x="12" gs-y="12" gs-w="12" gs-h="3">
        <div class="grid-stack-item-content" style="background-color: rgb(255, 255, 255, 0.2);">
        	<div class="top shadow-sm" style="height: 57px; background-color: rgb(255, 255, 255, 0.5);">
			<span style="position:relative; font-size: 2em; left: 50px; top: 10px; font-weight: 700;">이번 주 <em style="    position: relative;
    color: #4a65f6;
    display: inline-block;
    vertical-align: top;
    font-weight: 900"> TOP4 </em> 상품</span>
		</div>  
			<section class="cards" style="
    max-height: 308px;
">
		<c:forEach items="${topExprodList }" var="exprod" begin="0" end="4" varStatus="status">
			<article class="card card--1">
				<div class="card__info-hover">
				 	<div class="card__clock-info">
				  		<span class="card__time" style="color: red; font-size: 24px;"><em style="    position: relative;
    color: red;
    display: inline-block;
    vertical-align: top;
    font-weight: 900"> 판매${status.index+1 }위 </em></span>
				  		<h4 style="font-weight: 900;border-top: solid;margin-top: 10px;">${exprod.exprodPr }</h4>
				  		
				  	</div>
				</div>
			  	<div class="card__img" style="background-image: url('<spring:url value='/image/expertFolder/exprodTop.jpg'/>'); background-size: cover; background-position: center;"></div>
			  	<a href="<%=request.getContextPath() %>/expert/prod/${exprod.exprodId }" class="card_link">
			    	<div class="card__img--hover" style="background-image: url('<spring:url value='/image/expertFolder/exprodTop${status.index }.jpg'/>'); background-size: cover; background-position: center; "></div>
			  	</a>
			  	 <div class="card__info" style="
				    max-height: 64px;
				">
			  	<h4 class="exprodName" style="font-size: 1.125rem; font-weight: 600; word-break: keep-all;">${exprod.exprodName }</h4>
<!-- 			    	<h3 class="card__title" style="word-break: keep-all; margin-top: 0px;"></h3> -->
<%-- 			    	<span class="card__by">기간 : <a href="#" class="card__author" title="author">${fn:substring(anno.annoStartdate, 0, 10)} ~ ${fn:substring(anno.annoEnddate, 0, 10)}</a></span> --%>
			  	</div> 
			</article>
		</c:forEach> 
	</section>
		</div>
    </div>
</div>
<!-- ============================================TOP20 공고목록=================================================== -->
<div style="padding: 3%; position: relative; width: 110%; left: -5%; height: auto; background-color: rgba(245, 245, 245, 0.5); margin-top: 75px; border-radius: 16px; box-shadow: 0 1px 2px rgba(0,0,0,0.16), 0 1px 2px rgba(0,0,0,0.23);">
	<div class="top shadow-sm" style="height: 70px;  background-color: rgba(255, 255, 255, 0.5); width: 30%;">
		<span style="position:relative; font-size: 2em; left: 50px; top: 10px; font-weight: 700;">TOP 12 공고</span>
	</div>  
	<section class="cards">
		<c:forEach items="${annoList}" var="anno" begin="0" end="3">
			<article class="card card--1">
				<div class="card__info-hover">
				 	<div class="card__clock-info">
				  		<span class="card__time">♥ 372</span>
				  	</div>
				</div>
			  	<div class="card__img" style="background-image: url('<spring:url value="/image/companyFolder/${anno.attSavename}"/>'); background-size: cover; background-position: center; box-shadow: 0 1px 2px rgba(0,0,0,0.16), 0 1px 2px rgba(0,0,0,0.23);"></div>
			  	<a href="#" class="card_link">
			    	<div class="card__img--hover" style="background-image: url('<spring:url value="/image/companyFolder/${anno.attSavename}"/>'); background-size: cover; background-position: center;"></div>
			  	</a>
			  	<div class="card__info">
			    	<span class="card__category"> ${anno.company.cmpName}</span>
			    	<h3 class="card__title" style="word-break: keep-all;">${anno.annoTitle}</h3>
			    	<span class="card__by">기간 : <a href="#" class="card__author" title="author">${fn:substring(anno.annoStartdate, 0, 10)} ~ ${fn:substring(anno.annoEnddate, 0, 10)}</a></span>
			  	</div>
			</article>
		</c:forEach>
	</section>
	<section class="cards">
		<c:forEach items="${annoList}" var="anno" begin="4" end="7">
			<article class="card card--1">
				<div class="card__info-hover">
				 	<div class="card__clock-info">
				  		<span class="card__time">♥ 372</span>
				  	</div>
				</div>
			  	<div class="card__img" style="background-image: url('<spring:url value="/image/companyFolder/${anno.attSavename}"/>'); background-size: cover; background-position: center;"></div>
			  	<a href="#" class="card_link">
			    	<div class="card__img--hover" style="background-image: url('<spring:url value="/image/companyFolder/${anno.attSavename}"/>'); background-size: cover; background-position: center;"></div>
			  	</a>
			  	<div class="card__info">
			    	<span class="card__category"> ${anno.company.cmpName}</span>
			    	<h3 class="card__title">${anno.annoTitle}</h3>
			    	<span class="card__by">기간 : <a href="#" class="card__author" title="author">${fn:substring(anno.annoStartdate, 0, 10)} ~ ${fn:substring(anno.annoEnddate, 0, 10)}</a></span>
			  	</div>
			</article>
		</c:forEach>
	</section>	
	<section class="cards">
		<c:forEach items="${annoList}" var="anno" begin="8" end="11">
			<article class="card card--1">
				<div class="card__info-hover">
				 	<div class="card__clock-info">
				  		<span class="card__time">♥ 372</span>
				  	</div>
				</div>
			  	<div class="card__img" style="background-image: url('<spring:url value="/image/companyFolder/${anno.attSavename}"/>'); background-size: cover; background-position: center;"></div>
			  	<a href="#" class="card_link">
			    	<div class="card__img--hover" style="background-image: url('<spring:url value="/image/companyFolder/${anno.attSavename}"/>'); background-size: cover; background-position: center;"></div>
			  	</a>
			  	<div class="card__info">
			    	<span class="card__category"> ${anno.company.cmpName}</span>
			    	<h3 class="card__title">${anno.annoTitle}</h3>
			    	<span class="card__by">기간 : <a href="#" class="card__author" title="author">${fn:substring(anno.annoStartdate, 0, 10)} ~ ${fn:substring(anno.annoEnddate, 0, 10)}</a></span>
			  	</div>
			</article>
		</c:forEach>
	</section>	
</div>

<script>

  var grid = GridStack.init();
  grid.margin(25);

</script>

<!-- fullcalendar -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.1/index.global.min.js'></script>
<script>

document.addEventListener('DOMContentLoaded', function() {
	  var calendarEl = document.getElementById('calendar');
	  var calendar = new FullCalendar.Calendar(calendarEl, {
	    initialView: 'dayGridMonth'
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
          month: '월',
          week: '주'
	    }
	    , eventSources : {
			url:"${pageContext.request.contextPath}/process/events/details/process",
			dataType:"json",
			extraParams : {
				date : "2022-01-01"
			},
			textColor : 'white'
		}
		, footerToolbar : {
			right: 'anno detail process'
		}
	    , customButtons: {
			anno: {
				text: '공고별',
				click: function() {
					var events = {
		 				url:"${pageContext.request.contextPath}/process/events",
		 				dataType:"json",
		 				extraParams : {
		 					date : "2022-01-01"
		 				},
		 			}
					let eventSources = calendar.getEventSources(); 
					for (let i = 0; i < eventSources.length; i++) { 
					    eventSources[i].remove(); 
					} 
					calendar.addEventSource(events);
					calendar.refetchEvents();					
				}
	        },
	        detail: {
	        	text: '세부공고별',
	        	click: function() {
					var events = {
			 				url:"${pageContext.request.contextPath}/process/events/details",
			 				dataType:"json",
			 				extraParams : {
			 					date : "2022-01-01"
			 				}
			 			}
					let eventSources = calendar.getEventSources(); 
					for (let i = 0; i < eventSources.length; i++) { 
					    eventSources[i].remove(); 
					} 
					calendar.addEventSource(events);
					calendar.refetchEvents();
	        	}
	        },
	        process: {
	        	text: '채용과정별',
	        	click: function() {
					var events = {
			 				url:"${pageContext.request.contextPath}/process/events/details/process",
			 				dataType:"json",
			 				extraParams : {
			 					date : "2022-01-01"
			 				}
			 			}
					let eventSources = calendar.getEventSources(); 
					for (let i = 0; i < eventSources.length; i++) { 
					    eventSources[i].remove(); 
					} 
					calendar.addEventSource(events);
					calendar.refetchEvents();
	        	}
	        }
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
	
 	// 선형진행도
 	$(".step").on("click", function(event){
 		let steps = $(this).parent();
 		let last = steps.find("div:last-child").attr("id");
 		let howMuch = 100 / last;
 		
 		
 		let id = $(this).attr("id");
 		let percent = $(event.target).parents(".pline-container").children(".pline").children(".percent");
 		let thisMuch = howMuch * id;
 		
 		//초기화
 		for (let i = 0; i < steps.length; i++) {
 			$("#" + i).removeClass("selected").removeClass("completed");
 			percent.css("width", thisMuch + "%");
 		}
 		
 		//다시
 		for (let i = 0; i < steps.length; i++) {
 			$("#" + i).addClass("selected").addClass("completed");
 			if (id == i) {
 				return;
 			}
 		}
 		
 		percent.css("width", thisMuch+"%");	
 	});


 	let stepss = $(".steps");
 	for (let i = 0; i < stepss.length; i++) {
 		let lastOne = $(stepss[i]).find("div:last-child").attr("id");
 		let howMuchIs = 100 / lastOne;
 		let nowProcess = $(stepss[i]).children(".step").filter(".selected:last")
 		let percentLine = $(stepss[i]).parent(".pline-container").children(".pline").children(".percent");
 		percentLine.css("width", (howMuchIs * nowProcess.attr("id")) + "%");
 	}
 	
 	// 알람
 	function makeAlarmTag(index, alarm) {
 		return $("<tr>").append($("<td>").append(index + 1), $("<td>").append($("<a>").attr("href", "${pageContext.request.contextPath}/process").html(alarm.alarmContent)), $("<td>").append($("<input>").attr("type", "checkBox")));
 	}
 	
 	$("#alarmBtn").on("click", function() {
 		let xhr = new XMLHttpRequest();
 		xhr.open("get", "${pageContext.request.contextPath}/process/alarm", true);
 		xhr.onreadystatechange = () => {
 			if (xhr.readyState == 4 && xhr.status == 200) {
 				
 	            let list = xhr.response;
 	    	   	var array = JSON.parse(list); 
 				let alarmTbl = document.querySelector("#alarm");
 				alarmTbl.innerHTML = "";
		 	   	for (var i = 0; i < array.length; i++) { 	
	 				$(alarmTbl).append(makeAlarmTag(i, array[i]));
 	   			} 
 	   	
 			}
 		}
 		xhr.send();
 	}).trigger("click");
 	
/* window.onload = function() {
	let auth = ${authMember.memAuthCd} + "";
	if (auth == "ROLE_ADMIN") {
		location.href = '${pageContext.request.contextPath}/systemManagement/memberList';
	} else if (auth == "" || auth == null) {
		location.href = '${pageContext.request.contextPath}/login';
	}
} */
 </script>