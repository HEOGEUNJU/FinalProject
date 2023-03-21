<%--
* [[개정이력(Modification Information)]]
* 수정일             수정자            수정내용
* ----------  ---------  -----------------
* 2023. 2. 20.      최경수            최초작성
* 2023. 2. 21.      최경수            나한테 왜 그래...
* 2023. 2. 22.      최경수            선형진행도, 프로그레스바 자동화
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link href="<%=request.getContextPath()%>/resources/cks/processAnnoList.css" rel="stylesheet" />

<div class="radiuss">
	<div class="qna_write_wrap">
		<div class="qna_write_selection">
			<span class="qna_category_tit" style="font-size: 40px;">공고목록</span>
		</div>
	</div>
	<hr style="background-color: #5c667b; height: 2px;">
	<p class="pf">작성순</p>
	<c:choose>
		<c:when test="${not empty list}">
			<div class="courses-container">
			
				<c:forEach items="${list}" var="anno">
					<div class="course">
						<div class="course-preview">
							<h6 style="color: white;">${anno.company.cmpName}</h6>
							<h2 style="color: white;" onclick='location.href="${pageContext.request.contextPath}/announcement/view/${anno.annoNo}"'>${fn:substring(anno.annoTitle, 0, 20)} ...</h2>
							<br><br><br>
							<h5 style="color: white;">[수습기간] ${anno.annoProbation}</h5>
							<h5 style="color: white;">[연봉] ${anno.annoSalary}</h5>
							<a href="${pageContext.request.contextPath}/announcement/view/${anno.annoNo}">공고 내용 보러가기<i class="fas fa-chevron-right"></i></a>
						</div>
						<div class="course-info" style="overflow-x: hidden;">
							<div class="progress-container">
								<div class="progress"></div>
								<div class="progressAfter" style="width: ${anno.percent}%"></div>
								<span class="progress-text">${fn:substring(anno.annoStartdate, 0, 10)} ~ ${fn:substring(anno.annoEnddate, 0, 10)}</span>
							</div>
<%-- 							<h6>${anno.detailList[0].daDepartment} · ${anno.detailList[1].daDepartment} · ${anno.detailList[2].daDepartment}</h6> --%>
							<h6>${anno.detailList[0].daDepartment}</h6>
							<h2>공고 내용</h2>
							<div class="topContainer" style="position: absolute; width: 94%; height: auto;">
							
								<div class="tree-container">
									<details>
										<summary class="topSummary" style="height: 40px; padding: 5px; font-size: 20px; font-weight: 600;">${anno.annoTitle} 구조 보기</summary>
										<div class="folder">
											<p>[시작날짜] ${fn:substring(anno.annoStartdate, 0, 10)}</p>
											<p>[종료날짜] ${fn:substring(anno.annoEnddate, 0, 10)}</p>
											<c:forEach items="${anno.detailList}" var="detail">
												<details open="open">
													<summary style="height: 40px; padding: 5px;">${detail.daFd} / ${detail.daNo}</summary>
													<div class="folder">
														<p>[모집인원] ${detail.daCount}</p>
														<c:choose>
															<c:when test="${not empty detail.processList[0].processCodeName}">
																<c:forEach items="${detail.processList}" var="process">
																	<details>
																		<summary style="height: 40px; padding: 5px; color: black; background: #EFEFEF;">${process.processCodeName}</summary>
																		<div class="folder">
																			<p>${fn:substring(process.processStartDate, 0, 10)}</p>
																			<p>${fn:substring(process.processEndDate, 0, 10)}</p>
																		</div>
																	</details>
																</c:forEach>
															</c:when>
															<c:otherwise>
																<details>
																	<summary style="height: 40px; padding: 5px; color: black; background: #EFEFEF;">등록된 채용과정이 없습니다.</summary>
																	<div class="folder">
																		<a href="${pageContext.request.contextPath}/process/form?annoNo=${detail.annoNo}&daNo=${detail.daNo}"><p>채용과정 등록하러 가기</p></a>
																	</div>
																</details>														
															</c:otherwise>
														</c:choose>
													</div>
												</details>
											</c:forEach>
										</div>
									</details>
								</div>						
								<div>
									<span>${fn:substring(anno.annoContent, 0, 210)} ...</span>
									<span>${anno.detailList[0].daFd}</span> / <span>${anno.detailList[1].daFd}</span> / <span>${anno.detailList[2].daFd} ...</span> <br>
								</div>
								<button class="listBtn" style="width: 30%; border-radius: 0;" onclick='location.href="${pageContext.request.contextPath}/process/${anno.annoNo}"'>채용과정 보러가기</button>
							</div>
						</div>
					</div>
				</c:forEach>
				
			</div>
		</c:when>
		<c:otherwise>
			<div class="courses-container">
				<div class="course">
					<div class="course-preview">
						<h6 style="color: white;">회사명</h6>
						<h2 style="color: white;">공고이름</h2>
						<a href="#">공고 내용 보러가기<i class="fas fa-chevron-right"></i></a>
					</div>
					<div class="course-info">
						<div class="progress-container">
							<div class="progress"></div>
							<span class="progress-text">3/8 현재 채용과정 </span>
						</div>
						<h6>직급</h6>
						<h2>직무명</h2>
						<button class="listBtn" style="width: 25%; border-radius: 0;">채용과정 보러가기</button>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</div>
