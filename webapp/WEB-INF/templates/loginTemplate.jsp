<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="8kb"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!doctype html>
<html style="background-color: #ECF0F6;">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>INU : Thank You Very Match!</title>

		<tiles:insertAttribute  name="preScript"/>
		
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
 				position: relative;
 				top: 50px;
			}
			
		    video#bgvid {
		            position: fixed; right: 0; bottom: 0;
		            min-width: 100%; min-height: 100%;
		            width: auto; height: auto; z-index: -100;
		    }
		</style>
		
	</head>
	
	<video muted autoplay loop  id="bgvid">
	    <source src='/INUProject/resources/images/bgvideo.mp4'>
	</video>	
	
	<body id="top" class="d-flex flex-column">
		<tiles:insertAttribute  name="headerMenu"/>
		<div id="main_div" class="row">
			<main class="col-md-10 ks-lm-radius mx-auto bg-transparent" style="border-radius: 30px; padding-top: 50px;">
				<tiles:insertAttribute  name="content"/>
			</main>
		</div>
	
		<footer class="footer">
			<tiles:insertAttribute  name="footer" ignore="true"/>
		</footer>
		
		<tiles:insertAttribute  name="postScript"/>
		
	</body>
	<script>
		$("header").removeClass("bg-white").css("background", "rgba(255, 255, 255, 0.8)");
		v = document.getElementById("bgvid");
		v.playbackRate = 0.8;
	</script>
</html>
