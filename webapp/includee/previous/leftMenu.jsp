<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

		<script src="${pageContext.request.contextPath}/resources/leftMenu/lib/wow/wow.min.js"></script>
		<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/leftMenu/css/style.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom-bs.css">
		
<leftmenu class="col-md-2 sidebar ks-leftmenu ks-lm-radius">
	<h1 style="text-align:right; color: white;"><i id="collapse" class="fa fa-bars"></i></h1>
	<sidebar>
		<h1 class="text-center"><a href="${pageContext.request.contextPath}/" class="logo" style="color: white;" id="inu"></a></h1>
		<ul class="list-unstyled components mb-5 text-left">
			<a href="${pageContext.request.contextPath}/apply"><li><h6 style="color: white;">지원</h6></li></a>
			<a href="${pageContext.request.contextPath}/resume"><li><h6 style="color: white;">이력서</h6></li></a>
			<a href="${pageContext.request.contextPath}/education"><li><h6 style="color: white;">학력</h6></li></a>
			<a href="${pageContext.request.contextPath}/career"><li><h6 style="color: white;">경력</h6></li></a>
			<a href="${pageContext.request.contextPath}/certification"><li><h6 style="color: white;">자격증</h6></li></a>
			<a href="${pageContext.request.contextPath}/facility"><li><h6 style="color: white;">기능</h6></li></a>
			<a href="${pageContext.request.contextPath}/activity"><li><h6 style="color: white;">주요활동</h6></li></a>
			<a href="${pageContext.request.contextPath}/course"><li><h6 style="color: white;">교육이수</h6></li></a>
			<a href="${pageContext.request.contextPath}/award"><li><h6 style="color: white;">수상내역</h6></li></a>
			<a href="${pageContext.request.contextPath}/myintro"><li><h6 style="color: white;">자기소개서</h6></li></a>
			<a href="${pageContext.request.contextPath}/process"><li><h6 style="color: white;">채용과정</h6></li></a>
		</ul>
	</sidebar>
</leftmenu>


<script>
(function($) {

	"use strict";

	var fullHeight = function() {

		$('.js-fullheight').css('height', $(window).height());
		$(window).resize(function(){
			$('.js-fullheight').css('height', $(window).height());
		});

	};
	fullHeight();

	
	let collapse = $('#collapse').on('click', function () {
		if ($('leftmenu').hasClass('active') == false) {
			$('leftmenu').removeClass('col-md-2').addClass('col-md-1 active');
			$('main').removeClass('col-md-9').addClass('col-md-10');
		} else {
			$('leftmenu').removeClass('col-md-1 active').addClass('col-md-2');
			$('main').removeClass('col-md-10').addClass('col-md-9');
		}
	});
	
    new WOW().init();


    // Sticky Navbar
    $(window).scroll(function () {
        if ($(this).scrollTop() > 45) {
            $('leftmenu').addClass('sticky ks-leftmenu-extended').removeClass('ks-leftmenu ks-lm-radius');
            $('#inu').html('INU');
        } else {
            $('leftmenu').removeClass('sticky ks-leftmenu-extended').addClass('ks-leftmenu ks-lm-radius');
            $('#inu').html('');
        }
    });
	
})(jQuery);

</script>