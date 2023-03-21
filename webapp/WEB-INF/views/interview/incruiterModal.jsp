<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023. 2. 9.      작성자명      최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/layout.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/saramin/components.css" />
<style>
.scroller {
    overflow-y: auto;
    overflow-x: auto;
    height: 311px;
    width: 100%;
    position: sticky;
   }

.scroller::-webkit-scrollbar {
  width: 6px;
}
.scroller::-webkit-scrollbar-track {
  background-color: transparent;
}

.scroller::-webkit-scrollbar-thumb {
   height : 10%;
     border-radius: 3px;
     background-color: #e9e9e9;
}
.btnTypoSearch {
    width: 52px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    background-color: #6d82f3;
    color: #fff;
    font-size: 13px;
    font-weight: bold;
    vertical-align: top;
}
.btnTypoSearch, .searchTypoBox .btnTypoReset {
    float: right;
}
.btnTypoSearch, .searchTypoBox .btnTypoReset {
    padding-bottom: 4px;
    height: 32px;
    border: 0;
    cursor: pointer;
}
.table-hover>tbody>tr:hover>* {
    /* --bs-table-accent-bg: var(--bs-table-hover-bg); */
    color: white;
}
caption, th {
    text-align: center;
}
.modal-title {font-size: 25px;}
</style>
<!-- 모달창 -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true"
	style="top: 100px">
	<div class="modal-dialog" role="document">
		<div class="modal-content">

<!-- 		<div class="lpop_head">
				<strong>답글 작성</strong>
			</div> -->

			<div class="modal-header lpop_head">
				<strong class="modal-title" id="exampleModalLabel">회사검색</strong>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<!-- 검색영역 시작 -->
				<form:form id="searchUI" name="myform"
					modelAttribute="simpleCondition" method="post"
					onclick="return false;">
					<fieldset>
						<table class="tb wrt_tb2 mb10">

							<colgroup>
								<col style="width: 120px;">
								<col>
								<col style="width: 100px;">
							</colgroup>
							<tr>
								<th>회사명</th>
								<form:input path="searchType" type="hidden" value="company" />
								<td>
								<form:input path="searchWord" type="text" class="inpTypo"
										style="width: 128%;" value="" id="searchWord" /> <!--<input type="text" id=searchWord  style="width: 100%;"> -->
								</td>
								<td class="tc">
									<button type="button" id="searchBtn" class="btnTypoSearch">검색</button>
								</td>
							</tr>
						</table>
					</fieldset>
				</form:form>
				<!-- 검색영역 끝 -->
				<!-- 검색결과 시작 -->
			</div>
			<table border="1" style="width: 100%;background-color: #2d65f2;font-size: large;text-align-last: center;color: white;" class="table table-bordered table-hover ">
					<tbody>
					<tr style="text-align: center;">
						<th style="width : 45% ; background-color:#6d82f3;">회사이름</th>
						<th style="width: 25%; background-color:#6d82f3;">대표자</th>
						<th style="background-color:#6d82f3;">회사위치</th>
					</tr>
				</tbody>
			</table>
			<div class="scroller well well-gray group_srch_result">
				<!-- <span class="clr-red">검색된 결과가 없습니다.<span> -->
				<table border="1" style="width: 100%;" class="table table-bordered table-hover">
					<tbody name="companyList" id="companyList">
						<c:set var="companyList" value="${pagingVO.dataList }"></c:set>
						<c:choose>
							<c:when test="${not empty companyList }">
								<c:forEach items="${companyList }" var="company">
									<tr>
										<td style="width : 47% "><a href="" onclick="companyClick(this)"
											data-dismiss="modal" style="color: black; font-weight: bold;">${company.cmpName }</a></td>
										<td>${company.cmpRepName }</td>
										<td>${company.cmpAddr2 }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="3">검색된 회사가 없음.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
<!-- 			페이지 네이션 소스 -->
				<div id="pagination">
<%-- 		       	<ui:pagination pagingVO="${pagingVO }" type="bootstrap"/> --%>
				</div>
			</div>
			<form:form id="searchForm" modelAttribute="simpleCondition" >
				<input type="hidden" name="page" />
				<form:hidden path="searchType" />
				<form:hidden path="searchWord" />
			</form:form>

			<!-- 검색결과 끝 -->

			<div class="modal-footer" style="padding: 2rem;">
<!-- 				<button type="button" class="btn btn-dark" id="insertComBtn"
					data-dismiss="modal">회사등록</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				<button type="button" class="btnSizeM btn-primary" >확인</button> -->
			</div>
		</div>
	</div>
</div>