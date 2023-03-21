<%--
* [[개정이력(Modification Information)]]
* 수정일             수정자            수정내용
* ----------  ---------  -----------------
* 2023. 2. 20.      최경수            최초작성
* 2023. 2. 22.      최경수            틀 잡기
* 2023. 2. 23.      최경수            내용 채우기
* 2023. 2. 27.      최경수            점수테이블 생성
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/pattern.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/help.css">

<link href="<%=request.getContextPath()%>/resources/cks/processView.css" rel="stylesheet"/>

<c:set var="detail" value="${anno.detailList[0]}"/>
<!-- pageContext에 있을 것 같은데!!!!!! -->
<input id="daNo" type="text" value="${anno.detailList[0].daNo}" hidden="true">

<div class="radiuss">
	<div class="qna_write_wrap">
		<div class="qna_write_selection">
			<span class="qna_category_tit" style="font-size: 40px;">세부공고</span>
			<button type="button" class="btnSizeL btn_qna_write" onclick="location.href='${pageContext.request.contextPath}/process/${anno.annoNo}'" style="position: relative; left: 70%; width: 15%; margin-bottom: 5%;">이전으로 돌아가기</button>
		</div>
	</div>
	<hr style="background-color: #5c667b; height: 2px;">
	<p class="pf">${anno.annoTitle}</p>
	<table class="annoTable" style="width: 100%;">
		<colgroup>
	 		<col width="155">
	 		<col width="280">
		</colgroup>
	  <tr>
	    <th scope="row">법인명</th>
	    <td>${anno.company.cmpName}</td>
	    <th scope="row">회사대표자</th>
	    <td>${anno.company.cmpRepName}</td>
	  </tr>
	  <tr>
	    <th scope="row">근무환경</th>
	    <td style="width:62%;">${anno.annoWorkenv}</td>
	    <th scope="row">수습기간</th>
	    <td>${anno.annoProbation}</td>
	  </tr>
	  <tr>
	    <th scope="row">공고 시작날짜</th>
	    <td>${fn:substring(anno.annoStartdate, 0, 10)}</td>
	    <th scope="row">공고 종료날짜</th>
	    <td>${fn:substring(anno.annoEnddate, 0, 10)}</td>
	  </tr>
	  <tr>
	    <th scope="row">공고 내용</th>
	    <td colspan="3">${anno.annoContent}</td>
	  </tr>
	  <tr>
	  	<th scope="row">담당업무</th>
	  	<td>${detail.daFd}</td>
	  	<th scope="row">근무부서</th>
	  	<td>${detail.daDepartment}</td>
	  </tr>
	  <tr>
	  	<th scope="row">고용형태</th>
	  	<td>${detail.empltypeName}</td>
	  	<th scope="row">직급</th>
	  	<td>${detail.positionList[0].positionName} · ${detail.positionList[3].positionName} · ${detail.positionList[2].positionName} ...</td>
	  </tr>
	  <tr>
	  	<th scope="row">상세업무</th>
	  	<td colspan="3">${detail.daTask}</td>
	  </tr>
<!-- 	  <tr> -->
<!-- 	  	<th scope="row"></th> -->
<%-- 	  	<td>${detail. }</td> --%>
<!-- 	  	<th scope="row"></th> -->
<%-- 	  	<td>${detail. }</td> --%>
<!-- 	  </tr> -->
	</table>
</div>

<div class="radiuss" style="padding: 0px;">
	<div class="qna_write_wrap" style="padding-top: 20px; padding-left: 100px; padding-right: 100px;">
		<div class="qna_write_selection">
			<span class="qna_category_tit" style="font-size: 40px;">채용과정</span>
			<c:choose>
				<c:when test="${not empty detail.processList[0].processStartDate}">
					<span style="position: relative; left: 80%;"><button class="btn btn-primary" onclick='location.href="${pageContext.request.contextPath}/process/edit?annoNo=${detail.annoNo}&daNo=${detail.daNo}"' style=" border-radius: 0;">수정하기</button></span>
				</c:when>
			</c:choose>
		</div>
	</div>
