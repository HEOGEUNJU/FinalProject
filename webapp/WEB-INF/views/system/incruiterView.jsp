<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/saramin/layout.css">

<style>
.pf {
 	font-size: 24px; 
}
.radiuss{
	border : 1px solid #eaedf4;
	border-radius: 12px;
	padding: 80px 99px 100px 99px;
}
table {
  	width: 100%;
  	height: 180px;
 	border-top: 1px solid #eaedf4;
  	border-collapse: collapse;
}
th{
	background: #f7f7f7;
	border-bottom: 1px solid #eaedf4;
  	padding: 10px;
  	width: 155px;
} 
td {
  	border-bottom: 1px solid #eaedf4;
  	padding: 20px;
  	width: 393px;
}
</style>


<section class="site-section">
	<div class="container" >
		<div class="radiuss">
			<form:form modelAttribute="incruiter" name="acc" action='${pageContext.request.contextPath }/systemManagement/acceptManagement/updateAcceptInc' method="post">
				<div style="display: flex; letter-spacing: -2px; line-height: 24px; align-items: center;">
					<span style="font-size: 40px;">기업회원 정보</span>
					<input type="hidden" name="cmpId" value="${incruiter.companyVO.cmpId }"/>
					<input type="hidden" id="memEmail" value="${incruiter.incruiterVO.memEmail }"/>
				</div>
				<hr style="background-color: #5c667b; height: 2px;">
				<table>
					<tr>
				    	<th scope="row">아이디</th>
				    	<td>${incruiter.memId }</td>
				    	<th scope="row">가입일자</th>
				    	<td>${incruiter.memJoinDate }</td>
				  	</tr>
				  	<tr>
				    	<th scope="row">성명</th>
				    	<td>${incruiter.memName }</td>
				    	<th scope="row">권한</th>
				    	<td>
				    		<c:if test="${incruiter.memAuthCd eq 'ROLE_INCRUITER1' }">
					    		인사담당자
				    		</c:if>
				    		<c:if test="${incruiter.memAuthCd eq 'ROLE_INCRUITER2' }">
					    		인사팀장
				    		</c:if>
				    		<c:if test="${incruiter.memAuthCd eq 'ROLE_INCRUITER3' }">
					    		총괄
				    		</c:if>
				    	</td>
				  	</tr>
				  	<tr>
					    <th scope="row">이메일</th>
					    <td>${incruiter.incruiterVO.memEmail }</td>
					    <th scope="row">연락처</th>
					    <td>${incruiter.incruiterVO.memTel }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">회사명</th>
					    <td>${incruiter.companyVO.cmpName }</td>
					    <th scope="row">법인등록번호</th>
					    <td>${incruiter.companyVO.cmpNo }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">대표자</th>
					    <td>${incruiter.companyVO.cmpRepName }</td>
					    <th scope="row">사업자등록번호</th>
					    <td>${incruiter.companyVO.cmpBsnsNo }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">설립일자</th>
					    <td>${incruiter.companyVO.cmpEstblDate }</td>
					    <th scope="row">종업원 수</th>
					    <td>${incruiter.companyVO.cmpEmpNo }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">회사 기본주소</th>
					    <td colspan="3">${incruiter.companyVO.cmpAddr1 }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">회사 상세주소</th>
					    <td colspan="3">${incruiter.companyVO.cmpAddr2 }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">회사우편번호</th>
					    <td>${incruiter.companyVO.cmpZip }</td>
					    <th scope="row">회사전화번호</th>
					    <td>${incruiter.companyVO.cmpPhone }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">회사이메일</th>
					    <td>${incruiter.companyVO.cmpEmail }</td>
					    <th scope="row">홈페이지</th>
					    <td>${incruiter.companyVO.cmpUrl }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">회사형태</th>
					    <td>${incruiter.companyVO.cmpSmenp }</td>
					    <th scope="row">주요사업</th>
					    <td>${incruiter.companyVO.cmpMbName }</td>
				  	</tr>
				  	<tr>
					    <th scope="row">회사소개</th>
					    <td colspan="3">${incruiter.companyVO.cmpContent }</td>
				  	</tr>
				</table>
				<div class="row align-items-center mb-5">
					<div class="col-lg-4 ml-auto">
						<div class="row">
							<div class="col-4" style="padding: 10px 3px 10px 3px;">
								<input type="button" 
									onclick="location.href='<c:url value="/systemManagement/memberList/incruiterList"/>'" 
									class="btn btn-block btn-primary btn-md" 
									value="목록으로" />
							</div>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</section>




















