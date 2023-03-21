<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023. 2. 17     최경수     최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/help.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/components.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/saramin/layout.css">

<section class="section-hero home-section overlay inner-page bg-image"
	style="background-image: url('<%=request.getContextPath()%>/resources/images/hero_1.jpg');"
	id="home-section">
	<div class="container">
		<div class="row">
			<div class="col-md-7">
				<h1 class="text-white font-weight-bold">우리 회사 공고목록</h1>
				<div class="custom-breadcrumbs">
					<a href="#">Announcement</a>
					<span class="mx-2 slash">/</span> 
					<span class="text-white">
						<strong>MyAnnouncement</strong>
					</span>
				</div>
			</div>
		</div>
	</div>
</section>

<div id="sri_section" class="  has_banner">
	<div id="sri_wrap">
      	<div id="content">
			<div class="wrap_help">
      			<!-- 리스트 영역 -->
				<div class="wrap_list_help">
              		<h2 class="tit_list_help">
         				<strong></strong> 공고 목록
                    </h2>
      				<!-- 도움말 리스트 -->
      				<ul class="list_help">
      					<c:choose>
		      				<c:when test="${not empty list}">
			      				<c:forEach items="${list}" var="anno">
			                        <li>
			                  			<dl>
			                      			<dt>
			                          			<button type="button" class="btn_close">
			                          				<span class="question">${anno.annoTitle }</span>
			                          			</button>
			                      			</dt>
			                      			<dd class="answer">
			                      				<a href="${pageContext.request.contextPath}/announcement/view/${anno.annoNo}">${anno.annoContent }</a>
								      		</dd>	
			                      			<dd class="date1">시작일 : ${anno.annoDate }</dd>
			                      			<dd class="date2">종료일 : ${anno.annoStartdate }</dd>
			                      			<dd class="view">등록일 : ${anno.annoEnddate }</dd>
			                  			</dl>
			                  			<button type="button" class="close btn_close">접기<span></span></button>
			              			</li>
			      				</c:forEach>
		      				</c:when>
		      				<c:otherwise>
		      					<li>
		      						<dl>
		      							<dt>공고글 없음</dt>
		      							<dd>올라온 공고글이 없습니다.</dd>
		      						</dl>
		      					</li>
		      				</c:otherwise>
	      				</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var $list = jQuery('.list_help'),
	  $li = jQuery('> li', $list);
	
	$list.on('click', '.btn_close', function () {
	  var $this = jQuery(this).closest('li');
	  if ($this.hasClass('select')) {
	      $this.removeClass('select');
	  } else {
	      $li.removeClass('select');
	      $this.addClass('select');
	  }
	});
</script>