<c:choose>
	<c:when test="${not empty detail.processList[0].processStartDate}">
		<hr style="background-color: #5c667b; height: 2px; width: 87 %; margin-left: 6%; margin-right: 6%;">
		<ul class="responsive-table" style="margin-bottom: 100px; padding-left: 50px; padding-right: 50px; height: 30vh; ">
			<li class="table-row" style="padding: 0px; box-shadow: 0 0 0 0;">
				<div style="padding-left: 50px; padding-right: 50px; width: 100%; height: 100px;">
					<div style="position: relative; width: 88%; height: 50%; padding: 50px; margin: auto;">
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
					</div>
				  	<div class="card-container">
						<div class="card-contain">
							<c:forEach items="${detail.processList}" var="process" varStatus="status">
								<c:set var="start" value="${fn:substring(process.processStartDate, 0, 10)}"/>
					  			<c:set var="sd" value="${fn:replace(start, '-', '')}"/>
					  			<c:set var="end" value="${fn:substring(process.processEndDate, 0, 10)}"/>
					  			<c:set var="ed" value="${fn:replace(end, '-', '')}"/>
								<span class="data-card <c:if test="${sd le now and now le ed}">hovered</c:if>" id="show${status.count}">
									<h3>${process.processCodeName}</h3>
									<h4 style="margin-top: 10px; margin-bottom: 0px;">${fn:substring(process.processStartDate, 0, 10)} ~ ${fn:substring(process.processEndDate, 0, 10)}</h4>
									<p>${fn:substring(process.processLimit, 3, 10)} ...</p>
									<input type="hidden" value="${process.processCodeId}">
									<span class="link-text">내용 보기</span>
								</span>	
							</c:forEach>
						</div>
					</div>
				</div>
			</li>
		</ul>
		<!-- 해당 과정 항목 목록 -->
		<div style="width: 70%; display: inline-block;">
			<div style="position: relative; margin-left: 7.5%; margin-bottom: 15px; width: 95%%; height: 50px;">
				<span style="position: absolute; left: 20px; top: 7px; font-size: 1.25rem; font-weight: 800; color: gray;">채용과정</span>
			</div>
			<ul class="responsive-table" style="width: 100%; display: inline-block;">
				<li class="table-row" style="height: 100%; padding: 0px; box-shadow: 0 0 0 0; width: 100%;">
					<div id="disp" style="width: 100%;">
						<c:forEach items="${detail.processList}" var="process" varStatus="status">
							<c:set var="start" value="${fn:substring(process.processStartDate, 0, 10)}"/>
				  			<c:set var="sd" value="${fn:replace(start, '-', '')}"/>
				  			<c:set var="end" value="${fn:substring(process.processEndDate, 0, 10)}"/>
				  			<c:set var="ed" value="${fn:replace(end, '-', '')}"/>
							<div id="disp${status.count }" style="display: <c:choose><c:when test="${sd le now and now le ed}"></c:when><c:otherwise>none</c:otherwise></c:choose>; width: 100%;">
			 					<ul id="${process.processCodeId}" class="responsive-table itemUl" style="padding-left: 50px; width: 100%;">
								<!-- ajax -->
								</ul>
							</div>
						</c:forEach>
					</div>
				</li>
			</ul>
		</div>
		<!-- 해당 과정 지원자 목록 -->
		<div id='schedular' class="table-responsive" style="position: sticky; top:100px; padding-bottom: 50px; float:right; width: 29%; height: auto; max-height: 800px; overflow-y: auto; overflow-x: hidden;/*  box-shadow: 0px 0px 9px 0px rgb(0 0 0 / 10%); */">
			<div style="position: relative; margin-bottom: 15px; width: 95%%; height: 50px;">
				<span style="position: absolute; left: 20px; top: 7px; font-size: 1.25rem; font-weight: 800; color: gray;">지원자 명단</span>
			</div>
			<ul id="alUl" class="responsive-table" style="padding-left: 0%; padding-right: 0%; display: none;">
			  	<li class="table-header" style="position: sticky; top: -5%; left: 3%;justify-content: flex-start; z-index: 99999; padding-top: 10px; padding-bottom: 10px; box-shadow: 0px 0px 9px 0px rgb(0 0 0 / 10%)">
			    	<div class="col col-2">순위</div>
			    	<div class="col col-3">이름</div>
			    	<div class="col col-2">총점</div>
			    	<div class="col col-2">평균</div>
			    	<div class="col col-3"><button id="passFail" class="btn btn-primary" style="font-size: 0.75rem; border-radius: 0;">저장</button></div>
			  	</li>
				<!-- ajax -->
			</ul>
		</div>
	</c:when>
	<c:otherwise>
		<div style="position: relative; left: 10%; margin-top: 3%; margin-bottom: 3%;">등록된 채용과정이 없습니다.</div>
		<button type="button" class="btnSizeL btn_qna_write" onclick="location.href='${pageContext.request.contextPath}/process/form?annoNo=${anno.annoNo}&daNo=${detail.daNo}'" style="position: relative; left: 80%; width: 15%; margin-bottom: 5%;">채용과정 등록하러 가기</button>
	</c:otherwise>	
</c:choose>
</div>
<!-- 첨부파일, 제약사항 목록 -->
<div class="radiuss">
	<div class="qna_write_wrap">
		<div class="qna_write_selection">
			<span class="qna_category_tit" style="font-size: 40px;">과정 상세내용</span>
		</div>
	</div>
	<hr style="background-color: #5c667b; height: 2px;">
	<c:forEach items="${detail.processList}" var="process">
		<table class="annoTable att" id="pd${process.processCodeId}" style="width: 100%; display: none;">
		    <tr id="attachTr">
		        <th scope="row">첨부파일</th>
		        <td colspan="3">
		        	<c:forEach items="${process.attatchList}" var="attach">
		        		${attach.attFilename}<br>
		        	</c:forEach>
		        </td>
		    </tr>
		    <tr id="detailTr">
		        <th scope="row">상세</th>
		        <td colspan="3">${process.processLimit}</td>
		    </tr>
	    </table>
    </c:forEach>
</div>
<!-- 합격자 목록 -->
<div class="radiuss">
	<div class="qna_write_wrap">
		<div class="qna_write_selection">
			<span class="qna_category_tit" style="font-size: 40px;">최종 합격자 명단</span>
		</div>
	</div>
	<hr style="background-color: #5c667b; height: 2px;">
	<p class="pf">최종평균점수순</p>
	<table class="annoTable" style="width: 100%;">
	  <tr>
	    <th scope="row">순위</th>
	    <th scope="row">이름</th>
	    <th scope="row" style="text-align: center;">이력서</th>
	    <th scope="row" style="text-align: right;">총점</th>
	    <th scope="row">평균</th>
	  </tr>
	  <tbody id="finalTbody">
		  <!-- ajax -->
	  </tbody>
	</table>
</div>

