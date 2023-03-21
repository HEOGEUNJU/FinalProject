<%--
* [[개정이력(Modification Information)]]
* 수정일             수정자            수정내용
* ----------  ---------  -----------------
* 2023. 2. 15.      최경수            최초작성
* 2023. 2. 18.      최경수           달력, 일정
* 2023. 2. 19.      최경수          화면 꾸미
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link href="<%=request.getContextPath()%>/resources/cks/processMain.css" rel="stylesheet"/>
<style>
a {
	color: black;
	text-decoration: none;
}
.pf {
 	font-size: 24px; 
}

.radiuss{
	width: 100%;
	height: auto;
	border : 1px solid #eaedf4;
	border-radius: 12px;
	padding-top: 50px;
	margin-top: 2%;
	margin-bottom: 2%;
}
</style>
<div class="radiuss">
	<div class="qna_write_wrap">
		<div class="qna_write_selection">
			<span class="qna_category_tit" style="font-size: 40px; padding-left: 100px; padding-right: 100px;">일정</span>
		</div>
	</div>
	<div style="padding-left: 50px; padding-right: 50px;">
		<hr style="background-color: #5c667b; height: 2px;">
		<p class="pf">총체적인 일정과 할 일 목록</p>
	</div>
	<!-- 달력, 일정 -->
	<div style="position: relative; padding: 25px; height: 90vh;">
		<div id='calendar' style="position: abolute; padding: 50px; float:left; border-radius: 0.5em; width: 67%; height: 100%; border : 1px solid #eaedf4;" data-source="${pageContext.request.contextPath}/process/events/details/process"></div>
		<div id='schedular' class="table-responsive" style="position: abolute; padding-top: 50px; padding-bottom: 50px; float:right; border-radius: 0.5em; width: 32%; height: 100%; border : 1px solid #eaedf4;">
			<div style="position: relative; margin-right: 10px; margin-bottom: 15px; background-color: #126CF5; width: 95%%; height: 50px; box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);">
				<span style="position: absolute; left: 20px; top: 7px; font-size: 25px; font-weight: 800; color: white;">할 일</span>
			</div>
			<ul class="responsive-table">
			  <li class="table-header">
			    <div class="col col-1">No</div>
			    <div class="col col-2"style="left: 20px;">TODO</div>
			    <div class="col col-3" style="left: 70px;">DEADLINE</div>
			    <div class="col col-4">CHECK</div>
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

<div class="radiuss">
  <canvas id="myChart"></canvas>
</div>

<!-- 세부공고 목록(카드) -->
<div class="radiuss">
	<div class="qna_write_wrap">
		<div class="qna_write_selection">
			<span class="qna_category_tit" style="font-size: 40px; padding-left: 100px; padding-right: 100px;">회사 공고</span>
		</div>
	</div>
	<div style="padding-left: 50px; padding-right: 50px;">
		<hr style="background-color: #5c667b; height: 2px;">
		<p class="pf">세부공고별</p>
	</div>
	
	<section class="page-contain">
	
			<div style="display: flex; flex-direction: column; padding-top: 110px; min-width: 17.75em; min-height: 20.75em; text-decoration: none; text-align: center;">
				<a href="${pageContext.request.contextPath}/process/list" style="text-decoration: none;"><h3>전체 공고</h3>
				<h3>목록 보기</h3>
				<h1>&#10159;</h1></a>
			</div>
			<c:forEach items="${list}" var="anno">
				<c:if test="${anno.percent ne 0.0 and anno.percent ne 100.0 }">
					<c:forEach items="${anno.detailList}" var="detail">
						<a href="${pageContext.request.contextPath}/process/${anno.annoNo }/${detail.daNo}" class="data-card">
							<h3>${detail.daFd}</h3>
							<h4>${detail.daDepartment }</h4>
							<p>${fn:substring(anno.annoStartdate, 0, 10)} ~ ${fn:substring(anno.annoEnddate, 0, 10)}</p>