<div class="rightRemote">
	<span class="qna_category_tit" style="font-size: 40px;">설정</span>
	<hr style="background-color: #5c667b; height: 2px;">
	<div style="text-align: center">
		<button class="btn btn-outline-primary showAll" style="width: 75%; height: 50px; margin-top: 30px; margin-bottom: 10px; border-radius: 0;">전체보기</button>
		<button class="btn btn-outline-primary openAll" style="width: 75%; height: 50px; margin-bottom: 10px; border-radius: 0;">세부공고 펼쳐보기</button>
		<button class="btn btn-outline-primary startAll" style="width: 75%; height: 50px; margin-bottom: 10px; border-radius: 0;">예정 공고 제외</button>
		<button class="btn btn-outline-primary ingAll" style="width: 75%; height: 50px; margin-bottom: 10px; border-radius: 0;">진행 공고 제외</button>
		<button class="btn btn-outline-primary overAll" style="width: 75%; height: 50px; margin-bottom: 10px; border-radius: 0;">지난 공고 제외</button>
	</div>
</div>

<script>
$('.topSummary').on('click', function(){
	let courseInfo = $(this).parents('.course-info');
	let coursePreview = courseInfo.siblings('.course-preview');
	let course = $(this).parents('.course');
	
	if (course.css('height') == '350px'){
		course.css('height', '700px');
	} else if (course.css('height') == '700px') {
		course.css('height', '350px');
	}
});

$(window).scroll(function () {
    if ($(this).scrollTop() > 300) {
		$(".rightRemote").css({"position":"fixed", "width":"18%", "top":"75px"});
    } else {
    	$(".rightRemote").css({"position":"absolute", "width":"22%", "top":"250px"});
    }
});

$(".showAll").on("click", function() {
	let pa = $(".progressAfter");
	$.each(pa, function(index, p) {
		let course = $(p).parents(".course");
		if (course.css("display") == "none") {
			course.css("display", "flex");
		}
	});	
});

$(".openAll").on("click", function() {
	if ($(".course").css("height") == "350px") {
		$(".course").css("height", "700px");
		$("details").attr("open", "open");
	} else {
		$(".course").css("height", "350px");
		$("details").removeAttr("open");
		
	}
});

$(".startAll").on("click", function() {
	let pa = $(".progressAfter");
	$.each(pa, function(index, p) {
		if ($(p).css("width") == "0px") {
			$(p).parents(".course").hide();
		}
	});	
});

$(".ingAll").on("click", function() {
	let pa = $(".progressAfter");
	$.each(pa, function(index, p) {
		if ($(p).css("width") != "0px" && $(p).css("width") != "400px") {
			$(p).parents(".course").hide();
		}
	});	
});

$(".overAll").on("click", function() {
	let pa = $(".progressAfter");
	$.each(pa, function(index, p) {
		if ($(p).css("width") == "400px") {
			$(p).parents(".course").hide();
		}
	});
});
</script>