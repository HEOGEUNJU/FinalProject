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
}
</style>


<section class="site-section">
	<div class="container" >
		<div class="radiuss">
			<div style="display: flex; letter-spacing: -2px; line-height: 24px; align-items: center;">
				<span style="font-size: 40px;">기업 정보</span>
			</div>
			<hr style="background-color: #5c667b; height: 2px;">
			<table>
			  	<tr>
				    <th scope="row">회사명</th>
				    <td style="width:395px">${company.cmpName }</td>
				    <th scope="row">법인등록번호</th>
				    <td>${company.cmpNo }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">대표자</th>
				    <td>${company.cmpRepName }</td>
				    <th scope="row">사업자등록번호</th>
				    <td>${company.cmpBsnsNo }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">설립일자</th>
				    <td>${company.cmpEstblDate }</td>
				    <th scope="row">종업원 수</th>
				    <td>${company.cmpEmpNo }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">회사 기본주소</th>
				    <td colspan="3">${company.cmpAddr1 }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">회사 상세주소</th>
				    <td colspan="3">${company.cmpAddr2 }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">회사우편번호</th>
				    <td>${company.cmpZip }</td>
				    <th scope="row">회사전화번호</th>
				    <td>${company.cmpPhone }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">회사이메일</th>
				    <td>${company.cmpEmail }</td>
				    <th scope="row">홈페이지</th>
				    <td>${company.cmpUrl }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">회사형태</th>
				    <td>${company.cmpSmenp }</td>
				    <th scope="row">주요사업</th>
				    <td>${company.cmpMbName }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">회사소개</th>
				    <td colspan="3">${company.cmpContent }</td>
			  	</tr>
			</table>
			<div class="row align-items-center mb-5">
				<div class="col-lg-4 ml-auto">
					<div class="row">
						<div class="col-4" style="padding: 10px 3px 10px 3px;">
							<input type="button" 
								onclick="location.href='<c:url value="/systemManagement/companyList"/>'" 
								class="btn btn-block btn-primary btn-md" 
								value="목록으로" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>




















