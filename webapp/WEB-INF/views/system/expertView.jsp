<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
.table1 {
  	width: 100%;
  	height: 180px;
 	border-top: 1px solid #eaedf4;
  	border-collapse: collapse;
}
.table2 {
  	width: 100%;
  	height: 600px;
 	border-top: 1px solid #eaedf4;
  	border-collapse: collapse;
}
th{
	background: #f7f7f7;
	border-bottom: 1px solid #eaedf4;
  	padding: 10px;
  	width: 155px;
} 
.td1 {
  	border-bottom: 1px solid #eaedf4;
  	padding: 20px;
  	width: 393px;
}
.td2 {
  	border-bottom: 1px solid #eaedf4;
  	padding: 20px;
  	width: 393px;
}
</style>


<section class="site-section">
	<div class="container" >
		<div class="radiuss">
			<div style="display: flex; letter-spacing: -2px; line-height: 24px; align-items: center;">
				<span style="font-size: 40px;">전문가 정보</span>
			</div>
			<hr style="background-color: #5c667b; height: 2px;">
			<p class="pf">전문가</p>
			<table class="table1">
				<tr>
			    	<th scope="row">아이디</th>
			    	<td class="td1">${expert.memId }</td>
			    	<th scope="row">가입일자</th>
			    	<td class="td1">${fn:substring(expert.expertVO.expertApprovalDate,0,10) }</td>
			  	</tr>
			  	<tr>
			    	<th scope="row">성명</th>
			    	<td class="td1">${expert.memName }</td>
			    	<th scope="row">성별</th>
			    	<td class="td1">${expert.seekerVO.memGender }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">생년월일</th>
				    <td class="td1">${expert.seekerVO.memBirth }</td>
				    <th scope="row">이메일</th>
				    <td class="td1">${expert.seekerVO.memEmail }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">연락처</th>
				    <td class="td1">${expert.seekerVO.memTel }</td>
				    <th scope="row">직업</th>
				    <td class="td1">${expert.expertVO.expertField }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">분야</th>
				    <td class="td1">${expert.expertVO.exfieldName }</td>
				    <th scope="row">직종</th>
				    <td class="td1">${expert.expertVO.exjobName }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">사업장 우편번호</th>
				    <td class="td1">${expert.expertVO.expertZip }</td>
				    <th scope="row">태그</th>
				    <td class="td1">${expert.expertVO.expertTag }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">사업장 주소</th>
				    <td class="td1" colspan="3">${expert.expertVO.expertAddr }(${expert.expertVO.expertAddr2 })</td>
			  	</tr>
			  	<tr>
				    <th scope="row">고객센터 전화번호</th>
				    <td class="td1">${expert.expertVO.expertTel }</td>
				    <th scope="row">고객센터 이메일</th>
				    <td class="td1">${expert.expertVO.expertEmail }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">은행</th>
				    <td class="td1">${expert.expertVO.expertBank }</td>
				    <th scope="row">계좌번호</th>
				    <td class="td1">${expert.expertVO.expertAccount }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">가입경로</th>
				    <td class="td1" colspan="3">${expert.expertVO.expertJoinpath }</td>
			  	</tr>
			  	<tr>
				    <th scope="row">한줄소개</th>
				    <td class="td1" colspan="3">${expert.expertVO.expertIntroduction }</td>
			  	</tr>
	  		</table>
		  	<br>
		  	<p class="pf">${expert.memName }님의 상품</p>
		  	<c:choose>
		  		<c:when test="${not empty exprodList }">
				  	<c:forEach items="${exprodList }" var="exprod"> 
				  		<table class="table2">
						  	<tr>
							    <th scope="row">시작일</th>
							    <td class="td2">${fn:substring(exprod.exprodStart,0,10) }</td>
							    <th scope="row">종료일</th>
							    <td class="td2">${fn:substring(exprod.exprodEnd,0,10) }</td>
						  	</tr>
						  	<tr>
							    <th scope="row">대상</th>
							    <td class="td2">${exprod.exprodTarget }</td>
							    <th scope="row">상품명</th>
							    <td class="td2">${exprod.exprodName }</td>
						  	</tr>
						  	<tr>
							    <th scope="row">상품구분</th>
							    <td class="td2">
							    	<c:if test="${exprod.exlprodId eq 'EL001'}">
										클래스					    	
							    	</c:if>
							    	<c:if test="${exprod.exlprodId eq 'EL002'}">
										컨설팅					    	
							    	</c:if>
							    </td>
							    <th scope="row">이용방법</th>
							    <td class="td2">${exprod.exprodWay }</td>
						  	</tr>
						  	<tr>
							    <th scope="row">시간</th>
							    <td class="td2">${exprod.exprodTime }</td>
							    <th scope="row">상품가격</th>
							    <td class="td2">${exprod.exprodPrice }</td>
						  	</tr>
						  	<tr>
							    <th scope="row">상세설명</th>
							    <td class="td2" colspan="3">${exprod.exprodDetail }</td>
						  	</tr>
						  	<tr>
							    <th scope="row">전문가 포부</th>
							    <td class="td2" colspan="3">${exprod.exprodPr }</td>
						  	</tr>
						</table>
						<br>
				  	</c:forEach>
		  		</c:when>
		  		<c:otherwise>
		  			목록없음
		  		</c:otherwise>
		  	</c:choose>
		  	
			<div class="row align-items-center mb-5">
				<div class="col-lg-4 ml-auto">
					<div class="row">
						<div class="col-4" style="padding: 10px 3px 10px 3px;">
							<input type="button" 
								onclick="location.href='<c:url value="/systemManagement/memberList/expertList"/>'" 
								class="btn btn-block btn-primary btn-md"
								value="목록으로" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>



	


















