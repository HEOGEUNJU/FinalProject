<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
		
<div class="top-bar" style="position: relative; background-color: #126CF5; width: 100%; height: 200px; box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);">
	<span style="position: absolute; left: 20px; top: 20px; font-size: 50px; font-weight: 900; color: white;">${menuList[0].menuTitle }</span>
	<span style="position: absolute; left: 20px; top: 100px; font-size: 15px; font-weight: 600; color: white;">${menuList[0].subTitle }</span>
	<div style="position: absolute;  left: 20px; top: 140px; font-size: 20px; font-weight: 600; color: white;">
		<c:forEach items="${menuList }" var="menu" varStatus="vs">
       		<security:authorize url="${menu.menuURL}">
<%-- 				<c:if test="${fn:contains(menu.menuURL, 'announcement/view/')}"> --%>
<%-- 					<c:if test="${vs.count gt 2}"> --%>
<%-- 						<security:authorize access="hasRole('ROLE_INCRUITER')"> --%>
<%-- 							<security:authentication property="principal.realMember" var="authMember"/> --%>
<%-- 								<c:if test="${authMember.incruiterVO.cmpId eq anno.cmpId}"> --%>
<%-- 									<c:url value="${menu.menuURL}" var="menuURLReform"> --%>
<%-- 										<c:param name="what" value="${anno.annoNo}"></c:param> --%>
<%-- 									</c:url> --%>
<%-- 									<a id="${menu.menuId}" style="color: white; margin-right: 5px;" class="btn btn-outline-primary" href="<c:url value='${menuURLReform}'/>">${menu.menuText}</a> --%>
<%-- 								</c:if> --%>
<%-- 						</security:authorize> --%>
<%-- 					</c:if> --%>
<%-- 				</c:if> --%>
				<a id="${menu.menuId}" style="color: white; margin-right: 5px; border-color: white;" class="btn btn-outline-primary" href="<c:url value='${menu.menuURL}'/>">${menu.menuText}</a>
			</security:authorize>
       	</c:forEach>
	</div>
</div>
<script>
// 	$("#a").on("click", function(){
// 		$($(this)).addClass("active");
// 	});
</script>