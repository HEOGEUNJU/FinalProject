<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023. 2. 26.  양서연      최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %> 
<c:set var="prePath" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${prePath}/resources/js/jquery-3.6.1.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row mt-3">
	<div class="col-6">
		<select id="singleSel" class="form-select">
		  	<option selected value>파일선택</option>
		 	<c:forEach items="${files}" var="filename">
		 		<option>${filename}</option>
		 	</c:forEach>
		</select>
	</div>
	<div class="col-2">
		<a class="btn btn-primary downloadBtn" href="${prePath}/file/single"
			data-target="#singleSel" data-role="single">single download</a>
	</div>
</div>
</body>
</html>
<script src="${pageContext.request.contextPath }/resources/js/api/fileView.js"></script>