<%-- 							<p>${fn:substring(detail.daTask, 0, 48)} ...</p> --%>
							<p>
								<c:forEach items="${detail.processList}" var="process" varStatus="status">
									${process.processCodeName}<c:if test="${!status.last}"> - </c:if>
								</c:forEach>
							</p>
							<span class="link-text">
								${anno.annoTitle}
							</span>
						</a>
					</c:forEach>
				<span style="width: 10px; height: 50px; background-color: gray; border-radius: 5px; margin-left: 10px; margin-right: 10px;">/</span>
				</c:if>
			</c:forEach>					
	</section>
	
	<section class="page-contain" style="position: relative; top: -100px;">
	
			<div style="position: absolute; top: 10px; min-width: 5em; min-height: 20.75em; text-decoration: none; text-align: center;">
				<h3>예정 공고</h3>
			</div>
			<c:forEach items="${list}" var="anno">
				<c:if test="${anno.percent eq 0 }">
					<c:forEach items="${anno.detailList}" var="detail">
						<a href="${pageContext.request.contextPath}/process/${anno.annoNo }/${detail.daNo}" class="data-card">
							<h3>${detail.daFd}</h3>
							<h4>${detail.daDepartment }</h4>
							<p>${fn:substring(anno.annoStartdate, 0, 10)} ~ ${fn:substring(anno.annoEnddate, 0, 10)}</p>
<%-- 							<p>${fn:substring(detail.daTask, 0, 48)} ...</p> --%>
							<p>
								<c:forEach items="${detail.processList}" var="process" varStatus="status">
									${process.processCodeName}<c:if test="${!status.last}"> - </c:if>
								</c:forEach>
							</p>
							<span class="link-text">
								${anno.annoTitle}
							</span>
						</a>
					</c:forEach>
				<span style="width: 10px; height: 50px; background-color: gray; border-radius: 5px; margin-left: 10px; margin-right: 10px;">/</span>
				</c:if>
			</c:forEach>	
									
	</section>
	
	<section class="page-contain" style="position: relative; top: -200px;">
	
			<div style="position: absolute; top: 10px; min-width: 5em; min-height: 20.75em; text-decoration: none; text-align: center;">
				<h3>지난 공고</h3>
			</div>
			<c:forEach items="${list}" var="anno">
				<c:if test="${anno.percent eq 100.0 }">
					<c:forEach items="${anno.detailList}" var="detail">
						<a href="${pageContext.request.contextPath}/process/${anno.annoNo }/${detail.daNo}" class="data-card">
							<h3>${detail.daFd}</h3>
							<h4>${detail.daDepartment }</h4>
							<p>${fn:substring(anno.annoStartdate, 0, 10)} ~ ${fn:substring(anno.annoEnddate, 0, 10)}</p>
<%-- 							<p>${fn:substring(detail.daTask, 0, 48)} ...</p> --%>
							<p>
								<c:forEach items="${detail.processList}" var="process" varStatus="status">
									${process.processCodeName}<c:if test="${!status.last}"> - </c:if>
								</c:forEach>
							</p>
							<span class="link-text">
								${anno.annoTitle}
							</span>
						</a>
					</c:forEach>
				<span style="width: 10px; height: 50px; background-color: gray; border-radius: 5px; margin-left: 10px; margin-right: 10px;">/</span>
				</c:if>
			</c:forEach>	
									
	</section>
</div>

<script src="${pageContext.request.contextPath}/resources/js/fullcalendar-6.1.0/dist/index.global.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>

	document.addEventListener('DOMContentLoaded', function() {
	  var calendarEl = document.getElementById('calendar');
	  var calendar = new FullCalendar.Calendar(calendarEl, {
	    initialView: 'dayGridMonth'
// 	    , plugins: [ 'interaction', 'dayGrid']
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
// 			textColor : '#252525'
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

	  const ctx = document.getElementById('myChart');

	  new Chart(ctx, {
	    type: 'bar',
	    data: {
	      labels: ['10월', '11월', '12월', '1월', '2월', '3월'],
	      datasets: [{
	        label: '# of Votes',
	        data: [12, 19, 3, 5, 2, 3],
	        borderWidth: 1
	      }]
	    },
	    options: {
	      scales: {
	        y: {
	          beginAtZero: true
	        }
	      }
	    }
	  });
	
</script>