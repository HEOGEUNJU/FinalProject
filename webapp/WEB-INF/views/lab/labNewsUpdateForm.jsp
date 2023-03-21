<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023.02.09  윤호연      최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/custom-bs.css">
	    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/jquery.fancybox.min.css">
	    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap-select.min.css">
	    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/fonts/icomoon/style.css">
	    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/fonts/line-icons/style.css">
	    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/owl.carousel.min.css">
	    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/animate.min.css">
	    
	    <!-- MAIN CSS -->
	    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css">    
	</head>

      <!-- HOME -->
	<section class="section-hero home-section overlay inner-page bg-image" style="background-image: url('<%=request.getContextPath()%>/resources/images/hero_1.jpg');" id="home-section">
		<div class="container">
	        <div class="row">
				<div class="col-md-7">
		            <h1 class="text-white font-weight-bold">뉴스</h1>
		            <div class="custom-breadcrumbs">
						<a href="${pageContext.request.contextPath}/lab">Lab</a> <span class="mx-2 slash">/</span>
						<span class="text-white"><strong>NewsInsert</strong></span>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- 입력 폼 -->
    <section class="site-section">
      <div class="container">
        <div class="row">
        
          <div class="col-lg-8 mb-5 mb-lg-0">

            <form action="<%=request.getContextPath() %>/lab/News/Update" method="post"> 
            <input type ="hidden" name="newsNo" value="${news.newsNo }"/>
              <p>카테고리 선택</p>
              <div class="container">
                <div class="row align-items-center justify-content-center">
                  <div class="col-md-10">
                      <div class="row mb-5">
                        <div class="col-lg-3 mb-4 mb-lg-0" style="border: 1px solid #ddd5d5; left: -60px;">
                          <select class="selectpicker" data-style="btn-white btn-lg" name="categoryselect" data-width="100%" data-live-search="true" title="Select">
	                      	<option value="기업"<c:if test="${news.newsField=='기업'}">selected</c:if>>기업</option>
	                      	<option value="취업"<c:if test="${news.newsField=='취업'}">selected</c:if>>취업</option>
	                      	<option value="공채"<c:if test="${news.newsField=='공채'}">selected</c:if>>공채</option>
                          </select>
                        </div>
                      </div>
                  </div>
                </div>
              </div>
            
              <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-black" for="text">기사 제목</label> 
             		<input type="text" id="newsName" name="newsName" class="form-control" value="${news.newsName }">
                </div>
              </div>


              <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-black" for="text">기사 내용</label>
             		<textarea id="newsContent" name="newsContent" cols="30" rows="7" class="form-control">${news.newsContent }</textarea>
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <input type="file" value="이미지 추가" class="btn btn-primary text-white">
                  <input type="submit" value="기사 수정하기" class="btn btn-primary text-white" style="float: right;">
                </div>
              </div>
  
            </form>
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
</body>
</html>