<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/layout.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/components.css"/>  
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/help.css">


<div id="sri_section" class="has_banner">
  	<div id="sri_wrap">
    	<div id="content" style="width: 1250px;">
      		<div class="wrap_title_recruit">
        		<h1 class="title_common">개인회원 아이디 찾기</h1>
      		</div>

      		<div class="help_find help_find_type2">
        		<h2 class="blind">개인회원 아이디 찾기 결과</h2>
        		<div class="cont_find">
          			<p class="desc_find">
            			${idList[0].memName }님의 아이디가 <em class="emph_txt">${fn:length(idList)}건</em> 검색되었습니다.
          			</p>
          			<table class="tbl_find">
            			<colgroup>
              				<col width="390" />
			              	<col width="488" />
			              	<col width="390" />
            			</colgroup>
            			<thead>
              				<tr>
                				<th scope="col">구분</th>
                				<th scope="col">아이디</th>
                				<th scope="col">가입일</th>
              				</tr>
            			</thead>
            			<tbody>
            				<c:choose>
				                <c:when test="${empty idList}">
					                    등록된 아이디가 없습니다. <br>
					                    입력한 정보를 다시 한 번 확인해주세요.
				                </c:when>
				
				                <c:otherwise>
				                    <c:forEach var="idList" items="${idList}">
				                        <tr>
			                				<th scope="row">
			                					<c:if test="${idList.memAuthCd eq 'ROLE_SEEKER'}">
			                						일반회원
			                					</c:if>
			                					<c:if test="${idList.memAuthCd eq 'ROLE_EXPERT'}">
			                						전문가
			                					</c:if>
			                				</th>
			                				<td>
			                  					${idList.memId }
			                				</td>
			                				<td>${idList.memJoinDate }</td>
			              				</tr>
				                    </c:forEach>
				                </c:otherwise>
				            </c:choose>
            			</tbody>
          			</table>
          			<div class="wrap_link">
            			<a href='<c:url value="/login/loginForm"/>' class="btn_biggest_type01" style="margin: 0 15px; background-color: #0D6EFD; border-color: #0D6EFD;">로그인</a>
            			<a href='<c:url value="/help/find/seekerFindPw"/>' class="btn_biggest_type03" style="margin: 0 15px;">비밀번호 찾기</a>
          			</div>
        		</div>
        		<div class="find_method">
          			<ul class="list_method">
            			<li>
              				찾으시는 아이디가 아니신가요? 다시 한 번
              				<a href='<c:url value="/help/find/seekerFindId"/>' class="link_method">아이디 찾기</a>를 이용해보세요.
            			</li>
          			</ul>
        		</div>
      		</div>
    	</div>
  	</div>
</div>