<!-- 새 항목 추가 모달 -->
<div class="modal fade" id="itemModal" tabindex="-1" aria-labelledby="itemModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="itemModalLabel">새 항목 추가하기</h1>
      </div>
      <div class="modal-body">
      
        <table class="table table-bordered">
        	<thead>
        		<tr style="text-align: center;">
        			<th></th>
        			<th>항목명</th>
        			<th>상세</th>
        			<th></th>
        		</tr>
        	</thead>
        	<tbody id="itemModalBody">
        	<!-- ajax -->
        	</tbody>
        </table>
      </div>
      <div id="itemModalDiv">
      <!-- ajax -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="itemModalBtn" style="width: 30%; border-radius: 0;">저장</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 30%; border-radius: 0;">닫기</button>
      </div>
    </div>
  </div>
</div>

<!-- 기존 항목 추가 모달 -->
<div class="modal fade" id="itemFormModal" tabindex="-1" aria-labelledby="itemFormModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="itemFormModalLabel">새 항목 추가하기</h1>
      </div>
      <div class="modal-body">
      
        <table class="table table-bordered">
        	<thead>
        		<tr style="text-align: center;">
        			<th></th>
        			<th>항목명</th>
        			<th>상세</th>
        			<th></th>
        		</tr>
        	</thead>
        	<tbody id="itemFormModalBody">
        	<!-- ajax -->
        	</tbody>
        </table>
      </div>
      <div id="itemFormModalDiv">
      <!-- ajax -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="itemFormModalBtn" style="width: 30%; border-radius: 0;">저장</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 30%; border-radius: 0;">닫기</button>
      </div>
    </div>
  </div>
</div>

<script>
const daNo = $("#daNo").val();

/* 채용과정 선형 진행도 최신화 */
let stepss = $(".steps");
for (let i = 0; i < stepss.length; i++) {
	let lastOne = $(stepss[i]).find("div:last-child").attr("id");
	let howMuchIs = 100 / lastOne;
// 	let nowProcess = $(stepss[i]).children(".step").filter(".completed").next(".selected").not(".completed");
	let nowProcess = $(stepss[i]).children(".step").filter(".completed").next(".selected").last();
	let percentLine = $(stepss[i]).parent(".pline-container").children(".pline").children(".percent");
	percentLine.css("width", (howMuchIs * nowProcess.attr("id")) + "%");
}

