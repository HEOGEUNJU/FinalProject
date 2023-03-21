<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<!-- Custom styles for this template -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom-bs.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">  

<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION }">
	<script>
		alert("${SPRING_SECURITY_LAST_EXCEPTION.message}");
	</script>
	<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
</c:if>

<!-- <div id="overlayer"></div>
<div class="loader">
	<div class="spinner-border text-primary" role="status">
    	<span class="sr-only">Loading...</span>
  	</div>
</div> -->

<section class="site-section" style="display:flex; justify-content : center; background: rgba(0, 0, 0, 0)">
	<div class="container" style="width:35%; background-color: rgba(255, 255, 255, .8); padding: 2%; border-radius: 8px;">
		<div class="">
           	<h2 class="mb-4">로그인</h2>
            <form class="p-4 border rounded" action="<c:url value='/login/loginProcess.do'/>" method="post" id="loginForm">
				<security:csrfInput/>
				<div class="row form-group">
	                <div class="col-md-12 mb-3 mb-md-0">
	                  <label class="text-black" for="fname">ID</label>
	                  <input type="text" name="memId" class="form-control" style="height:50px;" placeholder="아이디">
	                </div>
              	</div>
              	<div class="col-auto">
					<div class="form-check">
					<label><input type="checkbox" class="form-check-input" name="아이디 저장" />rememberMe</label>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-md-12 mb-3 mb-md-0">
						<label class="text-black" for="fname">Password</label>
	                  	<input type="password" name="memPass" class="form-control" style="height:50px;" placeholder="비밀번호">
	                </div>
				</div>
				
				<!-- 로그인 편의 기능, 개발종료시 지워야함 -->
				<div class="row mt-3">
					<div class="col	">
						<select class="form-select" aria-label="Default select example" onchange="selectedLogin(event);">
						  <option>사용자선택</option>
						  <option data-mem-id="zzz98" data-mem-pass="java">관리자</option>
						  <option data-mem-id="cks1111" data-mem-pass="java">일반회원</option>
						  <option data-mem-id="asdf2" data-mem-pass="asdf">기업회원</option>
						  <option data-mem-id="A001" data-mem-pass="java">전문가</option>
						</select>
						<script>
							function selectedLogin(event){
								let target = $(event.target);
								let option = target.find("option:selected");
								let memId = option.data("memId");
								let memPass = option.data("memPass");
								if(memId && memPass) {
									loginForm.memId.value = memId;
									loginForm.memPass.value = memPass;
		// 							loginForm.submit();
								}
							}
						</script>
					</div>
				</div>


              	<div class="row form-group">
               		<div class="col-md-12" style="text-align: right;">
                  		<input type="submit" value="로그인" class="btn px-4 btn-primary text-white" style="position: relative; width:100%; height:50px; background-color: #0D6EFD; border: 1px solid  #0D6EFD; margin: 20px 0;">
                	</div>
                	<div>
	                  	<hr style="border-top: 1px solid #7f848c;">
	                  	<p>
	                   		<a href="<c:url value='/join/seeker'/>" style="color: #3157DD; font-weight: 1000;">회원가입</a>
	                    	|
	                    	<a href="<c:url value='/help/find'/>" style="color: #3157DD; font-weight: 1000;">아이디/비밀번호 찾기</a>
	                  	</p>
                	</div>
              	</div>
            </form>
        </div>
   	</div>
</section>

<!-- SCRIPTS -->
<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/isotope.pkgd.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/stickyfill.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.fancybox.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.easing.1.3.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.waypoints.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.animateNumber.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/owl.carousel.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/quill.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap-select.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>

    
