<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="<%=request.getContextPath()%>/resources/floating/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/floating/main.js"></script>


<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<div class="floating-container">
	<div class="floating-button">+</div>
	<div class="element-container">
    	<span class="float-element tooltip-left">
			<a href="${pageContext.request.contextPath}/announcement/myList">
	   			<i class="material-icons">phone</i>
    		</a>
    	</span>
      	<span class="float-element">
 			<a href="${pageContext.request.contextPath}/resume">
	      		<i class="material-icons">email</i>
    		</a>
    	</span>
		<span class="float-element">
			<a href="${pageContext.request.contextPath}/apply">
				<i class="material-icons">chat</i>
			</a>
		</span>
	</div>
</div>