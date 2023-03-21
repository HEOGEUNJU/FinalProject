<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Custom styles for this template -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom-bs.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/layout.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/components.css"/>  
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/help.css">

<style>
body {
    background-color:rgb(234, 237, 242);
}
</style>


<div id="sri_section" class="has_banner">
  	<div id="sri_wrap">
    	<div id="content" style="width: 1250px;">
      		<div class="wrap_title_recruit">
        		<h1 class="title_common">아이디/비밀번호 찾기</h1>
      		</div>
      		<div class="help_find help_find_type4">
        		<div class="cont_find">
          			<p class="desc_find">가입한 아이디와 비밀번호를 잊으셨습니까?</p>
          			<ul class="list_idpwd" style="width: 1250px;">
            			<li style="width: 615px;">
              				<strong class="tit_idpwd">개인회원</strong>
              				<span class="find_link" style="width: 615px;">
                				<a href='<c:url value = "/help/find/seekerFindId"/>' class="link_sns" style="width: 308px;">아이디 찾기</a>
                				<a href='<c:url value = "/help/find/seekerFindPw"/>'class="link_sns" style="width: 308px;">비밀번호 찾기</a>
              				</span>
            			</li>
            			<li style="width: 615px; margin: 20px 0 0 0;">
              				<strong class="tit_idpwd">기업회원</strong>
              				<span class="find_link" style="width: 615px;">
                				<a href='<c:url value = "/help/find/incruiterFindId"/>' class="link_sns" style="width: 308px;">아이디 찾기</a>
                				<a href='<c:url value = "/help/find/incruiterFindPw"/>' class="link_sns" style="width: 308px;">비밀번호 찾기</a>
              				</span>
            			</li>
          			</ul>
        		</div>
	        	<div class="find_method">
	          		<a href="<c:url value='/login'/>" class="btn_basic_type01 btn_login" title="로그인 바로가기">로그인</a>
	          		<a href="<c:url value='/join/seeker'/>" class="btn_basic_type04" title="회원가입 바로가기">회원가입</a>
	          		<a href="<c:url value='/help'/>" class="btn_basic_type04" title="자주 묻는 질문 바로가기">자주 묻는 질문</a>
	          		<p class="desc_method">위 방법으로 계정을 찾을수 없다면, INU 고객센터로 직접
	            		<a href="<c:url value='/ask'/>">문의</a> 주시기 바랍니다.
	          		</p>
	        	</div>
	      	</div>
    	</div>
  	</div>
</div>
