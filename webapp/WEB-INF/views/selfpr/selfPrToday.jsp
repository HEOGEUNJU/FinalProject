<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023.02.23   윤호연      제작
* 2023.03.08   윤호연      1차수정      
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom-bs.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-select.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/fonts/line-icons/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/animate.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/quill.snow.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">    
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/help.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/components.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/layout.css">
    
<style type="text/css">
    
   	.img-jobseeker {
		width: 150px;
		height: 130px;    	
   	}
   	
/* 폰트 */
	@font-face {
	    font-family: 'TheJamsil5Bold';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
	    font-weight: 700;
	    font-style: normal;
	}
	
/* 나눔스퀘어 네오 */
	@font-face {
	    font-family: 'NanumSquareNeo-Variable';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
   	
	/* 카드 */
      
    @import url('https://fonts.googleapis.com/css?family=Abel');

	.center {
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  -webkit-transform: translate(-50%, -50%);
	}
	
	.card {
	  width: 485px;
	  height: 250px;
	  background-color: #fff;
	  background: linear-gradient(#f8f8f8, #fff);
	  box-shadow: 6px 12px 16px -8px rgba(0,0,0,0.4);
	  border-radius: 15px;
	  overflow: hidden;
	  position: relative;
	  margin: 1.5rem;
	}
	
	.card h1 {
	  font-family: 'TheJamsil5Bold';
	  font-size : 2.5em;
	  text-align: center;
	}
	
	.card p{
	  font-family: 'NanumSquareNeo-Variable';
	}
	
	.card .additional {
	  position: absolute;
	  width: 150px;
	  height: 100%;
	  background: linear-gradient(#dE685E, #EE786E);
	  transition: width 0.4s;
	  overflow: hidden;
	  z-index: 2;
	  left: 0px;
	}
	
	.card.green .additional {
	  background: linear-gradient(#ecfff6, #006c39);
	}
	
	
	.card:hover .additional {
	  width: 100%;
	  border-radius: 0 5px 5px 0;
	  
	}
	
	.card .additional .user-card {
	  width: 150px;
	  height: 100%;
	  position: relative;
	  float: left;
	  
	}
	
	.card .additional .user-card::after {
	  content: "";
	  display: block;
	  position: absolute;
	  top: 10%;
	  right: -2px;
	  height: 80%;
	  border-left: 2px solid rgba(0,0,0,0.025);
	  
	}
	
	.card .additional .user-card .level,
	.card .additional .user-card .points {
	  top: 15%;
	  color: #fff;
	  text-transform: uppercase;
	  font-size: 0.75em;
	  font-weight: bold;
	  background: rgba(0,0,0,0.15);
	  padding: 0.125rem 0.75rem;
	  border-radius: 100px;
	  white-space: nowrap;
	  
	}
	
	.card .additional .user-card .points {
	  top: 85%;
	}
	
	.card .additional .user-card svg {
	  top: 50%;
	}
	
	.card .additional .more-info {
	  width: 300px;
	  float: left;
	  position: absolute;
	  left: 150px;
	  height: 100%;
	}
	
	.card.green .additional .coords {
	  margin: 0 1rem;
	  color: black;
	  font-size: 1rem;
	  font-family: 'NanumSquareNeo-Variable';
	}
	
	.card .additional .coords span + span {
	  float: right;
	}
	
	.card.green .additional .stats {
	  font-family: 'NanumSquareNeo-Variable';
	  font-size: 2rem;
	  display: flex;
	  position: absolute;
	  bottom: 1rem;
	  left: 1rem;
	  right: 1rem;
	  top: auto;
	  color: black;
	}
	
	.card .additional .stats > div {
	  flex: 1;
	  text-align: center;
	}
	
	.card .additional .stats i {
	  display: block;
	}
	
	.card .additional .stats div.title {
	  font-size: 0.9rem;
	  font-weight: bold;
	  text-transform: uppercase;
	  border-bottom: 1px solid white;
	}
	
	.card .additional .stats div.value {
		font-size: 0.9rem;
		font-weight: bold;
		line-height: 1rem;
	}
	
	.card .additional .stats div.value.infinity {
		font-size: 2.5rem;
	}
	
	.card .general {
		width: 300px;
		height: 100%;
		position: absolute;
		top: 0;
		right: 0;
		z-index: 1;
		box-sizing: border-box;
		padding: 1rem;
		padding-top: 0;
	}
	
	.card .general .more {
		position: absolute;
		bottom: 1rem;
		right: 1rem;
		font-size: 0.9em;
	}
	.selectboxwidth{
		width: 205px;
	}
	.prsearchBtn{
		border: 1px solid black;
		width: 90px;
		height: 35px;
		border-radius: 5px;
		background-color: #d9d9f9;
		float: right;
	}
	
	.search_table{
	    float: right;
   	 	width: 565px;
	}
	.profileimage{
		width: 110px;
		height: 110px;
		border-radius: 45px;
	}
    	
    </style>    
</head>
<body>

	<!-- 오늘 본 인재 확인 UI -->
<section class="site-section">
<div class="row">
	
	<div class="container">
		<h4 style="font-family: 'NanumSquareNeo-Variable'; font-size: 2em;">오늘 본 인재 목록</h4>
		<hr style="border-top: 1px solid">
	</div>
	
	<div style="height: 35px;"></div>

	<!-- 카드 1 -->
	<c:set var="selfprTodayList" value="${pagingVO.dataList }"/>
	 <c:choose>
          <c:when test="${not empty selfprTodayList }">
	       <c:forEach items="${selfprTodayList }" var="selfprToday">
	       
		   <div class="card green">
		    <div class="additional">
	       	  <a href="${pageContext.request.contextPath}/selfpr/Detail/?no=${selfprToday.prNo }">
		      <div class="user-card">
		        <div class="level center">
		          ${selfprToday.prWantjob }
		        </div>
		        <div class="points center">
		          ${selfprToday.prAnnual }
		        </div>
		        
		         <!-- 프로필 사진 -->
		        <div class="center">
					<img class="profileimage" alt="안나옴" src="<spring:url value='/image/memberFolder/${selfprToday.attSavename}'/>" />		        	
		        </div>
		        
		      </div>
		      <div class="more-info">
		      	<br style="height: 2px;">
		        <div class="coords">
		          <span>학력 : ${selfprToday.prEdu }</span>
		          <br>
		          <span>산업분야 : ${selfprToday.industryName }</span>
		          <br>
		          <span>지역 : ${selfprToday.regionName }</span>
		        </div>
		        <div class="stats">
		          <div>
		            <div class="title">경력</div>
		            <div class="value"><br>${selfprToday.prAnnual }</div>
		          </div>
		          <div>
		            <div class="title">원하는 직급</div>
		            <div class="value"><br>${selfprToday.prWantType }</div>
		          </div>
		          <div>
		            <div class="title">원하는 연봉</div>
		            <div class="value"><br>${selfprToday.prWantmn }</div>
		          </div>
		        </div>
		      </div>
		    </div>
		  	</a>
		    <div class="general">
		      <br>
		      <h1>${selfprToday.memName }</h1>
		      <br>
		      <br>
		      <p>&ldquo;${selfprToday.prName }&rdquo;</p>
		    </div>
		  </div>
				
	       	</c:forEach>
          </c:when>
         </c:choose>

	</div>
</section>
	
	<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
		<form:hidden path="searchType"/>
		<form:hidden path="searchWord"/>
		<input type="hidden" name="page" />
	</form:form>
    
    <!-- 페이징 -->
	<div class="row pagination-wrap">
	  <div class="col-md-12 text-center text-md-right" style="left: 450px">
		<div id = "pagingArea">
			<ui:pagination pagingVO="${pagingVO }" type="bootstrap"/>
	    </div>
	  </div>
	</div>
	
<!-- SCRIPTS -->
<script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/isotope.pkgd.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/stickyfill.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.fancybox.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.easing.1.3.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.waypoints.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.animateNumber.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/quill.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap-select.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/daumPostcode.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/custom.js"></script>

	<script type="text/javascript">
	
	let searchForm = $("#searchForm").on("click", "#searchBtn", function(){
		let inputs = searchUI.find(":input[name]");
		$.each(inputs, function(index, input){
			let name = this.name;
			let value = $(this).val();
			searchForm.find("[name="+name+"]").val(value);
		});
		searchForm.submit();
	});
	
	$("a.paging").on("click", function(event){
		event.preventDefault();
		let page = $(this).data("page");
		if(!page) return false;
		searchForm.find("[name=page]").val(page);
		searchForm.submit();
		return false;
	});
	</script>
</body>