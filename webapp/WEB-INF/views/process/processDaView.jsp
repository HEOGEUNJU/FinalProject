<%--
* [[개정이력(Modification Information)]]
* 수정일             수정자            수정내용
* ----------  ---------  -----------------
* 2023. 2. 20.      최경수            최초작성
* 2023. 2. 22.      최경수            선형진행도, 프로그레스바 자동화
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link href="<%=request.getContextPath()%>/resources/cks/processDaView.css" rel="stylesheet"/>

<div class="radiuss" style="padding-bottom: 30px;">
	<div class="qna_write_wrap">
		<div class="qna_write_selection">
			<span class="qna_category_tit" style="font-size: 40px;">${anno.annoTitle}</span>
		</div>
	</div>
	<hr style="background-color: #5c667b; height: 2px;">
	<p class="pf">회사</p>
	<div class="row">
		<div class="col-9">
			<table class="annoTable" style="width: 100%;">
				<tr>
					<th  scope="row">법인명</th>
					<td>${anno.company.cmpName}</td>
					<th  scope="row">법인등록번호</th>
					<td>${anno.company.cmpNo}</td>
				</tr>
				<tr>
					<th  scope="row">회사대표자성명</th>
					<td>${anno.company.cmpRepName}</td>
					<th  scope="row">사업자등록번호</th>
					<td>${anno.company.cmpBsnsNo}</td>
				</tr>
				<tr>
					<th  scope="row">기본주소</th>
					<td>${anno.company.cmpAddr1} ${anno.company.cmpAddr2}</td>
					<th  scope="row">우편번호</th>
					<td>${anno.company.cmpZip}</td>
				</tr>
				<tr>
					<th  scope="row">전화번호</th>
					<td>${anno.company.cmpPhone}</td>
					<th  scope="row">이메일</th>
					<td>${anno.company.cmpEmail}</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<th  scope="row">회사종업원수</th>
					<td>${anno.company.cmpEmpNo}</td>
					<th  scope="row">회사1인평균급여금액</th>
					<td>${anno.company.cmpAvrSalary}</td>
				</tr>
				<tr>
					<th  scope="row">회사주요사업명</th>
					<td>${anno.company.cmpMbName}</td>
					<th  scope="row">기업소개</th>
					<td colspan="3">${anno.company.cmpContent}</td>
				</tr>
			</table>
		</div>
	    <div class="col-3">
	  	 	<img src="${pageContext.request.contextPath}/resources/images/hero_1.jpg" style="width:100%; height: 100%;"/>
	   </div>
	</div>
	<hr style="background-color: #5c667b; height: 2px;">
	<p class="pf">공고</p>
	<div>
		<table class="annoTable" style="width: 100%;">
			<tr>
				<th  scope="row">제목</th>
				<td colspan="3">${anno.annoTitle}</td>
			</tr>
			<tr>
				<th  scope="row">시작날짜</th>
				<td>${anno.annoStartdate}</td>
				<th  scope="row">종료날짜</th>
				<td>${anno.annoEnddate}</td>
			</tr>
		</table>
	</div>
</div>



<div class="radiuss" style="padding-bottom: 30px;">
	<div class="qna_write_wrap">
		<div class="qna_write_selection">
			<span class="qna_category_tit" style="font-size: 40px;">세부공고</span>
		</div>
	</div>
	<hr style="background-color: #5c667b; height: 2px;">
	<p class="pf">현재 진행중 순</p>
	<c:choose>
		<c:when test="${not empty anno.detailList}">
			<div class="courses-container">
				<c:forEach items="${anno.detailList}" var="detail">
					<div class="course">
						<div class="course-preview">
						
							<h6 style="color: white;">${detail.positionList[0].positionName} · ${detail.positionList[1].positionName} · ${detail.positionList[2].positionName}</h6>
							<h2 style="color: white;">${anno.annoTitle}</h2>
							<a href="${pageContext.request.contextPath}/announcement/view/${anno.annoNo}">공고 내용 보러가기<i class="fas fa-chevron-right"></i></a>
							
						</div>
						<div class="course-info">
							
							<div class="progress-container">
								<div class="progress"></div>
								<div class="progressAfter" style="width: ${detail.percent}%;"></div>
								<c:if test="${not empty detail.processList[0].processCodeId}">
									<span class="progress-text"">
										<c:forEach items="${detail.processList}" var="process" varStatus="status">
											<c:if test="${status.first}">${fn:substring(process.processStartDate, 0, 10)} ~ </c:if>
											<c:if test="${status.last}">${fn:substring(process.processEndDate, 0, 10)}</c:if>
										</c:forEach>
									</span>
								</c:if>
								<c:if test="${empty detail.processList[0].processCodeId}">
									<span class="progress-text">등록된 채용과정 없음</span>
								</c:if>
							</div>
							
<%-- 							<h4 style="color: gainsboro; font-size: 1.25rem;">[<c:forEach items="${detail.positionList}" var="position" varStatus="status">${position.positionName}<c:if test="${!status.last}"> · </c:if></c:forEach>]</h4> --%>
							<h4 style="color: gainsboro; font-size: 1.25rem;">${detail.daDepartment}</h4>
							<a style="text-decoration: none;" href="${pageContext.request.contextPath}/process/${anno.annoNo}/${detail.processList[0].daNo}"><h1>${detail.daFd}</h1></a>
							<br>
							<h6>${fn:substring(detail.daTask, 0, 210)} ...</h6>
							<h5 style="color: gray; font-size: 1rem;"><c:forTokens items="${detail.careerNames}" delims=", " var="career">${career}</c:forTokens></h5>
							
							
							<div style="position: absolute; width: 94%; height: 25%;">
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
										  			<h6 style="font-size: 10px;">${process.processStartDate}</h6>
										  			<h6 style="font-size: 10px;">${process.processEndDate}</h6>
										  		</div>
											</c:forEach>
									  	</div>
								  	</c:when>
								  	<c:otherwise>
								  		<div>
								  			등록된 채용과정이 없습니다.
								  		</div>
								  	</c:otherwise>
								</c:choose>
							</div>
							
							<div>
								<span style="position: absolute; top: 87%; font-size: 10px;">
									세부공고내용과 채용과정을 자세하게 확인하시려면 제목을 클릭하세요. 
								</span>
							</div>
						  	
							<c:if test="${not empty detail.processList[0].processCodeId}">
								<button class="listBtn" style="width: 25%; border-radius: 0;" onclick='location.href="${pageContext.request.contextPath}/process/${anno.annoNo}/${detail.daNo}"'>세부 채용과정 보러가기</button>
							</c:if>
							<c:if test="${empty detail.processList[0].processCodeId}">
								<button class="listBtn" style="width: 25%; border-radius: 0;" onclick='location.href="${pageContext.request.contextPath}/process/form?annoNo=${anno.annoNo}&daNo=${detail.daNo}"'>채용과정 등록하기</button>
							</c:if>
							
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

<script>
$(".step").on("click", function(event){
	let steps = $(this).parent();
// 	let last = $(".steps").find("div:last-child").attr("id");
	let last = steps.find("div:last-child").attr("id");
	console.log(last);
	let howMuch = 100 / last;
	
	
	let id = $(this).attr("id");
// 	let percent = $(".percent");
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

</script>


