<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="8kb"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!doctype html>
<html style="background-color: #ECF0F6;">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom-bs.css">

		<title>INU : Thank You Very Match!</title>
		
		<tiles:insertAttribute name="preScript" />
		<c:if test="${not empty message }">
			<script>
				alert("${message}");
			</script>
		</c:if>
		
		<style>
			body {
				width:100%;
 				height:100%;
 				overflow-x:hidden;
 				background-color: #ECF0F6;
/*  				background-color: rgb(234, 237, 242); */
				position:relative;
				z-index:1;
			}
			main {
 				position: abosolute;
 				top: 50px;
 				padding-top: 50px;
 				border-radius: 10px;
				background: white;
			}
		</style>
		
	</head>
	<body>
		<tiles:insertAttribute  name="headerMenu"/>
		<div class="row">
			<main class="col-md-10 ks-lm-radius mx-auto">
				<tiles:insertAttribute name="subMenu"/>
				<tiles:insertAttribute  name="content" />
			</main>
		</div>
		<tiles:insertAttribute  name="postScript"/>
		
	</body>
</html>















