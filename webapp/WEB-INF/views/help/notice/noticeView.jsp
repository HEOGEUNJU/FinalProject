<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/layout.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/components.css"/>  
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/help.css">

<style>
.main_tit {
    color: #373f57;
    font-size: 24px;
    font-weight: bold;
    letter-spacing: -2px;
    line-height: 32px;
    margin-bottom: 30px;
}
</style>


<!-- <table> -->
<!-- 	<tr> -->
<!-- 		<th>제목</th> -->
<%-- 		<td>${notice.noticeTitle }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>작성일</th> -->
<%-- 		<td>${notice.noticeDate }</td> --%>
<!-- 		<th>조회수</th> -->
<%-- 		<td>${notice.noticeHit }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>내용</th> -->
<%-- 		<td>${notice.noticeContent }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td colspan="2"> -->
<%-- 			<c:url value="/help/notice/noticeUpdate" var="updateURL"> --%>
<%-- 				<c:param name="what" value="${notice.noticeSn }"/> --%>
<%-- 			</c:url> --%>
<%-- 			<input type="button" onclick="location.href='${updateURL}'" value="수정"> --%>
<%-- 			<form action='<c:url value="/help/notice/noticeDelete"/>' method="post"> --%>
<%-- 				<input type="hidden" name="noticeSn" value="${notice.noticeSn }" /> --%>
<!-- 				<button type="submit">삭제하기</button> -->
<!-- 			</form> -->
<%-- 			<input type="button" onclick="location.href='<c:url value="/help/notice"/>'" value="목록으로"/> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- </table> -->

<div id="sri_section" class="has_banner">
  	<div id="sri_wrap">
    	<div id="content" style="width: 80%;">
	      	<div class="wrap_board_view">
	        	<h3 class="main_tit"> 공지사항 </h3>
	        	<div class="wrap_content_view">
	          		<div class="area_tit">
	            		<h1 class="content_tit"><c:out value="${notice.noticeTitle }"/></h1>
	            		<dl class="content_info" style="font-size: 16px;">
	              			<dt>등록일 :</dt>
	              			<dd>${notice.noticeDate }</dd>
	              			<dt>조회수 :</dt>
	              			<dd>${notice.noticeHit }</dd>
	            		</dl>
	            		<c:if test="${not empty files}">
            				<dl class="content_info" style="font-size: 16px;">
		            			<dt>첨부파일 : </dt>
		            			<dd>
		            				<c:forEach items="${files }" var="files">
								    	<a style="color: #0D6EFD;" href="<c:url value='/systemManagement/fileDownLoad?tblId=${files.tblId }'/>">${files.attFilename }</a>
								    	<span>${files.attFancysize }</span>
							    	</c:forEach>
		            			</dd>
		            		</dl>
	            		</c:if>
	            		
	            		
	            		
	          		</div>
	          		<div class="area_content">
	            		<div class="inner" style="font-size: 16px; padding: 50px 120px 65px; text-align: justify;">${notice.noticeContent }</div>
	          		</div>
	          		<div style="text-align: right; margin-top: 20px">
	            		<a href='<c:url value="/help/notice"/>' style="font-weight: 1; float: right; margin:5px;" class="btn_basic_type01 btn_list" >목록</a>
	            		<form name="frm" action='<c:url value="/help/notice/noticeDelete"/>' method="post">
							<input type="hidden" name="noticeSn" value="${notice.noticeSn }" />
						</form>
						<security:authorize url="/help/notice/noticeDelete">
		            		<input type="button" id="del-btn" style="float: right; margin:5px;" class="btn_basic_type01 btn_list" value="삭제"/>
						</security:authorize>
	          			<c:url value="/help/notice/noticeUpdate" var="updateURL">
							<c:param name="what" value="${notice.noticeSn }"/>
						</c:url>
						<security:authorize url="/help/notice/noticeUpdate">
		            		<a href='${updateURL}' class="btn_basic_type01 btn_list" style="font-weight: 1; float: right; margin:5px;">수정</a>
						</security:authorize>
	          		</div>
	        	</div>
	      	</div>
    	</div>
  	</div>
</div>

<script>
	$('#del-btn').click(function(){
		var flag = confirm("정말 삭제하시겠습니까?");
		if(!flag){
			return;
		}
		document.frm.submit();
	});
</script>













