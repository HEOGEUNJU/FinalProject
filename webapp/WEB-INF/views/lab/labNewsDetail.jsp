<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023.02.02  윤호연      최초작성
* 2023.03.09  윤호연      최초작성
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom-bs.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/line-icons/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/quill.snow.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/pattern.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
	/* 이미지 사이즈 */
	.newsImage{
 		width: 800px; 
	}
</style>
</head>

	<!-- 뉴스 본문 -->
    <section class="site-section">
      <div class="container">
        <div class="row">
        	
        	<h1 style="font-family: 'NanumSquareNeo-Variable'; font-size: 1.5em">${news.newsField } 뉴스</h1>
       	<br>
       	<br>
       	<hr style="border-bottom: 2px solid black">
            	<h3 style="font-family: 'NanumSquareNeo-Variable'; font-size: 2em; text-align: center;">${news.newsName }</h3>
        <div style="height: 15px;"></div>
            <p style="text-align: right; font-size: 1em;">
            	조회수 : ${news.newsHit }<br>
            	등록일 : ${news.newsDate }
            </p>
        <div style="height: 20px;"></div>
           	<hr style="border-bottom: 1px solid black">
		<div style="height: 40px;"></div>
		      
        <!-- 뉴스 소제목 -->
           	<p style="font-family: 'NanumSquareNeo-Variable'; color: blue;">${news.newsSemiName }</p>
        <div style="height: 40px;"></div>	
        
        <!-- 이미지 들어가는곳 -->	
        <div style="text-align: center;">
        	<img src='<spring:url value="/image/newsFolder/${news.attSavename}"/>' alt="Image" class="newsImage">
        </div>
        <div style="height: 40px;"></div>

        <!-- 뉴스 본문 -->
          	<p>${news.newsContent }</p>
        <div style="height: 50px; border-bottom: 1px solid black"></div> 
        <div style="height: 20px;"></div>
        
	      <div style="width: 1200px;">
	      	<security:authorize url="/lab/News/Update">
	    	  <button type="submit" class="btn btn-primary text-white" style="width: 116px; background: #7676e952;"
	    	  		 onclick="location.href='<%=request.getContextPath() %>/lab/News/Update?no=${news.newsNo}'">
	         		   뉴스 수정
	          </button>
	      	</security:authorize>
	      	<security:authorize url="/lab/News/Delete">
	          <button class="btn btn-primary text-white" style="width: 116px; background: #f92d2d6e;"
	           		 onclick="deleteNews()">
	         		  뉴스 삭제
	          </button>
	      	</security:authorize>
	         	<button type="button" class="btn btn-primary text-white" style="width: 116px; float: right; background-color: #0D6EFD"
	          		 onclick="location.href='<%=request.getContextPath() %>/lab/News'">
	            		목록으로
           		</button>
	        </div>	 	
       
      	</div>
      </div>
    </section>
    
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <script>
    
//  삭제요청시 Alert 띄움

   	function deleteNews(){
   		swal({
   			  title: "삭제하시겠습니까?",
   			  icon: "warning",
   			  buttons: true,
   			  dangerMode: true,
   			})
   			.then((willDelete) => {
   			  if (willDelete) {
   			    swal("삭제 완료!", {
   			      icon: "success",
   			    }).then(function(deleteNews){
   			    	let newsNo = '${news.newsNo}'; 
   			    	$.ajax({
						url : "<%=request.getContextPath()%>/lab/News/Delete?no=${news.newsNo}",
						method : "get",
						data : {"newsNo" : newsNo},
						success : function(resp) {
							console.log("삭제됨");
							window.location = "<%=request.getContextPath()%>/lab/News";
						},
						error : function(jqXHR, status, error) {
							console.log(jqXHR);
							console.log(status);
							console.log(error);
						}
					});
   			    });
   			  } else {
   			    swal("요청 취소됨");
   			  }
   			});
    	};
    	
    </script>

</body>
</html>