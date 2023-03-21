<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023.02.02  윤호연      최초작성
* 2023.02.28  윤호연      화면수정
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<head>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/animate.min.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">    
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/layout.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/help.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/board.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/components.css">
	    
	<style>
	/* 더잠실체  */
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
	.slideNewsWidth{
		width: 320px;
	}
	.imgSize{
		width: 250px;
		height: 250px;
	}
	.searchOn{
    	width: 1148px;
	}
	
	</style>
	</head>

	  <div id="content" style="width: 1260px;">
	  	<div class="wrap_title_recruit">
	  		<h1 class="title_common" style="font-size: 40px;">뉴스</h1>
	  		<div style="height: 10px;"></div>
	  	<hr style="border-bottom: 1px solid black">
	  	</div>
	  	
	<!-- 뉴스 슬라이드 -->
	
	<section id="gallery">
	  <div class="container">
	    <div class="row">
	    
	    <div class="owl-carousel" style="height: 400px;">
	    
		    <c:set var="newsList" value="${pagingVO.dataList }"/>
		      <c:choose>
		  	   <c:when test="${not empty newsList }">
			    <c:forEach items="${newsList }" var="news">
				    <div class="slideNewsWidth">
				    <div class="card">
				      <img src='<spring:url value="/image/newsFolder/${news.attSavename}"/>' alt="첨부파일 없음!" class="imgSize">
				      <div class="card-body">
				        <h5 class="card-title" style="font-family: 'NanumSquareNeo-Variable'; font-size: 1.2em;">${news.newsName }</h5><br>
				       <a href="${pageContext.request.contextPath}/lab/News/Detail?no=${news.newsNo }"
				       	  class="btn btn-outline-success btn-sm" style="color: black; border-color: #0D6EFD">기사 조회하기</a>
				      </div>
				     </div>
				    </div>
				</c:forEach>
		      </c:when>
		    </c:choose>
	    
	    </div>
	    
	  </div>
	  </div>
	</section>
	
	<div class="wrap_section wrap_community_topic">	
  	<div class="wrap_slide_category">
  	
	  	<div style="height: 10px;"></div>
	  	
		<!-- 카테고리별 정렬 -->	
		  	
	  	<ul class="list_category js-category" style="max-width: 889px;margin: 0 0 0 32px;">
	        <li aria-hidden="false" style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
	        	<a class="item_cate" href="#" onclick="selectCategory('취업')">취업<span></span></a>
	        </li>
	        <li aria-hidden="false" style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
	        	<a class="item_cate" href="#" onclick="selectCategory('기업')">기업<span></span></a>
	        </li>
	        <li aria-hidden="false" style="float: left; list-style: none; position: relative; width: 114px; margin-right: 12px;">
	        	<a class="item_cate" href="#" onclick="selectCategory('공채')">공채<span></span></a>
	        </li>
	  	</ul>
	  	
	  	<!-- 검색창 -->
	  	
		<div class="wrap_board">
	  		<div class="search_area" style="padding: 10px 0 12px;"> 
		  	<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
		  		<div class="searchOn">
			   	 <div class="searchTypoBox" style="float: right;">
			   	   	<form:input style="width: 276px;" path="searchWord" type="text" class="inpTypo" placeholder="검색내용을 입력하시오"/>
		       	   	<button type="submit" id="searchBtn" class="btnTypoSearch">검색</button>
			     </div>
				    <input type="hidden" name="newsField" />
				    <input type="hidden" name="page" />
		  		 </div>
		  	</form:form>
  			</div>
  		</div>
  		
  	</div>
  	</div>
  		
  	 <div style="height: 20px;"></div>
  		

  	 <div class="tblType">
        <table>
          <colgroup>
			<col width="64" />
			<col width="" />
			<col width="200" />
			<col width="200" />
		  </colgroup>
          <thead>
            <tr>
              <th>분야</th>
              <th>제목</th>
              <th>조회수</th>
              <th>작성일</th>
            </tr>
          </thead>
          <tbody>
          
          <c:set var="newsList" value="${pagingVO.dataList }"/>
          	<c:choose>
          	  <c:when test="${not empty newsList }">
          	  	<c:forEach items="${newsList }" var="news">
		            <tr>
		              <td><strong>${news.newsField }</strong></td>
		              <td>
		              	<c:url value="/lab/News/Detail" var="viewURL">
							<c:param name="no" value="${news.newsNo }"/>
						</c:url>
						<a href="${viewURL }">${news.newsName }</a>
					  </td>
		              <td>${news.newsHit }</td>
		              <td><fmt:formatDate value="${news.newsDate }" pattern="yyyy-MM-dd" type="Date"/></td>
		            </tr>
          	  	</c:forEach>
          	  </c:when>
          	  <c:otherwise>
          	  	<tr>
          	  		<td colspan="6">게시글 없음.</td>
          	  	</tr>
          	  </c:otherwise>
          	</c:choose>

          </tbody>
        </table>
    </div>

	<!-- 뉴스 작성 button -->
	
   <div style="height: 25px"></div>
   
	   <security:authorize url="/lab/News/Form">
		  <div class="col-lg-2" style="left: 1150px;">
		     <button type="button" class="btn btn-primary text-white" onclick="location.href='<%=request.getContextPath() %>/lab/News/Form'">
		     <span class="icon-line-document d-block"></span>뉴스 작성</button>
		  </div>
	   </security:authorize>
	  
		<!-- 페이징 -->
		<div class="row pagination-wrap">
		  <div class="col-md-12 text-center text-md-right" style="left: 150px">
			<div id = "pagingArea">
				<ui:pagination pagingVO="${pagingVO }" type="bootstrap"/>
		    </div>
		  </div>
		</div>
	  
    <hr>
    
    
	</div>

	<form:form id="searchForm" modelAttribute="simpleCondition" method="get">
		<input type="hidden" name="page" />
	</form:form>

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

	function selectCategory(category) {
		$('input[name=newsField]').val(category);
		$('#searchForm').submit();
	}
</script>

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
</body>