/* 지원자 목록 만들기 */
function applyList(processCodeId) {
	$.ajax({
		url : "${pageContext.request.contextPath}/apply/applicant",
		method : "get",
		contentType : "application/json; charset=UTF-8",
		data : {
			"processCodeId" : processCodeId
			, "daNo" : daNo
		},
		dataType : "json",
		success : function(applicant) {
			$(".applyList").remove();
			$.each(applicant, function(index, app) {
				if (app.processCodeId == processCodeId) {
					$("#alUl").append(makeApplyListTag(index, app));
				} else if (app.processCodeId != processCodeId) {
					app.applyResult = "합격";	
					$("#alUl").append(makeApplyListTag(index, app));
				}
				
			});

		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

applyList($(".hovered").children("input").val());

let originAdd = $(".originAdd");
let itemUl = $(".itemUl");
let header = $(".header:first");
let footer = $(".footer:first");
let itemModalBody = $("#itemModalBody");
let itemFormModalBody = $("#itemFormModalBody");

/* 항목 목록에 들어가는 항목 만드는 태그 */
let makeLiTag = function(index, item) {
	return $("<li>").addClass("table-row items").addClass(item.itemCodeId).attr("id", item.itemCodeId).css({"height":"100%", "padding":"0px", "width":"100%", "padding-top":"10px", "padding-bottom":"10px", "padding-left":"50px", "padding-right":"50px", "display":"block"}).append(
				$("<table>").addClass("itemTable").css("width", "100%").append(
					$("<tr>").append(
						$("<td>").addClass("col-1").html(index + 1)
						, $("<td>").addClass("col-2 itemCodeName").val(item.itemCodeName).html(item.itemCodeName)
						, $("<td>").addClass("col-6 itemAsk").val(item.itemAsk).html(item.itemAsk)
						, $("<td>").addClass("col-2 itemBtn").append(
							$("<button>").addClass("btn btn-outline-primary itemUpdateBtn").val(item.processCodeId).attr("name", item.itemCodeId).css({"width":"60px", "display":"inline-block", "font-size":"12px", "border-radius":"0"}).html("수정")
							, $("<button>").addClass("btn btn-outline-danger itemRemoveBtn").val(item.itemCodeId).css({"width":"60px", "font-size":"12px", "border-radius":"0"}).html("삭제")
						)
					)
				)
				, $("<div>").addClass("gap")
				, $("<table>").addClass("table scoreTable").css({"display":"none", "width":"100%", "padding-left":"50px", "padding-right":"50px", "margin-top":"50px"}).append(
					$("<thead>").append(
							$("<tr>").css("text-align", "center").append(
								$("<th>").addClass("col-1").html(" ")
								, $("<th>").addClass("col-1").html("지원자")
								, $("<th>").addClass("col-4").html("이력서")
								, $("<th>").addClass("col-2").html("과정 결과")
								, $("<th>").addClass("col-2").html("점수")
								, $("<th>").addClass("col-2").html(" ")
							)
						), $("<tbody>")
					)
			);
}

/* 항목 목록에서 헤더 만드는 태그 */
let makeHeaderTag = function() {
	return $("<li>").addClass("table-header").addClass("header").css({"padding":"10px", "font-size":"1.125rem", "width":"100%", "height":"52px", "font-weight":"800", "padding-left":"50px", "box-shadow":"0px 0px 9px 0px rgb(0 0 0 / 10%)"}).append(
				$("<table>").css({"width":"100%", "padding-left":"50px", "padding-right":"50px"}).append(
					$("<tr>").append(
						$("<th>").addClass("col-1")
						, $("<th>").addClass("col-2").html("항목명")
						, $("<th>").addClass("col-6").css("text-align", "center").html("상세")
						, $("<th>").addClass("col-1")
					)
				)
			);	
}

/* 항목 목록에서 새로운 추가, 기존 항목 추가 버튼 만드는 태그 */
let makeFooterTag = function(process) {
	return $("<li>").addClass("table-row").addClass("footer").css({"height":"100%", "padding":"0px", "width":"100%", "padding-top":"10px", "padding-bottom":"10px", "padding-left":"50px", "padding-right":"50px", "box-shadow":"0px 0px 9px 0px rgb(0 0 0 / 10%)"}).append(
				$("<table>").css({"width":"100%"}).append(
					$("<tr>").append(
						$("<td>").css({"position":"relative", "text-align":"center"}).append(
							$("<button>").addClass("btn btn-outline-primary newAdd").css({"width":"15%", "margin-right":"3%", "font-size":"0.7rem", "border-radius":"0"}).attr("data-bs-toggle", "modal").attr("data-bs-target", "#itemModal").val(process.processCodeId).html("새 항목 추가")
							, $("<button>").addClass("btn btn-outline-primary originAdd").css({"width":"15%", "font-size":"0.7rem", "border-radius":"0"}).attr("data-bs-toggle", "modal").attr("data-bs-target", "#itemFormModal").val(process.processCodeId).html("기존항목에서 추가")
// 							, $("<button>").addClass("btn btn-primary newAdd").css({"width":"20%"}).data("bs-toggle", "modal").data("bs-target", "#itemModal").html("기존항목에서 추가하기")
						)
					)
				)
			);
}

/* 모달 : 새 추가 목록 태그 만들기 */
let makeModalTag = function(index, item) {
	let itemIndex = "item" + (index + 1);
	return $("<tr>").append(
			$("<td>").addClass("col-1").css("text-align", "center").html(index)
			, $("<td>").addClass("col-2").html(item.itemCodeName)
			, $("<td>").addClass("col-8").append(
				$("<input>").attr("name", "itemAsk").attr("type", "text").attr("size", "50").attr("placeholder", item.itemCodeName+"에 대해 작성할 질문을 적으세요.")	.addClass("itemAsk").css("border", "none")	
			)
			, $("<td>").addClass("col-1").css("text-align", "center").append($("<input>").attr("type", "checkBox").attr("id", itemIndex).attr("name", item.itemCodeId).val(item.itemCodeId))
		);
}

/* 모달 : 기존 추가 목록 태그 만들기 */
let makeFormModalTag = function(index, item) {
	let itemIndex = "item" + index;
	return $("<tr>").append(
			$("<td>").addClass("col-1").css("text-align", "center").html(index)
			, $("<td>").addClass("col-2 itemCodeName").html(item.itemCodeName)
			, $("<td>").addClass("col-8 itemAsk").html(item.itemAsk)
			, $("<td>").addClass("col-1").css("text-align", "center").append($("<input>").attr("type", "checkBox").attr("id", itemIndex).attr("name", item.itemCodeId).val(item.itemCodeId))
		);
}

/* 목록 띄우기 */
let $itemList = function() {
	$.ajax({
		url : "${pageContext.request.contextPath}/process/${anno.annoNo}/${anno.detailList[0].daNo}",
		method : "get",
		dataType : "json",
		success : function(resp) {
			itemUl.empty();
			let processList = resp.anno.detailList[0].processList;
 			let liTag = [];
			$.each(processList, function(index, process) { // 채용과정 개수만큼 돌기(8번)
				liTag.push(makeHeaderTag());
				let itemList = process.itemList;
				$.each(itemList, function(idx, item) { // 채용과정 항목수만큼 돌기(26번)
					if (process.processCodeId == item.processCodeId) {
						liTag.push(makeLiTag(idx, item));
					}
				});
				liTag.push(makeFooterTag(process));
				$("#" + process.processCodeId).append(liTag);
				liTag = [];
			});
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	}).done(function(data, textStatus, xhr) {
		// 항목 목록에서 삭제 버튼 클릭 시, 해당 항목 지우기
		$(".itemRemoveBtn").on("click", function() {
			itemRemove(this);
		});
		// 모달 : '새 항목 추가'버튼 클릭 시, 목록 띄우기
		$(".newAdd").on("click", function() {
			modalList(this);
		});
		// 모달 : '저장' 버튼 클릭 시, 항목 테이블에 입력
		$("#itemModalBtn").on("click", function(event) {
			insertNewItem(event);
		});
		// 모달 : '기존 항목 추가'버튼 클릭 시, 목록 띄우기
		$(".originAdd").on("click", function() {
			modalFormList(this);
		});
		// 모달 : '저장' 버튼 클릭 시, 항목 테이블에 입력
		$("#itemFormModalBtn").on("click", function(event) {
			insertOriginItem();
		});
		// 항목 목록에서 수정 버튼 클릭 시, 폼 만들어지고 저장 클릭 시 update 후 목록 다시 불러오기
		$(".itemUpdateBtn").on("click", function() {
			updateOriginItem(this);
		});
		// 항목 목록 중 하나를 누르면 나오는 점수표
		$(".itemTable").on("click", function() {
			showScoreList(this);	
		});
		// 합격여부 바꾸기
		$("#passFail").on("click", function() {
			passOrFail(this);
		});
	});

}

$itemList();

/* 모달 : '추가되지 않은' 항목 목록 */
function modalList(button) {
	let clickFrom = $(button).val();
	$.ajax({
		url : "${pageContext.request.contextPath}/process/notAdded?daNo="+daNo,
		method : "get",
		dataType : "json",
		success : function(notAddedList) {
			itemModalBody.empty();
			let itemList = [];
			let idx = 0;
			$.each(notAddedList, function(index, item) {
				if (clickFrom == item.processCodeId) {
					idx++;
					itemList.push(makeModalTag(idx, item));
				}
			});
			itemModalBody.append(itemList);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

/* 모달 : '추가되지 않은' 양식 항목 목록 */
function modalFormList(button) {
	let clickFrom = $(button).val(); // processCodeId
	
	let icids = $("ul #" + clickFrom).find(".itemRemoveBtn");
	let arrayIcids = [];
	for (let i = 0; i < icids.length; i++) {
		arrayIcids.push(icids[i].value);
	}
	
	$.ajax({
		url : "${pageContext.request.contextPath}/process/itemFormList?daNo=" + daNo,
		method : "get",
		dataType : "json",
		success : function(formList) {
			itemFormModalBody.empty();
			let itemFormList = [];
			let idx = 0;
			$.each(formList, function(index, item) {
				if (clickFrom == item.processCodeId) {
					// 이미 존재하는 항목은 더 추가해선 안 됨(li태그 안에 있는 값들)
// 					if (!arrayIcids.includes(item.itemCodeId)){
						idx++;
						itemFormList.push(makeFormModalTag(idx, item));
// 					}
				}
			});
			itemFormModalBody.append(itemFormList);
			
			// 선택하면 itemCodeId가 동일한 다른 checkBox 비활성화
			$("input[type=checkBox]").on("change", function() {
				let thisCode = this.value;
				if ($(this).is(":checked")){
					let otherCheck = $(this).parents("tr").siblings().find("input[type=checkBox]");
					$.each(otherCheck, function(index, check) {
						if (thisCode == check.value) {
							$(check).attr("disabled", true);
						}
					});
				} else {
					let otherCheck = $(this).parents("tr").siblings().find("input[type=checkBox]");
					$.each(otherCheck, function(index, check) {
						if (thisCode == check.value) {
							$(check).attr("disabled", false);
						}
					});
				}
			});
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

/* 항목 목록에서 지우기 */
function itemRemove(button) { // button = this
	let removeItem = $(button).val();
	let processCodeId = $(button).siblings(".itemUpdateBtn").val()
	let item = {
		"daNo" : daNo
		, "itemCodeId" : removeItem
		, "processCodeId" : processCodeId
	}
	$.ajax({
		url : "${pageContext.request.contextPath}/process/item",
		method : "delete",
		contentType: "application/json; charset=utf-8",
		data : JSON.stringify(item),
		success : function() {
			$itemList();
			applyList(processCodeId);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

let itemModalDiv = $("#itemModalDiv");

// let makeModalForm = function() {
// 	return 	$("<form>").attr("method", "post").attr("encType", "multipart/form-data").attr("id", "itemModalForm").append(
// 				$("<input>").attr("name", "daNo").attr("type", "text")
// 				, $("<input>").attr("name", "itemCodeId").attr("type", "text")
// 				, $("<input>").attr("name", "itemAsk").attr("type", "text")
// 	);
// }

/* 새 추가 모달 밑에 form태그 붙이고 ajax실행해서 insert하기 */
function insertNewItem(event) {
	let checkBox = itemModalBody.find("input[type=checkBox]:checked");
	let inputTags = "";
	for (let i = 0; i < checkBox.length; i++) {
		inputTags += '<input name="itemList[' + i + '].daNo" value="${daNo}" hidden/>';
		inputTags += '<input name="itemList[' + i + '].itemCodeId" value="' + checkBox[i].value + '" hidden/>'; // dom객체
		inputTags += '<input name="itemList[' + i + '].itemAsk" value="' + $(checkBox.get(i)).parents("tr").find(".itemAsk").val() + '" hidden/>'; // jquery객체
		
	}
	
	let makeItemForm = '<form:form modelAttribute="process" id="itemModalForm"></form:form>';
	itemModalDiv.html(makeItemForm);
	$("#itemModalForm").html(inputTags);
	
	let itemModalForm = $("#itemModalForm").submit(function(event) {
		event.preventDefault();
		
		//serialize안 쓰고 어떻게 해? 일일이 json으로 바꿔? 아니면 js 객체?
		let itemList = $("#itemModalForm").serialize();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/process/item",
			method : "post",
			data : itemList,
			success : function() {
				$itemList();
				$("button[data-bs-dismiss=modal]").trigger("click");
				$("#itemModalDiv").empty();
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
		return false;
	});
	
	itemModalForm.submit();
}

let itemFormModalDiv = $("#itemFormModalDiv");
/* 기존 추가모달 밑에 form태그 붙이고 ajax실행해서 insert하기 */
function insertOriginItem() {
	let checkBox = itemFormModalBody.find("input[type=checkBox]:checked");
	let inputTags = "";
	for (let i = 0; i < checkBox.length; i++) {
		inputTags += '<input name="itemList[' + i + '].daNo" value="${daNo}" hidden/>';
		inputTags += '<input name="itemList[' + i + '].itemCodeId" value="' + checkBox[i].value + '" hidden/>'; // dom객체
		inputTags += '<input name="itemList[' + i + '].itemAsk" value="' + $(checkBox[i]).parents("tr").find(".itemAsk").html() + '" hidden/>'; // jquery객체
		inputTags += '<input name="itemList[' + i + '].itemCodeName" value="' + $(checkBox[i]).parents("tr").find(".itemCodeName").html() + '" hidden/>'; // jquery객체
	}
	
	let makeItemFormForm = '<form:form modelAttribute="process" id="itemFormModalForm"></form:form>';
	itemFormModalDiv.html(makeItemFormForm);
	$("#itemFormModalForm").html(inputTags);
	
	
	let itemFormModalForm = $("#itemFormModalForm").submit(function(event) {
		event.preventDefault();
		
		let itemList = $("#itemFormModalForm").serialize();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/process/item",
			method : "post",
			data : itemList,
			success : function() {
				$itemList();
				$("button[data-bs-dismiss=modal]").trigger("click");
				$("#itemFormModalDiv").empty();
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
		return false;
	});

	itemFormModalForm.submit();
}

/* 원래 있는 항목을 수정하기 */
function updateOriginItem(button) {
	let processCodeId = $(button).val();
	let itemCodeId = $(button).attr("name");
	let ctd = $(button).parents("tr").find(".itemCodeName");
	let atd = $(button).parents("tr").find(".itemAsk");
	let btd = $(button).parents("tr").find(".itemBtn");
	
	let ctdv = ctd.html();
	let atdv = atd.html();
	
	ctd.empty();
	atd.empty();
	btd.empty();
	////////////////////////////////
	$.ajax({
		url : "${pageContext.request.contextPath}/process/notAdded?daNo="+daNo,
		method : "get",
		dataType : "json",
		success : function(notAddedList) {
			let selectTags = "";
			
			selectTags += '<select class="form-control">';
			selectTags += '<option value="' + itemCodeId +'" selected>' + ctdv + '</option>';
			$.each(notAddedList, function(index, item) {
				if (processCodeId == item.processCodeId){
					selectTags += '<option value="' + item.itemCodeId + '">' + item.itemCodeName + '</option>'
				}
			});
			selectTags += "</select>";
			ctd.html(selectTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	////////////////////////////////
// 	ctd.html('<input type="text" name="icn" value="' + ctdv +'">');
	atd.html('<input type="text" name="ia" size="50" value="' + atdv +'">');
	let btn = '<button class="btn btn-outline-primary itemSaveBtn" style="width: 100%; margin-bottom: 5px; border-radius: 0;">저장</button><button class="btn btn-outline-danger itemCancelBtn" style="width: 100%; border-radius: 0;">취소</button>'
	btd.html(btn);
	
	$(".itemSaveBtn").on("click", function() {
		let ici = $(this).parents("tr").find("option:selected").val();
		let ia = $(this).parents("tr").find(".itemAsk").children().val();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/process/item?originCodeId=" + itemCodeId,
			method: "put",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify({
				"item" : {
					"daNo" : daNo
					, "itemCodeId" : ici
					, "itemAsk" : ia
					, "processCodeId" : processCodeId
				},
				"originCodeId" : itemCodeId
			}),
			success : function() {
				$itemList();
				applyList(processCodeId);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});
	
	$(".itemCancelBtn").on("click", function() {
		$itemList();
	});
}


/* 점수 테이블 만드는 태그 */
let makeScoreTable = function(index, applicant, score) {
	return $("<tr>").css("text-align", "center").append(
				$("<td>").addClass("col-1 index").val(applicant.applySn).html(index)
				, $("<td>").addClass("col-1").html(applicant.resume.resumeName)
				, $("<td>").addClass("col-4").html(applicant.resume.resumeTitle)
				, $("<td>").addClass("col-2").html(applicant.applyResult)
				, $("<td>").addClass("col-2 score").html(score) // 나중에 각 과정 점수로 바꿔주기
// 				append($("<input>").addClass("form-control").attr("name", applicant.score).attr("placeholder", "해당 지원자의 점수를 입력하세요").attr("size", "30"))
				, $("<td>").addClass("col-2").append(
					$("<button>").addClass("btn btn-outline-primary scoreUpdateBtn").css({"width":"60px", "display":"inline-block", "border-radius":"0", "font-size":"12px;"}).html("수정")
				)
				
			);
}

/* table 누르면 지원자에게 점수를 부여하는 테이블이 나옴 */
function showScoreList(itemTable) {
	let processCodeId = $(itemTable).parents(".itemUl").attr("id");
	let itemCodeId = $(itemTable).parent().attr("id");
	
	if ($(itemTable).parent().children(".scoreTable").is(":visible")) {
		$(itemTable).parent().children(".scoreTable").children("tbody").empty();
	} else {
		$.ajax({
			url : "${pageContext.request.contextPath}/apply/applicant?daNo=" + daNo + "&processCodeId=" + processCodeId + "&itemCodeId=" + itemCodeId,
			dataType: "json",
			success : function(applicant) {
				$.each(applicant, function(index, app) {
					let score = app.selected[itemCodeId.toLowerCase()];
					$(itemTable).parent().children(".scoreTable").children("tbody").append(makeScoreTable(index + 1, app, score));
					let indexApp = $(itemTable).parent().find(".score:eq(" + index + ")");
					if (score == 0) {
						indexApp.empty();
						indexApp.append($("<input>").addClass("form-control").attr("placeholder", "점수 입력"));
						indexApp.parent().find(".scoreUpdateBtn").html("저장").removeClass("scoreUpdateBtn").addClass("scoreSaveBtn");
					}
				});
			},
			
			error : function(jqXHR, status, error) {

				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		}).done(function(data, textStatus, xhr) {
			$(".scoreUpdateBtn").on("click", function() {
				let subtn = this;
				let thisTd = $(this).parent();
				let scoreTd = $(this).parents("tr").find(".score");
				let origin = scoreTd.html();
				scoreTd.empty();
				scoreTd.append($("<input>").addClass("form-control").val(origin));
				
				$(subtn).hide();
				thisTd.append($("<button>").addClass("btn btn-outline-primary newScoreSaveBtn").css({"width":"60px", "display":"inline-block", "border-radius":"0", "font-size":"12px"}).html("저장"));
				thisTd.find(".newScoreSaveBtn").on("click", function() {
					let thisButton = this;
					let itemCodeId = $(this).parents(".items").attr("id");
					let processCodeId = $(this).parents(".itemUl").attr("id");
					let score = $(this).parents("tr").find("input").val();
					let applySn = $(this).parents("tr").find(".index").val();
					let scoreInput = $(this).parents("tr").find(".score");
					console.log(daNo);
					console.log(applySn);
					console.log(score);
					
					$.ajax({
						url : "${pageContext.request.contextPath}/apply/updateScore",
						method : "patch",
						contentType : "application/json; charset=UTF-8",
						data : JSON.stringify({
							"processCodeId":processCodeId
							, "itemCodeId":itemCodeId
							, "score":score
							, "applySn":applySn
							, "daNo":daNo
						}),
						success : function() {
							scoreInput.empty();
							scoreInput.html(score);
							$("button").remove(".newScoreSaveBtn");
							$(subtn).show();
							applyList(processCodeId);
						},
						error : function(jqXHR, status, error) {
							console.log(jqXHR);
							console.log(status);
							console.log(error);
						}
					});
				});
			});
			// 점수표에서 저장을 누르면 점수테이블에 업데이트
			$(".scoreSaveBtn").on("click", function() {
				updateScore(this);
			});
		});
	}
	$(itemTable).parent().children(".scoreTable").toggle();
}

/* 점수 입력 */
function updateScore(button) {
	let itemCodeId = $(button).parents(".items").attr("id");
	let processCodeId = $(button).parents(".itemUl").attr("id");
	let score = $(button).parents("tr").find("input").val();
	let applySn = $(button).parents("tr").find(".index").val();
	let scoreInput = $(button).parents("tr").find(".score");
	
	$.ajax({
		url : "${pageContext.request.contextPath}/apply/updateScore",
		method : "patch",
		contentType : "application/json; charset=UTF-8",
		data : JSON.stringify({
			"processCodeId":processCodeId
			, "itemCodeId":itemCodeId
			, "score":score
			, "applySn":applySn
			, "daNo":daNo
		}),
		success : function() {
			scoreInput.empty();
			scoreInput.html(score);
			$(button).removeClass("scoreSaveBtn").addClass("scoreUpdateBtn").html("수정").on("click", function() {
				let subtn = button;
				let buttonTd = $(button).parent();
				let scoreTd = $(button).parents("tr").find(".score");
				let origin = scoreTd.html();
				scoreTd.empty();
				scoreTd.append($("<input>").addClass("form-control").val(origin));
				$(subtn).hide();
				buttonTd.append($("<button>").addClass("btn btn-outline-primary newScoreSaveBtn").css({"width":"60px", "display":"inline-block", "border-radius":"0"}).html("저장")).on("click", function() {
					buttonTd.find(".newScoreSaveBtn").on("click", function() {
						let buttonButton = button;
						let itemCodeId = $(button).parents(".items").attr("id");
						let processCodeId = $(button).parents(".itemUl").attr("id");
						let score = $(button).parents("tr").find("input").val();
						let applySn = $(button).parents("tr").find(".index").val();
						let scoreInput = $(button).parents("tr").find(".score");
						
						$.ajax({
							url : "${pageContext.request.contextPath}/apply/updateScore",
							method : "patch",
							contentType : "application/json; charset=UTF-8",
							data : JSON.stringify({
								"processCodeId":processCodeId
								, "itemCodeId":itemCodeId
								, "score":score
								, "applySn":applySn
							}),
							success : function() {
								scoreInput.empty();
								scoreInput.html(score);
								$("button").remove(".newScoreSaveBtn");
								$(subtn).show();
								applyList(processCodeId);
							},
							error : function(jqXHR, status, error) {
								console.log(jqXHR);
								console.log(status);
								console.log(error);
							}
						});
					});
				});
			});
			applyList(processCodeId);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
/* 	}).done(function(data, textStatus, xhr) {
		$(".scoreUpdateBtn").on("click", function() {
			let subtn = this;
			let thisTd = $(this).parent();
			let scoreTd = $(this).parents("tr").find(".score");
			let origin = scoreTd.html();
			scoreTd.empty();
			scoreTd.append($("<input>").addClass("form-control").val(origin));
			
			$(subtn).hide();
			thisTd.append($("<button>").addClass("btn btn-outline-primary newScoreSaveBtn").css({"width":"60px", "display":"inline-block", "border-radius":"0"}).html("저장"));
			thisTd.find(".newScoreSaveBtn").on("click", function() {
				let thisButton = this;
				let itemCodeId = $(this).parents(".items").attr("id");
				let processCodeId = $(this).parents(".itemUl").attr("id");
				let score = $(this).parents("tr").find("input").val();
				let applySn = $(this).parents("tr").find(".index").val();
				let scoreInput = $(this).parents("tr").find(".score");
				
				$.ajax({
					url : "${pageContext.request.contextPath}/apply/updateScore",
					method : "patch",
					contentType : "application/json; charset=UTF-8",
					data : JSON.stringify({
						"processCodeId":processCodeId
						, "itemCodeId":itemCodeId
						, "score":score
						, "applySn":applySn
					}),
					success : function() {
						scoreInput.empty();
						scoreInput.html(score);
						$("button").remove(".newScoreSaveBtn");
						$(subtn).show();
						applyList(processCodeId);
					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				});
			});
		}); */
	});
}

/* 순위 목록을 만드는 태그 */
function makeApplyListTag(index, applicant) {
	return $("<li>").addClass("table-row applyList").css({"margin-left":"2%", "margin-right":"2%", "justify-content":"flex-start"}).append(
		$("<div>").addClass("col col-2 ranking").html(index + 1)
		, $("<div>").addClass("col col-3").html(applicant.resume.resumeName)
		, $("<div>").addClass("col col-2").html(applicant.selected.total)
		, $("<div>").addClass("col col-2").html(applicant.selected.avg)
		, $("<div>").addClass("col col-3").append(
			$("<select>").addClass("form-control result").append(
				$("<option>").html(applicant.applyResult)
				, $("<option>").html("진행중")
				, $("<option>").html("합격")
				, $("<option>").html("탈락")
			)
			, $("<input>").addClass("applySns").attr("type", "hidden").val(applicant.applySn)
			, $("<input>").addClass("processCodeId").attr("type", "hidden").val(applicant.processCodeId)
		)
	);
}

/* 합격 / 진행중 / 탈락 정하기 */
function passOrFail(button) {
	let applySns = $("#alUl").find(".applySns");
	let applyResults = $("#alUl").find(".result");
	let processCodeId = $(".hovered").find("input").val();
	let resultList = [];
	for (let i = 0; i < applySns.length; i++) {
		let applyVO = new Object();
		applyVO.applySn = applySns[i].value;
		applyVO.applyResult = applyResults[i].value;
		applyVO.daNo = daNo;
		applyVO.processCodeId = processCodeId;
		resultList.push(applyVO);
	}
	
	$.ajax({
		url : "${pageContext.request.contextPath}/apply/updateResult",
		method : "patch",
		contentType : "application/json; charset=UTF-8",
		data : JSON.stringify(resultList),
		success : function() {
			$itemList();
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	}).done(function(data, textStatus, xhr) {
		finalResult();
	});	
}

/* 최종합격자 명단 태그 */
function makeFinalResultTag(index, applicant) {
	return $("<tr>").append(
				$("<td>").html(index)
				, $("<td>").html(applicant.resume.resumeName)
				, $("<td>").html('<button class="pdfBtn" value="' + applicant.resume.resumeSn +'">' + applicant.resume.resumeTitle + "</button>")
				, $("<td>").css("text-align", "right").html(applicant.scoreIndepth.total)
				, $("<td>").html(applicant.scoreIndepth.avg)
			);
}

/* 최종합격자 명단을 최신화하기 */
function finalResult() {
	$.ajax({
		url : "${pageContext.request.contextPath}/apply/applicant",
		method : "get",
		contentType : "application/json; charset=UTF-8",
		data : {
			"processCodeId" : 'PRC08'
			, "daNo" : daNo
			, "finalResult" : "Y"
		},
		dataType : "json",
		success : function(applicants) {
			$("#finalTbody").empty();
			$.each(applicants, function(index, applicant) {
				$("#finalTbody").append(makeFinalResultTag(index + 1, applicant));
			});

			/* pdf 여는 기능 */
			$(".pdfBtn").on("click", function() {
				let resumeSn = $(this).val();
				window.open('${pageContext.request.contextPath}/pdf?resumeSn=' + resumeSn, 'window_name', 'width=730, height=1080, location=no, status=no, scrollbars=yes');
			});

		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

finalResult();

/* 각 카드 누르면 카드에 맞는 항목들 보여주기 */
$("span.data-card").on("click", function() {
	// .card-contain이 갖고 있는 모든 span을 조사해서 만약 hovered가 있으면 없애주고
	let spans = $(this).parent().children("span");
	for (let i = 0; i < spans.length; i++) {
		$(spans[i]).removeClass("hovered");
	}
	
	// 선택한 애는 넣어주기
	$(this).addClass("hovered");
	
	// 라디오버튼 체크할 거 값 가져오기
	let id = $(this).attr("id").substring(4);
	$("#disp"+id).show();
	
	let udisp = $("#disp").children().not("#disp"+id);
	for (let i = 0; i < udisp.length; i++) {
		udisp[i].style.display = "none";
	}
	
	/* 지원 목록 순위*/
	let processCodeId = $("#disp" + id).children().attr("id");
	applyList(processCodeId);
	$("#alUl").show();
	
	// 첨부파일 보이기
	$(".att").hide();
	$("#pd" + processCodeId).show();
});

if ($(".data-card").hasClass("hovered") && $("#alUl").css("display") == "none") {
	$("#alUl").show();
	let processCodeId = $(".hovered").find("input[type=hidden]").val();
	$("#pd" + processCodeId).show();
}		
</script>